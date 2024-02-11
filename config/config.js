const mysql = require('mysql');

/*const db = mysql.createConnection({
    host: 'sql309.infinityfree.com',
    user: 'if0_35944113',
    password: 'rkyhtPeHqn',
    database: 'if0_35944113_appDelivery'
});*/

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'app_delivery'
});

db.connect(function(err){
    if(err) throw err;
    console.log('CONEXION EXITOSA');
});

module.exports = db;