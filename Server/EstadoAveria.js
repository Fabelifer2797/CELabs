var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteEstAv(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Estados de Averia de la BD
const getEstAv=(req,res)=>{
    client.query('SELECT verEstadosAveria()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Reportes de Averias a la BD

const addEstAv=(req,res)=>{
    const {_info}=req.body;
    client.query('SELECT crearEstadoAveria($1)',[_info])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

    module.exports={getEstAv,addEstAv,set_clienteEstAv};