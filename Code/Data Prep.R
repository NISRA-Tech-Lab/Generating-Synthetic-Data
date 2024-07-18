# Enter your data and the columns you wish to randomise 

# #### Read data in ####

# Unhash as necessary (Ctrl + Shift + C)

## Read csv file
# dfexample = read.csv("enter your data file here")

## Read xlsx file
# dfexample <- read_excel("enter your data file here",
#                         sheet = "enter sheet name here")

## Read in SPSS (.sav) files
# dfexample <- read.spss("enter file name here",
#                          sheet = "Enter sheet name",
#                          to.data.frame = TRUE)

## SQL Code
# Set up the connection to the SQL Server database
# con <<- dbConnect(odbc(),
#                   Driver = "SQL Server",
#                   Server = "Enter your server name",
#                   Database = "Enter the database name",
#                   Trusted_Connection = "True")
#
# Read SQL table
# dfexample <- dbGetQuery(con, 'select *
#                              from dbo.table_name;')

