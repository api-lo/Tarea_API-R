# plumber.R
library(wooldridge)
#* @filter cors
cors <- function(res) {
  
  res$setHeader("Access-Control-Allow-Origin", "*") # Or whatever
  res$setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, USE, DELETE, HEAD, OPTIONS, PATCH")
  res$setHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-with, Origin, authorization")
  plumber::forward()
}



#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @get /plot
function() {
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  as.numeric(a) + as.numeric(b)
}

#* Return cluster
#* @param archivo1 The first number to add
#* @serializer png
#* @get  /cluster
function(archivo1) {
  data <- jsonlite::fromJSON(archivo1);
  data.table::as.data.table(archivo1); 
  dw <- data
  df <- scale(dw[,1:4])
  df<- as.data.frame(df)
  df$factor<-as.factor(dw$class)
  m.distancia <- get_dist(df, method = "euclidean")
  fviz_nbclust(df, kmeans, method = "wss")
}


#* Histogramas
#* @param x1
#* @param y1
#* @serializer png
#* @get  /histograma
function(x1,y1) {
  data("wage1")
  plot(x = wage1[,x1], y = wage1[,y1])
}
