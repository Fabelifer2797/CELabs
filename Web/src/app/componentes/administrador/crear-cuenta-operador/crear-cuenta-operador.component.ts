import { Component, OnInit } from '@angular/core';
import {FormGroup,FormBuilder,Validators} from '@angular/forms';
import {OperadorModel} from '../../../modelos/operador.model';
import {AdminService} from '../../../services/admin.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-crear-cuenta-operador',
  templateUrl: './crear-cuenta-operador.component.html',
  styleUrls: ['./crear-cuenta-operador.component.css']
})
export class CrearCuentaOperadorComponent implements OnInit {

  formOperador:FormGroup;
  operador:OperadorModel;

  constructor(private formBuilder:FormBuilder, private adminService:AdminService) {

    this.crearFormulario(); 

   }

  ngOnInit(): void {
  }


  get nombreNoValido() {
    return this.formOperador.get('_nombre').invalid && this.formOperador.get('_nombre').touched
  }


  crearFormulario(){
    
    this.formOperador = this.formBuilder.group(
      {
        _nombre :['',[Validators.required]] ,
        _apellidos :['',[Validators.required]],
        _idXTEC: ['',[Validators.required]],
        _email: ['',[Validators.required]],
        _telefono:['',[Validators.required]] , 
      }
    );
      
  }

  guardar(){

    
    if ( this.formOperador.invalid ) {

      return Object.values( this.formOperador.controls ).forEach( control => {
        
        if ( control instanceof FormGroup ) {
          Object.values( control.controls ).forEach( control => control.markAsTouched() );
        } else {
          control.markAsTouched();
        }
        
        
      });
     
    }


    //Se crea el objeto de operador en base a el form
    this.operador = new OperadorModel(this.formOperador.value._nombre,this.formOperador.value._apellidos,
    this.formOperador.value._idXTEC,this.formOperador.value._email,
    this.formOperador.value._telefono);

    console.log(this.operador);


    //Aquí se  hace el post
    

    Swal.fire({
      title: 'Espere',
      text: 'Guardando información',
      icon: 'info',
      allowOutsideClick: false
    });
    Swal.showLoading();



    this.adminService.crearOperador( this.operador )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();
        Swal.fire({
          title: 'Éxito',
          text: 'Se creó con éxito la cuenta de operador',
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




    this.formOperador.reset({
      
    });


  }

}
