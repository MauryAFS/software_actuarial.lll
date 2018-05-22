library(dplyr)
getwd()
setwd("C:/Users/Maury/Documents/GitHub/software_actuarial.lll/Calidad de Hospitales - data")
outcome <- read.csv(file="outcome-of-care-measures.csv", colClasses = "character") 




 z <- suppressWarnings(as.numeric(outcome[,11]))
d<-outcome[,7]
feilure<-suppressWarnings(as.numeric(outcome[,17]))
neumonia<-suppressWarnings(as.numeric(outcome[,23]))
hospitalname<-outcome[,2]
pop<-c()
lulu<-c()
lalos<-c()
lolos<-c()
veco<-c()
lo<-c()
mejor<-function(estado, resultados){
  
  for(u in 1:50){
   
    if(estado== state.abb[c(u)]){
     m<- estado == state.abb[c(u)]
     
      lo<-c(lo,m)
    }else if (estado!= state.abb[c(u)]) {
      j<- estado != state.abb[c(u)]
      
    }
    
  }
  
 lo<- length(lo)
 if (j ==T & lo==0){ stop("Estado invalido") }
  
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
NombresHospital<-s[,1]

#df<-which.min(ku)

#df<-sos[c(df)]
#df
las<- data.frame(Hospitales=NombresHospital,Tasa= ku)
las<-arrange(las,Hospitales)

las<-arrange(las,Tasa)


kh <-las[1,]
kh
}
mejor("NY","atakue") ## Resultado invalido
mejor("TX","falla")
mejor("TX","ataque")
mejor("MD","ataque")













