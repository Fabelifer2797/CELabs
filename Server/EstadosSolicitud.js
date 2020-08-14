var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteEstadoSolicitud(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Estados de Averia de la BD
const verEstadoSol=(req,res)=>{
    client.query('SELECT verEstadosSolicitud()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};
    module.exports={verEstadoSol,set_clienteEstadoSolicitud};