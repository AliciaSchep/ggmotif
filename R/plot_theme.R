#'@import ggplot2
#'@export
ggmotif_theme <- function(base_size = 8, base_family="Helvetica"){
  theme_bw(base_size, base_family) %+replace%
    theme(axis.line.x = element_line(colour = "black"),
          axis.line.y = element_line(colour = "black"),
          panel.background = element_blank(),
          panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          plot.background = element_blank(),
          strip.background = element_blank() ,
          legend.background = element_blank(),
          legend.key = element_blank()
    )
}




#'@import ggplot2
remove_y_axis <- function(){
  theme(axis.line.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank())
}

#'@import ggplot2
remove_x_axis <- function(){
  theme(axis.line.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank())
}

