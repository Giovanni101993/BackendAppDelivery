const Delivery = require('../models/delivery');
const Rol = require('../models/rol');
const StoreHasDelivery = require('../models/store_has_delivery')
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const storage = require('../utils/cloud_storage');

module.exports = {
    
    createDelivery(req, res){
        const delivery = req.body; //CAPTURA LOS DATOS DE USUARIO

        Delivery.registerDelivery(delivery,(err, data) =>{

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

    async createDeliveryWithImage(req, res){
        console.log('Delivery: ', req.body.user);
        const delivery = JSON.parse(req.body.user); //CAPTURA LOS DATOS DE USUARIO
        //const id_store = req.params.id_store;
        const files = req.files;

        if(files.length > 0){
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if (url != undefined && url != null){
                delivery.image = url;
            }
        }

        Delivery.registerDelivery(delivery, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                });
            }

            delivery.id = `${data}`;
            const token = jwt.sign({id: delivery.id, email: delivery.email}, keys.secretOrKey,{});
            delivery.session_token = `JWT ${token}`;
        });  
        return res.status(201).json({
            success: true,
            message: 'El registro se realizo correctamente',
            data: delivery
        });
    },
}