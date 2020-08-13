import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AprobarCuentasComponent } from './aprobar-cuentas.component';

describe('AprobarCuentasComponent', () => {
  let component: AprobarCuentasComponent;
  let fixture: ComponentFixture<AprobarCuentasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AprobarCuentasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AprobarCuentasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
