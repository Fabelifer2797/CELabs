import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReporteAveriaComponent } from './reporte-averia.component';

describe('ReporteAveriaComponent', () => {
  let component: ReporteAveriaComponent;
  let fixture: ComponentFixture<ReporteAveriaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReporteAveriaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReporteAveriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
