venn <- read.csv("Venn.txt",header = TRUE,sep = "\t")

library(VennDiagram)
library(RColorBrewer)
windowsFonts(myFont1 = windowsFont("Times New Roman"))
tiff("venn_ponds.tif",width = 5400,height = 5400,type = "windows",res = 600,compression = "lzw")
T <- venn.diagram(list(P=venn$P,P.JF.C=venn$P.JF.C,P.SC=venn$P.SC,P.JF=venn$P.JF),
                  filename = NULL,height = 5400,width = 5400,resolution = 600,
                  imagetype = "tiff",units = "px",compression = "lzw",lwd = 5,
                  lty = 1,fill = brewer.pal(4,"Set2"),cex = 3,cat.cex = 3,alpha = 0.8,
                  fontface = "bold",fontfamily = "myFont1",cat.fontface = "bold",
                  cat.fontfamily = "myFont1") 
grid.draw(T)
dev.off()


tiff("venn_all.tif",width = 5400,height = 5400,type = "windows",res = 600,compression = "lzw")
par(mar = c(6,6,6,6))
T <- venn.diagram(list(P=venn$P,P.JF.C=venn$P.JF.C,P.SC=venn$P.SC,P.JF=venn$P.JF,Control=venn$Control),
                  filename = NULL,height = 5400,width = 5400,resolution = 600,
                  imagetype = "tiff",units = "px",compression = "lzw",lwd = 5,
                  lty = 1,fill = brewer.pal(5,"Set2"),cex = 2,cat.cex = 0.5,alpha = 0.8,
                  fontface = "bold",fontfamily = "myFont1",cat.fontface = "bold",
                  cat.fontfamily = "myFont1")
grid.draw(T)
dev.off()