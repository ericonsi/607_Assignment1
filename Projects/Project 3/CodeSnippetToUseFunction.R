
library(dplyr )
library(stringr)
library(tidyverse)
library(magrittr)

dfKaggle <-read_csv("D:/RStudio/CUNY_607/Projects/Project 3/Kaggle CSVs/alldata.csv")
dfKaggle %<>% 
  filter(str_detect(dfKaggle$position, "Data Scientist" ))

dfSkills<-as.data.frame(str_extract(dfKaggle$description, "(.............................................................................)skills"))

dfSkills <- na.omit(dfSkills)

dfSkills %<>%
  rename(Skills='str_extract(dfKaggle$description, "(.............................................................................)skills")')

write_csv(dfSkills, "D:/RStudio/CUNY_607/Projects/Project 3/Kaggle CSVs/SkillsExtract.csv")

freqSkills <- EH_WordCloudIt(dfSkills, "Skills", FALSE)

write.csv(freqSkills, "D:/RStudio/CUNY_607/Projects/Project 3/Kaggle CSVs/SkillsExtract_Results.csv")
