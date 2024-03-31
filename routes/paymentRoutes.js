const passport = require('passport');
const paymentController = require('../controllers/paymentController');

module.exports = (app, upload) => {
    app.get('/api/payment/getAll', passport.authenticate('jwt', {session: false}), paymentController.getAll);
    app.get('/api/payment/getPaymentByUser/:id_user', passport.authenticate('jwt', {session: false}), paymentController.getPaymentByUser);
    app.post('/api/payment/create', passport.authenticate('jwt', {session: false}), upload.array('image', 1), paymentController.create);
    app.put('/api/payment/updateWithImage', passport.authenticate('jwt', {session: false}), upload.array('image', 1), paymentController.updateWithImage);
    app.put('/api/payment/update', passport.authenticate('jwt', {session: false}), paymentController.update);
    app.delete('/api/payment/delete/:id', passport.authenticate('jwt', {session: false}), paymentController.delete);
}