args.number <- read.table("Common_type_cell.txt",header = TRUE,sep = "\t",row.names = 1)
#载入绘图数据
args.number <- args.number*100
args.number <- as.matrix(args.number)
#调整数据格式
windowsFonts(myFont1=windowsFont("Times New Roman"))
#设置绘图字体

library(RColorBrewer)
#载入颜色包
tiff(filename = "Common.cell.tif",width = 8400,height = 6000,res = 600,type = "windows",compression = "lzw")
par(mar=c(5,8,10,2))
#设置绘图区
bar <- barplot(args.number,names.arg = c(rep("",5)),col = colorRampPalette(brewer.pal(12,"Set3"))(14),border = "black",family = "myFont1",xlim = c(0,6),axes = F,ylim = c(0,100))
#绘制第一张图
axis(side = 2,at = seq(0,100,20),line = -2.5,family = "myFont1",cex.axis = 2.8,lwd = 3,font = 2,las = 2)
mtext("The relative abundance (%) of shared ARGs\nin the total microbial DNA of different samples",side = 2,line = 3,family = "myFont1",font = 2,cex = 2.6)
#添加y轴
axis(side = 1, at = bar,labels = colnames(args.number),family = "myFont1",font = 2,cex.axis = 2.8,lwd = 3,line = 0.5,padj = 0.5)
#添加x轴

par(xpd=TRUE)
par(new = T)
par(family = "myFont1")
plot(0:1, 0:1, type="n", xlab="",ylab="", axes=FALSE)
legend(0,1.3,legend = rownames(args.number),fill = colorRampPalette(brewer.pal(12,"Set3"))(14),bty = "n",ncol = 4,text.width = 0.18,text.font = 2,cex = 2,pt.cex = 4)
#添加图例
dev.off()