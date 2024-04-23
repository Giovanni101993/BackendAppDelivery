const usersController = require('../controllers/usersController');
const passport = require('passport');
module.exports = (app, upload) =>{

    //GET -> OBTENER DATOS
    //POST -> ALMACENAR DATOS
    //PUT -> ACTUALIZAR DATOS
    //DELETE -> ELIMINAR DATOS

    app.post('/api/users/create',  usersController.register);
    app.post('/api/users/createWithImage', upload.array('image', 1), usersController.registerWithImage);
    app.post('/api/users/login', usersController.login);
    
    app.put('/api/users/update', passport.authenticate('jwt', {session: false}), upload.array('image', 1), usersController.updateWithImage);
    app.put('/api/users/updateWithoutImage', passport.authenticate('jwt', {session: false}),usersController.updateWithoutImage);

    app.get('/api/users/findDeliveryMen/:id_store', passport.authenticate('jwt', {session: false}),usersController.findDeliveryMen);
    app.get('/api/users/findByRol/:id_user/:id_rol', passport.authenticate('jwt', {session: false}),usersController.findByRol);

    app.get('/api/users/getAllStore', passport.authenticate('jwt', {session: false}),usersController.getAllStore);
    app.put('/api/users/updateNotificationToken', passport.authenticate('jwt', {session: false}),usersController.updateNotificationToken);

    
}