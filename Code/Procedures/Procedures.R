# 1. Anonymising sensitive columns (such as unique identifiers or names)
if( exists("anonymisation_data") ){

  # Synthetic data
  a <- 0:9
  letters_and_numbers <- list(Letters_and_Numbers = c(LETTERS, 0:9))
  b <- letters_and_numbers$Letters_and_Numbers
  
  character_df <- data.frame(row_id = c(1:nrow(anonymisation_data)))
  
  for (x in 1:(ncol(anonymisation_data))) {
    
    if(is.character(anonymisation_data[,x])){
      character_data <- anonymisation_data %>%
        select(x)
      avg_col <- nchar(character_data[,1])
      avg_col <- mean(avg_col, na.rm = TRUE)
      avg_col <- strtrim(letters_and_numbers, avg_col)
      character_data <- character_data %>%
        replace(is.na(.), avg_col)
      character_df <- cbind(character_df, character_data)
    }
  }
  
  numeric_df <- data.frame(row_id = c(1:nrow(anonymisation_data)))
  
  for (x in 1:(ncol(anonymisation_data))) {
    
    if(is.numeric(anonymisation_data[,x])){
      numeric_data <- anonymisation_data %>%
        select(x)
      avg_col <- round_half_up(mean(numeric_data[,1], na.rm = TRUE))
      numeric_data <- numeric_data %>%
        replace(is.na(.), avg_col)
      numeric_df <- cbind(numeric_df, numeric_data)
    }
  }
    
    anonymisation_data <- cbind(numeric_df, character_df)
    
    anonymisation_data <- anonymisation_data %>%
      select(-row_id)
    
    df <- anonymisation_data 
    
    df <- df %>% 
      mutate(across(where(is.factor), as.character))
    
    myFun <- function(y) {
      do.call(paste0, replicate(y, sample(b, 1, TRUE), FALSE))
    }
    
    mynumbFun <- function(y) {
      c <- do.call(paste0, replicate(y, sample(a, 1, TRUE), FALSE))
      as.double(c)
    }
 
    df$row_number <- seq.int(nrow(df))
    
    synthetic_df <- data.frame(matrix(NA, nrow = nrow(df), ncol = 0))
    
    for (x in 1:(ncol(df)- 1)) {
      
      synthetic_data <- subset(df, select = c(x))
      
      data_type <- print(unique(sapply(synthetic_data[,1], class)))

      if (data_type == "character") {
        
        number_char <- nchar(synthetic_data[,1])
        number_rows <- nrow(synthetic_data)
        anonymised_char <- print(sapply(number_char, myFun))
        anonymised_char <- as.data.frame(anonymised_char)
        synthetic_df[x] <- anonymised_char
    
      } else if (data_type == "numeric") {
    
        numeric_data <- your_data %>%
          select(x)
        avg_col <- mean(numeric_data[,1], na.rm = TRUE)
        numeric_data <- numeric_data %>%
          replace(is.na(.), avg_col)
        numeric_df <- cbind(numeric_df, numeric_data)
        number_chars <- nchar(synthetic_data[,1])
        number_rows <- nrow(synthetic_data)
        anonymised_postcode <- print(sapply(number_chars, mynumbFun))
        anonymised_postcode <- as.data.frame(anonymised_postcode)
        synthetic_df[x] <- anonymised_postcode
        
        } else {
        print("Not a number or character")
      }
      
    }
    
    colnames(synthetic_df) <- colnames(anonymisation_data)
    
    similar_columns1 <- colnames(synthetic_df)
    
    final_anonymised_data <- synthetic_df %>%
      select(-similar_columns1)
}

# Row Swapping
if( exists("swapped_data") ){

  final_swapped_synthetic_data <- as.data.frame(lapply(swapped_data, sample))
}

# Create final synthetic dataframe
synthetic_data_output <- your_data
synthetic_data_cols <- colnames(synthetic_data_output)

if( exists("swapped_data") ){
  swapped_names <- colnames(final_swapped_synthetic_data) 
  synthetic_data_output <- synthetic_data_output %>%
    select(-swapped_names)
  synthetic_data_output <- cbind(synthetic_data_output, 
                                        final_swapped_synthetic_data)
  synthetic_data_output <- synthetic_data_output %>%
    select(synthetic_data_cols)
}

if( exists("anonymisation_data") ){
  anonymised_names <- colnames(anonymisation_data) 
  synthetic_data_output <- synthetic_data_output %>%
    select(-anonymised_names)
  synthetic_data_output <- cbind(synthetic_data_output, 
                                 anonymisation_data)
  synthetic_data_output <- synthetic_data_output %>%
    select(synthetic_data_cols)
}

rm("anonymisation_data", "anonymised_char", "character_data",
   "character_df", "df", "final_anonymised_data", "final_swapped_synthetic_data", 
   "letters_and_numbers", "numeric_df", 
   "swapped_data", "synthetic_data", "synthetic_df")

synthetic_data <- synthetic_data_output
rm("synthetic_data_output")

# Colors for visuals 
bar_plot_colors <- c("#3878c5", "#00205b", "#68a41e", "#732777", "#ce70d2")

# df <- data.frame(ID = c(1, 2, 3, 4),
#                  Religion = c("Catholic", "Protestant", "Catholic", "Catholic"),
#                  Age = c(32, 21, 12, 34))
# anonymised_df = transform(df, Religion = sample(Religion))
# anonymised_df = transform(df, Age = sample(Age))
# anonymised_df
# df

# set.seed(101) # Set Seed so that same sample can be reproduced in future also
# 
# # Now Selecting 75% of data as sample from total 'n' rows of the data  
# sample <- sample.int(n = nrow(df), size = floor(.9*nrow(df)), replace = F)
# train <- df[sample, ]
# test  <- df[-sample, ]
# test
# train
# df <- rbind(test, train)
# df

# dummy_df_plot <- dummy_df %>%
#   group_by(Religion) %>%
#   dplyr::summarise(N = n()) %>%
#   arrange(desc(N))
# 
# synthetic_data <- dummy_df
# sythetic_df_plot <- synthetic_data %>%
#   group_by(Religion) %>%
#   dplyr::summarise(N = n()) %>%
#   arrange(desc(N))
# 
# a <- ggplot(sythetic_df_plot, aes(x = reorder(Religion, N), y = N)) +
#   geom_bar(fill = "steelblue", stat = "identity") +
#   xlab("Martial Status") +
#   ylab("Count")
# 
# b <- ggplot(dummy_df_plot, aes(x = reorder(Religion, N),  y = N)) +
#   geom_bar(fill = "steelblue", stat = "identity") +
#   xlab("Martial Status") +
#   ylab("Count")
# 
# grid.arrange(a, b, top="", ncol=2)
# 
# # Change colors
# ggplot(dummy_df, aes(x=Age)) + 
#   geom_histogram(color="black", fill="steelblue") + 
#   ggtitle("Age Histogram") 
# 
# ggplot(synthetic_data, aes(x=Age)) + 
#   geom_histogram(color="black", fill="steelblue") + 
#   ggtitle("Age Histogram") 
