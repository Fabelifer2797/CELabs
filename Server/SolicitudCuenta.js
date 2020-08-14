var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteSC(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener las Solicitudes de Cuenta de la BD
const getSC=(req,res)=>{
    const {_pagina}=req.params;
    client.query('SELECT verSolicitudesCuenta($1)',[_pagina])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Solicitudes de Cuenta a la BD

const addSC=(req,res)=>{
    const {idCuenta,idAdministrador,idEstadoSolicitud}=req.body;
    client.query('SELECT crearSolicitudCuenta($1,$2,$3)',[idCuenta,idAdministrador,idEstadoSolicitud])
    //client.query('SELECT * FROM SolicitudCuenta')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Actualiza las solicitudes de cuenta
const putSC=(req,res)=>{
    const {_idCuenta,_idAdministrador,_idEstadoSolicitud}=req.body;
    client.query('SELECT actualizarSolicitudCuenta($1,$2,$3)',[_idCuenta,_idAdministrador,_idEstadoSolicitud])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};


module.exports={getSC,addSC,putSC,set_clienteSC};