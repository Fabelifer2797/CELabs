export class TiempoTrabajadoModel{
    
    _idOperador:number;
    _horaInicio:Date;
    _horaFinal:Date;
    _actividades:String;


    constructor(idOperador:number, horaInicio: Date, horaFinal: Date, actividades:String){

        this._idOperador = idOperador;
        this._horaInicio = horaInicio;
        this._horaFinal =  horaFinal;
        this._actividades = actividades;

    }
}