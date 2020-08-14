import { Component, OnInit } from '@angular/core';
import {FormGroup,FormBuilder,Validators} from '@angular/forms';
import {AveriaModel} from '../../../modelos/averia.model';
import {OperadorService} from '../../../services/operador.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-reporte-averia',
  templateUrl: './reporte-averia.component.html',
  styleUrls: ['./reporte-averia.component.css']
})
export class ReporteAveriaComponent implements OnInit {

  formAveria:FormGroup;
  averia:AveriaModel;

  constructor(private formBuilder:FormBuilder, private operadorService:OperadorService) {
      
    this.crearFormulario(); 


   }

  ngOnInit(): void {
  }


  get idLaboratorioNoValido() {
    return this.formAveria.get('_idLaboratorio').invalid && this.formAveria.get('_idLaboratorio').touched
  }


  crearFormulario(){
    
    this.formAveria = this.formBuilder.group(
      {
        _idOperador :[1] ,
        _idLaboratorio :['',[Validators.required]],
        _activo: ['',[Validators.required]],
        _descripcion: ['',[Validators.required]],
      }
    );
      
  }


  guardar(){

    
    if ( this.formAveria.invalid ) {

      return Object.values( this.formAveria.controls ).forEach( control => {
        
        if ( control instanceof FormGroup ) {
          Object.values( control.controls ).forEach( control => control.markAsTouched() );
        } else {
          control.markAsTouched();
        }
        
        
      });
     
    }


    //Se crea el objeto de  averia en base a el form
    this.averia = new AveriaModel(this.formAveria.value._idOperador,this.formAveria.value._idLaboratorio,
    this.formAveria.value._activo,this.formAveria.value._descripcion);

    console.log(this.averia);


    //Aquí se  hace el post
    

    Swal.fire({
      title: 'Espere',
      text: 'Guardando información',
      icon: 'info',
      allowOutsideClick: false
    });
    Swal.showLoading();



    this.operadorService.crearAveria( this.averia )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();

      }, (err) => {

        console.log(err);
        Swal.fire({
          icon: 'error',
          title: 'Error al cargar el reporte de averia'
        });
      });




    this.formAveria.reset({
      
    });


  }

}
