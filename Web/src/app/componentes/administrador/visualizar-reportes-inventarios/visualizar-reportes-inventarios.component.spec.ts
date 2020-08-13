import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VisualizarReportesInventariosComponent } from './visualizar-reportes-inventarios.component';

describe('VisualizarReportesInventariosComponent', () => {
  let component: VisualizarReportesInventariosComponent;
  let fixture: ComponentFixture<VisualizarReportesInventariosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VisualizarReportesInventariosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VisualizarReportesInventariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
