# Generating-Synthetic-Data

## What is the project?

Synthetic data is artificially generated data that is used to match sensitive data. 

The objective of synthesising data is to generate a data set which resembles the original dataset, with the same row/column count, data types and number of categories as the original dataset. 

### Anonymising Unique Identifiers

This technique randomises any columns that contain sensitive data, such as names or personal identification numbers. It outputs a random string of characters that is the same datatype as the original column. 

### Row Swapping

Row swapping randomises the values in the selected columns. 

Steps

1. Load your data using the 'Data Prep.R' file. The file provides options for loading different types of data

2. Choose which columns you want to anonymise or row swap by entering them in the brackets of the 'select' statement 

3. Run the visualisation code to verify that the original data and synthetic data have the same underlying structures

   

