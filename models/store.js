const db = require('../config/config');
const bcrypt = require('bcryptjs');
const Store = {};

Store.findById = (id, result) => {

    const sql =
    `
    SELECT
        S.id,
        S.email,
        S.name,
        S.lastname,
        S.name_store,
        S.business_type,
        S.address,
        S.departmento,
        S.ciudad,
        S.image,
        S.phone,
        S.password,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', CONVERT(R.id, char),
            'name', R.name,
            'image', R.image,
            'route', R.route
        )
    )AS roles
    FROM
        store AS S
    INNER JOIN
        user_has_roles AS UHR
    ON
        UHR.id_user = U.id
    INNER JOIN
        roles as R
    On UHR.id_rol = R.id
    WHERE
        U.id= ?
    GROUP BY
        U.id
    `;

    db.query(
        sql,
        [id],
        (err, store) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario obtenido: ', store[0]);
                result(null, store[0]);
            }
        }
    )
}

Store.findDeliveryMen = (id_store,result) => {
    const sql= `
        SELECT
    U.id AS delivery_id,
    U.email AS delivery_email,
    U.name AS delivery_name,
    U.lastname AS delivery_lastname,
    U.image AS delivery_image,
    U.phone AS delivery_phone,
    U.name_store AS store_name
FROM
    users AS U
INNER JOIN
    user_has_roles AS UHR
ON
    UHR.id_user = U.id
INNER JOIN
    roles AS R
ON
    R.id = UHR.id_rol
INNER JOIN
    store_has_delivery AS SHD
ON
    U.id = SHD.id_delivery
WHERE
    R.name = 'REPARTIDOR'
    AND SHD.id_store = ?;
    `;
    db.query(
        sql, id_store,
        (err, data) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                result(null, data);
            }
        }
    )
}

Store.findByEmail = (email, result) => {

    const sql =
    `
    SELECT
        S.id,
        S.email,
        S.name,
        S.lastname,
        S.name_store,
        S.business_type,
        S.address,
        S.departamento,
        S.ciudad,
        S.image,
        S.phone,
        S.password
    FROM
        store AS S
    WHERE
        S.email = ?
    GROUP BY
        S.id
    `;

    db.query(
        sql,
        [email],
        (err, store) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario obtenido: ', store[0]);
                result(null, store[0]);
            }
        }
    )
}

Store.create = async (store, result) => {
    const hash = await bcrypt.hash(store.password, 10);
    const sql = `
        INSERT INTO
            store(
                email,
                name,
                lastname,
                name_store,
                address,
                business_type,
                departamento,
                ciudad,
                phone,
                image,
                password,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query
    (
        sql,
        [
            store.email,
            store.name,
            store.lastname,
            store.name_store,
            store.address,
            store.business_type,
            store.departamento,
            store.ciudad,
            store.phone,
            store.image,
            hash,
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

Store.update = async (store, result)  => {

    const sql = `
    UPDATE
        store
    SET
        name = ?,
        lastname = ?,
        phone = ?,
        image = ?,
        updated_at = ?
    WHERE
        id = ?
    `; 
db.query
    (
        sql,
        [
            store.name,
            store.lastname,
            store.phone,
            store.image,
            new Date(),
            store.id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', res.insertId);
                result(null, store.id);
            }
        }
    )
}

Store.updateWithoutImage = async (store, result)  => {
    const sql = `
    UPDATE
        store
    SET
        name = ?,
        lastname = ?,
        phone = ?,
        updated_at = ?
    WHERE
        id = ?
    `; 
db.query
    (
        sql,
        [
            store.name,
            store.lastname,
            store.phone,
            new Date(),
            store.id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', res.insertId);
                result(null, store.id);
            }
        }
    )
}

Store.getAllStore = (resultado) => {
    const sql = `
    SELECT
        S.id,
        S.email,
        S.name,
        S.lastname,
        S.name_store,
        S.business_type,
        S.address,
        S.departmento,
        S.ciudad,
        S.image,
        S.phone
    FROM
        store AS U
    INNER JOIN
        user_has_roles AS UHR
    ON
        UHR.id_user = U.id
    WHERE
        UHR.id_rol = 2
    ORDER BY 
        U.name_store
    `;
    db.query(
        sql,
        (err, data) => {
            if(err){
                console.log('Error', err);
                resultado(err, null);
            }
            else{
                console.log('Id de la tienda', data);
                resultado(null, data);
            }
        }
    )
}

module.exports = Store;
