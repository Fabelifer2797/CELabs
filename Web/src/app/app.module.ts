import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

//Rutas
import { APP_ROUTING } from './app.routes';

//Servicios


//Componentes
import { AppComponent } from './app.component';
import { NavBarComponent } from './componentes/compartidos/nav-bar/nav-bar.component';
import { HomeAdminComponent } from './componentes/administrador/home-admin/home-admin.component';
import { CalendarioComponent } from './componentes/compartidos/calendario/calendario.component';
import { HomeOperadorComponent } from './componentes/operador/home-operador/home-operador.component';
import { ContenidoPrincipalComponent } from './componentes/compartidos/contenido-principal/contenido-principal.component';

@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    HomeAdminComponent,
    CalendarioComponent,
    HomeOperadorComponent,
    ContenidoPrincipalComponent
  ],
  imports: [
    BrowserModule,
    APP_ROUTING
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
