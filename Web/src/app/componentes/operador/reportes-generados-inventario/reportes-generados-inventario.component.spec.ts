import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportesGeneradosInventarioComponent } from './reportes-generados-inventario.component';

describe('ReportesGeneradosInventarioComponent', () => {
  let component: ReportesGeneradosInventarioComponent;
  let fixture: ComponentFixture<ReportesGeneradosInventarioComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReportesGeneradosInventarioComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportesGeneradosInventarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
