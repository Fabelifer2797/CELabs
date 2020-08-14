import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { OperadorModel } from '../modelos/operador.model'

@Injectable({
  providedIn: 'root'
})
export class AdminService {


  private urlPOSTCrearOperador = 'https://apilabsce.herokuapp.com/Administrador/CrearOperador';

  constructor(private http:HttpClient) { }

  crearOperador(operador:OperadorModel){

    return this.http.post(this.urlPOSTCrearOperador,operador);

  }
  

}
