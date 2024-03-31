const Payment = require('../models/payment');
const storage = require('../utils/cloud_storage');


module.exports = {

    async getAll(req, res){        
        Payment.getAll((err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un problema al listar las categorias',
                    error: err
                });
            }

            return res.status(201).json(data);
        });
    },

    getPaymentByUser(req, res){
        const id_user = req.params.id_user;
        Payment.getPaymentByUser(id_user, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con las medios de pago',
                    error: err
                });
            }

            return res.status(201).json(data);  
        })
    },

    async create(req, res){
        const payment = JSON.parse(req.body.payment);
        console.log('PAYMENT: ', payment); 
        const files = req.files;

        if(files.length > 0){
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if (url != undefined && url != null){
                payment.code_qr = url;
            }
        }

        Payment.create(payment, req.user.id, (err, data) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con la creacion de la categoria',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El QR se registro correctamente',
                data: `${data}`
            });          
        });
    },

    async updateWithImage(req, res){
        const payment = JSON.parse(req.body.payment); //CAPTURA LOS DATOS DE USUARIO

        const files = req.files;

        if(files.length > 0){
            const path = `image_${Date.now()}`;
            const url = await storage(files[0], path);

            if (url != undefined && url != null){
                payment.code_qr = url;
            }
        }
        Payment.update(payment, (err, id) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con la actualización de la categoría',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El código se actualizo correctamente',
                data: `${id}`
            });          
        });
    },

    async update(req, res){
        const payment = req.body; //CAPTURA LOS DATOS DE USUARIO

        Payment.update(payment, (err, id) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con la actualización del código',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El código se actualizo correctamente',
                data: `${id}`
            });          
        });
    },
    async delete(req, res){
        const id = req.params.id;
        Payment.delete(id, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al eliminar el código',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El código se elimino',
                data: `${id}`
            });    
        });
    },
}