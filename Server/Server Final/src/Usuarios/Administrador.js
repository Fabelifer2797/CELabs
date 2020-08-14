var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteAdministrador(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Administradores de la BD
const getAdministrador=(req,res)=>{
    client.query('SELECT * FROM ADMINISTRADOR')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Administradores a la BD

const addAdministrador=(req,res)=>{
    const {_nombre,_apellidos,_idXTEC,_email,_telefono}=req.body;
    client.query('SELECT crearAdministrador($1,$2,$3,$4,$5)',[_nombre,_apellidos,_idXTEC,_email,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

    module.exports={getAdministrador,addAdministrador,set_clienteAdministrador};