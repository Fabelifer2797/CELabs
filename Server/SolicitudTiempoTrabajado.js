var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteSTT(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener las Solicitudes de Tiempo Trabajado de la BD
const getSTT=(req,res)=>{
    const {_pagina}=req.params;
    client.query('SELECT verSolicitudesRTT($1)',[_pagina])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};


//Permite actualizar las solicitudes de tiempo trabajado de averias para dar seguimiento a los mismos
const putSTT=(req,res)=>{
    const {_idReporteTT,_idUsuario,_idEstadoSolicitud}=req.body;    
    client.query('SELECT actualizarSolicitudRTT($1,$2,$3)',[_idReporteTT,_idUsuario,_idEstadoSolicitud])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

module.exports={getSTT,putSTT,set_clienteSTT};