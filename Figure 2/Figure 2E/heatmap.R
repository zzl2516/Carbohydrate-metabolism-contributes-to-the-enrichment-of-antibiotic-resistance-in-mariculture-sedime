cog <- read.table("COG.txt",header = T,sep = "\t",row.names = 1)
args.abundance <- read.table("Abundance_cell.txt",header = TRUE,sep = "\t",row.names = 1)
#ÔØÈë»æÍ¼Êý¾Ý

args.abundance <- t(args.abundance)
cog <- t(cog)

library(psych)
library(pheatmap)
windowsFonts(myFont1 = windowsFont("Times New Roman"))
res=corr.test(args.abundance,cog,method = "spearman",adjust = "holm")
write.table(res$r,"correlation.xls",sep="\t",quote=F,col.names=NA)
write.table(res$p,"pvalue.xls",sep="\t",quote=F,col.names=NA)

tiff(filename="correlation.tif",res=600,height=7200,width=5400,type="windows",compression = "lzw")
pheatmap(res$r,display_numbers = matrix(ifelse(res$p <= 0.01, "**", ifelse(res$p <= 0.05 ,"*"," ")), nrow(res$p)), 
         fontsize_number=25, fontsize_row = 20,fontsize_col = 18,fontsize = 15,cluster_rows = FALSE,cluster_cols = FALSE,fontface = "bold")
dev.off()