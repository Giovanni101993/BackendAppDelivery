const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: 'app_delivery'
});

db.connect(function(err){
    if(err) throw err;
    console.log('CONEXION EXITOSA');
});

module.exports = db;