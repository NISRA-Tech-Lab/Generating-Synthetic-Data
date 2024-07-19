final_synthetic_data <- your_data 

# 1. Anonymising sensitive columns (such as unique identifiers or names)
if( exists("anonymisation_data") ){
  
    df <- anonymisation_data 
    
    df <- df %>% 
      mutate(across(where(is.factor), as.character))
    
    # Synthetic data
    # Challenge in retaining statistical properties in the original data
    a <- 0:9
    letters_and_numbers <- list(Letters_and_Numbers = c(LETTERS, 0:9))
    b <- letters_and_numbers$Letters_and_Numbers
    
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
    
      } else if (data_type == "double") {
    
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
    
    final_synthetic_data <- final_synthetic_data %>%
      select(-similar_columns1)
    
    final_synthetic_data <- cbind(final_synthetic_data, synthetic_df)
}

# Row Swapping
if( exists("swapped_data") ){
  
  number_cols <- ncol(swapped_data)
  list_number_cols <- 1:number_cols
  number_rows <- nrow(swapped_data)
  syn_df <- data.frame(matrix(ncol = 0, nrow = number_rows))
  
  for(i in list_number_cols) {
    nam <- paste("swapped_data", i, sep = "_")
    assign(nam, data.frame(table(swapped_data[,i])))
    
    nam2 <- paste("col", i, sep = "")
    assign(nam2, as.character(rep(get(nam)[,1],
                                  times = get(nam)[,2])))
    syn_df <- syn_df %>% add_column(placeholder_name = sample(get(nam2)))  
    col.name <- colnames(swapped_data[i])
    names(syn_df)[i] <- col.name
  }
  
  similar_columns2 <- colnames(syn_df)

  final_synthetic_data <- final_synthetic_data %>%
    select(-similar_columns2)
  
  final_synthetic_data <- cbind(final_synthetic_data, syn_df)
}

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
