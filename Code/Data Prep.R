# Enter your data and the columns you wish to randomise 

# #### Read data in ####

# Unhash as necessary (Ctrl + Shift + C)

## Read csv file
# dfexample = read.csv("enter your data file here")

## Read xlsx file
# dfexample <- read_excel("enter your data file here",
#                         sheet = "enter sheet name here")

## Read in SPSS (.sav) files
# dfexample <- read.spss("T:/Projects/37 - HRCS Paybill/NICS TechLab Database - June 23/Data/FINAL Non-Ind TechLab Data - Mod DB June 23.sav",
#                          sheet = "Enter sheet name",
#                          to.data.frame = TRUE)

## SQL Code
# Set up the connection to the SQL Server database
# con <<- dbConnect(odbc(),
#                   Driver = "SQL Server",
#                   Server = "PR-AL-SQL03\\NISRA16",
#                   Database = "CSU_B5Wages",
#                   Trusted_Connection = "True")
#
# Read SQL table
# dfexample <- dbGetQuery(con, 'select *
#                              from "dbo"."lkpInterviewer"')

