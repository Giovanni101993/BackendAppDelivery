const db = require('../config/config');
const Payment = {};

Payment.getAll = (result) => {
    const sql = `
    SELECT
        id,
        code_qr,
        bank,
        phone,
        id_user
    FROM
        payment
    `;
    db.query(
        sql,
        (err, data) => {
            if(err){
                console.log('Error', err);
                result(err, null);
            }
            else{
                console.log('Id del QR', data);
                result(null, data);
            }
        }
    )
}

Payment.getPaymentByUser = (id_user, result) => {

    const sql =
    `
    SELECT
        P.*
    FROM
        payment AS P
    INNER JOIN
        users AS U
    ON 
        U.id = P.id_user
    WHERE
        P.id_user = ?
    `;

    db.query(
        sql,
        [id_user],
        (err, user) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Codigo obtenido: ', user);
                result(null, user);
            }
        }
    )
}

Payment.create = async (payment, id_user, result) => {
    const sql = `
        INSERT INTO
            payment(
                code_qr,
                bank,
                phone,
                id_user,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ?, ?)
    `;

    db.query
    (
        sql,
        [
            payment.code_qr,
            payment.bank,
            payment.phone,
            id_user,
            new Date(),
            new Date() 
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Id del medio de pago: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}

Payment.update = (payment, result) =>{
    const sql = `
        UPDATE
            payment
        SET
            code_qr = ?,
            bank = ?,
            phone = ?,
            updated_at = ? 
        WHERE
            id = ?
    `;

    db.query(
        sql,
        [
            payment.code_qr,
            payment.bank,
            payment.phone,
            new Date(),
            payment.id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Id del código actualizado: ', payment.id);
                result(null, payment.id);
            }
        }
    )
}

Payment.delete = (id, result) => {
    const sql = `
    DELETE FROM
        payment
    WHERE
        id = ?
    `;
    db.query(
        sql,
        id,
        (err, res) => {
            if(err){
                console.log('Error: ', err);
                result(err, null)
            }
            else{
                console.log('Id del código eliminado: ', id);
                result(null, id);
            }
        }
    )
}


module.exports = Payment;