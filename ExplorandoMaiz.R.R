
####Script de la pregunta 1#####


# 1. Cargar en una df llamada fullmat el archivo Prac_Uni6/maices/meta/maizteocintle_SNP50k_meta_extended.txt
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

# 2. �Qu� tipo de objeto creamos al cargar la base?
class(fullmat)  ##class te dice que clase de archivo tienes y en este caso es data frame


# 3. �C�mo se ven las primeras 6 l�neas del archivo?
head(fullmat) ##Te muestra las seis primeras l�neas

# 4. �Cu�ntas muestras hay?
nrow(fullmat) #te cuenta el n�mero de columnas, y cada columna es una muestra

# 5. �De cu�ntos estados se tienen muestras?
estados<-as.factor(fullmat$Estado)
length(levels(estados))

# 6. �Cu�ntas muestras fueron colectadas antes de 1980?
sum(fullmat$A�.o._de_colecta<1980 ,  na.rm =TRUE)

# 7. �Cu�ntas muestras hay de cada raza?
raza<- as.factor(fullmat$Raza)
summary(raza)

# 8. En promedio �a qu� altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

# 9. �Y a qu� altitud m�xima y m�nima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)


#pero con summary obtienes los tres datos anteriores
summary (as.numeric(fullmat$Altitud))


# 10. Crea una nueva df de datos s�lo con las muestras de la raza Olotillo
dfO<-subset.data.frame(fullmat, Raza=="Olotillo")

# 11. Crea una nueva df de datos s�lo con las muestras de la raza Reventador, Jala y Ancho
dfReJA<-subset.data.frame(fullmat, Raza== "Reventador" | Raza== "Jala" | Raza== "Ancho")


# 12. Escribe la matriz anterior a un archivo llamado "submat.csv" en /meta.
write.csv(dfReJA, file="../meta/submat.csv")


