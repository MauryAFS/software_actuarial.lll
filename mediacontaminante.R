setwd("C:/Users/Maury/Documents/R/specdata")


files <- list.files(path="C:/Users/Maury/Documents/R/specdata")
files
o <- lapply(files, read.csv, header = TRUE)
#o
Directorio<- do.call(rbind, o)
Directorio

mediacontaminante <-function(Directorio, contaminante="sulfate",Id=1:332){
  
  
  if(contaminante=="sulfate"){
    
    
    
    j<-na.omit(Directorio[,2])
    j
    
    
    
  }else if(contaminante=="nitrate"){
    
    
    j <- na.omit(Directorio[,3])
  }
  
  
  mean(j)
}


mediacontaminante(Directorio,"Nitrate",1:335)
