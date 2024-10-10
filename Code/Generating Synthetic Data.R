# Load config file
library(here)
source(paste0(here(), "/Code/config.R"))
source(paste0(here(), "/Code/Data Prep.R"))

# Unhash the next two lines if you wish to use sample data 
# head(iris)
# your_data <- iris

data <- data.frame(Name = c("John Mannion", "John Mannion", "John Mannion",
                            "Mary Mannion", "Niall Mannion"),
                   DOB = c("01/01/1960", "01/01/1960", "02/01/1960", 
                           "01/01/1960", "07/06/1991"))
your_data <- unique(data)

# Anonymising Unique Identifiers 
anonymisation_data <- your_data %>%
  select(Name, DOB)

# Row Swapping
swapped_data <- your_data %>%
  select(-IntNo, -PayLevel)

# Code to produce synthetic data. The output is the dataframe 'synthetic_df' 
source(paste0(here(), "/Code/Procedures/Procedures.R"))

synthetic_data_output <- synthetic_data_output %>%
  rename(Syn_Name = Name, Syn_DOB = DOB)
syn_data <- cbind(your_data, synthetic_data_output)
data_output <- left_join(data, syn_data, by = c("Name" = "Name", "DOB" = "DOB"))

# Visualise the original and synthetic datasets
summary(your_data)


# ggplot(data=syn_df, aes(x=dose, y=len)) +
#   geom_bar(stat="identity")
# original_data_plot <- barplot(prop.table(table(syn_df$Marital_Status)), 
#                               col = bar_plot_colors)
# synthetic_data_plot <- barplot(prop.table(table(df$Marital_Status)), 
#                                col = bar_plot_colors)
# grid.arrange(grobTree(original_data_plot), grobTree(synthetic_data_plot), top="Main Title", ncol=2)
