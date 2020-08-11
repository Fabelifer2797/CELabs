import {RouterModule,Routes} from '@angular/router';
import {HomeAdminComponent} from './componentes/administrador/home-admin/home-admin.component';
import {CalendarioComponent  } from './componentes/compartidos/calendario/calendario.component';

const APP_ROUTES: Routes = [
    {path: 'homeAdmin', component: HomeAdminComponent},
    {path: 'calendario',component: CalendarioComponent},
    {path: '**', pathMatch: 'full', redirectTo: 'homeAdmin'}
];


export const APP_ROUTING =RouterModule.forRoot(APP_ROUTES,{useHash:true});