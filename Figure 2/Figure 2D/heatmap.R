args.abundance <- read.table("cluster.level1.txt",header = TRUE,sep = "\t",row.names = 1)
#载入绘图数据

windowsFonts(myFont1=windowsFont("Times New Roman"))
#设置绘图字体

library(pheatmap)
#载入绘图包


tiff(filename = "cluster.level1.tif",res = 600,height = 5400,width = 7200,type = "windows",compression = "lzw")
pheatmap(args.abundance,family = "myFont1",fontsize = 24,scale = "row",cluster_cols = FALSE,gaps_col = c(3,6,9,12),cellwidth = 45)
dev.off()
#存为宽为样品数*45/155+10 长为物种数*13/35

