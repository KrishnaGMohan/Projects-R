library(RODBC)
connStr <- paste(
    "Server=msedxeus.database.windows.net",
    "Database=DAT209x01",
    "uid=RLogin",
    "pwd=P@ssw0rd",
    "Driver={SQL Server}",
    sep = ";"
)
conn <- odbcDriverConnect(connStr)

sqlTables(conn, tableType = "TABLE")
sqlColumns(conn, "bi.sentiment")[c("COLUMN_NAME", "TYPE_NAME")]
sqlQuery(conn, "SELECT COUNT(*) FROM bi.sentiment")
my.data.frame <- sqlQuery(conn,
                         "SELECT AVG(Score),Date
                          FROM bi.sentiment
                          WHERE State='WA'
                          GROUP BY Date"
                        )

names(my.data.frame) <- c("Average Score", "Date")
my.data.frame
?sqlFetch
?odbcClose


my.data.frame <- sqlQuery(conn,
                         "SELECT SUM(Revenue), SUM(Units), ProductID
                         FROM bi.salesFact
                         WHERE Date > '2013-12-31' AND Date < '2015-01-01'
                         GROUP BY ProductID"
)
my.data.frame
names(my.data.frame) <- c("SUM(Revenue)", "SUM(Units)", "ProductID")

df <- my.data.frame
names(df) <- c("revenue","units", "ProductID")
head(df[order( - df$units),])
head(df[order( - df$revenue),])