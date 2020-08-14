var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteLab(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para ver los laboratorios
const verLab=(req,res)=>{
    client.query('SELECT verLaboratorios()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};


//Crea un laboratorio
const crearLab=(req,res)=>{
    const {_codigo,_aula}=req.body;
    client.query('SELECT crearLaboratorio($1,$2)',[_codigo,_aula])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

module.exports={verLab,crearLab,set_clienteLab};