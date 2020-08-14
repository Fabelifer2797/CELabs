var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteRepTT(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Reportes de Tiempo Trabajado de la BD
const getRepTT=(req,res)=>{
    client.query('SELECT * FROM ReporteTT')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Reportes de Tiempo Trabajado a la BD

const addRepTT=(req,res)=>{
    const {_idOperador,_horaInicio,_horaFinal,_actividades}=req.body;
    client.query('SELECT crearReporteTT($1,$2,$3,$4)',[_idOperador,_horaInicio,_horaFinal,_actividades])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
    module.exports={getRepTT,addRepTT,set_clienteRepTT};