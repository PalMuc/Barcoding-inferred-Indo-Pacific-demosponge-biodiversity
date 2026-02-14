# Barcoding-inferred-Indo-Pacific-demosponge-biodiversity
Barcoding-inferred biodiversity of shallow-water Indo-Pacific demosponges

Dirk Erpenbeck <sup>1,2,*</sup>, Adrian Galitz<sup>1</sup>, Michael L. Berumen<sup>3</sup>, Gabriele Büttner<sup>1</sup>, Cécile Debitus<sup>4</sup>, Moritz Dirnberger<sup>1</sup>, Merrick Ekins<sup>5,6,7</sup>, Kathryn Hall<sup>5,8</sup>, Leonard Namuth<sup>1</sup>, Sylvain Petek<sup>4,9</sup>, Neda Rahnamae<sup>1,10</sup>, Maggie M. Reddy<sup>11,16</sup>, Daniela Rettenberger<sup>1</sup>, Stefanie R. Ries<sup>1,12</sup>, Simone Schätzle<sup>1</sup>, Christine H.L. Schönberg<sup>13,14</sup>, Edwin Setiawan<sup>1,15</sup>, Joëlle van der Sprong<sup>1</sup>, Olivier P. Thomas<sup>16</sup>, Vani Tirumalasetty<sup>1</sup>, Nicole J. de Voogd<sup>17,18</sup>, Oliver Voigt<sup>1</sup>, John N.A. Hooper<sup>5,7</sup>, and Gert Wörheide<sup>1,2,19</sup>

<sup>1</sup> Department of Earth- and Environmental Sciences, Palaeontology & Geobiology, Ludwig-Maximilians-Universität, Munich, Germany
<sup>2</sup> GeoBio-Center, Ludwig-Maximilians-Universität, Munich
<sup>3</sup> Red Sea Research Center, Division of Biological and Environmental Sciences, King Abdullah University of Science and Technology, Thuwal, 23955, Saudi Arabia
<sup>4</sup> IRD, CNRS, Ifremer, Univ Brest, LEMAR, F-29280 Plouzane, France
<sup>5</sup> Biodiversity Program, Queensland Museum, PO Box 3300, South Brisbane, QLD 4101, Australia
<sup>6</sup> School of Biological Sciences, University of Queensland, St Lucia, Queensland, 4072 Australia
<sup>7</sup> Griffith Institute for Drug Discovery, Griffith University, Nathan, QLD, Australia
<sup>8</sup> Atlas of Living Australia, CSIRO, Dutton Park, Queensland, 4101, Australia
<sup>9</sup> IRD, Univ de la Polynésie française, Ifremer, ILM, EIO, F-98713 Papeete, French Polynesia
<sup>10</sup> Institute of Plant Ecology and Evolution, Heinrich Heine University Düsseldorf, Germany
<sup>11</sup> Department of Biological Sciences, University of Cape Town, Private Bag X3, Rondebosch 7701, South Africa
<sup>12</sup> Department of Marine Sciences – Tjärnö Marine Laboratory, University of Gothenburg, SE-45296 Strömstad, Sweden 
<sup>13</sup> Department of Oceanography, National Sun Yat-sen University, Kaohsiung, Taiwan
<sup>14</sup> Oceans Institute, The University of Western Australia, Crawley, Australia 
<sup>15</sup> Biology Department, Institut Teknologi Sepuluh Nopember (ITS), Gedung H Biology ITS, Kampus Sukolilo Surabaya 60111, Indonesia
<sup>16</sup> School of Biological and Chemical Sciences, Ryan Institute, University of Galway, H91TK33 Galway, Ireland
<sup>17</sup> Naturalis Biodiversity Center, P.O. Box 9517, 2300 RA Leiden, the Netherlands
<sup>18</sup> Institute of Biology (IBL), Leiden University, Leiden, the Netherlands
<sup>19</sup> Bavarian State Collection of Palaeontology and Geology, Munich, Germany

<sup>*</sup>corresponding author: erpenbeck@LMU.de


## Abstract

### Aim: 
The Indo-Pacific is the world's largest marine biogeographic region. It is characterised by different degrees of connectivity among its subregions, and harbours the majority of demosponge species currently known to science. Comparisons between regional sponge faunas have been undertaken in the past, mostly based on morphological species identification. The Sponge Barcoding Project, in tandem with regional DNA taxonomy campaigns, provides one of the largest DNA-based taxonomic data collections from sponges of the Indo-Pacific. Here, we utilise the barcoding data in the most extensive molecular biodiversity study of sponges to date, which reveals patterns of shallow-water demosponge faunal connectivity, endemism, and distribution in the Indo-Pacific with a level of resolution unavailable in prior morphology-based studies.

### Location:
Demosponge specimens in this study cover 13 marine provinces (MPs) of the Indo-Pacific.

### Methods: 
We classified demosponge barcodes from 1,910 sponge samples into 701 molecular operational taxonomic units (MOTUs) using 28S rRNA. MOTU composition of the MPs was compared based on Jaccard and Sørenson dissimilarities, and other biodiversity indices.

### Results: 
Our data corroborated high endemism in MPs (up to 84.1% endemic MOTUs). Faunal overlaps are between the Red Sea and the Gulf, which displayed small connectivity with other MPs of the Western Indian Ocean. The Western Indian Ocean is a strong faunistic boundary to the Central Indo-Pacific, to which the Polynesian sponge faunas were comparatively isolated as well. 

### Main conclusions:
Our data corroborate case studies on sponges that generally reject the presence of cosmopolitan or otherwise widespread sponge species, instead revealing high levels of regional endemism. This is consistent with similar observations and hypotheses in other marine invertebrates, and highlights the need for close regional monitoring to identify biodiversity changes. Connectivity among Indo-Pacific MPs differ for demosponges in many aspects from that of other marine taxa, hypothetically due to their shorter pelagic larval phase. 

# R scripts for biodiversity analysis
The biodiversity analysis is divided into four R scripts. Versions of packages can be found in SessionInfo [SessionInfo.txt](./SessionInfo.txt). 

DISCLAIMER: It is one of my forst R codings and might be less elegant than possible and contained several extra strps for me to verify that the script does whyt it should have. Feel free to use it at your own risk (without warranty), but with citatio of this publication.

The first script [1_DB-creation.R](./1_DB-creation.R) generates a database from the barcodes from the different Indo-Pacific provinces. It uploads province by province.

