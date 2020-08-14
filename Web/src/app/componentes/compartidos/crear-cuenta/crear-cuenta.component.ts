import { Component, OnInit } from '@angular/core';
import { UsuarioModel } from '../../../modelos/usuario.model';
import { AuthService } from '../../../services/auth.service';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-crear-cuenta',
  templateUrl: './crear-cuenta.component.html',
  styleUrls: ['./crear-cuenta.component.css']
})
export class CrearCuentaComponent implements OnInit {
  
  usuario: UsuarioModel;
  recordarme = false;

  constructor(private auth: AuthService,
              private router: Router) { }

  ngOnInit(): void {

    this.usuario = new UsuarioModel();
  }


  onSubmit( form: NgForm ) {

    if ( form.invalid ) { return; }

    Swal.fire({
      allowOutsideClick: false,
      icon: 'info',
      text: 'Espere por favor...'
    });
    Swal.showLoading();

    this.auth.nuevoUsuario( this.usuario )
      .subscribe( resp => {

        console.log(resp);
        Swal.close();

        if ( this.recordarme ) {
          localStorage.setItem('email', this.usuario.email);
        }

        this.router.navigateByUrl('/homeAdmin');

      }, (err) => {
        console.log(err.error.error.message);
        Swal.fire({
          icon: 'error',
          title: 'Error al autenticar',
          text: err.error.error.message
        });
      });
  }

}
