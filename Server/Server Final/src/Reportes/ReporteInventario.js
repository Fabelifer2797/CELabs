var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteRepInv(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Reportes de Inventarios de la BD
const getRepInv=(req,res)=>{
    const {_pagina}=req.params;
    client.query('SELECT verReportesInventario($1)',[_pagina])
    //client.query('SELECT * from ReporteInventario')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Reportes de Inventario a la BD

const addRepInv=(req,res)=>{
    const {_idOperador,_idLaboratorio,_computadorasC,_computadorasI,_proyectores,_sillas,_extintores}=req.body;
    client.query('SELECT crearReporteInventario($1,$2,$3,$4,$5,$6,$7)',[_idOperador,_idLaboratorio,_computadorasC,_computadorasI,_proyectores,_sillas,_extintores])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
    module.exports={getRepInv,addRepInv,set_clienteRepInv};