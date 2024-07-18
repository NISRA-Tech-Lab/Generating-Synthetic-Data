your_data <- data.frame(Postcode = c('BT107AZ', 'BT97GY', 'BT106GY', 'BT80GY'),
                 Phone = c(8797676755, 8976786867, 8745435433, 8654543445))

# Anonymising Unique Identifiers 
anonymisation_data <- your_data %>%
  select()

# Row Swapping 
swapped_data <- your_data
anonymisation_data <- your_data %>%
  select()

synthetic_df <- synthetic_df %>%
  rename(Postcode = anonymised_char, Phone = anonymised_postcode)
kable(synthetic_df) %>%
  kableExtra::kable_styling(bootstrap_options = "bordered",
                            full_width = FALSE)

# Code to produce synthetic data. The output is the dataframe 'synthetic_df' 
source("Functions/Functions.R")

# Visualise the original and synthetic datasets
ggplot(data=syn_df, aes(x=dose, y=len)) +
  geom_bar(stat="identity")
p
original_data_plot <- barplot(prop.table(table(syn_df$Marital_Status)), 
                              col = bar_plot_colors)
synthetic_data_plot <- barplot(prop.table(table(df$Marital_Status)), 
                               col = bar_plot_colors)
grid.arrange(grobTree(original_data_plot), grobTree(synthetic_data_plot), top="Main Title", ncol=2)

par(mfrow = c(1, 1)) # 3 rows and 2 columns
original_data_plot
original_data_plot
