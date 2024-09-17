# Load config file
source(paste0(here(), "/Code/config.R"))

# Enter your data and the columns you wish to randomise 

# #### Read data in ####

# Unhash as necessary (Ctrl + Shift + C)

## Read csv file
# your_data = read.csv("enter your data file here")

## Read xlsx file
# your_data <- read_excel("enter your data file here",
#                         sheet = "enter sheet name here")

## Read in SPSS (.sav) files
# password <- "enter password"
# your_data <- readspss::read.spss("enter file name here",
#                                 pass = password,
#                                 use.missings = FALSE
# )

## SQL Code
# Set up the connection to the SQL Server database
# con <- dbConnect(odbc(),
#                   Driver = "SQL Server",
#                   Server = "Server Name",
#                   Database = "Database-Name",
#                   Trusted_Connection = "True")

# Read SQL table
# your_data <- dbGetQuery(con, 'select *  FROM [schema].[table_name];')


