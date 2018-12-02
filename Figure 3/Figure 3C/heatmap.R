cog <- read.table("KEGG.txt",header = T,sep = "\t",row.names = 1)

#ÔØÈë»æÍ¼Êý¾Ý
cog <- t(cog)

library(pheatmap)
windowsFonts(myFont1 = windowsFont("Times New Roman"))

tiff(filename="correlation.tif",res=600,height=7200,width=5400,type="windows",compression = "lzw")
pheatmap(cog,fontsize = 18,cluster_rows = FALSE,fontface = "bold",scale = "column")
dev.off()