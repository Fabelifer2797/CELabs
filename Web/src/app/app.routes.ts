import {RouterModule,Routes} from '@angular/router';
import {HomeAdminComponent} from './componentes/administrador/home-admin/home-admin.component';
import {CalendarioComponent  } from './componentes/compartidos/calendario/calendario.component';
import { HomeOperadorComponent } from './componentes/operador/home-operador/home-operador.component';
import { ReservaLabComponent } from './componentes/operador/reserva-lab/reserva-lab.component';
import {ReporteAveriaComponent} from './componentes/operador/reporte-averia/reporte-averia.component';
import {ReportesGeneradosAveriasComponent} from './componentes/operador/reportes-generados-averias/reportes-generados-averias.component';
import { ReporteInventarioComponent } from './componentes/operador/reporte-inventario/reporte-inventario.component';
import { ReportesGeneradosInventarioComponent  } from './componentes/operador/reportes-generados-inventario/reportes-generados-inventario.component';


const APP_ROUTES: Routes = [
    {path: 'homeOperador',component:HomeOperadorComponent},
    {path: 'homeAdmin', component: HomeAdminComponent},
    {path: 'calendario',component: CalendarioComponent},
    {path: 'reservaLaboratorio', component: ReservaLabComponent},
    {path: 'reporteAveria', component: ReporteAveriaComponent},
    {path: 'reportesGeneradosAverias',component:ReportesGeneradosAveriasComponent},
    {path:'reporteInventario',component:ReporteInventarioComponent},
    {path:'reportesGeneradosInventario',component:ReportesGeneradosInventarioComponent},
    {path: '**', pathMatch: 'full', redirectTo: 'homeOperador'}
];


export const APP_ROUTING =RouterModule.forRoot(APP_ROUTES,{useHash:true});