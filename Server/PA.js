var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clientePA(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los PA de la BD
const getPA=(req,res)=>{
    client.query('SELECT * FROM PA')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar PA a la BD

const addPA=(req,res)=>{
    const {_nombre,_apellidos,_idXTEC,_email,_telefono}=req.body;
    client.query('SELECT crearPA($1,$2,$3,$4,$5)',[_nombre,_apellidos,_idXTEC,_email,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

    module.exports={getPA,addPA,set_clientePA};
