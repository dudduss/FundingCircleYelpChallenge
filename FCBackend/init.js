var Sequelize = require('sequelize');
var con_string = process.env.DATABASE_URL || 'postgres://postgres:123@localhost:5432/fc';
var sequelize = new Sequelize(con_string,{
    logging: false
});

sequelize.sync();

module.exports.Sequelize = Sequelize;
module.exports.sequelize = sequelize;