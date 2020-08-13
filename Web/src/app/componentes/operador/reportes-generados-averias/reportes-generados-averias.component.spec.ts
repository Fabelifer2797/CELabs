import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportesGeneradosAveriasComponent } from './reportes-generados-averias.component';

describe('ReportesGeneradosAveriasComponent', () => {
  let component: ReportesGeneradosAveriasComponent;
  let fixture: ComponentFixture<ReportesGeneradosAveriasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReportesGeneradosAveriasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportesGeneradosAveriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
