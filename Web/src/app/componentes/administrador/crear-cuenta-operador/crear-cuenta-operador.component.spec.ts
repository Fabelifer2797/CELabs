import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CrearCuentaOperadorComponent } from './crear-cuenta-operador.component';

describe('CrearCuentaOperadorComponent', () => {
  let component: CrearCuentaOperadorComponent;
  let fixture: ComponentFixture<CrearCuentaOperadorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CrearCuentaOperadorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CrearCuentaOperadorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
