const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const passport = require('passport');
const multer = require('multer');
const io = require('socket.io')(server); 
const mercadopago = require('mercadopago');


const token = 'TEST-7299991881943845-042021-bbdf084b847c36b190cbf5a02c7223dc-357970647';
mercadopago.configure({
    sandbox: true,
    access_token: token
});

//IMPORTAR RUTAS
const usersRoutes = require('./routes/usersRoutes');
const storeRoutes = require('./routes/storeRoutes');
const categoriesRoutes = require('./routes/categoryRoutes');
const productRoutes = require('./routes/productRoutes');
const addressRoutes = require('./routes/addressRoutes');
const orderRoutes = require('./routes/orderRoutes');
const mercadoPagoRoutes = require('./routes/mercadoPagoRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const stripeRoutes = require('./routes/stripeRoutes');

const ordersSocket = require('./sockets/ordersSocket');

const port = process.env.PORT || 3000;
//const port = process.env.PORT || 3306;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
app.use(passport.initialize());
app.use(passport.session());

require('./config/passport')(passport);

app.disable('x-powered-by');

app.set('port', port);

ordersSocket(io);

const upload = multer({
    storage: multer.memoryStorage()
});

//LLAMADO DE LAS RUTAS
usersRoutes(app, upload);
storeRoutes(app, upload);
categoriesRoutes(app, upload);
productRoutes(app, upload);
addressRoutes(app);
orderRoutes(app);
mercadoPagoRoutes(app);
paymentRoutes(app, upload);
stripeRoutes(app);

/*server.listen(3306, '185.27.134.135' || '185.27.134.135', function(){
    console.log('Aplicacion de nodeJS ' + port + ' Iniciada...')
});*/

server.listen(3000, '192.168.20.25' || 'localhost', function(){
    console.log('Aplicacion de nodeJS ' + port + ' Iniciada...')
});

app.get('/', (req, res)=>{
    res.send('Ruta raiz del backend');
});

app.get('/test', (req, res)=>{
    res.send('Esta ruta es un test');
});

//ERROR HANDLER
app.use((err, req, res, next) =>{
    console.log(err);
    res.status(err.status || 500).send(err.stack); 
});

//200  ES UNA RESPUESTA EXITOSA
//404 ES UNA RESPUESTA A QUE LA URL NO EXISTE
//500 ES UN ERROR INTERNO DEL SERVIDOR