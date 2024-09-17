# Load config file
library(here)
source(paste0(here(), "/Code/config.R"))
source(paste0(here(), "/Code/Data Prep.R"))

# Unhash the next two lines if you wish to use sample data 
# head(iris)
# your_data <- iris

# Anonymising Unique Identifiers 
anonymisation_data <- your_data %>%
  select(IntNo, PayLevel, FirstName, Title, Surname)

# Row Swapping
swapped_data <- your_data %>%
  select(-IntNo, -PayLevel)

# Code to produce synthetic data. The output is the dataframe 'synthetic_df' 
source(paste0(here(), "/Code/Procedures/Procedures.R"))

# Visualise the original and synthetic datasets
summary(your_data)
# ggplot(data=syn_df, aes(x=dose, y=len)) +
#   geom_bar(stat="identity")
# original_data_plot <- barplot(prop.table(table(syn_df$Marital_Status)), 
#                               col = bar_plot_colors)
# synthetic_data_plot <- barplot(prop.table(table(df$Marital_Status)), 
#                                col = bar_plot_colors)
# grid.arrange(grobTree(original_data_plot), grobTree(synthetic_data_plot), top="Main Title", ncol=2)
