var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteOperador(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Operadores de la BD
const getOperador=(req,res)=>{
    client.query('SELECT * FROM OPERADOR')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};

//Procesa las solicitudes para ver las horas trabajadas
const verTiempoTrabajado=(req,res)=>{
    client.query('SELECT verMiTT()')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};


//Procesa las solicitudes para agregar Operadores a la BD

const addOperador=(req,res)=>{
    const {_nombre,_apellidos,_idXTEC,_email,_telefono}=req.body;
    client.query('SELECT crearOperador($1,$2,$3,$4,$5)',[_nombre,_apellidos,_idXTEC,_email,_telefono])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Procesa las solicitudes para crear una reserva

const crearReservasOperador=(req,res)=>{
    const {_idOperador,_idUsuarioReserva,_fechaReserva,_horaInicio,_horaFinal,_idLaboratorio,_motivo,_idCurso}=req.body;
    client.query('SELECT crearReserva($1,$2,$3,$4,$5,$6,$7,$8)',[_idOperador,_idUsuarioReserva,_fechaReserva,_horaInicio,_horaFinal,_idLaboratorio,_motivo,_idCurso])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

//Procesa las solicitudes para cancelar una reserva

const cancelarReservasOperador=(req,res)=>{
    const {_idReserva}=req.params;
    client.query('SELECT cancelarReserva($1)',[_idReserva])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

module.exports={getOperador,addOperador,crearReservasOperador,cancelarReservasOperador,verTiempoTrabajado,set_clienteOperador};
