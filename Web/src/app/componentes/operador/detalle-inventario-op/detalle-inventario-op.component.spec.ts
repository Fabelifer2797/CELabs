import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalleInventarioOPComponent } from './detalle-inventario-op.component';

describe('DetalleInventarioOPComponent', () => {
  let component: DetalleInventarioOPComponent;
  let fixture: ComponentFixture<DetalleInventarioOPComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetalleInventarioOPComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetalleInventarioOPComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
