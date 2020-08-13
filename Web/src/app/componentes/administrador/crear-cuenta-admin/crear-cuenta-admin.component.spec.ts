import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CrearCuentaAdminComponent } from './crear-cuenta-admin.component';

describe('CrearCuentaAdminComponent', () => {
  let component: CrearCuentaAdminComponent;
  let fixture: ComponentFixture<CrearCuentaAdminComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CrearCuentaAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CrearCuentaAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
