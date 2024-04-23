const db = require('../config/config');
const bcrypt = require('bcryptjs');
const User = {};

User.findById = (id, result) => {

    const sql =
    `
    SELECT
    U.id,
    U.email,
    U.name,
    U.lastname,
    U.image,
    U.phone,
    U.password,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', CONVERT(R.id, char),
            'name', R.name,
            'image', R.image,
            'route', R.route
        )
    )AS roles
    FROM
        users AS U
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
        (err, user) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario obtenido: ', user[0]);
                result(null, user[0]);
            }
        }
    )
}

User.findDeliveryMen = (id_store, result) => {
    const sql= `
   
    SELECT
    CONVERT(U.id, char) AS id,
    U.email,
    U.name,
    U.lastname,
    U.id_store,
    U.image,
    U.phone,
    U.notification_token
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
    SHD.id_delivery = U.id
WHERE
    U.id_store= 1
    AND
    R.id = 4;
    `;
    db.query(
        sql, [id_store], 
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

User.findByEmail = (email, result) => {

    const sql =
    `
    SELECT
    U.id,
    U.email,
    U.name,
    U.lastname,
    U.image,
    U.phone,
    U.password,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', CONVERT(R.id, char),
            'name', R.name,
            'image', R.image,
            'route', R.route
        )
    )AS roles
    FROM
        users AS U
    INNER JOIN
        user_has_roles AS UHR
    ON
        UHR.id_user = U.id
    INNER JOIN
        roles as R
    On UHR.id_rol = R.id
    WHERE
        email = ?
    GROUP BY
        U.id
    `;

    db.query(
        sql,
        [email],
        (err, user) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario obtenido: ', user[0]);
                result(null, user[0]);
            }
        }
    )
}

User.create = async (user, result) => {
    const hash = await bcrypt.hash(user.password, 10);
    const sql = `
        INSERT INTO
            users(
                email,
                name,
                lastname,
                name_store,
                address,
                business_type,
                phone,
                image,
                password,
                id_store,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query
    (
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.name_store,
            user.address,
            user.business_type,
            user.phone,
            user.image,
            hash,
            user.id_store,
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

User.update = async (user, result)  => {

    const sql = `
    UPDATE
        users
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
            user.name,
            user.lastname,
            user.phone,
            user.image,
            new Date(),
            user.id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', res.insertId);
                result(null, user.id);
            }
        }
    )
}

User.updateWithoutImage = async (user, result)  => {
    const sql = `
    UPDATE
        users
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
            user.name,
            user.lastname,
            user.phone,
            new Date(),
            user.id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', res.insertId);
                result(null, user.id);
            }
        }
    )
}

User.getAllStore = (resultado) => {
    const sql = `
    SELECT
        U.id,
        U.name_store,
        U.address,
        U.business_type,
        U.phone,
        U.image
    FROM
        users AS U
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

User.updateNotificationToken = (id, token, result) =>{
    const sql = `
    UPDATE
        users
    SET
        notification_token = ?,
        updated_at = ?
    WHERE
        id = ?
    `;

    db.query(
        sql,
        [
            token,
            new Date(),
            id
        ],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario actualizado: ', id);
                result(null, id);
            }
        }
    )
}

module.exports = User;
