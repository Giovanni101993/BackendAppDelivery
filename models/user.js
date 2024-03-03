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

User.findDeliveryMen = (result) => {
    const sql= `
        SELECT
        U.id,
        U.email,
        U.name,
        U.lastname,
        U.image,
        U.phone
    FROM
        users as U
    INNER JOIN
        user_has_roles as UHR
    ON
        UHR.id_user = U.id
    INNER JOIN 
        roles as R
    ON
        R.id = UHR.id_rol
    WHERE
        R.id = 2
    `;
    db.query(
        sql,
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
                phone,
                image,
                password,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query
    (
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            //user.password,
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

User.update = async (user, result)  => {

    const hash = await bcrypt.hash(user.password, 10);

    const sql = `
    UPDATE
        users
    SET
        name = ?,
        lastname = ?,
        phone = ?,
        password = ?,
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
            //user.password,
            hash,
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

    const hash = await bcrypt.hash(user.password, 10);

    const sql = `
    UPDATE
        users
    SET
        name = ?,
        lastname = ?,
        phone = ?,
        password = ?,
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
            hash,
            //user.password,
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

module.exports = User;