# Generating Synthetic Data

## What is the project?
 
Synthetic data is artificially generated data that is used to match sensitive data. 

The objective of synthesising data is to generate a data set which resembles the original dataset, with the same row/column count, data types and number of categories as the original dataset. 

### Anonymising Unique Identifiers

This technique randomises any columns that contain sensitive data, such as names or personal identification numbers. It outputs a random string of characters that is the same datatype as the original column. 

![image](https://github.com/user-attachments/assets/b98785db-f2f2-4143-92ef-e5ab2fa8b7fe)

### Row Swapping

Row swapping randomises the values in the selected columns. 

![image](https://github.com/user-attachments/assets/88a446a3-9485-4948-9273-d4411144c74f)

# Steps

### 1. Download the Synthetic Data Generator
In order to work with the Synthetic Data Generator the project folder must first be downloaded onto your local computer. Follow these steps to complete this process: 

- Download the Project as a ZIP file by clicking on the ‘Code (zip)’ button and clicking 'Download Zip.' 

- Open your ‘Downloads’ folder using Windows Explorer and extract the Synthetic Data Generator contents by right-clicking on the ZIP file and selecting ‘Extract All’.  

- The Synthetic Data Generator will be contained within a folder with a name such as `Generating-Synthetic-Data`. Choose an appropriate location to save this folder e.g. your desktop. 

### 2. Activate renv

Upon opening the `Generating-Synthetic-Data.Rproj` file for the first time you may see the following `Renv` warning appear in the console of R studio:

![image](https://github.com/user-attachments/assets/e9ebe115-f614-426a-bbf7-b8a6ef15987e)

`Renv` is used to lock the current version of the packages within the project so that any future package updates do not cause any issues with running code. `Renv` only needs to be activated once at the start of each project and it will attempt to automatically activate - the above warning is a sign that this automatic activation has failed and must be activated manually. Once `Renv` has been activated manually the above warning will disappear.

To manually activate `Renv`, run the following lines of code one at a time in the console:

- `source("renv/activate.R")`

- `renv::restore()` 

- After running `renv::restore()` press 'y' to accept.

If you did not see the above warning the first time you opened the `Generating-Synthetic-Data.Rproj` file, it means that `Renv` was able to activate automatically. In this case, there is no need to run `source("renv/activate.R")`. Instead just run `renv::restore()` and press `y` to accept.   

At this stage `Renv` has been activated. For further information visit the [Renv website.](https://rstudio.github.io/renv/index.html)

#### Help & Troubleshooting

If the above commands do not appear to work or error message appear, read more about troubleshooting renv in our [R Documentation](https://datavis.nisra.gov.uk/techlab/drpvze/r.html#renv_troubleshooting) <WILL USERS e.g. THEOTHER  ACCELERATOR PARTICIPANTS BE ABLE TO ACCESS THIS LINK?>

### 3. Load Your Data

Load your data using the 'Data Prep.R' file. The file provides options for loading different types of data into a dataframe called 'your_data'. 

### 4. Select Columns 

Choose which columns you want to anonymise or row swap by entering them in the brackets of the 'select' statement.

### 5. Compare the datasets using visualisations

Run the visualisation code to verify that the original data and synthetic data have the same underlying structures

   

