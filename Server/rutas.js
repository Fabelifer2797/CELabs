const {Router}=require('express');
const router = Router();
/*
//Establece la conexion con la BD de CELabs
const {Client}=require('pg');
const { response } = require('express');
const connectionData={
    user:'postgres',
    host:'localhost',
    database:'CELabs',
    password:'GabrielKarpov7585',
    port:5432,
};
*/

//Establece la conexion con la BD de CELabs
const {Client}=require('pg');
const { response } = require('express');
const connectionData={
    user:'lexjemtnjjnxuq',
    host:'ec2-54-166-107-5.compute-1.amazonaws.com',
    database:'ddfi7i9iagdfo7',
    password:'06231dcc7f7378b8c62ed90e3cb3c5b36dfab5905e30bb26ce06f91ffb6c3e6b',
    port:5432,
    ssl: {
        rejectUnauthorized: false
      },
    timezone: 'UTC',
    dateStrings: [
        'DATE',
        'DATETIME',
        'TIME'
    ]
};

const client =new Client(connectionData);
client.connect();


//Establece la conexion con la BD del departamento de becas
const connectionData_Becas={
    user:'swcdshwhdxbowo',
    host:'ec2-184-73-249-9.compute-1.amazonaws.com',
    database:'dcv16cd03kmrr1',
    password:'5557d5165f140872853a4c4cd7a3130bc7a3162b67d957c3487c977da5879497',
    port:5432,
    ssl: {
        rejectUnauthorized: false
      },
    timezone: 'UTC',
    dateStrings: [
          'DATE',
          'DATETIME',
          'TIME'
      ]
};

const client_Becas=new Client(connectionData_Becas);
client_Becas.connect();


//Establece la conexion con la BD de XTEC
const connectionData_XTEC={
    user:'iyxfpwviqigtfx',
    host:'ec2-54-160-120-28.compute-1.amazonaws.com',
    database:'d5othpaids29u7',
    password:'a50f0697591b4b478bcf2a71bbb8118c3c487b9b62f85a4718df651ec12dec68',
    port:5432,
    ssl: {
        rejectUnauthorized: false
      },
    timezone: 'UTC',
    dateStrings: [
          'DATE',
          'DATETIME',
          'TIME'
      ]
};

const client_XTEC=new Client(connectionData_XTEC);
client_XTEC.connect();
/*
//Establece la conexion con la BD de XTEC
const connectionData_XTEC={
    user:'postgres',
    host:'localhost',
    database:'XTECBD',
    password:'GabrielKarpov7585',
    port:5432,
};

const client_XTEC=new Client(connectionData_XTEC);
client_XTEC.connect();


//Establece la conexion con la BD del departamento de becas
const connectionData_Becas={
    user:'postgres',
    host:'localhost',
    database:'DepartamentoBecas',
    password:'GabrielKarpov7585',
    port:5432,
};

const client_Becas=new Client(connectionData_Becas);
client_Becas.connect();
*/
//#############################################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD LoginXTEC Y RUTAS PARA CADA SOLICITUD

const {set_clienteLogXTEC,loginXTEC}=require('../Solicitudes/LoginXTEC');
set_clienteLogXTEC(client_XTEC);

router.post('/LoginXTEC',loginXTEC);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD LoginCELabs Y RUTAS PARA CADA SOLICITUD

const {set_clienteLogCELabs,loginCELabs}=require('../Solicitudes/LoginCELabs');
set_clienteLogCELabs(client);

router.post('/LoginCELabs',loginCELabs);


//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD RegistrarHoras Y RUTAS PARA CADA SOLICITUD

const {set_clienteBecas,regHoras}=require('../Solicitudes/RegistrarHoras');
set_clienteBecas(client_Becas);


//#############################################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ReporteAveria Y RUTAS PARA CADA SOLICITUD

const {set_clienteRepAv,getRepAv,addRepAv}=require('../Reportes/ReporteAveria');
set_clienteRepAv(client);

//router.get('/ReporteAveria/get',getRepAv);
router.post('/ReporteAveria/post',addRepAv);
//router.delete('/Administrador/delete/:idxtec',deleteAdministrador);
//router.put('/ReporteAveria/put',putRepAv);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD SeguimientoAveria Y RUTAS PARA CADA SOLICITUD

const {set_clienteSegAv,putSegAv}=require('../Seguimientos/SeguimientoAveria');
set_clienteSegAv(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ReporteInventario Y RUTAS PARA CADA SOLICITUD

const {set_clienteRepInv,getRepInv,addRepInv}=require('../Reportes/ReporteInventario');
set_clienteRepInv(client);

router.post('/ReporteInventario/post',addRepInv);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ReporteTiempoTrabajado Y RUTAS PARA CADA SOLICITUD

const {set_clienteRepTT,getRepTT,addRepTT}=require('../Reportes/ReporteTiempoTrabajado');
set_clienteRepTT(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD SolicitudCuenta Y RUTAS PARA CADA SOLICITUD

const {set_clienteSC,getSC,addSC,putSC}=require('../Solicitudes/SolicitudCuenta');
set_clienteSC(client);

//router.get('/SolicitudCuenta/get',getSC);
router.post('/SolicitudCuenta/post',addSC);
//router.put('/SolicitudCuenta/post',putSC);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD SolicitudTiempoTrabajado Y RUTAS PARA CADA SOLICITUD

const {set_clienteSTT,getSTT,putSTT}=require('../Solicitudes/SolicitudTiempoTrabajado');
set_clienteSTT(client);

//router.get('/SolicitudTiempoTrabajado/get/:_idUsuario',getSTT);
//router.put('/SolicitudTiempoTrabajado/put',putSTT);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD SolicitudPalmada Y RUTAS PARA CADA SOLICITUD

const {set_clienteSP,getSP,putSP}=require('../Solicitudes/SolicitudPalmada');
set_clienteSP(client);

//router.get('/SolicitudPalmada/get',getSP);
//router.post('/SolicitudPalmada/post',addSP);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD FormSatisfaccion Y RUTAS PARA CADA SOLICITUD

const {set_clienteFS,addFS}=require('../Solicitudes/FormSatisfaccion');
set_clienteFS(client);

router.post('/FormularioSatisfaccion/:_valor',addFS);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD DashboardAdministrador Y RUTAS PARA CADA SOLICITUD

const {set_clienteDashboard,getDashboardAdmin}=require('../Dashboards/DashboardAdministrador');
set_clienteDashboard(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD LABORATORIO Y RUTAS PARA CADA SOLICITUD

const {set_clienteLab,verLab,crearLab}=require('../Calendario/Laboratorio');
set_clienteLab(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD CURSO Y RUTAS PARA CADA SOLICITUD

const {set_clienteCurso,verCurso,crearCurso}=require('../Calendario/Curso');
set_clienteCurso(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ESTADOSOLICITUD Y RUTAS PARA CADA SOLICITUD

const {set_clienteEstadoSolicitud,verEstadoSol}=require('../Solicitudes/EstadosSolicitud');
set_clienteEstadoSolicitud(client);


//#############################################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD HORARIO Y RUTAS PARA CADA SOLICITUD

const {set_clienteHorario,getHorario,addHorario}=require('../Calendario/Horario');
set_clienteHorario(client);

router.get('/Horario/get',getHorario);
//router.post('/Horario/post',addHorario);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD CORREO Y RUTAS PARA CADA SOLICITUD

const {set_clienteCorreo,getCorreoUsuario,getCorreoSeguridad,RegistrarCorreoEnviado}=require('../Solicitudes/Correo');
set_clienteCorreo(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD PALMADA Y RUTAS PARA CADA SOLICITUD

const {set_clientePalmada,addPalmada,cancelarPalmada}=require('../Calendario/Reservas/Palmada');
set_clientePalmada(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ESTADOAVERIA Y RUTAS PARA CADA SOLICITUD

const {set_clienteEstAv,getEstAv,addEstAv}=require('../Reportes/EstadoAveria');
set_clienteEstAv(client);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD USUARIO Y RUTAS PARA CADA SOLICITUD
const {getHorasReservadasTR,getReservas,obtenerRol,deactivateUsuario,putUsuario,set_clienteUsuario}=require('../Usuarios/Usuario');

set_clienteUsuario(client);

router.get('/Usuario/ObtenerHorasReservadasTR',getHorasReservadasTR);
router.get('/Usuario/ObtenerRol/:_idUsuario',obtenerRol);
router.delete('/Usuario/deactivate/:_idUsuario',deactivateUsuario);
router.post('/Usuario/ObtenerReservas',getReservas);
router.put('/Usuario/put',putUsuario);


//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD OPERADOR Y RUTAS PARA CADA SOLICITUD

const {getOperador,addOperador,crearReservasOperador,cancelarReservasOperador,verTiempoTrabajado,set_clienteOperador}=require('../Usuarios/Operador');
set_clienteOperador(client);

router.get('/Operador/VerTT',verTiempoTrabajado);
router.get('/Operador/get',getOperador);
router.get('/Operador/getCorreoUsuario/:_idUsuario',getCorreoUsuario);
router.post('/Operador/CrearReservas',crearReservasOperador);
router.post('/Operador/CrearReporteAveria',addRepAv);
router.post('/Operador/CrearReporteInventario',addRepInv);
router.post('/Operador/CrearReporteTT',addRepTT);
router.post('/Operador/RegistrarCorreoEnviado',RegistrarCorreoEnviado);
router.post('/Operador/CrearPalmada',addPalmada);
router.delete('/Operador/CancelarReserva/:_idReserva',cancelarReservasOperador);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD EDA Y RUTAS PARA CADA SOLICITUD

const {getEDA,addEDA,set_clienteEDA}=require('../Usuarios/EDA');
set_clienteEDA(client);

router.get('/EDA/get',getEDA);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD PA Y RUTAS PARA CADA SOLICITUD

const {getPA,addPA,set_clientePA}=require('../Usuarios/PA');
set_clientePA(client);

router.get('/PA/get',getPA);
router.post('/PA/add',addPA);


//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD ADMINISTRADOR Y RUTAS PARA CADA SOLICITUD

const {getAdministrador,addAdministrador,set_clienteAdministrador}=require('../Usuarios/Administrador');
set_clienteAdministrador(client);

router.get('/Administrador/getAdministradores',getAdministrador);
router.get('/Administrador/getSolicitudCuenta/:_pagina',getSC);
router.get('/Administrador/getReporteAverias/:_pagina',getRepAv);
router.get('/Administrador/VerLaboratorios',verLab);
router.get('/Administrador/VerCursos',verCurso);
router.get('/Administrador/VerEstadoAveria',getEstAv);
router.get('/Administrador/VerEstadosSolicitud',verEstadoSol);
router.get('/Administrador/getReporteInventario/:_pagina',getRepInv);
router.get('/Administrador/getSolicitudTT/:_pagina',getSTT);
router.get('/Administrador/getSolicitudTT/:_pagina',getSTT);
router.get('/Administrador/getSolicitudPalmada/:_pagina',getSP);
router.get('/Administrador/getDashboardAdministrador',getDashboardAdmin);
router.get('/Administrador/getCorreoUsuario/:_idUsuario',getCorreoUsuario);
router.get('/Administrador/getCorreoSeguridad',getCorreoSeguridad);
router.post('/Administrador/post',addAdministrador);
router.post('/Administrador/CrearHorario',addHorario);
router.post('/Administrador/CrearOperador',addOperador);
router.post('/Administrador/CrearEDA',addEDA);
router.post('/Administrador/CrearLaboratorio',crearLab);
router.post('/Administrador/CrearCurso',crearCurso);
router.post('/Administrador/RegistrarCorreoEnviado',RegistrarCorreoEnviado);
router.post('/Administrador/CrearEstadoAveria',addEstAv);
router.post('/RegistrarHoras',regHoras);
router.put('/Administrador/ActualizarSolicitudCuenta',putSC);
router.put('/Administrador/ActualizarSolicitudTT',putSTT);
router.put('/Administrador/ActualizarPalmada',putSP);
router.put('/Administrador/SeguimientoAveria',putSegAv);
router.delete('/Administrador/CancelarPalmada/:_idPalmada',cancelarPalmada);

//router.delete('/Administrador/deactivate/:_idUsuario',deactivateUsuario);
//router.put('/Administrador/put',putUsuario);

//APARTADO DE LLAMADO DE FUNCIONES PARA LA ENTIDAD DOCENTE Y RUTAS PARA CADA SOLICITUD

const {getDocente,addDocente,verReservas,cancelarReservasDocente,crearReservasDocente,cancelarReservas,set_clienteDocente}=require('../Usuarios/Docente');
set_clienteDocente(client);

router.get('/Docente/get',getDocente);
router.post('/Docente/add',addDocente);
router.post('/Docente/VerReservas',verReservas);
router.post('/Docente/CrearReservas',crearReservasDocente);
router.delete('/Docente/CancelarReserva/:_idReserva',cancelarReservasDocente);

module.exports=router;
