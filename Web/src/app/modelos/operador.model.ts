export class OperadorModel{
    
    _nombre: String;
    _apellidos: String;
    _idXTEC: String;
    _email: String;
    _telefono: String;

    constructor(nombre:String, apellidos:String, idXTEC:String, email:String,telefono:String){

        this._nombre = nombre;
        this._apellidos = apellidos;
        this._idXTEC = idXTEC;
        this._email = email;
        this._telefono = telefono;

    }

}