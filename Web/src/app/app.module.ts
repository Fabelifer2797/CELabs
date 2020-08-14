import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';

//Rutas
import { AppRoutingModule } from './app-routing.module';

//Servicios


//Componentes
import { AppComponent } from './app.component';
import { NavBarComponent } from './componentes/compartidos/nav-bar/nav-bar.component';
import { HomeAdminComponent } from './componentes/administrador/home-admin/home-admin.component';
import { CalendarioComponent } from './componentes/compartidos/calendario/calendario.component';
import { HomeOperadorComponent } from './componentes/operador/home-operador/home-operador.component';
import { ContenidoPrincipalComponent } from './componentes/compartidos/contenido-principal/contenido-principal.component';
import { ReservaLabComponent } from './componentes/operador/reserva-lab/reserva-lab.component';
import { ReporteAveriaComponent } from './componentes/operador/reporte-averia/reporte-averia.component';
import { ReportesGeneradosAveriasComponent } from './componentes/operador/reportes-generados-averias/reportes-generados-averias.component';
import { ReporteInventarioComponent } from './componentes/operador/reporte-inventario/reporte-inventario.component';
import { ReportesGeneradosInventarioComponent } from './componentes/operador/reportes-generados-inventario/reportes-generados-inventario.component';
import { RegistrarTiempoComponent } from './componentes/operador/registrar-tiempo/registrar-tiempo.component';
import { PerfilUsuarioComponent } from './componentes/compartidos/perfil-usuario/perfil-usuario.component';
import { ConfigurarCuentaComponent } from './componentes/compartidos/configurar-cuenta/configurar-cuenta.component';
import { CrearCuentaOperadorComponent } from './componentes/administrador/crear-cuenta-operador/crear-cuenta-operador.component';
import { CrearCuentaAdminComponent } from './componentes/administrador/crear-cuenta-admin/crear-cuenta-admin.component';
import { AprobarCuentasComponent } from './componentes/administrador/aprobar-cuentas/aprobar-cuentas.component';
import { ValidarHorasComponent } from './componentes/administrador/validar-horas/validar-horas.component';
import { VisualizarReportesAveriasComponent } from './componentes/administrador/visualizar-reportes-averias/visualizar-reportes-averias.component';
import { VisualizarReportesInventariosComponent } from './componentes/administrador/visualizar-reportes-inventarios/visualizar-reportes-inventarios.component';
import { ConfiguracionesInicialesComponent } from './componentes/administrador/configuraciones-iniciales/configuraciones-iniciales.component';
import { FormSatisfaccionComponent } from './componentes/administrador/form-satisfaccion/form-satisfaccion.component';
import { DashboardComponent } from './componentes/administrador/dashboard/dashboard.component';
import { DetalleAveriaOPComponent } from './componentes/operador/detalle-averia-op/detalle-averia-op.component';
import { DetalleAveriaADComponent } from './componentes/administrador/detalle-averia-ad/detalle-averia-ad.component';
import { DetalleInventarioADComponent } from './componentes/administrador/detalle-inventario-ad/detalle-inventario-ad.component';
import { DetalleInventarioOPComponent } from './componentes/operador/detalle-inventario-op/detalle-inventario-op.component';
import { LoginComponent } from './componentes/compartidos/login/login.component';
import { CrearCuentaComponent } from './componentes/compartidos/crear-cuenta/crear-cuenta.component';

@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    HomeAdminComponent,
    CalendarioComponent,
    HomeOperadorComponent,
    ContenidoPrincipalComponent,
    ReservaLabComponent,
    ReporteAveriaComponent,
    ReportesGeneradosAveriasComponent,
    ReporteInventarioComponent,
    ReportesGeneradosInventarioComponent,
    RegistrarTiempoComponent,
    PerfilUsuarioComponent,
    ConfigurarCuentaComponent,
    CrearCuentaOperadorComponent,
    CrearCuentaAdminComponent,
    AprobarCuentasComponent,
    ValidarHorasComponent,
    VisualizarReportesAveriasComponent,
    VisualizarReportesInventariosComponent,
    ConfiguracionesInicialesComponent,
    FormSatisfaccionComponent,
    DashboardComponent,
    DetalleAveriaOPComponent,
    DetalleAveriaADComponent,
    DetalleInventarioADComponent,
    DetalleInventarioOPComponent,
    LoginComponent,
    CrearCuentaComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
