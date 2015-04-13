#load libraries

library(plyr)
library(dplyr)
library(stringr)

#load data

soraw <- read.csv("./so-make-raw.csv")

#extract SO data from notes column and put in its own column; do this in a new dataframe

soclean <- mutate(soraw, Make = str_extract_all(soraw$Co.Op.Notes, "SO \\([^()]+\\)"))
soclean[,4] <- gsub("SO \\(","",soclean[,4])
soclean[,4] <- gsub("\\)","",soclean[,4])
soclean[,4] <- gsub("character\\(0","",soclean[,4])

#rename columns

names(soclean) <- c("Account Name","Customer ID","Notes","Make")

#export data

write.table(soclean,file="./so-make-clean.csv")
