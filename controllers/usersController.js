const User = require('../models/user');
const Rol = require('../models/rol');
const StoreHasDelivery = require('../models/store_has_delivery.js');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const storage = require('../utils/cloud_storage');

module.exports = {
    
    findDeliveryMen(req, res){
        const id_store = req.params.id_store; 
        User.findDeliveryMen(id_store, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }
            return res.status(201).json(data);
        });
    },

    login(req, res){

        const email = req.body.email;
        const password = req.body.password;
        
        User.findByEmail(email, async (err, myUser) =>{

            console.log('ERROR', err);
            console.log('USUARIO', myUser);

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            if(!myUser){
                return res.status(401).json({//EL CLIENTE NO ESTA AUTORIZADO PARA HACER ESTA PETICION
                    success: false,
                    message: 'El email no fue encontrado'
                });
            }

            const isPasswordValid = await bcrypt.compare(password, myUser.password);  
            
            if (isPasswordValid){
                const token = jwt.sign({id: myUser.id, email: myUser.email}, keys.secretOrKey,{});

                const data = {
                    id: `${myUser.id}`,
                    name: myUser.name,
                    lastname: myUser.lastname,
                    email: myUser.email,
                    phone: myUser.phone,
                    image: myUser.image,
                    session_token: `JWT ${token}`,
                    roles: JSON.parse(myUser.roles)
                }

                return res.status(201).json({
                    success: true,
                    message: 'El usuario fue autenticado',
                    data: data 
                });
            }
            else{
                return res.status(401).json({//EL CLIENTE NO ESTA AUTORIZADO PARA HACER ESTA PETICION
                    success: false,
                    message: 'El password es incorrecto'
                });
            }
        });
    },

    register(req, res){
        const user = req.body; //CAPTURA LOS DATOS DE USUARIO
        User.create(user, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El registro se realizo correctamente',
                data: data //ES EL ID DEL NUEVO USUARIO
            });
        });
    },

    async registerWithImage(req, res){
        const user = JSON.parse(req.body.user); //CAPTURA LOS DATOS DE USUARIO

        const files = req.files;

        if(files.length > 0){
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if (url != undefined && url != null){
                user.image = url;
            }
        }

        User.create(user, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            user.id = `${data}`;
            const token = jwt.sign({id: user.id, email: user.email}, keys.secretOrKey,{});
            user.session_token = `JWT ${token}`;

            if (user.id_store) {
                StoreHasDelivery.create(user.id_store, user.id, (err, data) => {
                    if (err) {
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error al crear la relación en store_has_delivery',
                            error: err
                        });
                    } else {
                        console.log('Relación creada en store_has_delivery');
                    }
                });
            }

            if (user.name_store !== '') {
                
                Rol.create(user.id, 2, (err, data) => {
                    if(err){
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error con el registro del rol de usuario',
                            error: err
                        });
                    }
                    else{
                        return res.status(201).json({
                            success: true,
                            message: 'El registro se realizo correctamente',
                            data:user
                        });
                    }
                });
            }
            else if (user.id_store !== '') {
                Rol.create(user.id, 4, (err, data) => {
                    if(err){
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error con el registro del rol de usuario',
                            error: err
                        });
                    }
                    else{
                        return res.status(201).json({
                            success: true,
                            message: 'El registro se realizo correctamente',
                            data:user
                        });
                    }
                });
            }
            else{   
                Rol.create(user.id, 3, (err, data) => {
                    if(err){
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error con el registro del rol de usuario',
                            error: err
                        });
                    }
                    else{
                        return res.status(201).json({
                            success: true,
                            message: 'El registro se realizo correctamente',
                            data:user
                        });
                    }
                });
            }
        });  
    },

    async updateWithImage(req, res){

        //user.id = id_user;
        const user = JSON.parse(req.body.user); //CAPTURA LOS DATOS DE USUARIO

        const files = req.files;

        if(files.length > 0){
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if (url != undefined && url != null){
                user.image = url;
            }
        }

        User.update(user, (err, data) =>{

            if(err){
                return res.status(501).json({
                 success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            else{
                return res.status(201).json({
                    success: true,
                    message: 'El usuario se actualizo correctamente',
                    data:user
                });
            }
        });
    },

    async updateWithoutImage(req, res){
        const user = req.body; //CAPTURA LOS DATOS DE USUARIO

        User.updateWithoutImage(user, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            else{
                return res.status(201).json({
                    success: true,
                    message: 'El usuario se actualizo correctamente',
                    data:user
                });
            }
        });
    },

    findByRol(req, res){
        const id_user = req.params.id_user;
        const id_rol = req.params.id_rol;

        Rol.findByRol(id_user, id_rol, (err, data) =>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error',
                    error: err
                });
            }
            return res.status(201).json(data);
        });
    },

    async getAllStore(req, res){        
        User.getAllStore((err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un problema al listar las tiendas',
                    error: err
                });
            }

            return res.status(201).json(data);
        });
    },

    async updateNotificationToken(req, res){
        const id = req.body.id;
        const token = req.body.token;
        console.log('ID ', id);
        console.log('TOKEN ', token);
        User.updateNotificationToken(id, token, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            else{
                return res.status(201).json({
                    success: true,
                    message: 'El token se actualizo correctamente',
                    data:id
                });
            }
        });
    },

}