## Biodiv Analysis fuer IPD
## 19.10.2019

## Initializing

par(mar=c(1,1,1,1)) # sets plot size parameters

library(picante)                          # loads the Biodiversity library


## Checking the dataset
class(alldata.df) # checks for resonable names of columns and rows. Should become data.frame
rownames(alldata.df) # checks rownames
head(colnames(alldata.df)) # checks columnnames

## Determine data set parameters before and after clusterin
print(paste("Total number of sequences is",dim(alldata.df)[1])) # checks dimensions of the data object, imported before clustering
number.of.all.genotypes <- length(levels(alldata.df$OTU)) # Determine number of MOTUs, total
print(paste("Number of all OTUs is",number.of.all.genotypes))
print(paste("Total number of sequences included in the cluster analysis is",dim(Cluster_by_row.df)[1])) # checks length in cluster analysis

##Extraction of the subsets to be compared; unused levels are deleted with drop=TRUE.
CEP.only.df <- subset(alldata.df, alldata.df$Region == "CEP")
WIO.only.df <- subset(alldata.df, alldata.df$Region == "WIO")
SUN.only.df <- subset(alldata.df, alldata.df$Region == "SUN")
CIO.only.df <- subset(alldata.df, alldata.df$Region == "CIO")
SAH.only.df <- subset(alldata.df, alldata.df$Region == "SAH")
SEP.only.df <- subset(alldata.df, alldata.df$Region == "SEP")
NEA.only.df <- subset(alldata.df, alldata.df$Region == "NEA")
ECA.only.df <- subset(alldata.df, alldata.df$Region == "ECA")
TSP.only.df <- subset(alldata.df, alldata.df$Region == "TSP")
GLF.only.df <- subset(alldata.df, alldata.df$Region == "GLF")
RED.only.df <- subset(alldata.df, alldata.df$Region == "RED")
ECT.only.df <- subset(alldata.df, alldata.df$Region == "ECT")

## Number of regions and specimens per region
NUMBER.SP.ALL.REGS <- c(dim(CEP.only.df)[1],dim(WIO.only.df)[1],dim(SUN.only.df)[1],dim(CIO.only.df)[1],dim(SAH.only.df)[1],dim(SEP.only.df)[1],dim(NEA.only.df)[1],dim(ECA.only.df)[1],dim(TSP.only.df)[1],dim(GLF.only.df)[1],dim(RED.only.df)[1],dim(ECT.only.df)[1]) #fuer ggf spaetere Berechnungen
NUMBER.REGS<- length(NUMBER.SP.ALL.REGS)
print(paste("There are ",NUMBER.REGS,"regions")) # output for region number
print(paste("Numbers of specimens are           ",dim(CEP.only.df)[1],"(CEP)  ",dim(WIO.only.df)[1],"(WIO)  ",dim(SUN.only.df)[1],"(SUN)  ",dim(CIO.only.df)[1],"(CIO)  ",dim(SAH.only.df)[1],"(SAH)  ",dim(SEP.only.df)[1],"(SEP)  ",dim(NEA.only.df)[1],"(NEA)  ",dim(ECA.only.df)[1],"(ECA)  ",dim(TSP.only.df)[1],"(TSP)  ",dim(GLF.only.df)[1],"(GLF)  ",dim(RED.only.df)[1],"(RED)  ",dim(ECT.only.df)[1],"(ECT)  ")) # output

## Creation of two factors that only have the MOTUs of the respective regions

OTUS.CEP <- CEP.only.df$OTU[drop=TRUE]
OTUS.WIO <- WIO.only.df$OTU[drop=TRUE]
OTUS.SUN <- SUN.only.df$OTU[drop=TRUE]
OTUS.CIO <- CIO.only.df$OTU[drop=TRUE]
OTUS.SAH <- SAH.only.df$OTU[drop=TRUE]
OTUS.SEP <- SEP.only.df$OTU[drop=TRUE]
OTUS.NEA <- NEA.only.df$OTU[drop=TRUE]
OTUS.ECA <- ECA.only.df$OTU[drop=TRUE]
OTUS.TSP <- TSP.only.df$OTU[drop=TRUE]
OTUS.GLF <- GLF.only.df$OTU[drop=TRUE]
OTUS.RED <- RED.only.df$OTU[drop=TRUE]
OTUS.ECT <- ECT.only.df$OTU[drop=TRUE]

## Analysis of how many sequences were not clustered
CEP.only.no.NA<-length(which(is.na(OTUS.CEP)==FALSE))
WIO.only.no.NA<-length(which(is.na(OTUS.WIO)==FALSE))
SUN.only.no.NA<-length(which(is.na(OTUS.SUN)==FALSE))
CIO.only.no.NA<-length(which(is.na(OTUS.CIO)==FALSE))
SAH.only.no.NA<-length(which(is.na(OTUS.SAH)==FALSE))
SEP.only.no.NA<-length(which(is.na(OTUS.SEP)==FALSE))
NEA.only.no.NA<-length(which(is.na(OTUS.NEA)==FALSE))
ECA.only.no.NA<-length(which(is.na(OTUS.ECA)==FALSE))
TSP.only.no.NA<-length(which(is.na(OTUS.TSP)==FALSE))
GLF.only.no.NA<-length(which(is.na(OTUS.GLF)==FALSE))
RED.only.no.NA<-length(which(is.na(OTUS.RED)==FALSE))
ECT.only.no.NA<-length(which(is.na(OTUS.ECT)==FALSE))

print(paste("Numbers of clustered specimens are ",CEP.only.no.NA,"(CEP)  ",WIO.only.no.NA,"(WIO)  ",SUN.only.no.NA,"(SUN)  ",CIO.only.no.NA,"(CIO)  ",SAH.only.no.NA,"(SAH)  ",SEP.only.no.NA,"(SEP)  ",NEA.only.no.NA,"(NEA)  ",ECA.only.no.NA,"(ECA)  ",TSP.only.no.NA,"(TSP)  ",GLF.only.no.NA,"(GLF)  ",RED.only.no.NA,"(RED)  ",ECT.only.no.NA,"(ECT)  ")) # output


##Creation of a level list of the regions
LEVELS.OTUS.CEP <- levels(OTUS.CEP)
LEVELS.OTUS.WIO <- levels(OTUS.WIO)
LEVELS.OTUS.SUN <- levels(OTUS.SUN)
LEVELS.OTUS.CIO <- levels(OTUS.CIO)
LEVELS.OTUS.SAH <- levels(OTUS.SAH)
LEVELS.OTUS.SEP <- levels(OTUS.SEP)
LEVELS.OTUS.NEA <- levels(OTUS.NEA)
LEVELS.OTUS.ECA <- levels(OTUS.ECA)
LEVELS.OTUS.TSP <- levels(OTUS.TSP)
LEVELS.OTUS.GLF <- levels(OTUS.GLF)
LEVELS.OTUS.RED <- levels(OTUS.RED)
LEVELS.OTUS.ECT <- levels(OTUS.ECT)

print(paste("Numbers of OTUs incl. Singletons are ",length(LEVELS.OTUS.CEP),"(CEP)  ",length(LEVELS.OTUS.WIO),"(WIO)  ",length(LEVELS.OTUS.SUN),"(SUN)  ",length(LEVELS.OTUS.CIO),"(CIO)  ",length(LEVELS.OTUS.SAH),"(SAH)  ",length(LEVELS.OTUS.SEP),"(SEP)  ",length(LEVELS.OTUS.NEA),"(NEA)  ",length(LEVELS.OTUS.ECA),"(ECA)  ",length(LEVELS.OTUS.TSP),"(TSP)  ",length(LEVELS.OTUS.GLF),"(GLF)  ",length(LEVELS.OTUS.RED),"(RED)  ",length(LEVELS.OTUS.ECT),"(ECT)  "))


## Create a table for the regions with only genotypes and numbers.
WIO.Specimens.pro.OTU <-table(OTUS.WIO)
WIO.Specimens.pro.OTU.mat <- matrix(WIO.Specimens.pro.OTU)
rownames(WIO.Specimens.pro.OTU.mat) <- LEVELS.OTUS.WIO
colnames(WIO.Specimens.pro.OTU.mat) <- "Number"

CEP.Specimens.pro.OTU <-table(OTUS.CEP)
CEP.Specimens.pro.OTU.mat <- matrix(CEP.Specimens.pro.OTU)
rownames(CEP.Specimens.pro.OTU.mat) <- LEVELS.OTUS.CEP
colnames(CEP.Specimens.pro.OTU.mat) <- "Number"

SUN.Specimens.pro.OTU <-table(OTUS.SUN)
SUN.Specimens.pro.OTU.mat <- matrix(SUN.Specimens.pro.OTU)
rownames(SUN.Specimens.pro.OTU.mat) <- LEVELS.OTUS.SUN
colnames(SUN.Specimens.pro.OTU.mat) <- "Number"

CIO.Specimens.pro.OTU <-table(OTUS.CIO)
CIO.Specimens.pro.OTU.mat <- matrix(CIO.Specimens.pro.OTU)
rownames(CIO.Specimens.pro.OTU.mat) <- LEVELS.OTUS.CIO
colnames(CIO.Specimens.pro.OTU.mat) <- "Number"

SAH.Specimens.pro.OTU <-table(OTUS.SAH)
SAH.Specimens.pro.OTU.mat <- matrix(SAH.Specimens.pro.OTU)
rownames(SAH.Specimens.pro.OTU.mat) <- LEVELS.OTUS.SAH
colnames(SAH.Specimens.pro.OTU.mat) <- "Number"

SEP.Specimens.pro.OTU <-table(OTUS.SEP)
SEP.Specimens.pro.OTU.mat <- matrix(SEP.Specimens.pro.OTU)
rownames(SEP.Specimens.pro.OTU.mat) <- LEVELS.OTUS.SEP
colnames(SEP.Specimens.pro.OTU.mat) <- "Number"

NEA.Specimens.pro.OTU <-table(OTUS.NEA)
NEA.Specimens.pro.OTU.mat <- matrix(NEA.Specimens.pro.OTU)
rownames(NEA.Specimens.pro.OTU.mat) <- LEVELS.OTUS.NEA
colnames(NEA.Specimens.pro.OTU.mat) <- "Number"

ECA.Specimens.pro.OTU <-table(OTUS.ECA)
ECA.Specimens.pro.OTU.mat <- matrix(ECA.Specimens.pro.OTU)
rownames(ECA.Specimens.pro.OTU.mat) <- LEVELS.OTUS.ECA
colnames(ECA.Specimens.pro.OTU.mat) <- "Number"

TSP.Specimens.pro.OTU <-table(OTUS.TSP)
TSP.Specimens.pro.OTU.mat <- matrix(TSP.Specimens.pro.OTU)
rownames(TSP.Specimens.pro.OTU.mat) <- LEVELS.OTUS.TSP
colnames(TSP.Specimens.pro.OTU.mat) <- "Number"

GLF.Specimens.pro.OTU <-table(OTUS.GLF)
GLF.Specimens.pro.OTU.mat <- matrix(GLF.Specimens.pro.OTU)
rownames(GLF.Specimens.pro.OTU.mat) <- LEVELS.OTUS.GLF
colnames(GLF.Specimens.pro.OTU.mat) <- "Number"

RED.Specimens.pro.OTU <-table(OTUS.RED)
RED.Specimens.pro.OTU.mat <- matrix(RED.Specimens.pro.OTU)
rownames(RED.Specimens.pro.OTU.mat) <- LEVELS.OTUS.RED
colnames(RED.Specimens.pro.OTU.mat) <- "Number"

ECT.Specimens.pro.OTU <-table(OTUS.ECT)
ECT.Specimens.pro.OTU.mat <- matrix(ECT.Specimens.pro.OTU)
rownames(ECT.Specimens.pro.OTU.mat) <- LEVELS.OTUS.ECT
colnames(ECT.Specimens.pro.OTU.mat) <- "Number"

##Creation of a table “REGS.OTU.FRQ” with regions on Y and OTUs on X

WESTRN_IND_OCN <- table(WIO.only.df$OTU[drop=FALSE]) # Read first region in table
WESTRN_IND_OCN.mat <- matrix(WESTRN_IND_OCN,nrow = 1,ncol=(length(WESTRN_IND_OCN))) #Shape table as a matrix
colnames(WESTRN_IND_OCN.mat) <- levels(WIO.only.df$OTU) # Adjust column names to OTU names
rownames(WESTRN_IND_OCN.mat) <- "WESTRN_IND_OCN" # customize row names

CENTRL_POLYNES <- table(CEP.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(WESTRN_IND_OCN.mat, CENTRL_POLYNES) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

CENTRL_IND_OCN <- table(CIO.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, CENTRL_IND_OCN) # fMerge the following region into the table of the first to “REGS.OTU.FRQ”

SUNDA_SHELF <- table(SUN.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, SUNDA_SHELF) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

SAHUL_SHELF <- table(SAH.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, SAHUL_SHELF) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

S_E_POLYNESIA <- table(SEP.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, S_E_POLYNESIA) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

N_E_AUSTR_SHELF <- table(NEA.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, N_E_AUSTR_SHELF) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

E_C_AUSTR_SHELF <- table(ECA.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, E_C_AUSTR_SHELF) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

TROP_SOUTH_PAC <- table(TSP.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, TROP_SOUTH_PAC) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

SOMALI_ARABIAN <- table(GLF.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, SOMALI_ARABIAN) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

RED_SEA_G_ADEN <- table(RED.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, RED_SEA_G_ADEN) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

E_CORAL_TRIANG <- table(ECT.only.df$OTU[drop=FALSE]) # Read the following region as a table
REGS.OTU.FRQ.mat <- rbind(REGS.OTU.FRQ.mat, E_CORAL_TRIANG) # Merge the following region into the table of the first to “REGS.OTU.FRQ”

REGS.OTU.FRQ.df <- as.data.frame(REGS.OTU.FRQ.mat) #turn it into a data frame

print(paste("With singletons dataframe contains",length(rownames(REGS.OTU.FRQ.df)),"regions with",length(colnames(REGS.OTU.FRQ.df)),"OTUs")) #Overview of output for the entire matrix

## Creation of Dataset without Singletons
SPECIMEN.pro.OTU.AND.REGION.df <- t(REGS.OTU.FRQ.df) # makes new transposed data set with OTU numbers and Regions are columns
SUM.OF.SPECIMENS.pro.OTU <- rowSums(SPECIMEN.pro.OTU.AND.REGION.df) # calculating number of specimens per OTU
SPECIMEN.pro.OTU.AND.REGION.df <- cbind(SPECIMEN.pro.OTU.AND.REGION.df,SUM.OF.SPECIMENS.pro.OTU) #adds SUM.OF.SPECIMEN.pro.OTU to SPECIMEN.pro.OTU.AND.REGION.df
NO.SINGLETONS.df <- subset(SPECIMEN.pro.OTU.AND.REGION.df, SUM.OF.SPECIMENS.pro.OTU > "1") # makes a submatrix with all OTUs > 1 specimen


print(paste("Without singletons dataframe contains",length(colnames(NO.SINGLETONS.df))-1,"regions with",length(rownames(NO.SINGLETONS.df)),"OTUs" )) #Uebersicht output fuer die Singleton matrix
print(paste("That means there are ", length(colnames(REGS.OTU.FRQ.df))-length(rownames(NO.SINGLETONS.df)),"singletons resulting in", round((1-(length(rownames(NO.SINGLETONS.df)))/(length(colnames(REGS.OTU.FRQ.df))))*100,digits=1), "% of OTUs"))

#################################

### Biodiversity-Analyses including Singletons

## Preparation of dataset
tREGS.OTU.FRQ.mat<-t(REGS.OTU.FRQ.mat) #transposes matrix with location in columns
tREGS.OTU.FRQ.mat[tREGS.OTU.FRQ.mat>0]<-1 #replaces all values larger 0 with 1 und prepares absence-presence matrix
RowSum<-rowSums(tREGS.OTU.FRQ.mat) # makes vector with the sums of rows, if sum is 1,  OTU is present in only a single region 
tREGS.OTU.FRQ.mat<-cbind(tREGS.OTU.FRQ.mat,RowSum) #adds this vector to the matrix as additional column
tREGS.OTU.FRQ.df<-as.data.frame(tREGS.OTU.FRQ.mat) # transforms matrix in df

## Calculation of combinations and percentages 
OTUS.with.1.REG.only<-which(RowSum==1) # pulls all OTUs, which are present in a single location only

OTUS.of.SEP<-which(tREGS.OTU.FRQ.df$"S_E_POLYNESIA"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.SEP.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.SEP)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.SEP<-round(((Number.OTUS.of.SEP.only/sum(tREGS.OTU.FRQ.df$"S_E_POLYNESIA"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.CEP<-which(tREGS.OTU.FRQ.df$"CENTRL_POLYNES"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.CEP.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.CEP)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.CEP<-round(((Number.OTUS.of.CEP.only/sum(tREGS.OTU.FRQ.df$"CENTRL_POLYNES"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.NEA<-which(tREGS.OTU.FRQ.df$"N_E_AUSTR_SHELF"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.NEA.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.NEA)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.NEA<-round(((Number.OTUS.of.NEA.only/sum(tREGS.OTU.FRQ.df$"N_E_AUSTR_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.CIO<-which(tREGS.OTU.FRQ.df$"CENTRL_IND_OCN"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.CIO.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.CIO)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.CIO<-round(((Number.OTUS.of.CIO.only/sum(tREGS.OTU.FRQ.df$"CENTRL_IND_OCN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.SUN<-which(tREGS.OTU.FRQ.df$"SUNDA_SHELF"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.SUN.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.SUN)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.SUN<-round(((Number.OTUS.of.SUN.only/sum(tREGS.OTU.FRQ.df$"SUNDA_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.ECA<-which(tREGS.OTU.FRQ.df$"E_C_AUSTR_SHELF"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.ECA.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.ECA)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.ECA<-round(((Number.OTUS.of.ECA.only/sum(tREGS.OTU.FRQ.df$"E_C_AUSTR_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.TSP<-which(tREGS.OTU.FRQ.df$"TROP_SOUTH_PAC"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.TSP.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.TSP)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.TSP<-round(((Number.OTUS.of.TSP.only/sum(tREGS.OTU.FRQ.df$"TROP_SOUTH_PAC"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.WIO<-which(tREGS.OTU.FRQ.df$"WESTRN_IND_OCN"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.WIO.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.WIO)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.WIO<-round(((Number.OTUS.of.WIO.only/sum(tREGS.OTU.FRQ.df$"WESTRN_IND_OCN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.SAH<-which(tREGS.OTU.FRQ.df$"SAHUL_SHELF"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.SAH.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.SAH)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.SAH<-round(((Number.OTUS.of.SAH.only/sum(tREGS.OTU.FRQ.df$"SAHUL_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.GLF<-which(tREGS.OTU.FRQ.df$"SOMALI_ARABIAN"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.GLF.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.GLF)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.GLF<-round(((Number.OTUS.of.GLF.only/sum(tREGS.OTU.FRQ.df$"SOMALI_ARABIAN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.RED<-which(tREGS.OTU.FRQ.df$"RED_SEA_G_ADEN"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.RED.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.RED)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.RED<-round(((Number.OTUS.of.RED.only/sum(tREGS.OTU.FRQ.df$"RED_SEA_G_ADEN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

OTUS.of.ECT<-which(tREGS.OTU.FRQ.df$"E_CORAL_TRIANG"==1) # pulls all OTUs, which are present in the specified location
Number.OTUS.of.ECT.only<-length(intersect(OTUS.with.1.REG.only,OTUS.of.ECT)) #pulls all OTUs, which are ONLY present in the specified location
ENDEMIC.OTUS.ECT<-round(((Number.OTUS.of.ECT.only/sum(tREGS.OTU.FRQ.df$"E_CORAL_TRIANG"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

print(paste("Percentage unshared OTUs (incl singletons) ",ENDEMIC.OTUS.CEP,"(CEP)",ENDEMIC.OTUS.WIO,"(WIO)  ",ENDEMIC.OTUS.SUN,"(SUN)  ",ENDEMIC.OTUS.CIO,"(CIO)  ",ENDEMIC.OTUS.SAH,"(SAH)  ",ENDEMIC.OTUS.SEP,"(SEP)  ",ENDEMIC.OTUS.NEA,"(NEA)  ",ENDEMIC.OTUS.ECA,"(ECA)  ",ENDEMIC.OTUS.TSP,"(TSP)  ",ENDEMIC.OTUS.GLF,"(GLF)  ",ENDEMIC.OTUS.RED,"(RED)  ",ENDEMIC.OTUS.ECT,"(ECT)  "))

print(cat("Biodiversity data for:\t\t\t",rownames(REGS.OTU.FRQ.df)," ",sep="\t")) # Displays the order of regions

## calculating Shannons index for each region
SHANNON.REGS <- round(diversity(REGS.OTU.FRQ.df, index = "shannon"),digits = 2) # Calculation and rounding
print(cat("Shannon index is:\t\t",SHANNON.REGS," ",sep="\t\t")) #output to screen

## calculating Fisher's alpha
FISHER.REGS <-round(fisher.alpha(REGS.OTU.FRQ.df, MARGIN = 1),digits = 2) # Calculation and rounding
print(cat(c("Fisher's alpha is:\t\t",FISHER.REGS," "),sep = "\t\t")) #output to screen

## Species-area and species-individual curves:
REGS.SPA <- specaccum(REGS.OTU.FRQ.df)
plot(REGS.SPA) #plots the species accumulation curve and the confidence intervals for sites.
plot(REGS.SPA, ci.type="poly", col="blue", lwd=2, ci.lty=0, ci.col="lightblue") #makes a prettier plot

## Accumulation of individuals
REGS.SPI<-specaccum(REGS.OTU.FRQ.df, method="rarefaction")
plot(REGS.SPI)



####################### Biodiversity-Analyses excluding singletons

#install.packages("gplots", dependencies = TRUE)
library(gplots)

#install.packages("RColorBrewer", dependencies = TRUE)
library(RColorBrewer)
#install.packages("viridis")
library(viridis)

## Change of NO.SINGLETONS.df to NoSING.tREGS.OTU.FRQ.mat 
tNO.SINGLETONS.df <- t(NO.SINGLETONS.df) # transposes NO.SINGLETONS.df
tNO.SINGLETONS.df <- tNO.SINGLETONS.df[-c(length(colnames(NO.SINGLETONS.df))),] # removes the last row, which included the sum of specimens
ttNO.SINGLETONS.df <- t(tNO.SINGLETONS.df) # transposes matrix
NoSING.tREGS.OTU.FRQ.mat <- as.matrix(ttNO.SINGLETONS.df) # Final transcription into NoSING.tREGS.OTU.FRQ.mat

## Preparation of dataset - similar to with singleton analysis, therfore some double steps here
NoSING.tREGS.OTU.FRQ.mat[NoSING.tREGS.OTU.FRQ.mat>0]<-1 #replaces all values larger 0 with 1 und prepares absence-presence matrix
NoSING.RowSum<-rowSums(NoSING.tREGS.OTU.FRQ.mat) # makes vector with the sums of rows, if sum is 1,  OTU is present in only a single region 
NoSING.tREGS.OTU.FRQ.mat<-cbind(NoSING.tREGS.OTU.FRQ.mat,NoSING.RowSum) #adds this vector to the matrix as additional column
NoSING.tREGS.OTU.FRQ.df<-as.data.frame(NoSING.tREGS.OTU.FRQ.mat) # transforms matrix in df

## Calculation of combinations and percentages 
NoSING.OTUS.with.1.REG.only<-which(NoSING.RowSum==1) # pulls all OTUs, which are present in a single location only

NoSING.OTUS.of.SEP<-which(NoSING.tREGS.OTU.FRQ.df$"S_E_POLYNESIA"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.SEP.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.SEP)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.SEP<-round(((NoSING.Number.OTUS.of.SEP.only/sum(NoSING.tREGS.OTU.FRQ.df$"S_E_POLYNESIA"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.CEP<-which(NoSING.tREGS.OTU.FRQ.df$"CENTRL_POLYNES"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.CEP.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.CEP)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.CEP<-round(((NoSING.Number.OTUS.of.CEP.only/sum(NoSING.tREGS.OTU.FRQ.df$"CENTRL_POLYNES"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.NEA<-which(NoSING.tREGS.OTU.FRQ.df$"N_E_AUSTR_SHELF"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.NEA.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.NEA)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.NEA<-round(((NoSING.Number.OTUS.of.NEA.only/sum(NoSING.tREGS.OTU.FRQ.df$"N_E_AUSTR_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.CIO<-which(NoSING.tREGS.OTU.FRQ.df$"CENTRL_IND_OCN"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.CIO.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.CIO)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.CIO<-round(((NoSING.Number.OTUS.of.CIO.only/sum(NoSING.tREGS.OTU.FRQ.df$"CENTRL_IND_OCN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.SUN<-which(NoSING.tREGS.OTU.FRQ.df$"SUNDA_SHELF"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.SUN.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.SUN)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.SUN<-round(((NoSING.Number.OTUS.of.SUN.only/sum(NoSING.tREGS.OTU.FRQ.df$"SUNDA_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.ECA<-which(NoSING.tREGS.OTU.FRQ.df$"E_C_AUSTR_SHELF"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.ECA.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.ECA)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.ECA<-round(((NoSING.Number.OTUS.of.ECA.only/sum(NoSING.tREGS.OTU.FRQ.df$"E_C_AUSTR_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.TSP<-which(NoSING.tREGS.OTU.FRQ.df$"TROP_SOUTH_PAC"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.TSP.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.TSP)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.TSP<-round(((NoSING.Number.OTUS.of.TSP.only/sum(NoSING.tREGS.OTU.FRQ.df$"TROP_SOUTH_PAC"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.WIO<-which(NoSING.tREGS.OTU.FRQ.df$"WESTRN_IND_OCN"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.WIO.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.WIO)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.WIO<-round(((NoSING.Number.OTUS.of.WIO.only/sum(NoSING.tREGS.OTU.FRQ.df$"WESTRN_IND_OCN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.SAH<-which(NoSING.tREGS.OTU.FRQ.df$"SAHUL_SHELF"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.SAH.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.SAH)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.SAH<-round(((NoSING.Number.OTUS.of.SAH.only/sum(NoSING.tREGS.OTU.FRQ.df$"SAHUL_SHELF"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.GLF<-which(NoSING.tREGS.OTU.FRQ.df$"SOMALI_ARABIAN"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.GLF.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.GLF)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.GLF<-round(((NoSING.Number.OTUS.of.GLF.only/sum(NoSING.tREGS.OTU.FRQ.df$"SOMALI_ARABIAN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.RED<-which(NoSING.tREGS.OTU.FRQ.df$"RED_SEA_G_ADEN"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.RED.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.RED)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.RED<-round(((NoSING.Number.OTUS.of.RED.only/sum(NoSING.tREGS.OTU.FRQ.df$"RED_SEA_G_ADEN"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

NoSING.OTUS.of.ECT<-which(NoSING.tREGS.OTU.FRQ.df$"E_CORAL_TRIANG"==1) # pulls all OTUs, which are present in the specified location
NoSING.Number.OTUS.of.ECT.only<-length(intersect(NoSING.OTUS.with.1.REG.only,NoSING.OTUS.of.ECT)) #pulls all OTUs, which are ONLY present in the specified location
NoSING.ENDEMIC.OTUS.ECT<-round(((NoSING.Number.OTUS.of.ECT.only/sum(NoSING.tREGS.OTU.FRQ.df$"E_CORAL_TRIANG"))*100), digits = 1) # calculates the percentage of "endemic" OTUs

print(paste("Percentage unshared OTUs (without singletons) ",NoSING.ENDEMIC.OTUS.CEP,"(CEP)",NoSING.ENDEMIC.OTUS.WIO,"(WIO)  ",NoSING.ENDEMIC.OTUS.SUN,"(SUN)  ",NoSING.ENDEMIC.OTUS.CIO,"(CIO)  ",NoSING.ENDEMIC.OTUS.SAH,"(SAH)  ",NoSING.ENDEMIC.OTUS.SEP,"(SEP)  ",NoSING.ENDEMIC.OTUS.NEA,"(NEA)  ",NoSING.ENDEMIC.OTUS.ECA,"(ECA)  ",NoSING.ENDEMIC.OTUS.TSP,"(TSP)  ",NoSING.ENDEMIC.OTUS.GLF,"(GLF)  ",NoSING.ENDEMIC.OTUS.RED,"(RED)  ",NoSING.ENDEMIC.OTUS.ECT,"(ECT)  "))

print(cat("Biodiversity data (no Singletons) for:\t",rownames(tNO.SINGLETONS.df)," ",sep="\t")) # Displays the order of regions

## calculating Shannons index for each region
NoSING.SHANNON.REGS <- round(diversity(tNO.SINGLETONS.df, index = "shannon"),digits = 2) # Calculation and rounding
print(cat("Shannon index (no Singletons) is:\t",NoSING.SHANNON.REGS," ",sep="\t\t")) #output to screen

## calculating Fisher's alpha
NoSING.FISHER.REGS <-round(fisher.alpha(tNO.SINGLETONS.df, MARGIN = 1),digits = 2) # Calculation and rounding
print(cat(c("Fisher's alpha (no Singletons) is:\t",NoSING.FISHER.REGS," "),sep = "\t\t")) #output to screen

## Rarefaction analyse: gives you the species per 100 individuals sampled for each Region
#NoSING.RAR.REGS <- round(rarefy(tNO.SINGLETONS.df, 20),digits = 2) # Calculation and rounding
#print(cat(c("Rarefaction (no Snglt., Spp. per 20 specim.):",NoSING.RAR.REGS," "),sep ="\t\t")) #output to screen

## Species-area and species-individual curves:
NoSING.REGS.SPA <- specaccum(tNO.SINGLETONS.df)
plot(NoSING.REGS.SPA) #plots the species accumulation curve and the confidence intervals for sites.
plot(NoSING.REGS.SPA, ci.type="poly", col="blue", lwd=2, ci.lty=0, ci.col="lightblue") #makes a prettier plot

## Accumulation of individuals
NoSING.REGS.SPI<-specaccum(tNO.SINGLETONS.df, method="rarefaction")
plot(NoSING.REGS.SPI)



#################################################
# Result Summary
print ("################################################################################################################################################################################################################")
print ("SUMMARY OF RESULTS:")
print(paste("There are ",NUMBER.REGS,"regions")) # output fuer Regionenzahl
print(paste("Total number of sequences is",dim(alldata.df)[1])) # checks dimensions of the data object, imported before clustering
print(paste("Total number of sequences used in the cluster analysis is",dim(Cluster_by_row.df)[1])) # checks length in cluster analysis
print(paste("Number of all OTUs (incl. singletons) is",number.of.all.genotypes))
print(paste("Number of all OTUs (excl. singletons) is",length(colnames(NO.SINGLETONS.df))-1,"regions with",length(rownames(NO.SINGLETONS.df)),"OTUs" )) #Uebersicht output fuer die Singleton matrix
print(paste("That means there are ", length(colnames(REGS.OTU.FRQ.df))-length(rownames(NO.SINGLETONS.df)),"singletons resulting in", round((1-(length(rownames(NO.SINGLETONS.df)))/(length(colnames(REGS.OTU.FRQ.df))))*100,digits=1), "% of OTUs"))
print ("                                                                                                                                                                                                      ")
print (paste("Cutoff in the present analysis is ",CUTOFF))
print(cat("Biodiversity data for:\t\t\t",rownames(REGS.OTU.FRQ.df)," ",sep="\t")) # Displays the order of regions
print(cat("Numbers of specimens are\t\t",dim(WIO.only.df)[1],"(WIO);",dim(CEP.only.df)[1],"(CEP);",dim(CIO.only.df)[1],"(CIO);",dim(SUN.only.df)[1],"(SUN);",dim(SAH.only.df)[1],"(SAH);",dim(SEP.only.df)[1],"(SEP);",dim(NEA.only.df)[1],"(NEA);",dim(ECA.only.df)[1],"(ECA);",dim(TSP.only.df)[1],"(TSP);",dim(GLF.only.df)[1],"(GLF);",dim(RED.only.df)[1],"(RED);",dim(ECT.only.df)[1],"(ECT);","",sep="\t")) # output
print(cat("Numbers of clustered specimens are\t",WIO.only.no.NA,"(WIO);",CEP.only.no.NA,"(CEP);",CIO.only.no.NA,"(CIO);",SUN.only.no.NA,"(SUN);",SAH.only.no.NA,"(SAH);",SEP.only.no.NA,"(SEP);",NEA.only.no.NA,"(NEA);",ECA.only.no.NA,"(ECA);",TSP.only.no.NA,"(TSP);",GLF.only.no.NA,"(GLF);",RED.only.no.NA,"(RED);",ECT.only.no.NA,"(ECT);","",sep="\t")) # output
print(cat("Numbers of OTUs (incl. Singletons)\t",length(LEVELS.OTUS.WIO),"(WIO);",length(LEVELS.OTUS.CEP),"(CEP);",length(LEVELS.OTUS.CIO),"(CIO);",length(LEVELS.OTUS.SUN),"(SUN);",length(LEVELS.OTUS.SAH),"(SAH);",length(LEVELS.OTUS.SEP),"(SEP);",length(LEVELS.OTUS.NEA),"(NEA);",length(LEVELS.OTUS.ECA),"(ECA);",length(LEVELS.OTUS.TSP),"(TSP);",length(LEVELS.OTUS.GLF),"(GLF);",length(LEVELS.OTUS.RED),"(RED);",length(LEVELS.OTUS.ECT),"(ECT);","",sep="\t"))
print(cat("Numbers of OTUs (excl. Singletons)\t",length(NoSING.OTUS.of.WIO),"(WIO);",length(NoSING.OTUS.of.CEP),"(CEP);",length(NoSING.OTUS.of.CIO),"(CIO);",length(NoSING.OTUS.of.SUN),"(SUN);",length(NoSING.OTUS.of.SAH),"(SAH);",length(NoSING.OTUS.of.SEP),"(SEP);",length(NoSING.OTUS.of.NEA),"(NEA);",length(NoSING.OTUS.of.ECA),"(ECA);",length(NoSING.OTUS.of.TSP),"(TSP);",length(NoSING.OTUS.of.GLF),"(GLF);",length(NoSING.OTUS.of.RED),"(RED);",length(NoSING.OTUS.of.ECT),"(ECT);","",sep="\t"))
print(cat("Percentage endemic OTUs (incl. singletons)",ENDEMIC.OTUS.WIO,"%(WIO);",ENDEMIC.OTUS.CEP,"%(CEP);",ENDEMIC.OTUS.CIO,"%(CIO);",ENDEMIC.OTUS.SUN,"%(SUN);",ENDEMIC.OTUS.SAH,"%(SAH);",ENDEMIC.OTUS.SEP,"%(SEP);",ENDEMIC.OTUS.NEA,"%(NEA)",ENDEMIC.OTUS.ECA,"%(ECA);",ENDEMIC.OTUS.TSP,"%(TSP);",ENDEMIC.OTUS.GLF,"%(GLF);",ENDEMIC.OTUS.RED,"%(RED);",ENDEMIC.OTUS.ECT,"%(ECT);","",sep="\t"))
print(cat("Percentage endemic OTUs (excl. singletons)",NoSING.ENDEMIC.OTUS.WIO,"%(WIO);",NoSING.ENDEMIC.OTUS.CEP,"%(CEP);",NoSING.ENDEMIC.OTUS.CIO,"%(CIO);",NoSING.ENDEMIC.OTUS.SUN,"%(SUN);",NoSING.ENDEMIC.OTUS.SAH,"%(SAH);",NoSING.ENDEMIC.OTUS.SEP,"%(SEP);",NoSING.ENDEMIC.OTUS.NEA,"%(NEA);",NoSING.ENDEMIC.OTUS.ECA,"%(ECA);",NoSING.ENDEMIC.OTUS.TSP,"%(TSP);",NoSING.ENDEMIC.OTUS.GLF,"%(GLF);",NoSING.ENDEMIC.OTUS.RED,"%(RED);",NoSING.ENDEMIC.OTUS.ECT,"%(ECT);","",sep="\t"))

print(cat("Shannon index (incl. singletons) is:",SHANNON.REGS," ",sep="\t\t")) #output to screen
print(cat("Shannon index (excl. singletons) is:",NoSING.SHANNON.REGS," ",sep="\t\t")) #output to screen

print(cat(c("Fisher's alpha (incl. singletons) is:",FISHER.REGS," "),sep = "\t\t")) #output to screen
print(cat(c("Fisher's alpha (excl. singletons) is:",NoSING.FISHER.REGS," "),sep = "\t\t")) #output to screen

#print(cat(c("Rarefaction: (incl. singletons):",RAR.REGS, "Spp per 20 indiv. "),sep="\t\t")) #output to screen
#print(cat(c("Rarefaction: (excl. singletons):",NoSING.RAR.REGS,"Spp per 20 indiv. "),sep ="\t\t")) #output to screen
print ("                                                                                                                                                                                                      ")

### HEATMAP GENERATION

## Color settings for all:
my_palette <- colorRampPalette(c("green", "yellow", "orange", "red", "purple", "blue4", "black"))(n = 100) # gives the colour spectrum
colour_breaks = c(seq(0,0.90,length=0), seq(0.901,0.995,length=101),seq(0.9951,1,length=0)) # defines the colour ranges

## Jaccard index incl. singletons
REGS.JA<-vegdist(REGS.OTU.FRQ.df, method="jaccard", binary=TRUE) #Jaccard index
print("Jaccard index (incl. singletons) is:") #output to screen
print(REGS.JA) #output to screen
REGS.JA.MAT<-(as.matrix(REGS.JA)) # change to matrix for heatmap

pdf("Jaccard_Incl.pdf", width=11) ## starts printing the following to pdf
heatmap.2(REGS.JA.MAT, # basis data for heatmap
          main = paste("Jaccard-dissimilarity (incl singletons), cutoff:",CUTOFF), # overall title for plot
          cellnote = (round(REGS.JA.MAT,digits=3))*100, # values in cell rounded
          notecol="white", # colours the values in cell 
          density.info="none", # removes the density infor in the legend
          trace="none", #removes the tracelines
          margins =c(12,12), # widens the margin
          col=my_palette,
          breaks=colour_breaks, # defines the ranges for each colour
          dendrogram="row") #writes a dandogram only at the rows
dev.off() # terminates the printing mode

print ("                                                                                                                                                                                                      ")
## Jaccard index excl singletons
NoSING.REGS.JA<-vegdist(tNO.SINGLETONS.df, method="jaccard", binary=TRUE) #Jaccard index
print("Jaccard dissimilarity (excl singletons) is:") #output to screen
print(NoSING.REGS.JA) #output to screen
NoSING.REGS.JA.MAT<-(as.matrix(NoSING.REGS.JA)) # change to matrix for heatmap

pdf("Jaccard_Excl.pdf", width=11) ## starts printing the following to pdf
heatmap.2(NoSING.REGS.JA.MAT, # basis data for heatmap
          main = paste("Jaccard dissimilarity (excl. singletons), cutoff:",CUTOFF), # overall title for plot
          cellnote = (round(NoSING.REGS.JA.MAT,digits=3))*100, # values in cell rounded
          notecol="white", # colours the values in cell 
          density.info="none", # removes the density infor in the legend
          trace="none", #removes the tracelines
          margins =c(12,12), # widens the margin
          col=my_palette,  # defines colour palette
          breaks=colour_breaks, # defines the ranges for each colour
          dendrogram="row") #writes a dandogram only at the rows
dev.off() # terminates the printing mode

print ("                                                                                                                                                                                                      ")

## Sorensons index incl. Singletons
REGS.SO<-vegdist(REGS.OTU.FRQ.df, method="bray", binary=TRUE) #Jaccard index
print("Sorensons index (incl. singletons) is:") #output to screen
print(REGS.SO) #output to screen
REGS.SO.MAT<-(as.matrix(REGS.SO)) # change to matrix for heatmap

pdf("Sorensen_Incl.pdf", width=11) ## starts printing the following to pdf
heatmap.2(REGS.SO.MAT, # basis data for heatmap
          main = paste("Sorensons index (incl singletons), cutoff:",CUTOFF), # overall title for plot
          cellnote = (round(REGS.SO.MAT,digits=3))*100, # values in cell rounded
          notecol="white", # colours the values in cell 
          density.info="none", # removes the density infor in the legend
          trace="none", #removes the tracelines
          margins =c(12,12), # widens the margin
          col=my_palette,  # defines colour palette
          breaks=colour_breaks, # defines the ranges for each colour
          dendrogram="row") #writes a dandogram only at the rows
dev.off() # terminates the printing mode

## Sorensons index excl. Singletons
NoSING.REGS.SO<-vegdist(tNO.SINGLETONS.df, method="bray", binary=TRUE) #Jaccard index
print("Sorensons index (excl. singletons) is:") #output to screen
print(NoSING.REGS.SO) #output to screen
NoSING.REGS.SO.MAT<-(as.matrix(NoSING.REGS.SO)) # change to matrix for heatmap

pdf("Sorensen_excl.pdf", width=11) ## starts printing the following to pdf
heatmap.2(NoSING.REGS.SO.MAT, # basis data for heatmap
          main = paste("Sorensons index (excl. singletons), cutoff:",CUTOFF), # overall title for plot
          cellnote = (round(NoSING.REGS.SO.MAT,digits=3))*100, # values in cell rounded
          notecol="white", # colours the values in cell 
          density.info="none", # removes the density infor in the legend
          trace="none", #removes the tracelines
          margins =c(12,12), # widens the margin
          col=my_palette,  # defines colour palette
          breaks=colour_breaks, # defines the ranges for each colour
          dendrogram="row") #writes a dandogram only at the rowsto match the column-dendogram
dev.off() # terminates the printing mode

print ("ready                                                                                                        ")

