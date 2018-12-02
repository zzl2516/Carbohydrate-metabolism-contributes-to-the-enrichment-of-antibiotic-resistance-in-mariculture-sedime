gene.expression <- read.csv("Abundance_cell.txt",header = T,sep = "\t",row.names = 1)
gene.expression$Group <- factor(gene.expression$Group,levels = c("P","P.JF.C","P.SC","P.JF","Control"))


windowsFonts(myFont1 = windowsFont("Times New Roman"))

tiff(filename = "TotalAbundance.tif",width = 7200,height = 5400,compression = "lzw",res = 600,type = "windows")
par(mar=c(8,9,2.2,2),family = "myFont1")  
p1 <- boxplot(abundance~Group,data = gene.expression,col=c("#BD3B1D","#DB3B1D","#D8A800","#D8A800","#B9D870"),border = "black",xlab = "",ylab = "",family = "myFont1",xaxt = "n",yaxt = "n",lwd = 5)
par(new = T)
par(xpd=TRUE,family = "myFont1")
p1
axis(side = 2,at = c(0.05,0.06,0.07,0.08,0.09,0.10),label = c("","","","","",""),tck = 0.02,lwd.ticks = 2)
text(x = 0.09,y = c(0.05,0.06,0.07,0.08,0.09,0.10),labels = c(0.05,0.06,0.07,0.08,0.09,"0.10"),family = "myFont1",font = 2,cex = 2.5)
text(x = -0.4,y = 0.0715,labels = "The abundance of total ARGs against bacteria number\nin the total microbial DNA of different samples",font = 2,family = "myFont1",cex = 2.3,srt = 90)
axis(side = 1,at = 1:5,label = c("","","","",""),tck = 0.02,lwd.ticks = 2)
text(x = 1:5,y = 0.045,labels = levels(gene.expression$Group),font =2, family = "myFont1",srt = 45,cex = 2.5,adj = c(1,0.5))
segments(x0 = 1,y0 = 0.064,x1 = 1,y1 = 0.068,col = "black",lwd = 5)
segments(x0 = 2,y0 = 0.064,x1 = 2,y1 = 0.068,col = "black",lwd = 5)
segments(x0 = 1,y0 = 0.064,x1 = 2,y1 = 0.064,col = "black",lwd = 5)
text(x = 1.5,y = 0.062,labels = "Group I",font = 2,family = "myFont1",cex = 2.5)
segments(x0 = 3,y0 = 0.07,x1 = 3,y1 = 0.074,col = "black",lwd = 5)
segments(x0 = 5,y0 = 0.07,x1 = 5,y1 = 0.074,col = "black",lwd = 5)
segments(x0 = 3,y0 = 0.074,x1 = 5,y1 = 0.074,col = "black",lwd = 5)
text(x = 4,y = 0.076,labels = "Group II",font = 2,family = "myFont1",cex = 2.5)
dev.off()

