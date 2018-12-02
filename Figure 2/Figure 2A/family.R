Palette <- c("#B2182B","#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7","#CC6666","#9999CC","#66CC99","#99999","#ADD1E5")
taxon <- read.table("family.txt",header = T,sep = "\t")

library(reshape2)
taxon <- melt(taxon)
colnames(taxon) <- c("Taxon","variable","value")
library(ggplot2)
windowsFonts(myFont1 = windowsFont("Times New Roman"))

p <- ggplot(data = taxon,aes(x = variable, y = value, fill = Taxon))
p1 <- p + geom_bar(stat = "identity",width = 0.8)+ xlab(label = "")+labs(title ="")
p2 <- p1 + ylab(label = "The relative abundance (%) of\n major taxon at family level") 
p3 <- p2 + scale_fill_manual(values = Palette) +theme_bw()+ 
  theme(panel.grid=element_blank())
p4 <- p3 + theme(axis.text.x=element_text(colour="black",size=28,family = "myFont1",
                                          face = "bold",angle = 45,hjust = 1,vjust = 1)) + 
  theme(axis.text.y=element_text(colour = "black",size = 24,family = "myFont1",face = "bold")) + 
  theme(axis.line = element_line(colour = "black")) + 
  theme(axis.title.y = element_text(size = 32,family = "myFont1",face = "bold"))
p5 <- p4 + theme(legend.text = element_text(colour = "black",size = 24,family = "myFont1",face = "bold.italic")) + 
  theme(legend.title = element_text(size = 24,colour = "black",family = "myFont1",face = "bold"),
        legend.key.height=unit(1.73,"cm"),legend.key = element_rect(fill = "white",color = "black"),
        legend.key.width = unit(1.2,"cm"),
        legend.background = element_rect(fill = "white",colour = "black",size = 1.2)) +
  guides(fill = guide_legend(reverse = TRUE)) + 
  scale_y_continuous(expand = c(0,0)) + theme(panel.border = element_blank())+
  theme(panel.background = element_rect(fill='white', colour='black',size = 2))


tiff(filename="family.tif",res=600,height=5400,width=7200,type="windows",compression = "lzw")

p5
dev.off()
cairo_pdf(filename = "family.pdf",height = 12,width = 15)
p5
dev.off()