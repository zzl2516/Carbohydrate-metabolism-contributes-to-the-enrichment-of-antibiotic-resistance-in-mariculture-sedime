library(vegan)
library(ape)
library(ggplot2)
library(grid)
library(RColorBrewer)

data <- read.csv("Subtype_abundance_cell.txt", head=TRUE,sep="\t")
groups <- read.table("group.list.txt",sep = "\t",header = F,colClasses = c("character"))
groups <- as.list(groups)
data <- t(data)
data[is.na(data)] <- 0
data <- vegdist(data)
windowsFonts(myFont1 = windowsFont("Times New Roman"))

length=length(unique(as.character(groups$V1)))
times1=length%/%8
res1=length%%8
times2=length%/%5
res2=length%%5
col1=rep(1:8,times1)
col=c(col1,1:res1)
pich1=rep(c(15,21:24,18,18),times2)
pich=c(pich1,15:(15+res2))
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7", "#D55E00")
Palette <- c("#000000", "#000000", "#000000", "#000000", "#000000", "#CC79A7", "#D55E00")
pcoa<- pcoa(data, correction = "none", rn = NULL)
PC1 = pcoa$vectors[,1]
PC2 = pcoa$vectors[,2]
plotdata <- data.frame(rownames(pcoa$vectors),PC1,PC2,groups$V2)
colnames(plotdata) <-c("sample","PC1","PC2","group")
pc1 <-floor(pcoa$values$Relative_eig[1]*100)
pc2 <-floor(pcoa$values$Relative_eig[2]*100)

p2<-ggplot(plotdata, aes(PC1, PC2)) +
geom_point(aes(colour=group,shape=group,fill=group),size=12)+ 
scale_shape_manual(values=pich)+
scale_colour_manual(values=Palette)+
scale_fill_manual(values=cbbPalette)+
labs(title="PCoA - PC1 vs PC2") + 
  xlab(paste("PC1 ( ",pc1,"%"," )",sep="")) + 
  ylab(paste("PC2 ( ",pc2,"%"," )",sep=""))+
theme(text=element_text(family="myFont1",size=28,face = "bold"))+
geom_vline(aes(xintercept = 0),linetype="dotted")+
geom_hline(aes(yintercept = 0),linetype="dotted")+
theme(panel.background = element_rect(fill='white', colour='black'),
      panel.grid=element_blank(), 
      axis.title = element_text(color='black',family="myFont1",size=28,face = "bold"),
      axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
      axis.line = element_line(colour = "black"), 
      axis.title.x=element_text(colour='black', size=28,face = "bold"),
      axis.title.y=element_text(colour='black', size=28,face = "bold"),
      axis.text=element_text(colour='black',size=28,face = "bold"),
      legend.title=element_blank(),
      legend.text=element_text(family="myFont1", size=28,face = "bold"),
      legend.key=element_blank(),legend.position = c(0.1,0.75),
      legend.background = element_rect(colour = "black"),
      legend.key.height=unit(1.8,"cm"))+
theme(plot.title = element_text(size=28,colour = "black",face = "bold",hjust = 0.5))

cairo_pdf("PCoA12.pdf",height=12,width=15)
p2
tiff(filename="PCoA12.tif",res=600,height=5400,width=7200,type="windows",compression = "lzw")
p2
dev.off()

sample1 <- c("","","P.3","P.JF.C.1","P.JF.C.2","","P.SC.1","","","P.JF.1","P.JF.2","","Control.1","","Control.3")
sample2 <- c("P.1","P.2","","","","","","P.SC.2","P.SC.3",rep("",2),"P.JF.3","","","")
sample3 <- c(rep("",13),"Control.2","")
sample4 <- c(rep("",5),"P.JF.C.3",rep("",9))
p5<-ggplot(plotdata, aes(PC1, PC2)) +
geom_text(aes(label=sample1),size=8,family="myFont1",hjust=0.5,vjust=-1)+
geom_text(aes(label=sample2),size=8,family="myFont1",hjust=0.5,vjust=2)+
geom_text(aes(label=sample3),size=8,family="myFont1",hjust=0.7,vjust=2)+
geom_text(aes(label=sample4),size=8,family="myFont1",hjust=0.3,vjust=-1)+
  geom_point(aes(colour=group,shape=group,fill=group),size=12)+ 
  scale_shape_manual(values=pich)+
  scale_colour_manual(values=Palette)+
  scale_fill_manual(values=cbbPalette)+
  labs(title="PCoA - PC1 vs PC2") + 
  xlab(paste("PC1 ( ",pc1,"%"," )",sep="")) + 
  ylab(paste("PC2 ( ",pc2,"%"," )",sep=""))+
  theme(text=element_text(family="myFont1",size=28,face = "bold"))+
  geom_vline(aes(xintercept = 0),linetype="dotted")+
  geom_hline(aes(yintercept = 0),linetype="dotted")+
  theme(panel.background = element_rect(fill='white', colour='black'),
        panel.grid=element_blank(), 
        axis.title = element_text(color='black',family="myFont1",size=28,face = "bold"),
        axis.ticks.length = unit(0.4,"lines"), axis.ticks = element_line(color='black'),
        axis.line = element_line(colour = "black"), 
        axis.title.x=element_text(colour='black', size=28,face = "bold"),
        axis.title.y=element_text(colour='black', size=28,face = "bold"),
        axis.text=element_text(colour='black',size=28,face = "bold"),
        legend.title=element_blank(),
        legend.text=element_text(family="myFont1", size=28,face = "bold"),
        legend.key=element_blank(),legend.position = c(0.1,0.75),
        legend.background = element_rect(colour = "black"),
        legend.key.height=unit(1.8,"cm"))+
  theme(plot.title = element_text(size=28,colour = "black",face = "bold",hjust = 0.5))
cairo_pdf("PCoA12-2.pdf",height=12,width=15)
p5
tiff(filename="PCoA12-2.tif",res=600,height=5400,width=7200,type="windows",compression = "lzw")
p5
dev.off()