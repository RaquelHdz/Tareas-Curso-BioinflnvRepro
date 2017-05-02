
####Script de la pregunta 1#####


#Cargar en una df llamada fullmat el archivo Prac_Uni6/maices/meta/maizteocintle_SNP50k_meta_extended.txt
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)  ##class te dice que clase de archivo tienes y en este caso es data frame


#¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat) ##Te muestra las seis primeras líneas

#¿Cuántas muestras hay?
nrow(fullmat) #te cuenta el número de columnas, y cada columna es una muestra

#¿De cuántos estados se tienen muestras?
estados<-as.factor(fullmat$Estado)
length(levels(estados))

#¿Cuántas muestras fueron colectadas antes de 1980?
sum(fullmat$AÌ.o._de_colecta<1980 ,  na.rm =TRUE)

#¿Cuántas muestras hay de cada raza?
raza<- as.factor(fullmat$Raza)
summary(raza)

#En promedio ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

#¿Y a qué altitud máxima y mínima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)


#pero con summary obtienes los tres datos anteriores
summary (as.numeric(fullmat$Altitud))


#Crea una nueva df de datos sólo con las muestras de la raza Olotillo
dfO<-subset.data.frame(fullmat, Raza=="Olotillo")

#Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
dfReJA<-subset.data.frame(fullmat, Raza== "Reventador" | Raza== "Jala" | Raza== "Ancho")


#Escribe la matriz anterior a un archivo llamado "submat.csv" en /meta.
write.csv(dfReJA, file="../meta/submat.csv")


