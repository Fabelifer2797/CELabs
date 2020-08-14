import { Component, OnInit } from '@angular/core';
import {FormGroup,FormBuilder,Validators} from '@angular/forms';
import {InventarioModel} from '../../../modelos/inventario.model';
import {OperadorService} from '../../../services/operador.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-reporte-inventario',
  templateUrl: './reporte-inventario.component.html',
  styleUrls: ['./reporte-inventario.component.css']
})
export class ReporteInventarioComponent implements OnInit {

  formInventario:FormGroup;
  inventario:InventarioModel;

  constructor(private formBuilder:FormBuilder, private operadorService:OperadorService) {
    
    this.crearFormulario();

   }

  ngOnInit(): void {
  }



  get idLaboratorioNoValido() {
    return this.formInventario.get('_idLaboratorio').invalid && this.formInventario.get('_idLaboratorio').touched
  }

  crearFormulario(){
    
    this.formInventario = this.formBuilder.group(
      {
        _idOperador :[1] ,
        _idLaboratorio :[,[Validators.required]],
        _computadorasC: [,[Validators.required]],
        _computadorasI: [,[Validators.required]],
        _proyectores:[,[Validators.required]] ,
        _sillas: [,[Validators.required]],
        _extintores:[,[Validators.required]] , 
      }
    );
      
  }

  guardar(){

    
    if ( this.formInventario.invalid ) {

      return Object.values( this.formInventario.controls ).forEach( control => {
        
        if ( control instanceof FormGroup ) {
          Object.values( control.controls ).forEach( control => control.markAsTouched() );
        } else {
          control.markAsTouched();
        }
        
        
      });
     
    }


    //Se crea el objeto de  reserva en base a el form
    this.inventario = new InventarioModel(this.formInventario.value._idOperador,this.formInventario.value._idLaboratorio,
    this.formInventario.value._computadorasC,this.formInventario.value._computadorasI,
    this.formInventario.value._proyectores,this.formInventario.value._sillas,
    this.formInventario.value._extintores);

    console.log(this.inventario);


    //Aquí se  hace el post
    

    Swal.fire({
      title: 'Espere',
      text: 'Guardando información',
      icon: 'info',
      allowOutsideClick: false
    });
    Swal.showLoading();



    this.operadorService.crearInventario( this.inventario )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();
        Swal.fire({
          title: 'Éxito',
          text: 'Se realizó con éxito el reporte de inventario',
          icon: 'info',
          allowOutsideClick: false
        });

      }, (err) => {

        console.log(err);
        Swal.fire({
          icon: 'error',
          title: 'Error al cargar el reporte de inventario'
        });
      });




    this.formInventario.reset({
      
    });


  }

}
