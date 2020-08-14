var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteDashboard(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Dashboard de la BD
const getDashboardAdmin=(req,res)=>{
    client.query('SELECT verDashboardAdmin()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

module.exports={getDashboardAdmin,set_clienteDashboard};