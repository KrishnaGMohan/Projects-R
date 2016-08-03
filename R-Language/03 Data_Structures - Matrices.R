#------------------------------------
# Demo 06: Matrices
# Vectors
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



x <- matrix(c(3, 2, -1, 1), nrow = 2, byrow = T)
x

solve(x)%*%x
