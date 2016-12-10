var mysql = require('mysql');

var conn = mysql.createPool({
	connectionLimit : 10,
	multipleStatements : true,
	host : 'localhost',
	user : 'uporabnik',
	password : 'uporabnik',
	database : 'jdemolay'
});

conn.getConnection(function(err){
	if(err) throw err;
});

module.exports = conn;