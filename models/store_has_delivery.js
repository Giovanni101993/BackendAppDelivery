const db = require('../config/config');
const StoreHasDelivery = {};

StoreHasDelivery.create = (id_store, id_delivery, result) => {
    const sql = `
        INSERT INTO 
            store_has_delivery(
                id_store,
                id_delivery,
                created_at
            )
        VALUES(?, ?, ?)
    `;

    db.query(
        sql,
        [
            id_store,
            id_delivery,
            new Date()
        ],
        (err, res) => {
            if(err){
                console.log('Error', err);
                result(err, null);
            }
            else{
                console.log('Id del admin con productos', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}


module.exports = StoreHasDelivery;