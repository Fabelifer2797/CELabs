var client;

//Funcion encargada de asignarle a la variable client la variable con la informacion de la conexion establecida
//con la BD de PostgreSQL
function set_clientePalmada(client_conection){
    client=client_conection;
}

//Procesa las solicitudes para agregar Palmadas a la BD

const addPalmada=(req,res)=>{
    const {_idOperador,_fechaHoraI,_fechaHoraF,_idLaboratorio,_motivo}=req.body;
    client.query('SELECT crearPalmada($1,$2,$3,$4,$5)',[_idOperador,_fechaHoraI,_fechaHoraF,_idLaboratorio,_motivo])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});

};

//Permite eliminar una Palmada de la BD
const cancelarPalmada=(req,res)=>{
    const {_idPalmada}=req.params;    
    client.query('SELECT cancelarPalmada($1)',[_idPalmada])
    .then(response=>{res.json(response.rows)})
    .catch(err=>{res.json('Error')});
};

    module.exports={addPalmada,cancelarPalmada,set_clientePalmada};