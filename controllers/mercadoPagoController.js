const mercadopago = require('mercadopago');
const Order = require('../models/order');
const OrderHasProducts = require('../models/order_has_products');

const token = 'TEST-7299991881943845-042021-bbdf084b847c36b190cbf5a02c7223dc-357970647';
mercadopago.configure({
    sandbox: true,
    access_token: token
});

module.exports = {
    async createPayment(req, res) {
        try {
            let payment = req.body;

            console.log('PAYMENT:', payment);

            const payment_data = {
                token: payment.token,
                issuer_id: payment.issuer_id,
                payment_method_id: payment.payment_method_id,
                transaction_amount: payment.transaction_amount,
                installments: parseInt(payment.installments),
                payer: {
                    email: payment.payer.email,
                    identification: {
                        type: payment.payer.identification.type,
                        number: payment.payer.identification.number
                    }
                }
            };

            const data = await mercadopago.payment.create(payment_data);

            console.log('Los datos del cliente son correctos', data.response);

            const order = payment.order;

            Order.create(order, async (err, id) => {
                if (err) {
                    console.log('Hubo un error al momento de crear la orden:', err);
                    return res.status(501).json({
                        success: false,
                        message: 'Hubo un error al momento de crear la orden',
                        error: err
                    });
                }

                for (const product of order.products) {
                    await OrderHasProducts.create(id, product.id, product.quantity, (err, id_data) => {
                        if (err) {
                            console.log('Hubo un error con la creacion de los productos en la orden:', err);
                            return res.status(501).json({
                                success: false,
                                message: 'Hubo un error con la creacion de los productos en la orden',
                                error: err
                            });
                        }
                    });
                }

                // Envía una respuesta de éxito al cliente
                return res.status(201).json({
                    success: true,
                    message: 'La orden se ha creado correctamente',
                    data: data.response
                });
            });
        } catch (error) {
            console.log('Error:', error);
            // Envía una respuesta de error al cliente
            return res.status(501).json({
                success: false,
                message: 'Hubo un error al procesar la solicitud',
                error: error.message
            });
        }
    }
}