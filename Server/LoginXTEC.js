var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteLogXTEC(client_conection){
    client=client_conection;
}

//Funcion para el login en la BD de XTEC
const loginXTEC=(req,res)=>{
    const {_idXTEC,_password}=req.body;
    client.query('SELECT logIn($1,$2)',[_idXTEC,_password])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
module.exports={loginXTEC,set_clienteLogXTEC};