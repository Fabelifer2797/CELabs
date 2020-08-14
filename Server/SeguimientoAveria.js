var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clienteSegAv(client_conection){
    client=client_conection;
}

//Permite actualizar los reportes de averias para dar seguimiento a los mismos
const putSegAv=(req,res)=>{
    const {_idReporteAveria,_idUsuario,_idEstadoAveria}=req.body;    
    client.query('SELECT darSeguimientoAveria($1,$2,$3)',[_idReporteAveria,_idUsuario,_idEstadoAveria])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

    module.exports={putSegAv,set_clienteSegAv};