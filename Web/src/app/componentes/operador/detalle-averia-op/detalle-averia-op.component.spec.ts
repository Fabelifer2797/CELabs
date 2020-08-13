import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalleAveriaOPComponent } from './detalle-averia-op.component';

describe('DetalleAveriaOPComponent', () => {
  let component: DetalleAveriaOPComponent;
  let fixture: ComponentFixture<DetalleAveriaOPComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetalleAveriaOPComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetalleAveriaOPComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
