


export class ReservaModel{

        _idOperador : String;
        _idUsuarioReserva :number;
        _fechaReserva: Date;
        _horaInicio: Date;
        _horaFinal: Date;
        _idLaboratorio: number;
        _motivo: String;
        _idCurso: number;
    
    
        constructor(idOperador:String, idUsuarioReserva:number,fechaReserva:Date, horaInicio:Date,
                    horaFinal:Date, idLaboratorio:number, motivo:String, idCurso:number){

                this._idOperador = idOperador;
                this._idUsuarioReserva = idUsuarioReserva;
                this._fechaReserva = fechaReserva;
                this._horaInicio = horaInicio;
                this._horaFinal = horaFinal;
                this._idLaboratorio = idLaboratorio;
                this._motivo = motivo;
                this._idCurso = idCurso;
                

        }


}