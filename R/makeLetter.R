## makeLetter function is modified from makeLetter, letterA, letterT, letterC, and letterG
## functions from seqLogo package by Oliver Bembom

makeLetter<- function(letter, x.pos = 0, y.pos = 0 , ht = 1, wt = 1, id = ""){
  if (letter == "A"){
    x <- c(0,0.4,0.6,1,0.8,0.5,0.2,0,0.32,0.36,0.66,0.68,0.32) * wt + x.pos
    y <- c(0,1,1,0,0,0.75,0,0,0.3,0.4,0.4,0.3,0.3) * ht + y.pos
    id <- unlist(Map(paste0,id,c(rep("_A1",8),rep("_A2",5))),use.names=F)
    fill <- "A"
  } else if (letter == "C"){
    angle1 <- seq(0.3+pi/2,pi,length=100)
    angle2 <- seq(pi,1.5*pi,length=100)
    x.l1 <- 0.5 + 0.5*sin(angle1)
    y.l1 <- 0.5 + 0.5*cos(angle1)
    x.l2 <- 0.5 + 0.5*sin(angle2)
    y.l2 <- 0.5 + 0.5*cos(angle2)

    x.l <- c(x.l1,x.l2)
    y.l <- c(y.l1,y.l2)

    x <- c(x.l,rev(x.l))
    y <- c(y.l,1-rev(y.l))

    x.i1 <- 0.5 +0.35*sin(angle1)
    y.i1 <- 0.5 +0.35*cos(angle1)
    x.i1 <- x.i1[y.i1<=max(y.l1)]
    y.i1 <- y.i1[y.i1<=max(y.l1)]
    y.i1[1] <- max(y.l1)

    x.i2 <- 0.5 +0.35*sin(angle2)
    y.i2 <- 0.5 +0.35*cos(angle2)

    x.i <- c(x.i1,x.i2)
    y.i <- c(y.i1,y.i2)

    x1 <- c(x.i,rev(x.i))
    y1 <- c(y.i,1-rev(y.i))

    x <- c(x,rev(x1))
    y <- c(y,rev(y1))

    x <- x.pos + wt*x
    y <- y.pos + ht*y

    id <- unlist(Map(paste0,id,rep("_C",length(x))),use.names=F)

    fill <- "C"
  } else if (letter == "G"){
    angle1 <- seq(0.3+pi/2,pi,length=100)
    angle2 <- seq(pi,1.5*pi,length=100)
    x.l1 <- 0.5 + 0.5*sin(angle1)
    y.l1 <- 0.5 + 0.5*cos(angle1)
    x.l2 <- 0.5 + 0.5*sin(angle2)
    y.l2 <- 0.5 + 0.5*cos(angle2)

    x.l <- c(x.l1,x.l2)
    y.l <- c(y.l1,y.l2)

    x <- c(x.l,rev(x.l))
    y <- c(y.l,1-rev(y.l))

    x.i1 <- 0.5 +0.35*sin(angle1)
    y.i1 <- 0.5 +0.35*cos(angle1)
    x.i1 <- x.i1[y.i1<=max(y.l1)]
    y.i1 <- y.i1[y.i1<=max(y.l1)]
    y.i1[1] <- max(y.l1)

    x.i2 <- 0.5 +0.35*sin(angle2)
    y.i2 <- 0.5 +0.35*cos(angle2)

    x.i <- c(x.i1,x.i2)
    y.i <- c(y.i1,y.i2)

    x1 <- c(x.i,rev(x.i))
    y1 <- c(y.i,1-rev(y.i))

    x <- c(x,rev(x1))
    y <- c(y,rev(y1))

    h1 <- max(y.l1)
    r1 <- max(x.l1)

    h1 <- 0.4
    x.add <- c(r1,0.5,0.5,r1-0.2,r1-0.2,r1,r1)
    y.add <- c(h1,h1,h1-0.1,h1-0.1,0,0,h1)

    id <- unlist(Map(paste0,id,c(rep("_G1",length(x)),rep("_G2",length(x.add)))),use.names=F)

    x <- c(rev(x),x.add)
    y <- c(rev(y),y.add)

    x <- x.pos + wt*x
    y <- y.pos + ht*y

    fill <- "G"
  } else if (letter == "T"){
    x <- c(0,1,1,0.6,0.6,0.4,0.4,0) * wt + x.pos
    y <- c(1,1,0.85,0.85,0,0,0.85,0.85) * ht + y.pos

    id <- unlist(Map(paste0,id,rep("_T",8)),use.names=F)

    fill <- "T"
  } else{
    stop("letter must be A, C, G, or T")
  }
  return(data.frame(x=x,y=y,id=id,fill=fill, stringsAsFactors = FALSE))
}
