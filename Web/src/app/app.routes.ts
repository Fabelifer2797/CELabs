import {RouterModule,Routes} from '@angular/router';
import {HomeAdminComponent} from './componentes/administrador/home-admin/home-admin.component';
import {CalendarioComponent  } from './componentes/compartidos/calendario/calendario.component';
import { HomeOperadorComponent } from './componentes/operador/home-operador/home-operador.component';

const APP_ROUTES: Routes = [
    {path: 'homeOperador',component:HomeOperadorComponent},
    {path: 'homeAdmin', component: HomeAdminComponent},
    {path: 'calendario',component: CalendarioComponent},
    {path: '**', pathMatch: 'full', redirectTo: 'homeOperador'}
];


export const APP_ROUTING =RouterModule.forRoot(APP_ROUTES,{useHash:true});