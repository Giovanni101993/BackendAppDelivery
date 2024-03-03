const Order = require('../models/order');
const OrderHasProducts = require('../models/order_has_products');

module.exports = {

    findByStatus(req, res){
        const status = req.params.status;

        Order.findByStatus(status, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al listar la orden',
                    error: err
                });
            }

            for(const d of data){

                d.address = JSON.parse(d.address);
                d.client = JSON.parse(d.client);
                d.products = JSON.parse(d.products);
                d.delivery = JSON.parse(d.delivery);
            }


            return res.status(201).json(data);
        });
    },

    findByDeliveryAndStatus(req, res){
        const id_delivery = req.params.id_delivery;
        const status = req.params.status;

        Order.findByDeliveryAndStatus(id_delivery, status, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al listar la orden',
                    error: err
                });
            }

            for(const d of data){
                d.address = JSON.parse(d.address);
                d.client = JSON.parse(d.client);
                d.products = JSON.parse(d.products);
                d.delivery = JSON.parse(d.delivery);
            }


            return res.status(201).json(data);
        });
    },

    findByClientAndStatus(req, res){
        const id_client = req.params.id_client;
        const status = req.params.status;

        Order.findByClientAndStatus(id_client, status, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al listar la orden',
                    error: err
                });
            }

            for(const d of data){
                d.address = JSON.parse(d.address);
                d.client = JSON.parse(d.client);
                d.products = JSON.parse(d.products);
                d.delivery = JSON.parse(d.delivery);
            }


            return res.status(201).json(data);
        });
    },

    async create(req, res){
        const order = req.body;

        Order.create(order, async (err, id) =>{

            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al crear la orden',
                    error: err
                });
            }

            for(const product of order.products){
                await OrderHasProducts.create(id, product.id, product.quantity, (err, id_data) => {
                    if(err){
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error con la creacion de la orden',
                            error: err
                        });
                    }
                });
            }

            return res.status(201).json({
                success: true,
                message: 'La orden se creo correctamente',
                data: `${id}`
            });          
        });
    },

    updateToDispatched(req, res){
        const order = req.body;
        
        Order.updateToDispatched(order.id, order.id_delivery, (err, id_order)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'No se actualizo la orden',
                    error: err
                });
            }
            return res.status(201).json({
                success: true,
                message: 'La orden se actualizo',
                data: `${id_order}`
            });   
        });
    },
    
    updateToOnTheWay(req, res){
        const order = req.body;
        
        Order.updateToOnTheWay(order.id, order.id_delivery, (err, id_order)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'No se actualizo la orden',
                    error: err
                });
            }
            return res.status(201).json({
                success: true,
                message: 'La orden se actualizo',
                data: `${id_order}`
            });   
        });
    },

    updateToDelivered(req, res){
        const order = req.body;
        
        Order.updateToDelivered(order.id, order.id_delivery, (err, id_order)=>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'No se actualizo la orden',
                    error: err
                });
            }
            return res.status(201).json({
                success: true,
                message: 'La orden se actualizo',
                data: `${id_order}`
            });   
        });
    },
}