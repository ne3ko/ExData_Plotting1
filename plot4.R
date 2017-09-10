## The plot4 functions called the read_data function to read the txt file.
## It then produces four seperate graphs and combines them into one image.
## Lastly, it saves the image into a 480x480 png file.

plot4 <- function(text_file){
	## Calls the read_data function, from "read_data.R".
	source("read_data.R")
	data <- read_data(text_file)

	par(mfrow = c(2,2))
	with(data, {	
		## Calls the function for the line graph of Global Active Power vs Time.
		plot(
			data$Time, data$Global_active_power,	## The x,y coords
			type = "l",				## The type is a line graph
			xlab = "",				## No x-axis label
			ylab = "Global Active Power"		## The y-axis label
		)

		## Creates a line graph of Voltage vs Time.
		plot(
			data$Time, data$Voltage,		## The x,y coords
			type = "l",				## The type is a line graph
			xlab = "datetime",			## No x-axis label
			ylab = "Voltage"			## The y-axis label
		)

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

		## Creates a line graph of Global_reactive_power vs Time.
		plot(
			data$Time, data$Global_reactive_power,	## The x,y coords
			type = "l",				## The type is a line graph
			xlab = "datetime",			## No x-axis label
			ylab = "Global_reactive_power"		## The y-axis label
		)
	}
	)

	## Saves a 480x480 png file of the graph to the current dir
	dev.copy(png, 'plot4.png', width = 480, height = 480)
	dev.off()
}