# get packages
library(httr)
require(rjson)
 
# set parameters (change to your ID and PW)
clientid <- "YourClientId"
apisecret <- "YourAPISecret"
 
# do authentication
req <- GET("https://api.quintly.com/v0.9/list-profiles", authenticate(clientid, apisecret, type = "basic"))
stop_for_status(req)
content(req)
 
# get the data (change profile ID, this can be found in your quintly account)
req <- GET("https://api.quintly.com/v0.9/qql?metric=fanCount&startTime=2016-09-04&endTime=2016-09-04&interval=daily&profileIds=12345", authenticate(clientid, apisecret, type = "basic"))
 
# convert the data from json to a data frame
json <- content(req)
data <- as.data.frame(json$data)
 
# some small processing steps
colnames(data) <- c("account","timestamp","fancount")
data$account[data$account == "12345"] <- "YourAccountName"
