## The plot2 function calls the read_data function to read the data from the text file,
## then it produces a line graph of Global Active Power vs Time and saves it to a png
## file in the directory.

plot2 <- function(text_file){
	## Calls the read_data function, from "read_data.R".
	source("read_data.R")
	data <- read_data(text_file)

	## Creates a line graph of Global Active Power vs Time.
	plot(
		data$Time, data$Global_active_power,		## The x,y coords
		type = "l",					## The type is a line graph
		xlab = "",					## No x-axis label
		ylab = "Global Active Power (kilowatts)"	## The y-axis label
	)	

	## Saves a 480x480 png file of the graph to the current dir
	dev.copy(png, 'plot2.png', width = 480, height = 480)
	dev.off()
}