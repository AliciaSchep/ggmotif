# Functions to test whether a vector is all TRUE or all FALSE ------------------
all_true <- function(x){
  stopifnot(inherits(x,"logical"))
  ifelse(sum(x)==length(x), TRUE, FALSE)
}

all_false <- function(x){
  stopifnot(inherits(x,"logical"))
  ifelse(sum(x)==0, TRUE, FALSE)
}

# not in -----------------------------------------------------------------------
'%ni%' = Negate('%in%')

# Convert ambiguous nucleotides ------------------------------------------------

convert_ambiguous_matrix <- function(mat){
  base_letters <- c("A","C","G","T")
  amb_letters <- names(Biostrings::IUPAC_CODE_MAP)[which(names(Biostrings::IUPAC_CODE_MAP) %ni% base_letters)]
  if (!all_true(rownames(mat) %in% c(base_letters,amb_letters))){
    stop("Input matrix must only consist of valid DNA letters (includes IUPAC ambiguous codes)")
  }
  if (!all_true(as.vector(mat >= 0))){
    stop("If ambiguous letters used, matrix must not contain negative values.")
  }
  if (!all_true(base_letters %in% rownames(mat))){
    missing <- base_letters[which(base_letters %ni% rownames(mat))]
    mat <- rbind(mat, matrix(0, nrow = length(missing), ncol = ncol(mat), dimnames = list(missing, NULL)))
  }
  out <- mat[c("A","C","G","T"),]
  for (letter in rownames(mat)[rownames(mat) %in% amb_letters]){
    matches <- strsplit(Biostrings::IUPAC_CODE_MAP[letter],"")[[1]]
    out[matches,] = out[matches,] + matrix(mat[letter,]/length(matches), byrow = TRUE, nrow = length(matches), ncol = ncol(mat))
  }
  return(out)
}
