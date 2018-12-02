host <- read.table("contigs.txt",header = TRUE,sep = "\t")

library(ggplot2)
library(reshape2)

host <- melt(host)

windowsFonts(myFont1 = windowsFont("Times New Roman"))
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#D55E00")
Palette <- c("#000000", "#000000", "#000000", "#000000", "#000000", "#CC79A7", "#D55E00")

sample1 <- c(33,0,0,56,27,2,59,25,1,"","","","","","")
sample2 <- c("","","","","","","","","",163,75,18,217,103,19)


p <- ggplot(host,aes(variable,value,fill = X)) + 
  geom_bar(stat = "identity",width = 0.8) +
  geom_text(aes(label=sample1),size=6,family="myFont1",hjust=0.5,vjust=-0.5,fontface = "bold") +
  geom_text(aes(label=sample2),size=6,family="myFont1",hjust=0.5,vjust=2,fontface = "bold") +
  scale_colour_manual(values=Palette)+
  scale_fill_manual(values=cbbPalette,guide = FALSE)+
  ylab("The number of assembled contigs in\n different mariculture modes")+
  facet_grid(X~.,scales = "free_y") +
  theme_bw()+
  theme(axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
        axis.line = element_line(colour = "black"), 
        axis.title.x=element_blank(),
        axis.title.y=element_text(colour='black', size=22,face = "bold",vjust = 3),
        axis.text.y=element_text(colour='black',size=18,face = "bold"),
        axis.text.x=element_text(colour = "black",size = 22,face = "bold"),
        plot.margin = margin(t = 5,r = 5,b = 5, l = 20, unit = "pt"),
        text = element_text(colour = "black",size = 23,face = "bold.italic")) +
  theme(plot.title = element_text(size=28,colour = "black",face = "bold",hjust = 0.5))

tiff(filename="contigs.tif",res=600,height=3600,width=5400,type="windows",compression = "lzw")
p
dev.off()

host1 <- read.table("abundance.txt",header = TRUE,sep = "\t")
host1 <- melt(host1)
cbbPalette1 <- c("#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#D55E00")

p1 <- ggplot(host1,aes(variable,value,fill = X)) + 
  geom_bar(stat = "identity",width = 0.8) +
  scale_colour_manual(values=Palette)+
  scale_fill_manual(values=cbbPalette1,guide = FALSE)+
  ylab("The abundance of GH-L host microbes\n in different mariculture modes")+
  facet_grid(X~.,scales = "free_y") +
  theme_bw()+
  theme(axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
        axis.line = element_line(colour = "black"), 
        axis.title.x=element_blank(),
        axis.title.y=element_text(colour='black', size=22,face = "bold",vjust = 3),
        axis.text.y=element_text(colour='black',size=18,face = "bold"),
        axis.text.x=element_text(colour = "black",size = 22,face = "bold"),
        plot.margin = margin(t = 5,r = 5,b = 5, l = 20, unit = "pt"),
        text = element_text(colour = "black",size = 28,face = "bold.italic")) +
  theme(plot.title = element_text(size=28,colour = "black",face = "bold",hjust = 0.5))

tiff(filename="abundance.tif",res=600,height=3600,width=5400,type="windows",compression = "lzw")
p1
dev.off()