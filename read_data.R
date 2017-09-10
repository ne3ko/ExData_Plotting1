## read_data reads the data of the text file, it then pulls a subset of the data
## (from 1/2/2007 to 2/2/2007) to be analysed. It then combines the Date and Time
## columns and changes the class to POSIXlt, and returns the subset.

read_data <- function(text_file){	
	## Reads the text file, then pulls out a subset between dates 1/2/07 and
	## 2/2/07	
	data <- read.table(text_file, header = T, sep = ";", na.strings = "?")
	subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

	## Combines the Date and Time columns into the Time column, and 
	## changes the class to POSIXlt
	subset$Time <- strptime(
		paste(subset$Date,subset$Time),
		format = "%d/%m/%Y %H:%M:%S"
	)
	##Deletes the Date column (not necessary, but makes it cleaner)
	subset$Date <- NULL

	## Returns the subset
	subset
}