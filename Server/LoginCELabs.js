var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteLogCELabs(client_conection){
    client=client_conection;
}

//Funcion para el login en la BD de CELabs
const loginCELabs=(req,res)=>{
    const {_idXTEC}=req.body;
    client.query('SELECT logIn($1)',[_idXTEC])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
module.exports={loginCELabs,set_clienteLogCELabs};