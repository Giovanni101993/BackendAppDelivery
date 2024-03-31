const Product = require('../models/product');
const storage = require('../utils/cloud_storage');
const asyncForEach = require('../utils/async_foreach');

module.exports = {

    findByStore(req, res){
        const id_user = req.params.id_user;

        Product.findByStore(id_user, (err, data) =>{
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

    findByCategoryAndUser(req, res){
        const id_user = req.params.id_user;
        const id_category = req.params.id_category;

        Product.findByCategoryAndUser(id_user, id_category, (err, data) =>{
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

    create(req, res) {
        console.log(req.body);
        const product = JSON.parse(req.body.product); 
        const files = req.files;
        let inserts = 0;
    
        if (files.length === 0) {
            return res.status(501).json({
                success: false,
                message: 'Error con el registro del producto no tiene imagenes',
            });
        } else {
            Product.create(product, req.user.id, async (err, id_product,) => {
                if (err) {
                    return res.status(501).json({
                        success: false,
                        message: 'Hubo un error con el registro del producto',
                        error: err
                    });
                }
    
                /*AdminHasProducts.create(id_product, req.user.id, (err, data) => {
                    if (err) {
                        return res.status(501).json({
                            success: false,
                            message: 'Hubo un error con el registro del rol de usuario',
                            error: err
                        });
                    }*/

                    product.id = id_product;
                    const start = async () => {
                        await asyncForEach(files, async (file) => {
                            const path = `image_${Date.now()}`;
                            const url = await storage(file, path);
    
                            if (url != undefined && url != null) {
                                if (inserts == 0) {
                                    product.image1 = url;
                                } else if (inserts == 1) {
                                    product.image2 = url;
                                } else if (inserts == 2) {
                                    product.image3 = url;
                                }
                            }
    
                            Product.update(product, (err, data) => {
                                if (err) {
                                    return res.status(501).json({
                                        success: false,
                                        message: 'Hubo un error con el registro del producto',
                                        error: err
                                    });
                                }
                                inserts += 1;
                                if (inserts == files.length) {
                                    // Aquí es donde debes enviar la respuesta una vez que todas las actualizaciones se completen
                                    return res.status(201).json({
                                        success: true,
                                        message: 'El registro del producto se realizo correctamente',
                                        data: `${data}`
                                    });
                                }
                            });
                        });
                    }
                    start();
                });
            //});
        }
    },
    
    update(req, res){
        const product = req.body;
        Product.update(product, (err, data) => {
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error',
                    error: err
                });
            }
            return res.status(201).json({
                success: true,
                message: 'El producto se actualizo',
                data: data
            });
        });
    },

    updateWithImage(req, res){
        const product = JSON.parse(req.body.product); //CAPTURA LOS DATOS DE USUARIO

        const files = req.files;

        let inserts = 0;

        if(files.length === 0){
            return res.status(501).json({
                success: false,
                message: 'Error',
            });
        }
        else{
            Product.update(product, (err, id_product) =>{

                if(err){
                    return res.status(501).json({
                        success: false,
                        message: 'Hubo un error con la actualización del producto',
                        error: err
                    });
                }
                
                product.id = id_product;
                const start = async () => {
                    await asyncForEach(files, async (file) =>{
                        const path = `image_${Date.now()}`;
                        const url = await storage(file, path);
            
                        if (url != undefined && url != null){
                            if(inserts == 0){
                                product.image1 = url;
                            }
                            else if (inserts == 1){
                                product.image2 = url;
                            }
                            else if (inserts == 2){
                                product.image3 = url;
                            }
                        }

                        await Product.update(product, (err, data) => {
                            if (err){
                                return res.status(501).json({
                                    success: false,
                                    message: 'Hubo un error con la actualización del producto',
                                    error: err
                                });
                            }
                            inserts += 1;
                            if (inserts == files.length){
                                return res.status(201).json({
                                    success: true,
                                    message: 'El producto ha sido actualizado',
                                    data:data
                                });
                            }
                        });
                    });
                }
                start();
            });
        }
    },

    delete(req, res){
        const id = req.params.id;

        Product.delete(id, (err, id) =>{
            if(err){
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error al eliminar el producto',
                    error: err
                });
            }
            return res.status(201).json({
                success: true,
                message: 'El producto se elimino',
                data: `${id}`
            });
        });
    },

}