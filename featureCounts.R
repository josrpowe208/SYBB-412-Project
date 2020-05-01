# Load libraries, Set up working directory
suppressPackageStartupMessages(library(Rsubread))

setwd("/mnt/pan/courses/sybb412/jrp208/cocaine_project")

# Create list for featureCount output
lst_esetParts <- list()

# Read in sample table
sampleTable <- read.delim(file = "/mnt/pan/courses/sybb412/jrp208/PRJNA388174_cocaine/SraRunTable-2.txt", header = TRUE, row.names = 1)

filenames <- list.files(path = '.', pattern = "hisat[[:punct:]]bam$")

# Read in .bam files
fc <- featureCounts(files=filenames, annot.ext="/mnt/pan/courses/sybb412/jrp208/genomes/gencode.v19.annotation.gtf", isGTFAnnotationFile=TRUE, isPairedEnd=TRUE)

colnames(fc$counts) <- sampleTable$Run

lst_esetParts$EsetRaw <- fc
lst_esetParts$sampleTable <- sampleTable


# Save RDS data
currentTime <- paste(format(Sys.time(), "%Y-%m-%dt%H_%M_%S"))

savePath <- file.path(path = '.',paste('save', currentTime, "RDS", sep=".")) 

saveRDS(lst_esetParts, file = savePath )  
lastSaved <- currentTime

rm(currentTime)


sessionInfo()   


#End of create featureCounts object.
