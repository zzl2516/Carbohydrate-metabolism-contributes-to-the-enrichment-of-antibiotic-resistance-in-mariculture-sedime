gene.expression <- read.csv("TotalNumber.txt",header = T,sep = "\t",row.names = 1)
gene.expression$Group <- factor(gene.expression$Group,levels = c("P","P.JF.C","P.SC","P.JF","Control"))


windowsFonts(myFont1 = windowsFont("Times New Roman"))

tiff(filename = "TotalNum.tif",width = 7200,height = 5400,compression = "lzw",res = 600,type = "windows")
par(mar=c(8,8,2,2),family = "myFont1")  
p1 <- boxplot(Num~Group,data = gene.expression,col=c("#BD3B1D","#DB3B1D","#D8A800","#D8A800","#B9D870"),border = "black",xlab = "",ylab = "",family = "myFont1",xaxt = "n",yaxt = "n",lwd = 5)
par(new = T)
par(xpd=TRUE,family = "myFont1")
p1
axis(side = 2,at = c(42,50,60,70,80),label = c("","","","",""),tck = 0.02,lwd.ticks = 2)
text(x = 0.18,y = c(42,50,60,70,80),labels = c(42,50,60,70,80),family = "myFont1",font = 2,cex = 2.5)
mtext("The number of ARGs detected in the\ntotal microbial DNA of different samples",line = 2.8,side = 2,font = 2,family = "myFont1",cex = 2.5)
axis(side = 1,at = 1:5,label = c("","","","",""),tck = 0.02,lwd.ticks = 2)
text(x = 1:5,y = 41,labels = levels(gene.expression$Group),font =2, family = "myFont1",srt = 45,cex = 2.5,adj = c(1,0.5))
segments(x0 = 1,y0 = 66,x1 = 1,y1 = 69,col = "black",lwd = 5)
segments(x0 = 2,y0 = 66,x1 = 2,y1 = 69,col = "black",lwd = 5)
segments(x0 = 1,y0 = 66,x1 = 2,y1 = 66,col = "black",lwd = 5)
text(x = 1.5,y = 64.5,labels = "Group I",font = 2,family = "myFont1",cex = 2.5)
segments(x0 = 3,y0 = 67,x1 = 3,y1 = 70,col = "black",lwd = 5)
segments(x0 = 5,y0 = 67,x1 = 5,y1 = 70,col = "black",lwd = 5)
segments(x0 = 3,y0 = 70,x1 = 5,y1 = 70,col = "black",lwd = 5)
text(x = 4,y = 71.5,labels = "Group II",font = 2,family = "myFont1",cex = 2.5)
dev.off()

