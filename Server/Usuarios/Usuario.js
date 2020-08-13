var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteUsuario(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los usuarios de la BD
const getUsuario=(req,res)=>{
    client.query('SELECT * FROM USUARIO')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};
//Busca un usuario de acuerdo a su ID
const getUsuarioID=(req,res)=>{
    const id_xtec=req.params.idxtec;
    client.query('SELECT buscarIdUsuario($1)',[id_xtec])
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar usuarios a la BD
const addUsuario=(req,res)=>{
    const {nombre,apellidos,idxtec,email,telefono,estado,rolactual}=req.body;
    client.query('INSERT INTO USUARIO (nombre,apellidos,idxtec,email,telefono,estado,rolactual) VALUES ($1,$2,$3,$4,$5,$6,$7)',[nombre,apellidos,idxtec,email,telefono,estado,rolactual]);
    client.query('SELECT * FROM USUARIO')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para borrar usuarios de la BD

const deleteUsuario=(req,res)=>{
    const id_xtec=req.params.idxtec;
    client.query('DELETE FROM USUARIO WHERE idxtec=$1',[id_xtec]);
    client.query('SELECT * FROM USUARIO')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para actualizar la informacion de los usuarios de la BD

const putUsuario=(req,res)=>{
    const {nombre,apellidos,idxtec,email,telefono,estado,rolactual}=req.body;
    client.query('UPDATE USUARIO SET nombre=$1,apellidos=$2,email=$4,telefono=$5,estado=$6,rolactual=$7 WHERE idxtec=$3',[nombre,apellidos,idxtec,email,telefono,estado,rolactual]);
    client.query('SELECT * FROM USUARIO')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};
    module.exports={getUsuario,getUsuarioID,addUsuario,deleteUsuario,putUsuario,set_clienteUsuario};
