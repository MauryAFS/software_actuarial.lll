library(plyr)
?ddply
  getwd()
setwd("C:/Users/Maury/Documents/GitHub/software_actuarial.lll/Calidad de Hospitales - data")
outcome <- read.csv(file="outcome-of-care-measures.csv", colClasses = "character")


d<-outcome[1:4706,7]

z <- suppressWarnings(as.numeric(outcome[1:4706,11]))
feilure<-suppressWarnings(as.numeric(outcome[1:4706,17]))
neumonia<-suppressWarnings(as.numeric(outcome[1:4706,23]))
hospitalname<-outcome[1:4706,2]
outcome<-data.frame(Hospita= hospitalname,estado=d,ataque=z,falla=feilure,naso=neumonia)

outcome


outcome$ataque[is.na(outcome$ataque) ] <- 100
#outcome

#j<-split(outcome,outcome$estado)
#as.vector(j)
#order(j)

#l<-group_by(outcome,estado)
#arrange(l,ataque,estado)
#l
#summarize(l,order(ataque))



#ddply(outcome,.(hospita),summarize,lo=order(ataque))

k<-ddply(outcome,.(estado),summarize,min=min(ataque),posicion=which.min(ataque),hospital=outcome[posicion,1])

k<- as.vector(k[,1])



pop<-c()
lulu<-c()
lalos<-c()
lolos<-c()
veco<-c()
otra<-c()
ju<-c()


rankingcompleto<-function(resultados, num=0){
  
  
  for (lo in 1:54){
  
  for (ki in 1:4706){
    if (k[c(lo)] == d[c(ki)]){
      
      
      la <-d[c(ki)]
      veco <-c(veco,la )
      pop<-c(pop,z[c(ki)])
      lulu<-c(lulu,neumonia[c(ki)])
      lalos<-c(lalos,feilure[c(ki)])
      lolos<- c(lolos,hospitalname[c(ki)])
      
    }
  }
  
    s<-data.frame(Hospital=lolos,Estado=veco,Ataque=pop,falla=lulu,neumonia=lalos)
    
   
  
 
  group_by(s,Ataque)
  
  s$Ataque[is.na(s$Ataque) ] <- 100
  
  
  
  
  if (resultados == "ataque"){
    
    ku<-s[,3]  
    
    
    
    
  }else if(resultados == "falla"){
    
    ku<-s[,5] 
    
  }else if(resultados == "neumonia"){
    
    ku<-s[,4] 
    
    
  }
  
  ku<-as.numeric(as.vector(ku))
  
 
  if(lo != 1){
  
  
  ka<-ku[-c(1:Q)]
  P<-as.numeric(length(ku))
  sos<-s[(Q+1):P,1]
  #kj<- length(ku)-Q
  Q<-as.numeric(length(ku))
  
  
  
  
  }
  
  if (lo ==1){
  sos<-s[,1]
  ka<-ku
  Q<-17
  }
  las<- data.frame(Var1=sos,Var2= ka)
  
  las<-arrange(las,Var1)
  
  las<-arrange(las,Var2)
  
las
  
  kh <-las[num,]
  kh
  #las<-data.frame(las,Var3=1:length(ku))
  
  
  
 # kh<-as.vector(kh)
  ju<-c(ju,kh)
  
  }
  
k<-as.data.frame(k)
ñp<-as.data.frame(ju)

data.frame(Estado=k,Hospital=ñp)
 
}
rankingcompleto("ataque",num=20)

