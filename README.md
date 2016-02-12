# ggmotif
add DNA sequence motifs to ggplot

Inspired by, and letters based on, seqLogo Bioconductor package.

Plots DNA sequence motif in ggplot2 framework.

Either create a standalone plot, or add a sequence logo at a specific position with a specific size into a ggplot.

```r
ggmotif_plot("ACGWRT") 

```
```r
ggplot() + ggmotif("ACGWRT", x.pos = 5, y.pos = 3, ht = 0.2, wt = 0.2) + ggmotif_scale() 

```
