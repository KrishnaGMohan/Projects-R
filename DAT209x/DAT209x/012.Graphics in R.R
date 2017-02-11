p<-ggplot(data = diamonds)
p <- p + aes(x = carat, y = depth)
p <- p + geom_point()
p <- p + geom_density2d()
p

#-----------------------
summary(diamonds)
depth.groups <- cut(diamonds$depth, breaks = 40 + (0:5) * 8)

ggplot(diamonds) +
 aes(price, fill = depth.groups) +
geom_density(alpha = .3)

#------------------------
library(ggplot2)
library(ggmap)
head(state.x77)
popdata <- data.frame(state = row.names(state.x77), murder = state.x77[, 5])
popdata$state <- as.character(popdata$state)
for (i in 1:nrow(popdata)) {
    latlon = geocode(popdata$state[i])
    popdata$lon[i] = as.numeric(latlon[1])
    popdata$lat[i] = as.numeric(latlon[2])
}
usa_center = geocode("United States of America")
USA <- ggmap(get_map(location = c(usa_center$lon, usa_center$lat), zoom = 4), extent = "panel")
#USA <- ggmap(get_map(location = usa_center, zoom = 4), extent = "panel")
USA + geom_point(aes(x = lon, y = lat), data = popdata, col = "black",
 alpha = 0.4, size = popdata$murder)


#--------
packageurl <- "https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/ggplot2_1.0.1.zip"
install.packages(packageurl, repos = NULL, type = "source")
qplot(hp, qsec, data = mtcars, geom = c("point", "smooth"), method = "lm")
qplot(hp, qsec, data = mtcars, geom = c("point"), method = "lm")
#---------------


hist(airquality$Temp, breaks = 10)
qplot(Temp, data = airquality, binwidth = 5)


#-----------------------
x <- rnorm(1000, mean = -5)
plot(density(x))

ggplot() + aes(x = x) + geom_density()
qplot(x, geom = "density")


#----------------------------------------

my.data <- data.frame(federal.states = c("Baden-Württemberg", "Bayern", "Berlin",
                                     "Brandenburg", "Bremen", "Hamburg", "Hessen",
                                     "Mecklenburg-Vorpommern", "Niedersachsen",
                                     "Nordrhein-Westfalen", "Rheinland-Pfalz",
                                     "Saarland", "Sachsen", "Sachsen-Anhalt",
                                     "Schleswig-Holstein", "Thüringen"),
                    Population = c(10716644, 12691568, 3469849, 2457872, 661888, 1762791,
                    6093888, 1599138, 7826739, 17638098, 4011582, 989035, 4055274,
                    2235548, 2830864, 2156759))
#str(my.data)
my.data$federal.states <- as.character(my.data$federal.states)
latlon <- geocode(my.data$federal.states)
my.data$federal.states[1] <- "Baden-Wurttemberg"
my.data$federal.states[16] <- "Thuringen Germany"
latlon <- geocode(my.data$federal.states)
my.data$lon <- latlon$lon; my.data$lat <- latlon$lat
my.data <- cbind(my.data, latlon)

#Germany <- geocode("Germany")
#Germany <- ggmap(get_map(location = c(Germany$lon,Germany$lat), zoom = 6), extent = "panel")
Germany <- ggmap(get_map(location = "Germany", zoom = 6), extent = "panel")

circle_scale <- 0.000002
Germany + geom_point(aes(x = lon, y = lat),
                    data = my.data,
                    col = "red",
                    alpha = 0.4,
                    size = my.data$Population * circle_scale)
