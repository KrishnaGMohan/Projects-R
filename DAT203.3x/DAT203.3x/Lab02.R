#-------------------------------------------------
# SpatialPointsDataFrame
# SpatialPolygonsDataFrame
# SpatialGridDataFrame
# SpatialPixelsDataFrame
#-------------------------------------------------
# Load and Examine the Data
#-------------------------------------

library(sp) # Spatial data frames defined
data(meuse)
names(meuse)
class(meuse)

set.coords = function(df) {
    require(sp)
    # Function converts dataframe to spatialpointsdataframe
    # Convert to spatial points data frame
    coordinates(df) = ~x + y

    # Assign the datum and compute the lat-lon of the 
    # of the x-y coordinates
    proj4string(df) <- CRS("+proj=stere
   +lat_0=52.15616055555555 +lon_0=5.38763888888889
   +k=0.999908 +x_0=155000 +y_0=463000
   +ellps=bessel +units=m +no_defs
   +towgs84=565.2369,50.0087,465.658,
   -0.406857330322398,0.350732676542563,-1.8703473836068, 4.0812")
    df
}
meuse = set.coords(meuse)
class(meuse)
summary(meuse)

#---------------------------------
# Loading the Grid Data
#--------------------------------
data(meuse.grid)
class(meuse.grid)
meuse.grid <- set.coords(meuse.grid)
gridded(meuse.grid) = TRUE
class(meuse.grid)
summary(meuse.grid)

#------------------------------------------
# Plot the Metal Concentration
#------------------------------------------

cols <- c("cadmium", "copper", "lead", "zinc")
plot.bubble <- function(x) {
    Title <- paste("Concentration of ", x)
    bubble(meuse, x, col = c("#00ff0088", "#00ff0088"), main = Title)
}
par(mar = c(0.7, 0.7, 0.7, 0.7))
lapply(cols, plot.bubble)

#---------------------------------------------------
# Plot Copper
#---------------------------------------------------

require(ggplot2)
#ggplot(data.frame(meuse), aes(dist, copper)) +
#geom_point(size = 2, color = 'blue', alpha = 0.3) +
#ggtitle("Concentration of copper vs. distance") +
#ylab("Copper concentration") +
#xlab("Distance from river")

meuse$logCopper <- log(meuse$copper)
#ggplot(data.frame(meuse), aes(dist, logCopper)) +
#geom_point(size = 2, color = 'blue', alpha = 0.3) +
#ggtitle("Log of concentration of copper vs. distance") +
#ylab("Log copper concentration") +
#xlab("Distance from river")

meuse$sqrtDist <- sqrt(meuse$dist)
ggplot(data.frame(meuse), aes(sqrtDist, logCopper)) +
geom_point(size = 2, color = 'blue', alpha = 0.3) +
ggtitle("Log of concentration of copper vs. sqrt of distance") +
ylab("Log copper concentration") +
xlab("Sqrt of distance from river")

#---------------------------------------------------
# Plot Zinc
#---------------------------------------------------
require(ggplot2)
#ggplot(data.frame(meuse), aes(dist, copper)) +
#geom_point(size = 2, color = 'blue', alpha = 0.3) +
#ggtitle("Concentration of copper vs. distance") +
#ylab("Copper concentration") +
#xlab("Distance from river")

meuse$logZinc <- log(meuse$zinc)
#ggplot(data.frame(meuse), aes(dist, logCopper)) +
#geom_point(size = 2, color = 'blue', alpha = 0.3) +
#ggtitle("Log of concentration of copper vs. distance") +
#ylab("Log copper concentration") +
#xlab("Distance from river")

meuse$sqrtDist <- sqrt(meuse$dist)
ggplot(data.frame(meuse), aes(sqrtDist, logZinc)) +
geom_point(size = 2, color = 'blue', alpha = 0.3) +
ggtitle("Log of concentration of zinc vs. sqrt of distance") +
ylab("Log zinc concentration") +
xlab("Sqrt of distance from river")

#----------------------------------------
# Variogram copper
#---------------------------------------
install.packages("gstat")
library(gstat)
copper.vgm <- variogram(logCopper ~ sqrtDist, meuse)
copper.vgm.fit <- fit.variogram(copper.vgm, model = vgm(1, "Sph", 900, 1))
copper.vgm.fit

plot(copper.vgm, copper.vgm.fit, main = "Semivariance of copper concentration vs. distance")

copper.vgm.dir = variogram(logCopper ~ sqrtDist, meuse, alpha = c(0, 45, 90, 135))
plot(copper.vgm.dir, copper.vgm.fit, main = "Variograms of copper concentration at various angles")

copper.vgm.map <- variogram(logCopper ~ sqrtDist, meuse, cutoff = 1500, width = 100, map = TRUE)
plot(copper.vgm.map, threshold = 5, main = "Map of semivariance of copper concentration")

#----------------------------------------
# Variogram zinc
#---------------------------------------
install.packages("gstat")
library(gstat)
zinc.vgm <- variogram(logZinc ~ sqrtDist, meuse)
zinc.vgm.fit <- fit.variogram(zinc.vgm, model = vgm(1, "Sph", 900, 1))
zinc.vgm.fit

plot(zinc.vgm, zinc.vgm.fit, main = "Semivariance of zinc concentration vs. distance")

zinc.vgm.dir = variogram(logZinc ~ sqrtDist, meuse, alpha = c(0, 45, 90, 135))
plot(zinc.vgm.dir, zinc.vgm.fit, main = "Variograms of zinc concentration at various angles")

zinc.vgm.map <- variogram(logZinc ~ sqrtDist, meuse, cutoff = 1500, width = 100, map = TRUE)
plot(zinc.vgm.map, threshold = 5, main = "Map of semivariance of zinc concentration")
#------------------------------------------------------------
# Krigging copper
#------------------------------------------------------------
par(mar = c(0.7, 0.7, 0.7, 0.7))
image(meuse.grid["dist"])
title("distance to river (red=0)")

copper.idw = idw(copper ~ 1, meuse, meuse.grid)
names(copper.idw)

par(mar = c(0.7, 0.7, 0.7, 0.7))
spplot(copper.idw["var1.pred"], main = "Inverse distance weighted interpolation for copper concentration")

copper.kriged <- krige(logCopper ~ 1, meuse, meuse.grid, model = copper.vgm.fit)
spplot(copper.kriged["var1.pred"], man = "Plot of kriging model of copper concentration")



#------------------------------------------------------------
# Krigging zinc
#------------------------------------------------------------
par(mar = c(0.7, 0.7, 0.7, 0.7))
image(meuse.grid["dist"])
title("distance to river (red=0)")

zinc.idw = idw(zinc ~ 1, meuse, meuse.grid)
names(zinc.idw)

par(mar = c(0.7, 0.7, 0.7, 0.7))
spplot(zinc.idw["var1.pred"], main = "Inverse distance weighted interpolation for zinc concentration")

zinc.kriged <- krige(logZinc ~ 1, meuse, meuse.grid, model = zinc.vgm.fit)
spplot(zinc.kriged["var1.pred"], man = "Plot of kriging model of zinc concentration")