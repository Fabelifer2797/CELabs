var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteSP(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener las Solicitudes de Palmada de la BD
const getSP=(req,res)=>{
    const {_pagina}=req.params;
    client.query('SELECT verSolicitudesPalmada($1)',[_pagina])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Solicitudes de Palmada a la BD

const addSP=(req,res)=>{
    const {idOperador,fechaHoraI,fechaHoraF,idLaboratorio}=req.body;
    client.query('SELECT crearPalmada($1,$2,$3,$4)',[idOperador,fechaHoraI,fechaHoraF,idLaboratorio])
    //client.query('SELECT * FROM SolicitudPalmada')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para agregar Solicitudes de Palmada a la BD

const putSP=(req,res)=>{
    const {_idPalmada,_idAdministrador,_idEstadoSolicitud}=req.body;
    client.query('SELECT  actualizarSolicitudPalmada($1,$2,$3)',[_idPalmada,_idAdministrador,_idEstadoSolicitud])
    //client.query('SELECT * FROM SolicitudPalmada')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

module.exports={getSP,addSP,putSP,set_clienteSP};