import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalleAveriaADComponent } from './detalle-averia-ad.component';

describe('DetalleAveriaADComponent', () => {
  let component: DetalleAveriaADComponent;
  let fixture: ComponentFixture<DetalleAveriaADComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetalleAveriaADComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetalleAveriaADComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
