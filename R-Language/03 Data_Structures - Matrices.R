#------------------------------------
# Demo 06: Matrices
# Creating Matrices
#------------------------------------

matrix(1:9, byrow = TRUE, nrow = 3)

mp_vec <- c(-219.62, -101.5, -7.3, 113.7)
bp_vec <- c(-188.12, -34.04, 58.8, 184.3)

halogen_matrix <- matrix(c(mp_vec, bp_vec), ncol = 2, byrow = FALSE)
halogen_matrix


colnames(halogen_matrix) <- c("mp", "bp")
rownames(halogen_matrix) <- c("Fluorine", "Chlorine", "Iodine", "Bromine")
halogen_matrix

Astatine <- c(302, 337)
halogen_matrix <- rbind(halogen_matrix, Astatine)
halogen_matrix

atomic_wt <- c(18.998, 35.446, 79.904, 126.904, 210)
halogen_matrix <- cbind(halogen_matrix, atomic_wt)
halogen_matrix

t(halogen_matrix)

#------------------------------------
# Demo 07: Matrices
# Subset of Matrices
#------------------------------------
v <- halogen_matrix
v[2,]
v["Iodine",]
v[c(1, 3),]
v[v[, "mp"] < 0,]

v["Bromine", "bp"]
v[, c(1:2)]
v[c("Fluorine", "Iodine"), c("mp", "bp")]

#------------------------------------
# Demo 08: Matrices
# Sums and Means
#------------------------------------

sales_cars <- c(906092, 841427, 799974, 972620, 709245)
sales_rvs <- c(503753, 475932, 466100, 475852, 370443)
sales_trucks_buses <- c(177490, 152684, 109435, 117685, 121288)

years <- c(2007, 2008, 2009, 2010, 2011)

veh_sales <- matrix(c(sales_cars,sales_rvs, sales_trucks_buses), byrow =F, ncol=3)

rownames(veh_sales) <- years
colnames(veh_sales) <- c("cars", "rvs", "trucks_buses")
veh_sales

s <- veh_sales
colSums(s)
rowSums(s)
colMeans(s)
rowMeans(s)

sum(s["2009",])
mean(s[, "cars"])
s[s[, "cars"] > mean(s[, "cars"]), "cars"]
sum(s[, "cars"] > mean(s[, "cars"]))

#------------------------------------
# Demo 09: Matrices
# Computations
#------------------------------------
m1 <- matrix(sample(1:9, 6, replace = T), nrow = 2, byrow = T)
m2 <- matrix(sample(1:9, 6, replace = T), nrow = 2, byrow = T)

# m1 <- matrix(c(1, 3, 2, 5, 8, 7), nrow = 2, byrow = T)
# m2 <- matrix(c(3, 6, 5, 1, 2, 7), nrow = 2, byrow = T)

m1
m2

m1 + m2
m1 - m2
m1 / m2
m1 * m2

m1 %*% t(m2)

m3 <- m1 %*% t(m2)
solve(m3)
m3 %*% solve(m3)

A <- matrix(c(1, 2, -1, 2, 1, 1, 1, 2, 1), byrow = T, nrow = 3)
B <- matrix(c(4, -2, 2), byrow = F, nrow = 3)

solve(A,B)