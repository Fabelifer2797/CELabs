export class AveriaModel{

    
    _idOperador:number;
    _idLaboratorio:number;
    _activo:String;
    _descripcion: String;



    constructor (idOperador: number, idLaboratorio:number,activo:String, descripcion:String){

        this._idOperador = idOperador;
        this._idLaboratorio = idLaboratorio;
        this._activo = activo;
        this._descripcion = descripcion;

    }

}