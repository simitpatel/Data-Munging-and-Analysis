library(plyr)
library(dplyr)
library(stringr)

soraw <- read.csv("./MDC/special-offers-make.csv")

soraw <- mutate(soraw, Make = str_extract_all(soraw$Co.Op.Notes, "SO \\([^()]+\\)"))
soraw[,4] <- gsub("SO \\(","",soraw[,4])
soraw[,4] <- gsub("\\)","",soraw[,4])
soraw[,4] <- gsub("character\\(0","",soraw[,4])
names(soraw) <- c("Account Name","Cars Customer ID","Co Op Notes","Special Offers Make")
soclean <- soraw
write.table(soclean,file="./co-op automation/so-make.csv")
