var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteFS(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para crear un formulario de satisfaccion
const addFS=(req,res)=>{
    const {_valor}=req.params;
    client.query('SELECT respuestaFSatisfaccion($1)',[_valor])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

module.exports={addFS,set_clienteFS};