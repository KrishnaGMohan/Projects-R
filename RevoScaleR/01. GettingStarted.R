# Declare the file paths for the csv and xdf files
ncdb2012Csv <- file.path("D:/Personal/OneDrive/Projects/Sample_Databases/NationalCollisionDatabase", "ncdb_2012.csv")
ncdb2012Xdf <- file.path("D:/Personal/OneDrive/Projects/Sample_Databases/NationalCollisionDatabase", "ncdb_2012.xdf")

# Use rxImport to import the data into xdf format
rxImport(inData = ncdb2012Csv, outFile = ncdb2012Xdf, overwrite = TRUE)

rxGetInfo(data = ncdb2012Xdf,
          getVarInfo = TRUE,
          numRows = 10)


# Declare the file paths for the csv and xdf files
ncdb1999to2012Csv <- file.path("D:/Personal/OneDrive/Projects/Sample_Databases/NationalCollisionDatabase", "NCDB_1999_to_2012.csv")
ncdb1999to2012Xdf <- file.path("D:/Personal/OneDrive/Projects/Sample_Databases/NationalCollisionDatabase", "NCDB_1999_to_2012.xdf")

# Use rxImport to import the data into xdf format
rxImport(inData = ncdb1999to2012Csv, outFile = ncdb1999to2012Xdf, overwrite = TRUE)

rxGetInfo(data = ncdb1999to2012Xdf,
          getVarInfo = TRUE,
          numRows = 10)