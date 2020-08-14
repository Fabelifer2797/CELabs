var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteHorario(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para obtener los Administradores de la BD
const getHorario=(req,res)=>{
    client.query('SELECT * FROM HORARIO')
    .then(response=>{
        res.json(response.rows);
    })
    .catch(err=>{
    })
};


//Crea un horario
const addHorario=(req,res)=>{
    const {_horaInicioLunes,_horaFinalLunes,_horaInicioMartes,_horaFinalMartes,_horaInicioMiercoles,
        _horaFinalMiercoles,_horaInicioJueves,_horaFinalJueves,_horaInicioViernes,_horaFinalViernes,
        _fechaInicio,_fechaFinal,_idAdministrador}=req.body;
    client.query('SELECT crearHorario($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)',[_horaInicioLunes,_horaFinalLunes,
        _horaInicioMartes,_horaFinalMartes,_horaInicioMiercoles,
        _horaFinalMiercoles,_horaInicioJueves,_horaFinalJueves,_horaInicioViernes,_horaFinalViernes,
        _fechaInicio,_fechaFinal,_idAdministrador])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

module.exports={getHorario,addHorario,set_clienteHorario};