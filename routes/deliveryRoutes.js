const deliveryController = require('../controllers/deliveryController');
const passport = require('passport');
module.exports = (app, upload) =>{

    //GET -> OBTENER DATOS
    //POST -> ALMACENAR DATOS
    //PUT -> ACTUALIZAR DATOS
    //DELETE -> ELIMINAR DATOS

    app.post('/api/delivery/createDelivery',  deliveryController.createDelivery);
    app.post('/api/delivery/createDeliveryWithImage', upload.array('image', 1), deliveryController.createDeliveryWithImage);
}