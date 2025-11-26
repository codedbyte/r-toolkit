# Load Required visualization Library
library(ggplot2)

# Load the built-in mtcars dataset
data(mtcars)


#Explore the dataset structure
cat("Dataset dimensions (rows X columns):", dim(mtcars),"\n")
cat("\nFirst few rows of the dataset: \n")
print(head(mtcars,3))

cat("\nColumn names: \n")
print(names(mtcars))

#Calculate basic Descriptive statistics (MPG - Miles Per Gallon)
mpg_mean <- mean(mtcars$mpg)
mpg_median <- median(mtcars$mpg)
mpg_sd <- sd(mtcars$mpg)
mpg_min <- min(mtcars$mpg)
mpg_max <- max(mtcars$mpg)

#Display the statistics
cat("\n========================================")
cat("\nFuel Efficiency (MPG) Statistics:")
cat("\n========================================\n")
cat("Mean:              ", round(mpg_mean, 2), "mpg\n")
cat("Median:            ", round(mpg_median, 2), "mpg\n")
cat("Standard Deviation:", round(mpg_sd, 2), "mpg\n")
cat("Minimum:           ", round(mpg_min, 2), "mpg\n")
cat("Maximum:           ", round(mpg_max, 2), "mpg\n")

# Calculate Correlation between weight and MPG
correlation <- cor(mtcars$wt, mtcars$mpg)
cat("\nCorrelation between weight and MPG:", round(correlation, 3), "\n")
cat("(Negative correlation means heavier cars have lower MPG)\n")

# Create a publication-quality Scatter plot
plot <- ggplot(mtcars, aes(x=wt, y =mpg)) +
  # Add points (scatter plot)
  geom_point(color="steelblue", size =3, alpha=0.7) +
  # Add a linear regression trend line with confidence interval
  geom_smooth(method="lm", color="red", se=TRUE, alpha=0.2) +
  
  # Add labels and Title
  
  labs(
    title ="Relationship Between Car Weight and Fuel Efficiency",
    subititle = "Data from 1974 Motor Trend Magazine(32 automobiles)",
    x= "Weight (1000lbs)",
    y="Miles Per Gallon (MPG)",
    caption = "Data source: mtcars dataset | Visualization: ggplot2"
  ) +
  
  #Apply a clean theme
  
  theme_minimal() +
  
  #Custom theme elements
  
  theme(
    plot.title = element_text(hjust = 0.5, face="bold", size = 14),
    plot.subtitile = element_text(hjust = 0.5, size=10, color ="gray40"),
    axis.title = element_text(face="bold"),
    plot.caption = element_text(size=8, color = "gray50")
  )


#Display Plot in Rstudio
print(plot)

# Save the plot as a high resolution image

ggsave(
  filename = "mpg_vs_weight_analysis.png",
  plot = plot,
  width = 10,
  height = 6,
  dpi = 300,
  bg = "white"
)

cat("\n========================================")
cat("\nPlot saved as 'mpg_vs_weight_analysis.png'")
cat("\nCheck your working directory for the file.")
cat("\n========================================\n")

# Simple interpretation
cat("\nInterpretation:\n")
cat("The negative correlation (", round(correlation, 3), ") indicates that\n")
cat("heavier vehicles consume more fuel (lower MPG). This makes\n")
cat("physical sense: more weight requires more energy to move.\n")
  
