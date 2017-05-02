
####Script de la pregunta 1#####


# 1. Cargar en una df llamada fullmat el archivo Prac_Uni6/maices/meta/maizteocintle_SNP50k_meta_extended.txt
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

# 2. ¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)  ##class te dice que clase de archivo tienes y en este caso es data frame


# 3. ¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat) ##Te muestra las seis primeras líneas

# 4. ¿Cuántas muestras hay?
nrow(fullmat) #te cuenta el número de columnas, y cada columna es una muestra

# 5. ¿De cuántos estados se tienen muestras?
estados<-as.factor(fullmat$Estado)
length(levels(estados))

# 6. ¿Cuántas muestras fueron colectadas antes de 1980?
sum(fullmat$AÌ.o._de_colecta<1980 ,  na.rm =TRUE)

# 7. ¿Cuántas muestras hay de cada raza?
raza<- as.factor(fullmat$Raza)
summary(raza)

# 8. En promedio ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)

# 9. ¿Y a qué altitud máxima y mínima fueron colectadas?
max(fullmat$Altitud)
min(fullmat$Altitud)


#pero con summary obtienes los tres datos anteriores
summary (as.numeric(fullmat$Altitud))


# 10. Crea una nueva df de datos sólo con las muestras de la raza Olotillo
dfO<-subset.data.frame(fullmat, Raza=="Olotillo")

# 11. Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
dfReJA<-subset.data.frame(fullmat, Raza== "Reventador" | Raza== "Jala" | Raza== "Ancho")


# 12. Escribe la matriz anterior a un archivo llamado "submat.csv" en /meta.
write.csv(dfReJA, file="../meta/submat.csv")


