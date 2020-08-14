import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { ReservaModel } from '../modelos/reserva.model';
import { AveriaModel } from '../modelos/averia.model';
import { InventarioModel } from '../modelos/inventario.model';
import { TiempoTrabajadoModel } from '../modelos/tiempoTrabajado.model';

@Injectable({
  providedIn: 'root'
})
export class OperadorService {


  private urlPostReserva = 'https://apilabsce.herokuapp.com/Operador/CrearReservas';
  private urlPostAveria = 'https://apilabsce.herokuapp.com/Operador/CrearReporteAveria';
  private urlPostInventario = 'https://apilabsce.herokuapp.com/Operador/CrearReporteInventario';
  private urlPostTiempo = 'https://apilabsce.herokuapp.com/Operador/CrearReporteTT';

  constructor(private http:HttpClient) { }

  crearReserva(reserva:ReservaModel){

    return this.http.post(this.urlPostReserva,reserva);

  }

  crearAveria(averia:AveriaModel){
    
    return this.http.post(this.urlPostAveria,averia);
  }


  crearInventario(inventario:InventarioModel){
    
    return this.http.post(this.urlPostInventario,inventario);

  }

  crearTiempoTrabajado(tiempoT:TiempoTrabajadoModel){
    return this.http.post(this.urlPostTiempo,tiempoT);
  }

}
