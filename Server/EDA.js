var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteEDA(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los EDA de la BD
const getEDA=(req,res)=>{
    client.query('SELECT * FROM EDA')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar EDA a la BD

const addEDA=(req,res)=>{
    const {_nombre,_apellidos,_idXTEC,_email,_telefono}=req.body;
    client.query('SELECT crearEDA($1,$2,$3,$4,$5)',[_nombre,_apellidos,_idXTEC,_email,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

    module.exports={getEDA,addEDA,set_clienteEDA};