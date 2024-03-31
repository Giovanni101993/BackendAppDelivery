const db = require('../config/config');

const Rol = {};

Rol.create = (id_user, id_rol, result) => {
    const sql = `
    INSERT INTO
        user_has_roles(
            id_user,
            id_rol,
            created_at,
            updated_at
        )
    VALUES(?, ?, ?, ?)
    `;

    db.query(
        sql,
        [id_user, id_rol, new Date(), new Date()],
        (err, res) =>{
            if(err){
                console.log('Error: ', err);
                result(err, null);
            }
            else{
                console.log('Usuario obtenido: ', res.insertId);
                result(null, res.insertId);
            }
        }
    )
}

Rol.findByRol = (id_user, id_rol, result) => {
    const sql = `
        SELECT
            U.name,
            CONVERT(UHR.id_user, char) AS id_user,
            CONVERT(UHR.id_rol, char) AS id_rol
        FROM
            user_has_roles AS UHR
        INNER JOIN
            roles AS r
        ON
            r.id = UHR.id_rol
        INNER JOIN
            users as U
        ON
            U.id = UHR.id_user
        WHERE
            UHR.id_user = ?
        AND
            UHR.id_rol = ?
    `;

    db.query(
        sql,
        [id_user, id_rol],
        (err, data) => {
            if(err){
                console.log('ERROR: err');
                result(err, null);
            }
            else{
                result(null, data);
            }
        }
    )
}

module.exports = Rol;