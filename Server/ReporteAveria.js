var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteRepAv(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Reportes de Averias de la BD
const getRepAv=(req,res)=>{
    const {_pagina}=req.params;
    client.query('SELECT verReportesAverias($1)',[_pagina])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Reportes de Averias a la BD

const addRepAv=(req,res)=>{
    const {_idOperador,_idLaboratorio,_activo,_descripcion}=req.body;
    client.query('SELECT crearReporteAveria($1,$2,$3,$4)',[_idOperador,_idLaboratorio,_activo,_descripcion])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

    module.exports={getRepAv,addRepAv,set_clienteRepAv};