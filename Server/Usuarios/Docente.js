var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteDocente(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los EDA de la BD
const getDocente=(req,res)=>{
    client.query('SELECT * FROM DOCENTE')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar EDA a la BD

const addDocente=(req,res)=>{
    const {nombre,apellidos,idxtec,email,telefono}=req.body;
    client.query('SELECT crearDocente($1,$2,$3,$4,$5)',[nombre,apellidos,idxtec,email,telefono])
    //client.query('SELECT * FROM DOCENTE')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para borrar administradores de la BD
/*
const deleteAdministrador=(req,res)=>{
    const {idxtec}=req.body;
    client.query('DELETE FROM ADMINISTRADOR WHERE idxtec=$1',[idxtec]);
    client.query('SELECT * FROM ADMINISTRADOR')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para actualizar la informacion de los administradores de la BD

const putAdministrador=(req,res)=>{
    const {nombre,apellidos,idxtec,email,telefono}=req.body;    
    client.query('UPDATE ADMINISTRADOR SET nombre=$1,apellidos=$2,email=$4,telefono=$5 WHERE idxtex=$3',[nombre,apellidos,idxtec,email,telefono]);
    client.query('SELECT * FROM ADMINISTRADOR')
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};
*/
    module.exports={getDocente,addDocente,set_clienteDocente};