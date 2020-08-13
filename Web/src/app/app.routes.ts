import {RouterModule,Routes} from '@angular/router';
import {HomeAdminComponent} from './componentes/administrador/home-admin/home-admin.component';
import {CalendarioComponent  } from './componentes/compartidos/calendario/calendario.component';
import { HomeOperadorComponent } from './componentes/operador/home-operador/home-operador.component';
import { ReservaLabComponent } from './componentes/operador/reserva-lab/reserva-lab.component';
import {ReporteAveriaComponent} from './componentes/operador/reporte-averia/reporte-averia.component';
import {ReportesGeneradosAveriasComponent} from './componentes/operador/reportes-generados-averias/reportes-generados-averias.component';
import { ReporteInventarioComponent } from './componentes/operador/reporte-inventario/reporte-inventario.component';
import { ReportesGeneradosInventarioComponent  } from './componentes/operador/reportes-generados-inventario/reportes-generados-inventario.component';
import { RegistrarTiempoComponent } from './componentes/operador/registrar-tiempo/registrar-tiempo.component';
import {PerfilUsuarioComponent  } from './componentes/compartidos/perfil-usuario/perfil-usuario.component';
import { ConfigurarCuentaComponent } from './componentes/compartidos/configurar-cuenta/configurar-cuenta.component';
import { CrearCuentaOperadorComponent } from './componentes/administrador/crear-cuenta-operador/crear-cuenta-operador.component';
import { CrearCuentaAdminComponent } from './componentes/administrador/crear-cuenta-admin/crear-cuenta-admin.component';
import { AprobarCuentasComponent } from './componentes/administrador/aprobar-cuentas/aprobar-cuentas.component';
import {ValidarHorasComponent} from './componentes/administrador/validar-horas/validar-horas.component';
import { VisualizarReportesAveriasComponent  } from './componentes/administrador/visualizar-reportes-averias/visualizar-reportes-averias.component';
import { VisualizarReportesInventariosComponent } from './componentes/administrador/visualizar-reportes-inventarios/visualizar-reportes-inventarios.component';
import {ConfiguracionesInicialesComponent} from './componentes/administrador/configuraciones-iniciales/configuraciones-iniciales.component';
import { DashboardComponent } from './componentes/administrador/dashboard/dashboard.component';
import { FormSatisfaccionComponent } from './componentes/administrador/form-satisfaccion/form-satisfaccion.component';


const APP_ROUTES: Routes = [
    {path: 'homeOperador',component:HomeOperadorComponent},
    {path: 'homeAdmin', component: HomeAdminComponent},
    {path: 'calendario',component: CalendarioComponent},
    {path: 'reservaLaboratorio', component: ReservaLabComponent},
    {path: 'reporteAveria', component: ReporteAveriaComponent},
    {path: 'reportesGeneradosAverias',component:ReportesGeneradosAveriasComponent},
    {path:'reporteInventario',component:ReporteInventarioComponent},
    {path:'reportesGeneradosInventario',component:ReportesGeneradosInventarioComponent},
    {path:'registrarTiempo',component:RegistrarTiempoComponent},
    {path:'perfilUsuario',component:PerfilUsuarioComponent},
    {path:'configurarCuenta',component:ConfigurarCuentaComponent},
    {path:'crearCuentaOperador',component:CrearCuentaOperadorComponent},
    {path:'crearCuentaAdmin',component:CrearCuentaAdminComponent},
    {path:'aprobarCuentas',component:AprobarCuentasComponent},
    {path:'validarHoras',component:ValidarHorasComponent},
    {path:'visualizarReportesAverias',component:VisualizarReportesAveriasComponent},
    {path:'visualizarReportesInventarios',component:VisualizarReportesInventariosComponent},
    {path: 'configuracionesIniciales',component:ConfiguracionesInicialesComponent},
    {path:'dashboard',component:DashboardComponent},
    {path:'formSatisfaccion',component:FormSatisfaccionComponent},
    {path: '**', pathMatch: 'full', redirectTo: 'homeAdmin'}
];


export const APP_ROUTING = RouterModule.forRoot(APP_ROUTES,{useHash:true});