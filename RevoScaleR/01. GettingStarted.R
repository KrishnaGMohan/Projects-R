# Declare the file paths for the csv and xdf files

dataPath <- c("D:/Personal/OneDrive/Projects/Sample_Databases/NationalCollisionDatabase")

# Declare the file paths for the csv and xdf files
ncdb1999to2012Csv <- file.path(dataPath, "NCDB_1999_to_2012.csv")
ncdb2012Csv <- file.path(dataPath, "ncdb_2012.csv")
ncdbAllXdf <- file.path(dataPath, "ncdb_ALL.xdf")

# Use rxImport to import the data into xdf format
if (file.exists(ncdbAllXdf)) file.remove(ncdbAllXdf)
rxImport(inData = ncdb1999to2012Csv, outFile = ncdbAllXdf, overwrite = TRUE)

rxGetInfo(data = ncdbAllXdf)
rxGetVarInfo(data = ncdbAllXdf)

#rxGetInfo(data = ncdbAllXdf, getVarInfo = TRUE, numRows = 5)

# Use rxImport to append the csv the data into xdf format
rxImport(inData = ncdb2012Csv, outFile = ncdbAllXdf, append = "rows", overwrite = TRUE)
rxGetInfo(data = ncdbAllXdf)

# Creating a data frame against a csv
ncdbDF1999to2012Csv <- RxTextData(ncdb1999to2012Csv)
head(ncdbDF1999to2012Csv)

# Creating a data frame against a xdf
ncdbDFAll <- RxXdfData(ncdbAllXdf)
head(ncdbDFAll)
length(ncdbDFAll)

#-------------------------
#ncdb2012Csv <- file.path(dataPath, "ncdb_2012.csv")
#ncdb2012Xdf <- file.path(dataPath, "ncdb_2012.xdf")
#if (file.exists(ncdb2012Xdf)) file.remove(ncdb2012Xdf)
#rxImport(inData = ncdb2012Csv, outFile = ncdb2012Xdf, overwrite = TRUE)
#ncdb2012XdfDF <- RxXdfData(ncdb2012Xdf)
#rxGetInfo(ncdb2012XdfDF)
#head(ncdb2012XdfDF)
#-------------------------


moreData <- TRUE
rxOpen(ncdbDFAll)
ncdbDFNextBlock <- rxReadNext(ncdbDFAll)
blk <- 0

while (moreData) {
    ncdbDFNextBlock <- rxReadNext(ncdbDFAll)
    blk <- blk + length(ncdbDFNextBlock)
    print(blk)
    if (length(ncdbDFNextBlock) == 0) {
        moreData <- FALSE
   }
}
rxClose(ncdbDFAll)
blk

rxGetVarInfo(ncdbDFAll)
?rxSummary
sumOutFile <- tempfile(pattern = ".rxTempSumOut", fileext = ".xdf")
rxSummary( ~ F(C_YEAR), data = ncdbDFAll)
rxSummary( ~ F(C_YEAR):F(C_MNTH), data = ncdbDFAll)

#-------------------------
# Lets select just a all columns for the years 2006 to 2010
ncdbDFAnalysis <- rxDataStep(inData = ncdbDFAll, outFile = ncdbDFAnalysis,
                                rowSelection = C_YEAR >= 2006 & C_YEAR <= 2010,
                                overwrite = TRUE)

rxSummary( ~ F(C_YEAR), data = ncdbDFAnalysis)
rxGetVarInfo(ncdbDFAnalysis)

#-----------------------------------------------------------------
# Lets select just a few columns for the years 2006 to 2010
# Missing data

ncdbDFAnalysis <- file.path(dataPath, "ncdb_analysis.xdf")

ncdbDFAnalysis <- rxDataStep(inData = ncdbDFAll, outFile = ncdbDFAnalysis,
                                rowSelection = C_YEAR >= 2006 & C_YEAR <= 2010,
                                varsToKeep = c("C_YEAR", "C_MNTH", "C_WDAY"),
                                overwrite = TRUE)

rxSummary( ~ F(C_YEAR), data = ncdbDFAnalysis)
rxGetVarInfo(ncdbDFAnalysis)

# Lets  give the columns new names
newVarInfo <- list(
                C_YEAR = list(newName = "Year"),
                C_MNTH = list(newName = "Month"),
                C_WDAY = list(newName = "WeekDay")
                )

rxSetVarInfo(varInfo = newVarInfo, data = ncdbDFAnalysis)
rxGetVarInfo(ncdbDFAnalysis)
rxGetInfo(ncdbDFAnalysis)
tail(ncdbDFAnalysis)

rxSummary( ~ ., data = ncdbDFAnalysis)



#-----------------------------------------------------------------
# Fix missing data
ncdbDFAnalysis <- file.path(dataPath, "ncdb_analysis.xdf")

ncdbDFAnalysis <- rxDataStep(inData = ncdbDFAll, outFile = ncdbDFAnalysis,
                                rowSelection = C_YEAR >= 2006 & C_YEAR <= 2010 & !is.na(C_MNTH) & !is.na(C_WDAY),
                                varsToKeep = c("C_YEAR", "C_MNTH", "C_WDAY"),
                                overwrite = TRUE)

rxSummary( ~ F(C_YEAR), data = ncdbDFAnalysis)
rxGetVarInfo(ncdbDFAnalysis)

# Lets  give the columns new names
newVarInfo <- list(
                C_YEAR = list(newName = "Year"),
                C_MNTH = list(newName = "Month"),
                C_WDAY = list(newName = "WeekDay")
                )

rxSetVarInfo(varInfo = newVarInfo, data = ncdbDFAnalysis)
rxGetVarInfo(ncdbDFAnalysis)
rxGetInfo(ncdbDFAnalysis)
tail(ncdbDFAnalysis)

rxSummary( ~ ., data = ncdbDFAnalysis)