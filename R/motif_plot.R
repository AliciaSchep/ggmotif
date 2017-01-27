#'ggmotif
#'
#'@param x either a character string, a \code{\link[Biostrings]{DNAString}} object, or a matrix
#'@param x.pos position on x axis for bottom left corner of motif
#'@param y.pos position on y axis for bottom left corner of motif
#'@param ht height of motif, default is 1
#'@param wt width of each letter of motif, default is 1
#'@param id id
#'@return geom_polygon to be added to ggplot. this will also add an ugly
#'legend... to remove, use \code{\link{ggmotif_scale}}
#'@import ggplot2
#'@export
#'@examples
#' ggplot() + ggmotif("ACG",x.pos = 5,y.pos = 2) + ggmotif_scale()  + ggmotif_theme()
ggmotif <- function(x,
                    x.pos = 0,
                    y.pos = 0,
                    ht = 1,
                    wt = 1,
                    id = ""){
  if (inherits(x,"character")){
    motif_df = stringToPolygons(x,
                                x.pos = x.pos,
                                y.pos = y.pos,
                                ht = ht,
                                wt = wt,
                                id = id)
  } else{
    motif_df = matrixToPolygons(x,
                                x.pos = x.pos,
                                y.pos = y.pos,
                                ht = ht,
                                wt = wt,
                                id = id)
  }
  motif_df$fill <- factor(motif_df$fill,
                          levels = c("A","C","G","T"),
                          ordered=TRUE )
  geom_polygon(data = motif_df,
               mapping = aes_string(x="x",
                             y="y",
                             fill = "fill",
                             group = "id"))
}

#'ggmotif_scale
#'
#'removes ugly legends and applies fixed coloring scheme to letters
#'@import ggplot2
#'@export
#'@examples
#'ggplot() + ggmotif("ACG") + ggmotif_scale()
ggmotif_scale <- function(){
  scale_fill_manual(name="Bases",
                    breaks = c("A","C","G","T"),
                    values = RColorBrewer::brewer.pal(4,"Dark2"),
                    drop=FALSE,
                    guide = FALSE)
}

#'ggmotif_plot
#'
#'@param x either a character string, a \code{\link[Biostrings]{DNAString}} object, or a matrix
#'@param y.axis plot a y axis? default is FALSE
#'@param y.lab axis title for y axis, if y.axis is TRUE
#'@param x.axis plot a x axis? default is TRUE
#'@param x.lab title for x axis, if x.axis is TRUE
#'@return ggplot with motif
#'@export
#'@examples
#'ggmotif_plot("ACGTRWN")
#'ggmotif_plot(Biostrings::DNAString("ACGTRWN"))
#'ggmotif_plot(Biostrings::consensusMatrix("ACGTRWN"))
ggmotif_plot <- function(x, y.axis = FALSE, y.lab = "Letter Frequency", x.axis = TRUE, x.lab = ""){
  if (inherits(x,"DNAString")){
    x = as.character(x)
  }
  p = ggplot() + ggmotif(x) + ggmotif_scale() + ggmotif_theme() + ylab(y.lab)
  if (inherits(x,"character")){
    if (is.null(y.axis) || !y.axis){
      p = p + remove_y_axis()
    } else {
      p = p + scale_y_continuous(limits=c(0,max(ggplot_build(p)$data[[1]]$y)),expand=c(0,0))
    }
  } else{
    if (!is.null(y.axis) && !y.axis){
      p = p + remove_y_axis()
    } else {
      p = p + scale_y_continuous(limits=c(0,max(max(ggplot_build(p)$data[[1]]$y))),expand=c(0,0))
    }
  }
  if (!x.axis){
    p = p + remove_x_axis()
  } else{
    if (inherits(x,"character")){
      p = p + scale_x_continuous(breaks = 1:nchar(x)) + xlab(x.lab)
    } else{
      p = p + scale_x_continuous(breaks = 1:ncol(x)) + xlab(x.lab)
    }
  }
  return(p)
}




