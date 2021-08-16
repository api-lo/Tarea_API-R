install.packages("plumber")

require(plumber);
require(rjson);
require(wooldridge)

path <- "C:\\Users\\USUARIO\\OneDrive\\Escritorio\\tareaR\\API-R\\"

services <- plumb(gsub(" " ,"", paste(path, 'API.R')))
services$run(port=8083)

