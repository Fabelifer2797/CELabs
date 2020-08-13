import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrarTiempoComponent } from './registrar-tiempo.component';

describe('RegistrarTiempoComponent', () => {
  let component: RegistrarTiempoComponent;
  let fixture: ComponentFixture<RegistrarTiempoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistrarTiempoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrarTiempoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
