## The plot1 function calls the read_data function to read in the data from the text file,
## then it produces a histogram of the Global Avtive Power and saves it to a png file
## in the directory.

plot1 <- function(text_file){
	## Calls the read_data function, previously created.
	source("read_data.R")
	data <- read_data(text_file)

	## Creates a histogram of the data
	hist(
		data$Global_active_power,			## The data being plotted
		col = "red", 					## Color of the bars
		main = "Global Active Power",			## Title
		xlab = "Global Active Power (kilowatts)"	## x-axis label
	)

	## Saves a 480x480 png file of the graph to the current dir
	dev.copy(png, 'plot1.png', width = 480, height = 480)
	dev.off()
}