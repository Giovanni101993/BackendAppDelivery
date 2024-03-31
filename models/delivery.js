const db = require('../config/config');
const bcrypt = require('bcryptjs');
const Delivery = {};

Delivery.registerDelivery = async (delivery, result) => {

    const hash = await bcrypt.hash(delivery.password, 10);
    const sql = `
        INSERT INTO
            delivery(
                email,
                name,
                lastname,
                phone,
                image,
                password,
                id_store,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query
    (
        sql,
        [
            delivery.email,
            delivery.name,
            delivery.lastname,
            delivery.phone,
            delivery.image,
            hash,
            delivery.id_store,
            new Date(),
            new Date() 
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Id del nuevo usuario: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}


module.exports = Delivery;
