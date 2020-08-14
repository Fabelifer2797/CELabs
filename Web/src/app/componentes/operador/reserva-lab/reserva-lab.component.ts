import { Component, OnInit } from '@angular/core';
import {FormGroup,FormBuilder,Validators} from '@angular/forms';
import {ReservaModel} from '../../../modelos/reserva.model';
import {OperadorService} from '../../../services/operador.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-reserva-lab',
  templateUrl: './reserva-lab.component.html',
  styleUrls: ['./reserva-lab.component.css']
})
export class ReservaLabComponent implements OnInit {

  formReserva:FormGroup;
  reserva:ReservaModel;

  constructor(private formBuilder:FormBuilder, private operadorService:OperadorService) {
  
    this.crearFormulario(); 

   }

  ngOnInit(): void {
  }

  get idUsuarioNoValido() {
    return this.formReserva.get('_idUsuarioReserva').invalid && this.formReserva.get('_idUsuarioReserva').touched
  }


  crearFormulario(){
    
    this.formReserva = this.formBuilder.group(
      {
        _idOperador :[1] ,
        _idUsuarioReserva :['',[Validators.required]],
        _fechaReserva: ['',[Validators.required]],
        _horaInicio: ['',[Validators.required]],
        _horaFinal:['',[Validators.required]] ,
        _idLaboratorio: ['',[Validators.required]],
        _motivo:['',[Validators.required]] ,
        _idCurso:['',[Validators.required]], 
      }
    );
      
  }

  guardar(){

    
    if ( this.formReserva.invalid ) {

      return Object.values( this.formReserva.controls ).forEach( control => {
        
        if ( control instanceof FormGroup ) {
          Object.values( control.controls ).forEach( control => control.markAsTouched() );
        } else {
          control.markAsTouched();
        }
        
        
      });
     
    }


    //Se crea el objeto de  reserva en base a el form
    this.reserva = new ReservaModel(this.formReserva.value._idOperador,this.formReserva.value._idUsuarioReserva,
    this.formReserva.value._fechaReserva,this.formReserva.value._horaInicio,
    this.formReserva.value._horaFinal,this.formReserva.value._idLaboratorio,
    this.formReserva.value._motivo,this.formReserva.value._idCurso);

    console.log(this.reserva);


    //Aquí se  hace el post
    

    Swal.fire({
      title: 'Espere',
      text: 'Guardando información',
      icon: 'info',
      allowOutsideClick: false
    });
    Swal.showLoading();



    this.operadorService.crearReserva( this.reserva )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();
        Swal.fire({
          title: 'Éxito',
          text: 'Se realizó con éxito la reserva',
          icon: 'info',
          allowOutsideClick: false
        });
        

      }, (err) => {

        console.log(err);
        Swal.fire({
          icon: 'error',
          title: 'Error al cargar la reserva'
        });
      });




    this.formReserva.reset({
      
    });


  }

}
