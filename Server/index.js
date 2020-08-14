const express=require('express');
const router = require('./Ruta/rutas');
const app=express();


//middlewares
app.use(express.json());
app.use(express.urlencoded({extended:false}));

app.listen(process.env.PORT || 3000);
console.log('Server on port 3000');

//rutas
app.use(require('./Ruta/rutas.js'));