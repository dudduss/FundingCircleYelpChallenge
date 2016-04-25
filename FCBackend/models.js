var sequelize_modules = require("./init");
var sequelize = sequelize_modules.sequelize;
var Sequelize = sequelize_modules.Sequelize;


var Business = sequelize.define("Businesses",{
	yelpID : {
       allowNull: false,
       primaryKey: true,
       type: Sequelize.STRING
    },
	name: {type: Sequelize.STRING},
	address: {type: Sequelize.STRING},
	primaryCategory: {type: Sequelize.STRING},
	secondaryCategory: {type: Sequelize.STRING},
	tertiaryCategory: {type: Sequelize.STRING},
	description: {type: Sequelize.STRING},
	lat: {type: Sequelize.FLOAT},
	lon: {type: Sequelize.FLOAT},
	imageURL: {type: Sequelize.STRING}
});


BusinessModel = {

createBusiness: function(res, fields){
  console.log("hello");
  console.log(fields);
  Business.create(fields).then(function(result){
      res.json({
          status:1, business: result
      })
  }).catch(function(err){
      res.json({status: -1, errors:['Unable to add new business',err]});
   });
}


};





Business.sync();

module.exports.Business = Business;
module.exports.BusinessModel = BusinessModel;
