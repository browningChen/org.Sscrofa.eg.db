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

SessionInfo:
```r
R version 4.2.3 (2023-03-15 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 22631)

Matrix products: default

locale:
[1] LC_COLLATE=Chinese (Simplified)_China.utf8 
[2] LC_CTYPE=Chinese (Simplified)_China.utf8   
[3] LC_MONETARY=Chinese (Simplified)_China.utf8
[4] LC_NUMERIC=C                               
[5] LC_TIME=Chinese (Simplified)_China.utf8    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] biomaRt_2.54.1

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.11            prettyunits_1.2.0      png_0.1-8             
 [4] ps_1.7.5               Biostrings_2.66.0      utf8_1.2.3            
 [7] digest_0.6.33          mime_0.12              BiocFileCache_2.9.1   
[10] R6_2.5.1               GenomeInfoDb_1.34.9    stats4_4.2.3          
[13] RSQLite_2.3.1          pillar_1.9.0           httr_1.4.7            
[16] zlibbioc_1.44.0        rlang_1.1.1            progress_1.2.2        
[19] curl_5.0.2             rstudioapi_0.15.0      miniUI_0.1.1.1        
[22] callr_3.7.3            urlchecker_1.0.1       blob_1.2.4            
[25] S4Vectors_0.36.2       devtools_2.4.5         stringr_1.5.0         
[28] htmlwidgets_1.6.2      RCurl_1.98-1.12        bit_4.0.5             
[31] shiny_1.7.5            compiler_4.2.3         httpuv_1.6.11         
[34] pkgconfig_2.0.3        BiocGenerics_0.44.0    pkgbuild_1.4.2        
[37] htmltools_0.5.6        tidyselect_1.2.0       KEGGREST_1.38.0       
[40] tibble_3.2.1           GenomeInfoDbData_1.2.9 IRanges_2.32.0        
[43] XML_3.99-0.14          fansi_1.0.4            withr_2.5.1           
[46] crayon_1.5.2           dplyr_1.1.3            dbplyr_2.3.4          
[49] later_1.3.1            rappdirs_0.3.3         bitops_1.0-7          
[52] xtable_1.8-4           lifecycle_1.0.3        DBI_1.1.3             
[55] magrittr_2.0.3         cli_3.6.1              stringi_1.7.12        
[58] cachem_1.0.8           XVector_0.38.0         fs_1.6.3              
[61] promises_1.2.1         remotes_2.4.2.1        xml2_1.3.5            
[64] filelock_1.0.2         ellipsis_0.3.2         vctrs_0.6.3           
[67] generics_0.1.3         tools_4.2.3            bit64_4.0.5           
[70] Biobase_2.58.0         glue_1.6.2             purrr_1.0.2           
[73] hms_1.1.3              processx_3.8.2         pkgload_1.3.3         
[76] fastmap_1.1.1          AnnotationDbi_1.60.2   sessioninfo_1.2.2     
[79] memoise_2.0.1          profvis_0.3.8          usethis_2.2.2
```
