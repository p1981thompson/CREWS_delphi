#Load data from Qualtrics RECAP #

#07-04-2020#

setwd('/Volumes/PSYHOME/PSYRES/pthompson/DVMB/CREWS_delphi/')
library(readxl)
library(psych)
library(tools)

qualtrics.Terminology.data<-read_excel("/Volumes/PSYHOME/PSYRES/pthompson/DVMB/CREWS_delphi/test data/CREWS_terminology.xlsx",sheet="CREWS_T")#,col_types='text')

qualtrics.Terminology.data<-as.data.frame(qualtrics.Terminology.data)

Delphi.T.members<-qualtrics.Terminology.data$ExternalDataReference
#Delphi.T.members <- factor(Delphi.T.members)
#Delphi.T.members <- factor(Delphi.T.members, levels=levels(droplevels(Delphi.T.members)))


processInput_T_Anon <- function(panel.member) { 
  temp <<- environment()
  Sweave(paste(getwd(),'/reports/delphi_CREWS_report_template_anonymous.Rnw',sep=""), output = paste(getwd(),'/reports/Delphi_RECAP_report_anonymous.tex', sep = ''))
  texi2dvi(paste(getwd(),'/reports/Delphi_RECAP_report_anonymous.tex', sep = ''), pdf = TRUE, clean = TRUE,texinputs=paste(getwd(),'/reports/Delphi_RECAP_report_anonymous.tex', sep = ''))
}

# processInput_T <- function(panel.member) { 
#   temp <<- environment()
#   Sweave(paste(getwd(),'/reports/delphi_CREWS_report_template.Rnw',sep=""), output = paste(getwd(),'/reports/Delphi_CREWS_report_', panel.member, '.tex', sep = ''))
#   texi2dvi(paste(getwd(),'/reports/Delphi_CREWS_report_', panel.member, '.tex', sep = ''), pdf = TRUE, clean = TRUE,texinputs=paste(getwd(),'/reports/Delphi_CREWS_report_', panel.member, '.tex', sep = ''))
# }


for(panel.member in Delphi.T.members){
  Sweave(paste(getwd(),'/reports/delphi_CREWS_report_template.Rnw',sep=""), output = paste(getwd(),'/reports/Delphi_RECAP_report_', panel.member, '.tex', sep = ''))
  texi2dvi(paste(getwd(),'/reports/Delphi_RECAP_report_', panel.member, '.tex', sep = ''), pdf = TRUE, clean = TRUE,texinputs=paste(getwd(),'/reports/Delphi_RECAP_report_', panel.member, '.tex', sep = ''))
}