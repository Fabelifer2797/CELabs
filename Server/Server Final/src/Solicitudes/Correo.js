var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteCorreo(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener el correo de un usuario de la BD
const getCorreoUsuario=(req,res)=>{
    const {_idUsuario}=req.params;
    client.query('SELECT buscarCorreo($1)',[_idUsuario])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para obtener el correo del personal de seguridad
const getCorreoSeguridad=(req,res)=>{
    client.query('SELECT buscarCorreoSeguridad()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para registrar un correo enviado a la BD

const RegistrarCorreoEnviado=(req,res)=>{
    const {_correo,_idMotivoCorreo}=req.body;
    client.query('SELECT registrarCorreoEnviado($1,$2)',[_correo,_idMotivoCorreo])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};
module.exports={getCorreoUsuario,getCorreoSeguridad,RegistrarCorreoEnviado,set_clienteCorreo};