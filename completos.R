
setwd("C:/Users/Maury/Documents/R/specdata")


files <- list.files(path="C:/Users/Maury/Documents/R/specdata")
files
o <- lapply(files, read.csv, header = TRUE)
#o
Directorio<- do.call(rbind, o)
Directorio

completos <-function(Directorio,id=1:332){
  
  
  for(i in id){
    j <-na.omit(Directorio[,2:4])
    j
    good<- split(j,j$ID)
    Vec<-sapply(good,nrow)
    Vacio<-c(Vacio,Vec)
    
    
  }
  vacio
  los <-data.frame(Vacio)
  menos<- los[id,]
  data.frame(a=id,b=menos)
  
}

completos(Directorio,1:20)

