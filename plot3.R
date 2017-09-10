## The plot3 function calls the read_data function to read the data from the text file,
## then produces three line graphs for Sub_metering_1, Sub_metering_2, and Sub_metering_3,
## and combines them into one plot. Lastly, it saves the plot to a png file in the directory.

plot3 <- function(text_file){
	## Calls the read_data function, from "read_data.R".
	source("read_data.R")
	data <- read_data(text_file)

	## Creates a line graph of Sub_metering_1 vs Time
	plot(
		data$Time,data$Sub_metering_1,		## The x,y coords
		type = "l",				## Type is a line graph
		xlab = "",				## No x-axis label
		ylab = "Energy sub metering"		## The y-axis label
	)
	## Adds a line graph of Sub_metering_2 vs Time to the previous
	## graph
	lines(
		data$Time,data$Sub_metering_2,		## The x,y coords
		type = "l",				## Type is a line graph
		col = "red"				## Color of the line is red
	)
	## Adds a line graph of Sub_metering_3 vs Time to the
	## previous graph.
	lines(
		data$Time,data$Sub_metering_3,		## The x,y coords
		type = "l",				## Type is a line graph
		col = "blue"				## Color of the line is blue
	)
	## Produces a legend of the three plots in the top right corner
	## of the graph.
	legend(
		## Places legend in the top-right corner
		"topright",
		## Adds labels to the legend
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		## Changes color of each line in legend
		col = c("black","red","blue"),
		## Established the line type for 
		lty = c(1,1,1)
	)

	## Saves a 480x480 png file of the graph to the current dir
	dev.copy(png, 'plot3.png', width = 480, height = 480)
	dev.off()
}