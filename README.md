# Accessing the quintly API from within R
quintly is an online social media analytics tool to help you track, benchmark and optimize your social media performance. You need to have a quintly business account in order to access the API but you can get a demo account via their webpage. For authentication they use Basic Auth via HTTPS. For the username you have to send your quintly client id and for the password your API secret (included in the demo account but you will need to ask the support).

The API let you access metrics from your own or a public social media account from Facebook, Instagram and other platforms. There are two ways of fetching data. Either by asking for predefined metrics, or by specifying a completely customized query by using QQL (Quintly Query Language).

I used the httr package to retrieve data from the quintly API and the rjson package to handle the incoming data which will be in json format. As you can see from the get command we were asking for the metric fanCount. You can find the whole list of predefined metrics on their API documentation website. All other parameters (startTime, endTime, interval, profileIds) are mandatory for every request. After getting the data via the API we can transform it from json to a data frame for further work.

