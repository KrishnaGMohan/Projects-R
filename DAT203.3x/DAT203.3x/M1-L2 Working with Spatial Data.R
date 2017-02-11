#----------------------------------------
# Variogram
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
