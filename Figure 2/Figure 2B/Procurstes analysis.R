windowsFonts(myFont1=windowsFont("Times New Roman"))
#设置绘图字体

otu <- read.csv("Subtype_abundance_cell.txt",header = TRUE,sep = "\t")
#载入第一个分析数据
otu <- t(otu)
otu <- as.matrix(otu)
#调整数据格式

env <- read.csv("phylum.txt",header = TRUE,sep = "\t",row.names = 1)
#载入第二个分析数据
env <- t(env)
env <- as.matrix(env)
#调整数据格式

library(vegan)
#载入分析包

otu.dist <- vegdist(otu)
env.dist <- vegdist(env)
#计算距离矩阵

mds.otu <- monoMDS(otu.dist)
mds.env <- monoMDS(env.dist)
#对距离矩阵进行mds分析

pro.otu.env <- procrustes(mds.otu,mds.env)
#进行procrustes分析

protest(mds.otu,mds.env)
#手动保存结果

tiff(filename = "ARGs_microbial.tif",width = 5400,height = 5400,res = 600,type = "windows",compression = "lzw")
par(family = "myFont1",mar = c(5,5,5,2))
plot(pro.otu.env,main = "The correlation between antibiotic resistome\nand microbial community composition",
     ar.col = "navy",lwd = 3,type = "p",pch = 21,bg = "navy",cex = 3,len = 0.2,
     family = "myFont1",font = 2,cex.main = 2.5, cex.axis = 2,cex.lab = 2)
points(pro.otu.env,pch = 21,bg = "firebrick1",cex = 3,col = "firebrick1")
text(-2,1.5,labels = "r = 0.479, p-value > 0.05",
     family = "myFont1",adj = 0,cex = 2.5,font = 2,font.lab = 2)
#绘制procrustes图
dev.off()