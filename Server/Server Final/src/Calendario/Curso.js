var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteCurso(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para ver los cursos
const verCurso=(req,res)=>{
    client.query('SELECT verCursos()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};


//Crea un curso
const crearCurso=(req,res)=>{
    const {_codigo,_nombre}=req.body;
    client.query('SELECT crearCurso($1,$2)',[_codigo,_nombre])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

module.exports={verCurso,crearCurso,set_clienteCurso};