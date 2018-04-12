#read.table, read.csv se usan para leer datos en tablas
#readlines, para leer lineas de texo
#source para leer archivos de codigo en R (opuesto a dump)
#dget para leer archivos de codigo en R (opuesto a dput)
# load  para leer en espacio de trabajo guardados
# unserialize() para leer un objeto simple en R en su forma binaria

#exportar funciones analogas para exporar datos a aarchivos
# write.table
#writelines
#dump
#dput
#save
#serialize

#READ.TABLE TIENE ARGUMENTOS IMPORTANTES
#File: nombre de un archivo o link
#header booleano indincando que el archivo tiene encabezado
# sep cadena indicando como se separan las columnas (pueden ser comas, tabulaciones,barras)
#colclasses incida la clase de cada columna en un datos c(character,character,numeric,character)
#nrows numero de filas de datos
#comments.char cadena indicando el caracter para comentarios

#skip lineas a omitir desde el inicio
#stringsasfactors los caracteres deberian ser condierados como factores

# data <- read.table("food.txt")

#read.csv asume las ,

# coloca comentarias con "" para ahorrar memoria

#dump  dput son utiles para crear formatos editables en texto que son bastante y preservan la metadata



#Lectura y escritura de datos




# dput y dget
#creo el objeto

y <- data.frame(a=1,b="a")
dput(y)

 
# 2 estudio de la manera en que se guardara
dput(y,file="y.R")

# ~/github/.... para no guardar en home

#3 se guarda en discu duro

#4 genero un nuevo objeto a partir de la informaicon guardada
y2 <- dget(file= "y.R")

 # TArea almacenar en tu disco duro la base de datos
# mtcars en un archivo "carros.R" y posteriormente
#guardarlo en un data frame nuevo que se llame
#Carros(tunombre)

o <- data.frame(mtcars)
 dput(o)
 
dput(o, file = "~/Github/software_actuarial.lll/CARROS.R")
 
CarrosMaury<- dget(file= "~/Github/software_actuarial.lll/CARROS.R")
dput(CarrosMaury)
## Agregar source