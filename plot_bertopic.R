library(data.table)
library(ggplot2)

theme_set(theme_bw()) # change the default ggplot theme to black-and-white
theme_update(
  panel.grid.minor = element_blank()
)

result <- fread("bertopic_result.csv", data.table = F)
result <- result[result$labels != -1, ]
result$labels <- as.factor(result$labels + 1)
result$antivax <- as.factor(result$antivax)
ggplot(data=result) +
  geom_point(aes(x=x, y=y, color=labels)) +
  scale_color_brewer(palette = "Set2", name = "Topic")

ggplot(data=result) +
  geom_point(aes(x=x, y=y, color=antivax)) +
  scale_color_brewer(palette = "Set2", name = "Vaccine Attitude",
                     labels = c("0" = "Not antivax", "1" = "Antivax"))
