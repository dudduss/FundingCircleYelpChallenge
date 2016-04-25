var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');

var business = require('./routes');
var app = express();


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', function (req, res) {
  res.send('Hello World!');
});


app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

app.use('/api/business', business);

// port   = parseInt(process.env.PORT, 10) || 8080;

// app.configure(function(){
//   app.use(express.bodyParser());
//   app.use(app.router);
// });

// app.listen(port);



module.exports = app;