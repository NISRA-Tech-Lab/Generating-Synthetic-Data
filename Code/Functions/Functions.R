library(stringr)
library(synthpop)

# Synthetic data
# Challenge in retaining statistical properties in the original data
letters_and_numbers <- list(Letters_and_Numbers = c(LETTERS, 0:9))
a <- letters_and_numbers$Letters_and_Numbers

myFun <- function(y) {
  a <- do.call(paste0, replicate(y, sample(a, 1, TRUE), FALSE))
  paste0(a)
}

df <- data.frame(Postcode = c('BT107AZ', 'BT97GY', 'BT106GY', 'BT80GY'),
                 Phone = c(8797676755, 8976786867, 8745435433, 8654543445))
number_chars <- nchar(df$Postcode)
number_rows <- nrow(df)

data_type <- print(typeof(df$Phone))
anonymised_postcode <- print(sapply(number_chars, myFun))

a <- 0:9
mynumbFun <- function(y) {
  a <- do.call(paste0, replicate(y, sample(a, 1, TRUE), FALSE))
  paste0(a)
}

number_chars <- nchar(df$Phone)
number_rows <- nrow(df)

anonymised_phone <- print(sapply(number_chars, mynumbFun))
synthetic_df <- data.frame(Postcode = c(anonymised_postcode),
                           Phone = c(anonymised_phone))

df$row_number <- seq.int(nrow(df))

for (x in 1:nrow(df)) {
  
  synthetic_data <- df
  
  synthetic_data <- subset(synthetic_data, select = -c(row_number))
  
  synthetic_data[,x]
  
  data_type <- print(typeof(synthetic_data[,x]))
  
  if (data_type == "character") {
    
    number_chars <- nchar(df[,x])
    number_rows <- nrow(df)
    anonymised_postcode <- print(sapply(number_chars, myFun))
    
  } else if (data_type == "double") {

    number_chars <- nchar(df[,x])
    number_rows <- nrow(df)
    anonymised_postcode <- print(sapply(number_chars, mynumbFun))
    
  } else {
    print("Not a number or character")
  }
  
  ifnotexists(synthetic_df) { 
    synthetic_df <- data.frame 
  }
  
  synthetic_df[1] <- colnames(df)
  
  
}

# The objective of synthesising data is to generate a data set which resembles the original as
# closely as possible, meaning also preserving the missing value structure.
df <- data.frame(ID = c(1, 2, 3, 4),
                 Religion = c("Catholic", "Protestant", "Catholic", "Catholic"),
                 Age = c(32, 21, 12, 34))
anonymised_df = transform(df, Religion = sample(Religion))
anonymised_df = transform(df, Age = sample(Age))
anonymised_df
df

set.seed(101) # Set Seed so that same sample can be reproduced in future also

# Now Selecting 75% of data as sample from total 'n' rows of the data  
sample <- sample.int(n = nrow(df), size = floor(.9*nrow(df)), replace = F)
train <- df[sample, ]
test  <- df[-sample, ]
test
train
df <- rbind(test, train)
df

# Dummy data
dummy_df <- data.frame(Age = c(34, 32, 12, 54, 56, 54, 54, 23, 12, 13),
                       Sex = c("Male", "Female", "Male", "Male", "Male", "Female", "Female", "Male", "Female", "Male"),
                       Area = c("Belfast", "Derry", "Down", "Belfast", "Derry", "Down", "Belfast", "Down", "Belfast", "Belfast"),
                       Marital_Status = c("Single", "Single", "Divorced", "Single", "Single", "Divorced", "Single", "Married", "Divorced", "Divorced")
)
my.seed <- 1798
synthetic_data <- syn(dummy_df)
synthetic_data$syn
dummy_df

synthetic_data_parametric <- syn(dummy_df, method = "parametric", seed = my.seed)
synthetic_data_parametric$syn

library(dplyr)
library(ggplot2)

dummy_df_plot <- dummy_df %>%
  group_by(Marital_Status) %>%
  dplyr::summarise(N = n()) %>%
  arrange(desc(N))

sythetic_df_plot <- synthetic_data$syn %>%
  group_by(Marital_Status) %>%
  dplyr::summarise(N = n()) %>%
  arrange(desc(N))

ggplot(sythetic_df_plot, aes(x = reorder(Marital_Status, N), y = N)) +
  geom_bar(fill = "steelblue", stat = "identity") +
  coord_flip() +
  xlab("Martial Status") +
  ylab("Count")

ggplot(dummy_df_plot, aes(x = reorder(Marital_Status, N),  y = N)) +
  geom_bar(fill = "steelblue", stat = "identity") +
  coord_flip() +
  xlab("Martial Status") +
  ylab("Count")

# Change colors
ggplot(dummy_df, aes(x=Age)) + 
  geom_histogram(color="black", fill="steelblue") + 
  ggtitle("Age Histogram") 

ggplot(synthetic_data$syn, aes(x=Age)) + 
  geom_histogram(color="black", fill="steelblue") + 
  ggtitle("Age Histogram") 

# Correlation

# Step 1: Generate Synthetic Data
set.seed(123)  # Set seed for reproducibility
study_hours <- round(runif(100, min = 1, max = 10)) 
exam_scores <- round(70 + study_hours * 5 + rnorm(100, sd = 5))  

# Step 2: Analyze the Data
correlation <- cor(study_hours, exam_scores)  
lm_model <- lm(exam_scores ~ study_hours)  

# Step 3: Visualize the Results
plot(study_hours, exam_scores, main = "Study Hours vs. Exam Scores", 
     xlab = "Study Hours", ylab = "Exam Scores")
abline(lm_model, col = "red")  # Add regression line
text(5, 90, paste("Correlation:", round(correlation, 2)), col = "blue") 


df <- data.frame(Marital_Status  = c("Single", "Single", "Single", "Married", "Married", "Divorced"),
                 Age_Group = c("30-39", "40-49", "40-49", "20-29", "20-29", "30-39"), 
                 Gender = c("Male", "Male", "Male", "Female", "Female", "Male"))
number_cols <- ncol(df)
list_number_cols <- 1:number_cols
syn_df <- data.frame(matrix(ncol = 0, nrow = 6))

# df_1 <- data.frame(table(df[,1]))
# df_2 <- data.frame(table(df[,2]))
# df_3 <- data.frame(table(df[,3]))

for(i in list_number_cols) {
  nam <- paste("df", i, sep = "_")
  assign(nam, data.frame(table(df[,i])))
  
  nam2 <- paste("col", i, sep = "")
  assign(nam2, as.character(rep(get(nam)[,1],
                                times = get(nam)[,2])))
  syn_df <- syn_df %>% add_column(placeholder_name = sample(get(nam2)))  
  col.name <- colnames(df[i])
  names(syn_df)[i] <- col.name
}

barplot(prop.table(table(df$Marital_Status)))
barplot(prop.table(table(syn_df$Marital_Status)))
library(dplyr)
library(tidyverse)
