#### ALIGNMENT WITH MSA


##Installation Bioconductor
#source("https://bioconductor.org/biocLite.R") #installation
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("muscle")

## Installation msa
#if (!requireNamespace("BiocManager", quietly=TRUE))
#  install.packages("BiocManager")
# BiocManager::install("msa")

library(msa) # start msa
#library(ape) # start ape
library(DECIPHER) # start DECIPHER

print("!!!!!! adjust minimum sequence length !!!!!!!") # minimum sequence length must be adjusted in "clause" option

## starting timer
start_time <- Sys.time()

##Create first alignment and visualize so alignment can be checked
ALL.seqs_by_descrip <- SearchDB("DB.TEMP",clause="width>340",nameBy="description", removeGaps = "all") # creates a  XStringSet fom the database displaying the taxon names. Sequences have minimum length as defined in the clause option.
MSAAlignment_by_description<-msa(ALL.seqs_by_descrip,method = "ClustalW", order = "aligned", verbose = TRUE) #Alignment
MSAAlignment_by_description_String<- as(MSAAlignment_by_description, "DNAStringSet") #Modification to Stringset for Visualisation with BrowseSeqs
BrowseSeqs(MSAAlignment_by_description_String,colors=c("#ffffff", "#32CD32", "#1E90FF", "black", "#EE3300")) # Visualisation

## Creates alignment as above, to be used for further analysis
ALL.sequences_by_row <- SearchDB("DB.TEMP",clause="width>340", removeGaps = "all") 
MSAAlignment_by_row <- msa(ALL.sequences_by_row,method = "ClustalW", order = "aligned",verbose = TRUE) 
MSAAlignment_by_row_String <- as(MSAAlignment_by_row, "DNAStringSet") 

print("continue with script #3")
