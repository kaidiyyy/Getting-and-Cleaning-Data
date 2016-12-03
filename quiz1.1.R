#12/01/2016 Coursera quiz 1

#quiz 1.1

if(!file.exists("data")) {
  dir.create("data")
}

fileUrl1 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/firstQuiz.csv", method = "curl")
data_first_quiz = read.csv("./data/firstQuiz.csv")

sum(data_first_quiz$VAL == 24 & !is.na(data_first_quiz$VAL))

#quiz 1.2
table(data_first_quiz$FES)
summary(data_first_quiz$FES)
data_first_quiz$FES[1:5]

#quiz 1.3
library(openxlsx)


fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/firstQuiz.xlsx2", method = "curl")
dateDownloaded <-  date()
q1.3 <- read.xlsx2("./data/firstQuiz.xlsx", sheet=1)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xls("./data/firstQuiz.xlsx", sheet=1, colIndex=colIndex, rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

#quiz 1.4
library(XML)
fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
xml <- xmlTreeParse(file=fileUrl4,useInternal=TRUE)
root.Node <- xmlRoot(xml)
xmlName(root.Node)
names(root.Node)
root.Node[[1]][[1]]
zipcode <-  xpathSApply(root.Node, "//zipcode", xmlValue)
length(zipcode[zipcode[zipcode==21231]])

#quiz 1.5
library(data.table)
fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl5, destfile = "./data/firstQuiz5.")
DT <- fread(input="getdata-data-ss06pid.csv", sep=",")
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

library(data.table)
fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl5, destfile = "./data/firstQuiz5.")
DT <- fread(input="getdata-data-ss06pid.csv", sep=",")
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))












































