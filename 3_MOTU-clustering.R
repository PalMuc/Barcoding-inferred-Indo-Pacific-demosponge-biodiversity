#### OTU CLUSTERING

##Installation Bioconductor
#source("https://bioconductor.org/biocLite.R") #installation
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("muscle")

## Installation msa
#if (!requireNamespace("BiocManager", quietly=TRUE))
#  install.packages("BiocManager")
#BiocManager::install("msa", force=TRUE)

library(msa) # start msa
library(DECIPHER) # start DECIPHER

print("!!!!!! adjust OTU cutoff for each marker !!!!!!!")

## define cutoff for MOTU distinction
CUTOFF<-0.003


## Creation of matrix und cluster outputfile with Dendrogramm , cutoff can be adjusted
DistMatr_by_descrip<-DistanceMatrix(MSAAlignment_by_description_String, correction="none", verbose=FALSE) #with taxon name
Cluster_by_descrip<-TreeLine(DistMatr_by_descrip, method="UPGMA", cutoff=CUTOFF, showPlot=TRUE, myXStringSet=NULL, verbose=TRUE) #will be displayed with taxon name for checking, but not later used as element
DistMatr_by_row<-DistanceMatrix(MSAAlignment_by_row_String, correction="none", verbose=FALSE)
Cluster_by_row <-TreeLine(DistMatr_by_row, method="UPGMA", cutoff=CUTOFF, myXStringSet=NULL, verbose=TRUE, type="clusters") #will be displayed with row name for checking and later used as element

## writing cluster number to sequences in the database
Cluster_by_row.df <- as.data.frame(Cluster_by_row) #transformation to dataframe
Add2DB(Cluster_by_row.df,"DB.TEMP") #addition to database

## Extracting of description and cluster number from data base and rewriting into factors.
library(DBI)
library(RSQLite)
connection_to_DB = dbConnect(SQLite(), dbname="DB.TEMP") # makes DB connection
descriptions.query<- dbSendQuery(connection_to_DB, "SELECT description FROM Seqs") # makes query for description
descriptions.tbl <- dbFetch(descriptions.query, n= -1) # fetches description from database with query
print(paste("DB has completed?",(dbHasCompleted(descriptions.query)))) # asks if database query is finished, should be TRUE
identifiers.query<- dbSendQuery(connection_to_DB, "SELECT identifier FROM Seqs") # makes query for identifiers
identifiers.tbl <- dbFetch(identifiers.query, n= -1) # fetches identifiers from database with query
print(paste("DB has completed?",(dbHasCompleted(identifiers.query)))) # asks if database query is finished, should be TRUE
cluster.query<- dbSendQuery(connection_to_DB, "SELECT cluster FROM Seqs") # makes query for cluster
cluster.tbl <- dbFetch(cluster.query, n= -1) # fetches cluster from database with query
print(paste("DB has completed?",(dbHasCompleted(cluster.query)))) # asks if database query is finished, should be TRUE
dbDisconnect(connection_to_DB) #closes access to DB

## Rewriting Identifiers, description and cluster.tbl-columns in dataframe 
Rownames<-(descriptions.tbl$description) # defines rownames
Region=identifiers.tbl$identifier # transforms identifiers to regions
alldata.df<-as.data.frame(Region,row.names=Rownames) #makes dataframe of regions with taxonnames as rownames
OTU<-cluster.tbl$cluster # Transforms cluster numbers to vektor OTU
alldata.df$OTU<-as.factor(OTU) # adds cluster numbers to table as column OTU

print("continue with script 4")

