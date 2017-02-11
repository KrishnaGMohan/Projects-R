#-------------------------------------------------
# SpatialPointsDataFrame
# SpatialPolygonsDataFrame
# SpatialGridDataFrame
# SpatialPixelsDataFrame
#-------------------------------------------------
install.packages("GISTools")
library(GISTools)
data(newhaven)
ls()
class(breach)
summary(breach)
class(blocks)
summary(blocks)
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
# Grid Data Frame
#--------------------------------
data(meuse.grid)
class(meuse.grid)
meuse.grid <- set.coords(meuse.grid)
#---SpatialPixelsDataFrame
gridded(meuse.grid) = TRUE 
class(meuse.grid)
summary(meuse.grid)

#------------------------------------------
# Plotting
#------------------------------------------
par(mar = c(0.7, 0.7, 0.7, 0.7))
plot(blocks)
plot(breach, col = "red", pch = 1, add = TRUE)
#-----------------------------------------
par(mfrow = c(1, 2))
par(mar = c(0.7, 0.7, 0.7, 0.7))
plot(blocks)
plot(burgres.f, col = "red", pch = 1, add = TRUE)
title('Forced entry burglaries')
plot(blocks)
plot(burgres.n, col = "red", pch = 1, add = TRUE)
title('Non-forced entry burglaries')
#-----------------------------------------
par(mar = c(0.7, 0.7, 0.7, 0.7))
plot(blocks)
plot(roads, col = "blue", add = TRUE)
plot(breach, col = "red", pch = 1, add = TRUE)
#-------------------------------------------



cols <- c("cadmium", "copper", "lead", "zinc")
plot.bubble <- function(x) {
    Title <- paste("Concentration of ", x)
    bubble(meuse, x, col = c("#00ff0088", "#00ff0088"), main = Title)
}
par(mar = c(0.7, 0.7, 0.7, 0.7))
lapply(cols, plot.bubble)

#---------------------------------------------------

names(blocks)
par(mfrow = c(1, 2))
par(mar = c(0.7, 0.7, 0.7, 0.7))
shades <- auto.shading(blocks$P_VACANT, n = 4, cols = brewer.pal(5, "Blues"), cutter = rangeCuts)
choropleth(sp = blocks, v = blocks$P_VACANT, shading = shades)
plot(breach, col = "red", pch = 1, add = TRUE)
title("Vacancy rate with breaches of peace")
shades <- auto.shading(blocks$P_OWNEROCC, n = 4, cols = brewer.pal(5, "Blues"), cutter = rangeCuts)
choropleth(sp = blocks, v = blocks$P_OWNEROCC, shading = shades)
plot(breach, col = "red", pch = 1, add = TRUE)
title("Owner occ rate with breaches of peace")
par(mfrow = c(1, 1))

#--------------------------------------
# KDE
#--------------------------------------
par(mar = c(0, 0, 0, 0))
density <- kde.points(breach, lims = tracts)
level.plot(density)
add.masking(poly.outer(density, blocks, extend = 100))
plot(blocks, add = TRUE)
#--------------------------------------
par(mfrow = c(1, 2))
par(mar = c(0.7, 0.7, 0.7, 0.7))

density <- kde.points(burgres.f, lims = blocks)
level.plot(density)
add.masking(poly.outer(density, blocks, extend = 100))
plot(blocks, add = TRUE)
title("Density of forced burglaries")

density <- kde.points(burgres.n, lims = blocks)
level.plot(density)
add.masking(poly.outer(density, blocks, extend = 100))
plot(blocks, add = TRUE)
title("Density of non-forced burglaries")

par(mfrow = c(1, 1))

#---------------------------------------
require(ggplot2)
ggplot(data.frame(meuse), aes(dist, copper)) +
geom_point(size = 2, color = 'blue', alpha = 0.3) +
ggtitle("Concentration of copper vs. distance") +
ylab("Copper concentration") +
xlab("Distance from river")

meuse$logCopper <- log(meuse$copper)
ggplot(data.frame(meuse), aes(dist, logCopper)) +
geom_point(size = 2, color = 'blue', alpha = 0.3) +
ggtitle("Log of concentration of copper vs. distance") +
ylab("Log copper concentration") +
xlab("Distance from river")

meuse$sqrtDist <- sqrt(meuse$dist)
ggplot(data.frame(meuse), aes(sqrtDist, logCopper)) +
geom_point(size = 2, color = 'blue', alpha = 0.3) +
ggtitle("Log of concentration of copper vs. sqrt of distance") +
ylab("Log copper concentration") +
xlab("Sqrt of distance from river")

#------------------------------------------------------------
# Krigging
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

