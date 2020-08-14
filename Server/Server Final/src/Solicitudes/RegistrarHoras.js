var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteBecas(client_conection){
    client=client_conection;
}

//Funcion para el login en la BD de CELabs
const regHoras=(req,res)=>{
    const {_idXTEC,_jornada}=req.body;
    client.query('SELECT registrarHoras($1,$2)',[_idXTEC,_jornada])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
module.exports={set_clienteBecas,regHoras};