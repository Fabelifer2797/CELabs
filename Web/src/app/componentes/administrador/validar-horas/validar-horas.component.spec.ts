import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ValidarHorasComponent } from './validar-horas.component';

describe('ValidarHorasComponent', () => {
  let component: ValidarHorasComponent;
  let fixture: ComponentFixture<ValidarHorasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ValidarHorasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ValidarHorasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
