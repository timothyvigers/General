# List of useful packages to install on a new computer (in no particular order).
# Similar or related packages are on the same line.
useful <- c("tidyverse","MASS","pROC","cgmanalysis","knitr","car","nlme","lme4",
            "zoo","devtools","roxygen2","shiny","readxl","arsenal",
            "RColorBrewer","randomForest","leaps","reshape2","DescTools",
            "jtools","interactions","BiocManager","enrichR","nortest","MatchIt",
            "redcapAPI","sas7bdat","ggdendro","enrichR","psych","MESS",
            "cgmanalysis","skimr","emmeans","DiagrammeR","gridExtra","ega","citr",
            "here","epiR","rjags","mcmcse","MCMCvis","ggpubr","blandr","mice",
            "multcomp","sjPlot","pwr","kableExtra","rgl","table1","mice","gRain",
            "rbmn","JM","lcmm","qqman","Epi","igraph","lcmm","janitor","omu",
            "patchwork","pdftools","ssh")
fun <- c("cowsay","spotifyr","wesanderson","janeaustenr")
install.packages(c(useful,fun))
# Bioconductor packages (requires "BiocManager")
bioC <- c("microbiome","phyloseq","dada2","WGCNA","DESeq2","biomaRt",
          "org.Hs.eg.db","TxDb.Hsapiens.UCSC.hg19.knownGene","hoardeR",
          "GEOquery","GEOsearch","ChIPseeker","clusterProfiler","minfi","ChAMP",
          "wateRmelon","DMRcate","mixOmics","RRmix","NormalizeMets","metabomxtr",
          "MSstats")
BiocManager::install(bioC)
