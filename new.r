rm(list=ls())
gc()

library("xlsx")
library("data.table")
library(stringr)
library(tm)

setwd("C:\\Users\\user\\Desktop\\ML_21")

tab.read <- read.xlsx("zz.xlsx",2,header = F)

write.table(tab.read,"table_rule.txt",quote = FALSE,row.names = FALSE,col.names = FALSE,sep = "\t")

tab_read <- readLines("C:\\Users\\user\\Desktop\\ML_21\\table_rule.txt")

head(tab_read)
#################TABLE_RULE#################

######################join#####################
if_join <- grep(x = tab_read,pattern = "join",value = TRUE)

if_join <- gsub("\\s+"," ",str_trim(if_join))

for(i in 1 : length(if_join))
{
  if_join[i] <- gsub('^.*join\\s*|\\s*If.*$', '', if_join[i])
  if_join[i] <- gsub('^.*join\\s*|\\s*Move.*$', '', if_join[i])
  if_join[i] <- gsub('^.*join\\s*|\\s*then.*$', '', if_join[i])
}

if_join <- grep(x = if_join,pattern = "_", value = TRUE)

for(i in 1: length(if_join))
{
  if_join[i] <- strsplit(as.character(if_join[i]), split="\\on")
}

if_join <- unlist(if_join)

for(i in 1: length(if_join))
{
  if_join[i] <- strsplit(as.character(if_join[i]), split="and")
}

if_join <- unlist(if_join)
if_join <- grep(x = if_join,pattern = "_", value = TRUE)
if_join <- gsub("\\s+"," ",str_trim(if_join))
if_join <- gsub("with","=",if_join)

######################IF-THEN#####################
if_data <- grep(x = tab_read,pattern = "if",value = TRUE)

if_data <- gsub("\\s+"," ",str_trim(if_data))

for(i in 1 : length(if_data))
{
  if_data[i] <- gsub('^.*if\\s*|\\s*then.*$', '', if_data[i])
}

if_data <- grep(x = if_data,pattern = "_", value = TRUE)

#########################WHERE-AND##############

if_where <- grep(x = tab_read,pattern = "where",value = TRUE)

if_where <- gsub("\\s+"," ",str_trim(if_where))

for(i in 1 : length(if_where))
{
  if_where[i] <- gsub('^.*where\\s*|\\s*then.*$', '', if_where[i])
}


for(i in 1: length(if_where))
{
  if_where[i] <- strsplit(as.character(if_where[i]), split="and")
}

if_where <- unlist(if_where)
if_where <- grep(x = if_where,pattern = "_", value = TRUE)
if_where <- gsub("\\s+"," ",str_trim(if_where))

tab_final <- paste(if_join,if_data,if_where,sep = '@@@')

for(i in 1: length(tab_final))
{
  tab_final[i] <- strsplit(as.character(tab_final[i]), split="\\@@@")
}

tab_final <- unlist(tab_final)
tab_final <- unique(tab_final)
tab_final <- grep(x = tab_final,pattern = "_", value = TRUE)
tab_final <- gsub("\\s+"," ",str_trim(tab_final))
#####################################################
##########COLUMN RULE###########################
col.read <- read.xlsx("zz.xlsx",1,header = T)

col.read <- col.read$TRANSFORMATION.RULE

write.table(col.read,"column_rule.txt",quote = FALSE,row.names = FALSE,col.names = FALSE,sep = "\t")

col_read <- readLines("C:\\Users\\user\\Desktop\\ML_21\\column_rule.txt")

head(col_read)
######################join#####################
if_join_1 <- grep(x = col_read,pattern = "join",value = TRUE)

if_join_1 <- gsub("\\s+"," ",str_trim(if_join_1))

for(i in 1 : length(if_join_1))
{
  if_join_1[i] <- gsub('^.*join\\s*|\\s*If.*$', '', if_join_1[i])
  if_join_1[i] <- gsub('^.*join\\s*|\\s*Move.*$', '', if_join_1[i])
  if_join_1[i] <- gsub('^.*join\\s*|\\s*then.*$', '', if_join_1[i])
}

if_join_1 <- grep(x = if_join_1,pattern = "_", value = TRUE)

for(i in 1: length(if_join_1))
{
  if_join_1[i] <- strsplit(as.character(if_join_1[i]), split="\\on")
}

if_join_1 <- unlist(if_join_1)

for(i in 1: length(if_join_1))
{
  if_join_1[i] <- strsplit(as.character(if_join_1[i]), split="and")
}

if_join_1 <- unlist(if_join_1)
if_join_1 <- grep(x = if_join_1,pattern = "_", value = TRUE)
if_join_1 <- gsub("\\s+"," ",str_trim(if_join_1))
if_join_1 <- gsub("with","=",if_join_1)
######################IF-THEN#####################
if_data_1 <- grep(x = col_read,pattern = "if",value = TRUE)

if_data_1 <- gsub("\\s+"," ",str_trim(if_data_1))

for(i in 1 : length(if_data_1))
{
  if_data_1[i] <- gsub('^.*if\\s*|\\s*then.*$', '', if_data_1[i])
}

if_data_1 <- grep(x = if_data_1,pattern = "_", value = TRUE)
#########################WHERE-AND##############

if_where_1 <- grep(x = col_read,pattern = "where",value = TRUE)

if_where_1 <- gsub("\\s+"," ",str_trim(if_where_1))

for(i in 1 : length(if_where_1))
{
  if_where_1[i] <- gsub('^.*where\\s*|\\s*then.*$', '', if_where_1[i])
}


for(i in 1: length(if_where_1))
{
  if_where_1[i] <- strsplit(as.character(if_where_1[i]), split="and")
}

if_where_1 <- unlist(if_where_1)
if_where_1 <- grep(x = if_where_1,pattern = "_", value = TRUE)
if_where_1 <- gsub("\\s+"," ",str_trim(if_where_1))

tab_final_1 <- paste(if_join_1,if_data_1,if_where_1,sep = '@@@')
tab_final_1
for(i in 1: length(tab_final_1))
{
  tab_final_1[i] <- strsplit(as.character(tab_final_1[i]), split="\\@@@")
}

tab_final_1 <- unlist(tab_final_1)
tab_final_1 <- unique(tab_final_1)
tab_final_1 <- grep(x = tab_final_1,pattern = "_", value = TRUE)
tab_final_1 <- gsub("\\s+"," ",str_trim(tab_final_1))

##########COMBINE TABLE & COLUMN RULE#############
write.csv(tab_final, file = "table_rule.csv",row.names=FALSE)
write.csv(tab_final_1, file = "column_rule.csv",row.names=FALSE)  

df1 <- read.csv("C:\\Users\\user\\Desktop\\ML_21\\table_rule.csv",header = TRUE)
df2 <- read.csv("C:\\Users\\user\\Desktop\\ML_21\\column_rule.csv",header = TRUE)

df3 <- rbind(df1,df2)

names(df3) <- paste("SCENARIOS")

write.csv(df3, file = "My_Rules.csv",row.names=FALSE)  

