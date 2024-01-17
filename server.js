const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const passport = require('passport');

//IMPORTAR RUTAS
const usersRoutes = require('./routes/usersRoutes');

const port = process.env.PORT || 3000;

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

//LLAMADO DE LAS RUTAS
usersRoutes(app);

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