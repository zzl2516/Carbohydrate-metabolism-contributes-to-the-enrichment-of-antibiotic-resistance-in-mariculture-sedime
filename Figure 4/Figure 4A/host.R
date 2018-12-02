host <- read.table("host.txt",header = TRUE,sep = "\t")

library(ggplot2)
library(reshape2)

host <- melt(host)

windowsFonts(myFont1 = windowsFont("Times New Roman"))
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#D55E00")
Palette <- c("#000000", "#000000", "#000000", "#000000", "#000000", "#CC79A7", "#D55E00")
host$X <- factor(host$X,levels = c("Xanthomonas","Eimeria","Leishmania","Gillisia","Thiomicrospira"),ordered = TRUE)

p <- ggplot(host,aes(variable,value,fill = X)) + 
  geom_bar(stat = "identity",width = 0.8) + 
  scale_colour_manual(values=Palette)+
  scale_fill_manual(values=cbbPalette,guide = FALSE)+
  ylab("The relative abundance of ARGs host microorganisms (%)")+
  facet_grid(X~.,scales = "free_y") +
  theme_bw()+
  theme(axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
        axis.line = element_line(colour = "black"), 
        axis.title.x=element_blank(),
        axis.title.y=element_text(colour='black', size=28,face = "bold",vjust = 3),
        axis.text.y=element_text(colour='black',size=20,face = "bold"),
        axis.text.x=element_text(colour = "black",size = 28,face = "bold"),
        plot.margin = margin(t = 5,r = 5,b = 5, l = 10, unit = "pt"),
        text = element_text(colour = "black",size = 25,face = "bold.italic")) +
  theme(plot.title = element_text(size=28,colour = "black",face = "bold",hjust = 0.5))

tiff(filename="host.tif",res=600,height=7200,width=5400,type="windows",compression = "lzw")
p
dev.off()
