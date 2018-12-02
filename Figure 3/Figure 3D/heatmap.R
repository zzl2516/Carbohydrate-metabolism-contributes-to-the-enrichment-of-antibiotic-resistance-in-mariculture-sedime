cog <- read.table("COG.txt",header = T,sep = "\t",row.names = 1)
args.abundance <- read.table("Subtype_abundance_ppm.txt",header = TRUE,sep = "\t",row.names = 1)
#ÔØÈë»æÍ¼Êý¾Ý

args.abundance <- t(args.abundance)
cog <- t(cog)

library(psych)
windowsFonts(myFont1 = windowsFont("Times New Roman"))
res=corr.test(args.abundance,cog,method = "pearson",adjust = "holm")
library(reshape2)
gene.expression.r <- melt(res$r)
write.table(gene.expression.r,"correlation.xls",sep="\t",quote=F,col.names=NA)
gene.expression.p <- melt(res$p)
write.table(gene.expression.p,"pvalue.xls",sep="\t",quote=F,col.names=NA)