## setting up
#source("https://bioconductor.org/biocLite.R") #installation
#biocLite("DECIPHER") #installation

library(DECIPHER) #start DECIPHER

## loading Central Eastern Pacific sequences as fasta
print("load CEP")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","CEP") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading the Central Indian Ocean Islands sequences
print("load CIO")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","CIO") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Western Indian Ocean sequences
print("load WIO")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","WIO")  
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Sahul Shelf sequences
print("load SAH")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","SAH")  
BrowseDB("DB.TEMP") # display in Webbrowser

## loading South East Polynesias sequences
print("load SEP")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","SEP") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Northeast Australian Shelf, sequences
print("load NEA")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","NEA")  
BrowseDB("DB.TEMP") # display in Webbrowser

## loading East Central Australian Shelf sequences
print("load ECA")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","ECA") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Tropical Southwestern Pacific sequences
print("load TSP")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","TSP") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Red Sea and Gulf of Aden sequences
print("load RED")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","RED") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Somali/Arabian sequences
print("load GLF")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","GLF") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Sunda Shelf sequences
print("load SUN")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","SUN") 
BrowseDB("DB.TEMP") # display in Webbrowser

## loading Eastern Coral Triangle sequences
print("load ECT")
Seqs2DB(file.choose(),"FASTA","DB.TEMP","ECT") 
BrowseDB("DB.TEMP") # display in Webbrowser

## Calculation of sequence length (bases) and entry in DB
Seqlengths <- IdLengths("DB.TEMP")
Add2DB(Seqlengths,"DB.TEMP")
BrowseDB("DB.TEMP") # display in Webbrowser

print("continue with script #2")


