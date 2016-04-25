var express = require('express');
var router = express.Router();

var business_model = require("./models");
var BusinessModel =  business_model.BusinessModel;

router.post('/addBusiness', function(req, res, next){

	 console.log("in routes");
  console.log(req.body);
    var business = req.body;
    BusinessModel.createBusiness(res, business);
});

module.exports = router;