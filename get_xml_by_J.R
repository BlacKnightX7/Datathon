install.packages("XML")
library(XML)

url <- "https://www.ptv.vic.gov.au/tickets/myki/ef1d0f60a/xml-list"
AAA<-GET(url)
BBB<-xmlParse(AAA)
RAW_XML<-xmlToList(BBB)

namevector<-names(RAW_XML[[1]])
namevector<-namevector[-4] #A2 is NULL 

xml_data<-unlist( sapply(RAW_XML, '[', namevector[1]))


for(i in 2:8){
  intermediate_xml <-unlist( sapply(RAW_XML, '[', namevector[i]))
  xml_data<-cbind(xml_data,intermediate_xml)
  
}

xml_data<-as.data.frame(xml_data)
colnames(xml_data)<-namevector
rownames(xml_data)<-NULL
head(xml_data)
