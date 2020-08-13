import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VisualizarReportesAveriasComponent } from './visualizar-reportes-averias.component';

describe('VisualizarReportesAveriasComponent', () => {
  let component: VisualizarReportesAveriasComponent;
  let fixture: ComponentFixture<VisualizarReportesAveriasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VisualizarReportesAveriasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VisualizarReportesAveriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
