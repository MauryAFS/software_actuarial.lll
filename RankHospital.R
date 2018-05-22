library(dplyr)
getwd()
setwd("C:/Users/Maury/Documents/GitHub/software_actuarial.lll/Calidad de Hospitales - data")
outcome <- read.csv(file="outcome-of-care-measures.csv", colClasses = "character")

d<-outcome[,7]
z <- suppressWarnings(as.numeric(outcome[,11]))
feilure<-suppressWarnings(as.numeric(outcome[,17]))
neumonia<-suppressWarnings(as.numeric(outcome[,23]))
hospitalname<-outcome[,2]
pop<-c()
lulu<-c()
lalos<-c()
lolos<-c()
veco<-c()
otra<-c()
Rankhospital<-function(estado, resultados,num=6){
  for (ki in 1:4706){
    if (estado == d[c(ki)]){
      la <-d[c(ki)]
      veco <-c(veco,la )
      pop<-c(pop,z[c(ki)])
      lulu<-c(lulu,neumonia[c(ki)])
      lalos<-c(lalos,feilure[c(ki)])
      lolos<- c(lolos,hospitalname[c(ki)])
      
    }
    
  }
  s<-cbind(lolos,veco,pop,lulu,lalos)
  s<- as.data.frame(s)
  s<-s[complete.cases(s),]
  s<-as.data.frame(s)
  if (resultados != "ataque" & resultados != "falla" & resultados != "neumonia"){
    stop("resultado invalido")   
  }else if(resultados == "ataque"){
    ku<-s[,3]  
   }else if(resultados == "falla"){
    ku<-s[,5] 
    }else if(resultados == "neumonia"){
    ku<-s[,4] 
    
}
  
ku<-as.numeric(as.vector(ku))
 sos<-s[,1]
las<- data.frame(Var1=sos,Var2= ku)
if (num == "mejor"){
  num <- 1
}else if (num== "peor"){
  num<-length(ku)
}else if(num > length(ku)){
  stop( NA,call.=F,domain=NULL)
 
}

las<-arrange(las,Var1)
las<-arrange(las,Var2)
kh <-las[num,]
  kh
}
Rankhospital("TX","falla",4)
Rankhospital("MD", "ataque", "peor")
Rankhospital("MN", "ataque", 5000) # NA
Rankhospital("MN","Atakue",4)# resultado invalido
