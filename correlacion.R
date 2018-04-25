setwd("C:/Users/Maury/Documents/R/specdata")


files <- list.files(path="C:/Users/Maury/Documents/R/specdata")
files
o <- lapply(files, read.csv, header = TRUE)
#o
Directorio<- do.call(rbind, o)
Directorio

vacio <-c()



j <-na.omit(Directorio[,2:4])

j
good<- split(j,j$ID)
Vec<-sapply(good,nrow)
vacio<-c(vacio,Vec)
vacio
m <-vacio






mx<-c()
corr <- function(Directorio, horizonte=0){
  vacio <-c()
  for( i in 1:332){
    
    if (m> 332){
      
      
      col2 <- data.frame(lo[,2])
      
      col3 <-data.frame(lo[,3])
      
      correlacion <-cor(col2,col3)
      
      mx<-c(mx,correlacion)
    }
  }  
  mx
  
}

corr(Directorio,332)
