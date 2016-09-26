



matrixToPolygons <- function(x,
                             x.pos = 0,
                             y.pos = 0,
                             ht = 1,
                             wt = 1,
                             id = ""){
  if (inherits(x, "XMatrix")){
    x <- TFBSTools::Matrix(x)
  }
  stopifnot(ncol(x) >= 1)
  if (nrow(x) > 4){
    x = convert_ambiguous_matrix(x)
  }
  letters = rownames(x)
  out = data.frame(x = NULL, y = NULL, id = NULL, fill = NULL, stringsAsFactors = FALSE)
  for (i in 1:ncol(x)){
    nz = which(x[,i]!=0)
    tmpy = -sum(abs(x[which(x[,i]<0),i]))
    for (j in nz[sort(x[nz,i], index.return=T)$ix]){
      tmpht = ht * x[j,i]
      if (x[j,i] < 0){
        tmpypos = y.pos + tmpy - tmpht
      } else{
        tmpypos = y.pos + tmpy
      }
      out = rbind(out, makeLetter(letters[j],
                                  x.pos= x.pos + (i - 0.5) * wt,
                                  y.pos = tmpypos,
                                  ht = tmpht,
                                  wt = wt* 0.98,
                                  id = paste0(id,as.character(i))))
      tmpy = tmpy + abs(tmpht)
    }
  }
  out
}


stringToPolygons <- function(x, x.pos = 0, y.pos = 0, ht = 1, wt = 1, id = ""){
  baseletters = c("A","C","G","T")
  i = 1
  out = data.frame(x = NULL, y = NULL, id = NULL, fill = NULL, stringsAsFactors = FALSE)
  for (letter in unlist(strsplit(x,""),use.names=F)){
    if (letter %in% baseletters){
      out = rbind(out, makeLetter(letter,
                                  x.pos= x.pos + (i - 0.5) * wt,
                                  y.pos = y.pos,
                                  ht = ht,
                                  wt = wt * 0.98,
                                  id = paste0(id,as.character(i))))
    } else{
      tmpletters = unlist(strsplit(Biostrings::IUPAC_CODE_MAP[[letter]],""), use.names=FALSE)
      tmpht = ht / length(tmpletters)
      j = 0
      for (tmpletter in tmpletters){
        out = rbind(out, makeLetter(tmpletter,
                                    x.pos= x.pos + (i - 0.5)*wt,
                                    y.pos = y.pos + j,
                                    ht = tmpht,
                                    wt = wt* 0.98,
                                    id = paste0(id,as.character(i))))
        j = j + tmpht
      }
    }
    i = i +1
  }
  out
}
