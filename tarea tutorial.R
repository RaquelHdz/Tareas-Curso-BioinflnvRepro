##Introduction to population genetics analysis using##

library(adegenet)
library(pegas)
library(hierfstat)

## First look at the data

#Leer un archivo formato genpop
biv<-read.genepop("genepop.gen", ncode=2L)

biv

dim(biv@tab)

class(biv@tab)

#Pides que te muestre la matriz de las frec alélicas de los primero cinco individuos
#Las filas son individuos y las columnas alelos
biv@tab[1:5,1:20]

head(indNames(biv), 10)

indNames(biv) <- paste("b", 1:nInd(biv),sep=".")

head(indNames(biv), 10)

locNames(biv)

temp <- locNames(biv, withAlleles=TRUE)
head(temp, 10)

head(pop(biv), 50)

table(pop(biv))

barplot(table(pop(biv)), col=funky(11), las=3,
        xlab="Population", ylab="Sample size")

temp<- summary(biv)

plot(temp$Hexp, temp$Hobs, pch=20, cex=3, xlim=c(.4,1), ylim=c(.4,1))
abline(0,1,lty=2)

#Testing for Hardy-Weinberg equilibrium
#La función de adegenet era HWE.test.genind(), pero ahora pertenece a la paquetería pegas, y es hw.test


allpval <- hw.test(biv,res="matrix")
dim(allpval)
colnames(allpval)

idx <- which(allpval<0.0001,TRUE)
idx

alltests <- hw.test(biv,res="full")
alltests

### Assessing population structure

fstat(biv, fstonly=TRUE)

#proporción de la variación genética
biv.gtest <- gstat.randtest(biv)
biv.gtest

plot(biv.gtest)

matFst <- pairwise.fst(biv,res.type="matrix")
matFst[1:4,1:4]

matFst <- matFst[-17,-17]

#Grafica la distancia genética de las poblaciones 
biv.tree <- nj(matFst)
plot(biv.tree, type="unr", tip.col=funky(17)[-17], font=2)
annot <- round(biv.tree$edge.length,2)
edgelabels(annot[annot>0], which(annot>0), frame="n")
add.scale.bar()


#plotea Fst pareadas
table.paint(matFst, col.labels=1:16)

temp <- matFst
diag(temp) <- NA

#plotea diagrama de caja y bigote de los valores de Fst
boxplot(temp, col=funky(17)[-17], xlab="Population", ylab="Fst")
