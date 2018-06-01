rm(list = ls())

set.seed(1)
options(repos = "https://cran.rstudio.com/")
library(formatR)
library(ctv)
library(MASS)
library(dplyr)
library(nycflights13)
library(data.table)
library(pryr)
library(ggplot2)
library(microbenchmark)
library(sqldf)
library(devtools)
devtools::find_rtools()
options(width = 55)
knitr::opts_chunk$set(comment="  ##", collapse=TRUE, tidy = FALSE)
compiler::enableJIT(0)

####
# Téléchargement des données et espace de travail ----
####

if(!exists(".download")) .download <- FALSE
if(.download){
  file <- tempfile()
  download.file("http://t.slmc.fr/perf/donnees.zip", file)
}else file <- "#output/donnees.zip"
.dir <- tempdir()
unzip(file, exdir = .dir)
knitr::opts_knit$set(root.dir = .dir)

.initOK <<- TRUE 
