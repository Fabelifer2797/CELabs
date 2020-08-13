import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalleInventarioADComponent } from './detalle-inventario-ad.component';

describe('DetalleInventarioADComponent', () => {
  let component: DetalleInventarioADComponent;
  let fixture: ComponentFixture<DetalleInventarioADComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetalleInventarioADComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetalleInventarioADComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
