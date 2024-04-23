const storeController = require('../controllers/storeController');
const passport = require('passport');
module.exports = (app, upload) =>{

    //GET -> OBTENER DATOS
    //POST -> ALMACENAR DATOS
    //PUT -> ACTUALIZAR DATOS
    //DELETE -> ELIMINAR DATOS

    app.post('/api/store/create',  storeController.register);
    app.post('/api/store/createWithImage', upload.array('image', 1), storeController.registerWithImage);
    app.post('/api/store/login', storeController.login);
    
    app.put('/api/store/update', passport.authenticate('jwt', {session: false}), upload.array('image', 1), storeController.updateWithImage);
    app.put('/api/store/updateWithoutImage', passport.authenticate('jwt', {session: false}), storeController.updateWithoutImage);

    app.get('/api/store/findDeliveryMen/:id_store', passport.authenticate('jwt', {session: false}), storeController.findDeliveryMen);
    app.get('/api/store/findByRol/:id_user/:id_rol', passport.authenticate('jwt', {session: false}), storeController.findByRol);

    app.get('/api/store/getAllStore', passport.authenticate('jwt', {session: false}), storeController.getAllStore);
}