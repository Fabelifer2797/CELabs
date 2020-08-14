import { Component, OnInit } from '@angular/core';
import {FormGroup,FormBuilder,Validators} from '@angular/forms';
import {TiempoTrabajadoModel} from '../../../modelos/tiempoTrabajado.model';
import {OperadorService} from '../../../services/operador.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-registrar-tiempo',
  templateUrl: './registrar-tiempo.component.html',
  styleUrls: ['./registrar-tiempo.component.css']
})
export class RegistrarTiempoComponent implements OnInit {

  formTiempo:FormGroup;
  tiempoT:TiempoTrabajadoModel;

  constructor(private formBuilder:FormBuilder, private operadorService:OperadorService) { 

    this.crearFormulario();
  }

  ngOnInit(): void {
  }

  get horaInicioNoValida() {
    return this.formTiempo.get('_horaInicio').invalid && this.formTiempo.get('_horaInicio').touched
  }


  crearFormulario(){
    
    this.formTiempo = this.formBuilder.group(
      {
        _idOperador :[1] ,
        _horaInicio :['',[Validators.required]],
        _horaFinal: ['',[Validators.required]],
        _actividades: ['',[Validators.required]],
      }
    );
      
  }

  guardar(){

    
    if ( this.formTiempo.invalid ) {

      return Object.values( this.formTiempo.controls ).forEach( control => {
        
        if ( control instanceof FormGroup ) {
          Object.values( control.controls ).forEach( control => control.markAsTouched() );
        } else {
          control.markAsTouched();
        }
        
        
      });
     
    }


    //Se crea el objeto de  reserva en base a el form
    this.tiempoT = new TiempoTrabajadoModel(this.formTiempo.value._idOperador,this.formTiempo.value._horaInicio,
    this.formTiempo.value._horaFinal,this.formTiempo.value._actividades);

    console.log(this.tiempoT);


    //Aquí se  hace el post
    

    Swal.fire({
      title: 'Espere',
      text: 'Guardando información',
      icon: 'info',
      allowOutsideClick: false
    });
    Swal.showLoading();



    this.operadorService.crearTiempoTrabajado( this.tiempoT )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();

      }, (err) => {

        console.log(err);
        Swal.fire({
          icon: 'error',
          title: 'Error al cargar el tiempo trabajado'
        });
      });




    this.formTiempo.reset({
      
    });


  }

}
