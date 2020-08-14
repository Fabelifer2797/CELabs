export class InventarioModel{

    _idOperador:number;
    _idLaboratorio:number;
    _computadorasC: number;
    _computadorasI:number;
    _proyectores: number;
    _sillas: number;
    _extintores: number;


    constructor(idOperador:number, idLaboratorio:number, computadorasC:number,computadorasI:number ,
                proyectores:number, sillas:number, extintores:number){
        
        this._idOperador = idOperador;
        this._idLaboratorio = idLaboratorio;
        this._computadorasC = computadorasC;
        this._computadorasI = computadorasI;
        this._proyectores = proyectores;
        this._sillas = sillas;
        this._extintores = extintores;

    }
}