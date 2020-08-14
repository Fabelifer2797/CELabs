var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteDocente(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Docentes de la BD
const getDocente=(req,res)=>{
    client.query('SELECT * FROM DOCENTE')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para agregar Docentes a la BD

const addDocente=(req,res)=>{
    const {_nombre,_apellidos,_idXTEC,_email,_telefono}=req.body;
    client.query('SELECT crearDocente($1,$2,$3,$4,$5)',[_nombre,_apellidos,_idXTEC,_email,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para crear una reserva

const crearReservasDocente=(req,res)=>{
    const {_idOperador,_idUsuarioReserva,_fechaReserva,_horaInicio,_horaFinal,_idLaboratorio,_motivo,_idCurso}=req.body;
    client.query('SELECT crearReserva($1,$2,$3,$4,$5,$6,$7,$8)',[_idOperador,_idUsuarioReserva,_fechaReserva,_horaInicio,_horaFinal,_idLaboratorio,_motivo,_idCurso])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};


//Procesa las solicitudes para ver mis reservas

const verReservas=(req,res)=>{
    const {_fechaLunes,_fechaDomingo,_idDocente}=req.body;
    client.query('SELECT verMisReservas($1,$2,$3)',[_fechaLunes,_fechaDomingo,_idDocente])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

//Procesa las solicitudes para cancelar una reserva

const cancelarReservasDocente=(req,res)=>{
    const {_idReserva}=req.params;
    client.query('SELECT cancelarReserva($1)',[_idReserva])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

module.exports={getDocente,addDocente,verReservas,crearReservasDocente,cancelarReservasDocente,set_clienteDocente};