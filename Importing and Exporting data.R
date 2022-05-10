#Importing data is the primary way you will be using to get your data into R. You can import data from text files (CSV, tab-delimited), Excel, SAS, SPSS, Stata, and so on.

#read.table("file/path", sep = "", header = TRUE, .) is the general-purpose family of functions for reading text data into R

#Importing a text file with Comma Separated Values (CSV) is done with the read.csv() function from the read.table() family.
#As of R versions 4.0+, stringsAsFactors = FALSE is the default.
my.data <- read.csv("file.name", stringsAsFactors = FALSE)
my.data <- read.csv2("file.name", stringsAsFactors = FALSE)

#read.csv2() imports data saved as a CSV but where the decimals are denoted with a comma (?? = 3,14) instead of a dot (?? = 3.14)

my.data <- read.delim("file.name", stringsAsFactors = FALSE)
my.data <- read.delim2("file.name", stringsAsFactors = FALSE)

#read.delim() imports data in which the values are separated by a tab; there is a read.delim2() version of the call, too

#Exporting a data frame out of R to share it with others is done with the write.table() function in a much similar way to importing data.

#write.csv() exports a data frame as a CSV text file, with a write.csv2() for European users

write.csv(my.data, file="file.name", row.names = FALSE)
write.csv2(my.data, file="file.name", row.names = FALSE)

#write.table() with a sep = "\t" argument exports a data frame as a tab-delimited text file
write.table(my.data, file="file.name", sep = "\t", row.names = FALSE)

#The row.names = argument is best set to FALSE. The default TRUE creates a redundant column of numbers in the beginning of your dataframe, if your rows aren't already named.