# Load config file
library(here)
source(paste0(here(), "/Code/config.R"))
source(paste0(here(), "/Code/Data Prep.R"))

# Unhash the next two lines if you wish to use sample data 
# data <- data.frame(Name = c("John Blank", "John Blank", "John Blank",
#                             "Joan Blank", "Niall Blank"),
#                    DOB = c("01/01/1960", "01/01/1960", "02/01/1960", 
#                            "01/01/1960", "07/06/1991"),
#                    Age = c(42, 42, 44, 54, 12),
#                    Sex = c("Male", "Male", "Male", 
#                            "Female", "Male"))
your_data <- unique(data)

# Anonymising Unique Identifiers 
anonymisation_data <- your_data %>%
  select(Name, DOB)

# Row Swapping
swapped_data <- your_data %>%
  select(Age)

# Code to produce synthetic data. The output is the dataframe 'synthetic_df' 
source(paste0(here(), "/Code/Procedures/Procedures.R"))

# Visualise the original and synthetic datasets
summary(your_data)
summary(synthetic_data_output)

