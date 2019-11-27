library(raster) 
library(RStoolbox)
library(randomForest) 

setwd("f:/comp_HU_Davvid")
lista = list.dirs(full.names = TRUE)

#lista plik?w
files = list.files(lista, pattern = "MIN.dat$")
#nazwy plik?w
names = paste("min", c(1:length(files)), sep = "") 


min_list=list() #tworzymy pusta liste aby w petli od razu zrobi?a sie lista 40 stack?w
for(i in 1:length(files)){  
  min_list[[i]] = stack(paste(path, lista[i+1], "/", files[i], sep=""))  
  assign(names[i], min_list[i])  
}  
min_list$fun = mean
min_mosaic = do.call(mosaic,min_list)

setwd("f:/comp_HU_Davvid")
path = "f:/comp_HU_Davvid"
#lista folder?w
lista = list.dirs(full.names = TRUE)

#lista plik?w
files = list.files(lista, pattern = "MAX.dat$")
#nazwy plik?w
names = paste("max", c(1:length(files)), sep = "") 


max_list=list() #tworzymy pusta liste aby w petli od razu zrobi?a sie lista 40 stack?w
for(i in 1:length(files)){  
  max_list[[i]] = stack(paste(path, lista[i+1], "/", files[i], sep=""))  
  assign(names[i], max_list[i])  
}
max_list$fun = mean
max_mosaic = do.call(mosaic,max_list)
writeRaster(max_mosaic, "mosaic_MAX", format = "GTiff")

plotRGB(min_mosaic, stretch="hist")
writeRaster(min_mosaic, "mosaic_MIN", format = "GTiff")


setwd("f:/comp_HU_Davvid")
path = "f:/comp_HU_Davvid"
#lista folder?w
lista = list.dirs(full.names = TRUE)

#lista plik?w
files = list.files(lista, pattern = "RNG.dat$")
#nazwy plik?w
names = paste("rng", c(1:length(files)), sep = "") 


rng_list=list() #tworzymy pusta liste aby w petli od razu zrobi?a sie lista 40 stack?w
for(i in 1:length(files)){  
  rng_list[[i]] = stack(paste(path, lista[i+1], "/", files[i], sep=""))  
  assign(names[i], rng_list[i])  
}
rng_list$fun = mean
rng_mosaic = do.call(mosaic,rng_list)
writeRaster(rng_mosaic, "mosaic_rng", format = "GTiff")

q25_mosaic
