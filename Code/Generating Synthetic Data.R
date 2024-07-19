source(paste0(here(), "/Code/config.R"))

# Load data 
head(iris)
your_data <- iris

# Anonymisingiris# Anonymising Unique Identifiers 
anonymisation_data <- your_data %>%
  select(Species)

# Row Swapping 
swapped_data <- your_data
swapped_data <- swapped_data %>%
  select(Sepal.Width)

# Code to produce synthetic data. The output is the dataframe 'synthetic_df' 
source(paste0(here(), "/Code/Functions/Functions.R"))

# Visualise the original and synthetic datasets
ggplot(data=syn_df, aes(x=dose, y=len)) +
  geom_bar(stat="identity")
p
original_data_plot <- barplot(prop.table(table(syn_df$Marital_Status)), 
                              col = bar_plot_colors)
synthetic_data_plot <- barplot(prop.table(table(df$Marital_Status)), 
                               col = bar_plot_colors)
grid.arrange(grobTree(original_data_plot), grobTree(synthetic_data_plot), top="Main Title", ncol=2)
