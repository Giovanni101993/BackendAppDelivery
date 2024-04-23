const Stripe = require('stripe');

const stripe = new Stripe('sk_test_51P8Esp01llpGp6R5lPBeFYchb74dQsNAqoL3S88CnoYYSNcuxYIdvdXfJKmSdofovNaJuFa6dlcD2E3ix2OwaHLt00M96pfTQx');

module.exports ={
    async createPayment(req, res){
        const data = req.body;

        try {
            const payment = await stripe.paymentIntents.create({
                amount: data.amount,
                currency: 'USD',
                description: 'domii APP',
                payment_method: data.id,
                confirm: true,
                return_url: 'https://dashboard.stripe.com/test/payments'
            });
            console.log('PAYMENT' + JSON.stringify(payment, null, 3));
            return res.status(200).json({
                success: true,
                message: 'Transacción exitosa'
            });
        } catch (error) {
            return res.status(501).json({
                success: false,
                message: 'Hubo un error en la transacción',
                error: error
            });
        }
    }
}