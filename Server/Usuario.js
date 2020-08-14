var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteUsuario(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener las Horas Reservadas de la BD
const getHorasReservadasTR=(req,res)=>{
    client.query('SELECT verHorasReservadasTR()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para obtener las Reservas de la BD
const getReservas=(req,res)=>{
    const {_fechaLunes,_fechaDomingo}=req.body;
    client.query('SELECT verReservas($1,$2)',[_fechaLunes,_fechaDomingo])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para obtener el rol de un determinado usuario

const obtenerRol=(req,res)=>{
    const {_idUsuario}=req.params;    
    client.query('SELECT getIdRol($1)',[_idUsuario])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};


//Procesa las solicitudes para desactivar usuarios de la BD

const deactivateUsuario=(req,res)=>{
    const {_idUsuario}=req.params;
    client.query('SELECT desactivarUsuario($1)',[_idUsuario])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para actualizar la informacion de los usuarios de la BD

const putUsuario=(req,res)=>{
    const {_idUsuario,_nombre,_apellidos,_telefono}=req.body;    
    client.query('SELECT actualizarUsuario($1,$2,$3,$4)',[_idUsuario,_nombre,_apellidos,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};
    module.exports={getHorasReservadasTR,getReservas,obtenerRol,deactivateUsuario,putUsuario,set_clienteUsuario};