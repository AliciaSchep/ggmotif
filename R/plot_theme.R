#'@import ggplot2
ggmotif_theme <- function(base_size = 12, base_family="Helvetica"){
  theme(line = element_line(colour = "black", size = 0.5, linetype = 1,
                            lineend = "butt"),
        rect = element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
        text = element_text(family = base_family, face = "plain", colour = "black", size = base_size, hjust = 0.5,
                            vjust = 0.5, angle = 0, lineheight = 0.9),
        strip.text = element_text(size = rel(0.8)),
        axis.line = element_line(colour = "black"),
        axis.text = element_text(size = rel(0.8), colour = "black"),
        axis.text.x = element_text(vjust = 1),
        axis.ticks = element_line(colour = "black"),
        axis.title = element_text(),
        axis.ticks.length = grid::unit(0.15, "cm"),
        axis.ticks.margin = grid::unit(0.1, "cm"),
        legend.position = "none",
        panel.background = element_blank(),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.margin = grid::unit(0.25, "lines"),
        panel.margin.x = NULL,
        panel.margin.y = NULL,
        strip.background = element_blank(),
        strip.text.x = element_text(),
        strip.text.y = element_text(angle = -90),
        plot.background = element_blank(),
        plot.title = element_text(size = rel(1.2)),
        plot.margin = grid::unit(c(0.5, 0.5, 0.25, 0.25), "lines"), complete = TRUE)
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

