const productsController = require('../controllers/productsController');
const passport = require('passport');

module.exports = (app, upload) => {

    app.post('/api/products/create', passport.authenticate('jwt', {session: false}), upload.array('image', 3), productsController.create);
    app.get('/api/products/findByStore/:id_user', passport.authenticate('jwt', {session: false}), productsController.findByStore);
    app.get('/api/products/findByCategoryAndUser/:id_user/:id_category', passport.authenticate('jwt', {session: false}), productsController.findByCategoryAndUser);
    app.delete('/api/products/delete/:id', passport.authenticate('jwt', {session: false}), productsController.delete);
    app.put('/api/products/updateWithImage', passport.authenticate('jwt', {session: false}), upload.array('image', 3), productsController.updateWithImage);
    app.put('/api/products/update', passport.authenticate('jwt', {session: false}), productsController.update);

}