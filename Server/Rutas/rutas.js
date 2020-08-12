
const {Router}=require('express');
const router = Router();

//Establece la conexion con la BD de PostgreSQL
const {Client}=require('pg');
const { response } = require('express');
const connectionData={
    user:'postgres',
    host:'localhost',
    database:'CELabs',
    password:'GabrielKarpov7585',
    port:5432,
};

const client =new Client(connectionData);
client.connect();

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD USUARIO Y RUTAS PARA CADA SOLICITUD
const {set_clienteUsuario}=require('../Usuarios/Usuario');
const {getUsuario}=require('../Usuarios/Usuario');
const {getUsuarioID}=require('../Usuarios/Usuario');
const {addUsuario}=require('../Usuarios/Usuario');
const {deleteUsuario}=require('../Usuarios/Usuario');
const {putUsuario}=require('../Usuarios/Usuario');
set_clienteUsuario(client);

router.get('/Usuario/get',getUsuario);
router.get('/Usuario/get/:idxtec',getUsuarioID);
router.post('/Usuario/post',addUsuario);
router.delete('/Usuario/delete/:idxtec',deleteUsuario);
router.put('/Usuario/put',putUsuario);


//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ADMINISTRADOR Y RUTAS PARA CADA SOLICITUD

const {set_clienteAdministrador}=require('../Usuarios/Administrador');
const {getAdministrador}=require('../Usuarios/Administrador');
const {addAdministrador}=require('../Usuarios/Administrador');
//const {deleteAdministrador}=require('../Usuarios/Administrador');
//const {putAdministrador}=require('../Usuarios/Administrador');
set_clienteAdministrador(client);

router.get('/Administrador/get',getAdministrador);
router.post('/Administrador/post',addAdministrador);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/Administrador/put',putAdministrador);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD DOCENTE Y RUTAS PARA CADA SOLICITUD

const {set_clienteDocente}=require('../Usuarios/Docente');
const {getDocente}=require('../Usuarios/Docente');
const {addDocente}=require('../Usuarios/Docente');
//const {deleteAdministrador}=require('../Usuarios/Administrador');
//const {putAdministrador}=require('../Usuarios/Administrador');
set_clienteDocente(client);

router.get('/Docente/get',getDocente);
router.post('/Docente/post',addDocente);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/Administrador/put',putAdministrador);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD EDA Y RUTAS PARA CADA SOLICITUD

const {set_clienteEDA}=require('../Usuarios/EDA');
const {getEDA}=require('../Usuarios/EDA');
const {addEDA}=require('../Usuarios/EDA');
//const {deleteAdministrador}=require('../Usuarios/Administrador');
//const {putAdministrador}=require('../Usuarios/Administrador');
set_clienteEDA(client);

router.get('/EDA/get',getEDA);
router.post('/EDA/post',addEDA);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/Administrador/put',putAdministrador);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD OPERADOR Y RUTAS PARA CADA SOLICITUD

const {set_clienteOperador}=require('../Usuarios/Operador');
const {getOperador}=require('../Usuarios/Operador');
const {addOperador}=require('../Usuarios/Operador');
//const {deleteAdministrador}=require('../Usuarios/Administrador');
//const {putAdministrador}=require('../Usuarios/Administrador');
set_clienteOperador(client);

router.get('/Operador/get',getOperador);
router.post('/Operador/post',addOperador);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/Administrador/put',putAdministrador);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD PA Y RUTAS PARA CADA SOLICITUD

const {set_clientePA}=require('../Usuarios/PA');
const {getPA}=require('../Usuarios/PA');
const {addPA}=require('../Usuarios/PA');
//const {deleteAdministrador}=require('../Usuarios/Administrador');
//const {putAdministrador}=require('../Usuarios/Administrador');
set_clientePA(client);

router.get('/PA/get',getPA);
router.post('/PA/post',addPA);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/Administrador/put',putAdministrador);


module.exports=router;