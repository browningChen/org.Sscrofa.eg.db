# org.Sscrofa.eg.db
OrgDb making for Sus scrofa(Ensembl geneID)

```r
library(org.Sscrofa.eg.db)
keytypes(org.Sscrofa.eg.db)
# [1] "chromosome_name"          "description"             
# [3] "end_position"             "ENSEMBL"                 
# [5] "ensembl_exon_id"          "ensembl_gene_id_version" 
# [7] "ensembl_transcript_id"    "entrezgene_id"           
# [9] "EVIDENCE"                 "EVIDENCEALL"             
#[11] "external_gene_name"       "gene_biotype"            
#[13] "GID"                      "GO"                      
#[15] "GOALL"                    "ONTOLOGY"                
#[17] "ONTOLOGYALL"              "start_position"          
#[19] "strand"                   "SYMBOL"
#[21] "transcript_biotype"       "transcript_count"
#[23] "transcript_end"           "transcript_start"
#[25] "transcription_start_site"
```

Usage:
```r
GO <- enrichGO(res$gene_id,
               OrgDb = "org.Sscrofa.eg.db",
               keyType = "ENSEMBL",
               readable = T)
```
