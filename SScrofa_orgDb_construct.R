#biomart

library(biomaRt)
listEnsembl()

#> listEnsembl() 
#        biomart                version
#1         genes      Ensembl Genes 110
#2 mouse_strains      Mouse strains 110
#3          snps  Ensembl Variation 110
#4    regulation Ensembl Regulation 110

database = useEnsembl("genes")
dataset = listDatasets(database)

searchDatasets(mart = database, pattern = "pig")
#                     dataset                              description          version
#186     ssbamei_gene_ensembl         Pig - Bamei genes (Bamei_pig_v1)     Bamei_pig_v1
#187 ssberkshire_gene_ensembl Pig - Berkshire genes (Berkshire_pig_v1) Berkshire_pig_v1
#189 sshampshire_gene_ensembl Pig - Hampshire genes (Hampshire_pig_v1) Hampshire_pig_v1
#190    ssjinhua_gene_ensembl       Pig - Jinhua genes (Jinhua_pig_v1)    Jinhua_pig_v1
#191  sslandrace_gene_ensembl   Pig - Landrace genes (Landrace_pig_v1)  Landrace_pig_v1
#193   ssmeishan_gene_ensembl     Pig - Meishan genes (Meishan_pig_v1)   Meishan_pig_v1
#194  sspietrain_gene_ensembl   Pig - Pietrain genes (Pietrain_pig_v1)  Pietrain_pig_v1
#195 ssrongchang_gene_ensembl Pig - Rongchang genes (Rongchang_pig_v1) Rongchang_pig_v1
#198 sswuzhishan_gene_ensembl     Pig - Wuzhishan genes (minipig_v1.0)     minipig_v1.0

#> searchDatasets(mart = database, pattern = "sscrofa")
#                 dataset             description     version
#188 sscrofa_gene_ensembl Pig genes (Sscrofa11.1) Sscrofa11.1

ensembl <- useDataset(dataset = "sscrofa_gene_ensembl", mart = database)
#> ensembl
#Object of class 'Mart':
#  Using the ENSEMBL_MART_ENSEMBL BioMart database
#  Using the sscrofa_gene_ensembl dataset

# select specific version
#listEnsemblArchives()
#listEnsembl(version = 110)
#listEnsemblGenomes()
attribute = listAttributes(ensembl)
table(attribute$page)
ensembl <- useEnsembl(biomart = 'genes', dataset = 'sscrofa_gene_ensembl')
library(tidyverse)
keytypes(ensembl) %>% as.data.frame() %>% View()
#columns(ensembl) %>% as.data.frame() %>% View()

ensembl_base = select(ensembl,keys = keys(ensembl, keytype="chromosome_name"), 
                      keytype= "chromosome_name",
                      columns=c("ensembl_gene_id", "entrezgene_id", "external_gene_name", 
                                "description", "gene_biotype", "ensembl_gene_id_version",
                                "start_position", "end_position", "strand", "chromosome_name"
                      ))

ensembl_base$external_gene_name[ensembl_base$external_gene_name==""] = NA
for (i in 1:nrow(ensembl_base))
  if (is.na(ensembl_base[i,2]))  ensembl_base[i,2]=ensembl_base[i,3]
for (i in 1:nrow(ensembl_base))
  if (is.na(ensembl_base[i,3]))  ensembl_base[i,3]=ensembl_base[i,2]
ensembl_base = ensembl_base[complete.cases(ensembl_base$external_gene_name), ]
dim(ensembl_base)
colnames(ensembl_base)[1]="GID" # *****
ensembl_base$ENSEMBL = ensembl_base$GID
ensembl_base$SYMBOL = ensembl_base$external_gene_name
write.table(ensembl_base, file = "ensembl_base.txt", sep = "\t" ,row.names = FALSE, col.names = TRUE, quote = FALSE)

# transcript and exons
ensembl_ts_ex = select(ensembl,keys = keys(ensembl, keytype="chromosome_name"), 
                       keytype= "chromosome_name",
                       columns=c("ensembl_gene_id", "transcript_count", "ensembl_exon_id", 
                                 "ensembl_transcript_id", "transcript_biotype",
                                 "transcript_start", "transcript_end", "transcription_start_site"
                       ))
colnames(ensembl_ts_ex)[1]="GID" # *****
write.table(ensembl_ts_ex, file = "ensembl_ts_ex.txt", sep = "\t", 
            row.names = FALSE, col.names = TRUE, quote = FALSE)

# 3.
# go 
ensembl_go = select(ensembl,keys = keys(ensembl, keytype="chromosome_name"),
                    keytype= "chromosome_name", 
                    columns=c("ensembl_gene_id", "go_id", "name_1006"))
ensembl_go$go_id[ensembl_go$go_id==""] = NA
ensembl_go = ensembl_go[complete.cases(ensembl_go$go_id), ]
colnames(ensembl_go) = c("GID",'GO',"EVIDENCE") # *****
write.table(ensembl_go, file = "ensembl_go.txt", sep = "\t", 
            row.names = FALSE, col.names = TRUE, quote = FALSE)


ensembl_base = read.csv("ensembl_base.txt", sep="\t", header = TRUE)
ensembl_ts_ex = read.csv("ensembl_ts_ex.txt", sep="\t", header = TRUE)
ensembl_go = read.csv("ensembl_go.txt", sep="\t", header = TRUE)

library(AnnotationForge)
library(DBI)
makeOrgPackage(gene_info = ensembl_base,
               transcript_exon = ensembl_ts_ex,
               go = ensembl_go,
               version="0.1",
               maintainer="your_name <your_email@your_email>",
               author="your_name <your_email@your_email>",
               outputDir = ".",
               tax_id="9823",
               genus="Sus",
               species="scrofa",
               goTable="go")

#成功生成"./org.Sscrofa.eg.db"文件夹
#devtools::install_local(path=".\\org.Sscrofa.eg.db") Or
install.packages("./org.Sscrofa.eg.db", repos=NULL,type="source",unlink=TRUE)
library(org.Sscrofa.eg.db)
keytypes(org.Sscrofa.eg.db)


