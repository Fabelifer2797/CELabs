import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {UsuarioModel} from '../modelos/usuario.model';
import { map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private  url = 'https://identitytoolkit.googleapis.com/v1/accounts:';
  private apikey = 'AIzaSyB2vFl4PVbs6f2nn1xoDlnHNcCsJ9UOiY4';
  userToken: string;

  //Crear nuevo usuario
  //https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]

  //Login
  //https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]

  constructor( private http: HttpClient ) {
    this.leerToken();
  }


  logout() {
    localStorage.removeItem('token');
  }

  login( usuario: UsuarioModel ) {

    const authData = {
      ...usuario, // Esto es para resumir todas las propiedades que tiene el usuario
      returnSecureToken: true
    };

    return this.http.post(
      `${ this.url }signInWithPassword?key=${ this.apikey }`,
      authData
    ).pipe(
      map( resp => {
        this.guardarToken( resp['idToken'] );
        return resp;
      })
    );

  }

  nuevoUsuario( usuario: UsuarioModel ) {

    const authData = {
      ...usuario,
      returnSecureToken: true
    };

    return this.http.post(
      `${ this.url }signUp?key=${ this.apikey }`,
      authData
    ).pipe(
      map( resp => {
        this.guardarToken( resp['idToken'] );
        return resp;
      })
    );

  }


  private guardarToken( idToken: string ) {

    this.userToken = idToken;
    localStorage.setItem('token', idToken); // 'token' es la llave con que se graba


  }

  leerToken() {

    if ( localStorage.getItem('token') ) {
      this.userToken = localStorage.getItem('token');
    } else {
      this.userToken = '';
    }

    return this.userToken;

  }


  estaAutenticado(): boolean {

    if ( this.userToken == '' ) {
      return false;
    }

    else {
      return true;
    }

  }
}
