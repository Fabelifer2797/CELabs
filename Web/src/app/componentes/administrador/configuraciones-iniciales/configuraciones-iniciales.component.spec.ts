import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfiguracionesInicialesComponent } from './configuraciones-iniciales.component';

describe('ConfiguracionesInicialesComponent', () => {
  let component: ConfiguracionesInicialesComponent;
  let fixture: ComponentFixture<ConfiguracionesInicialesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfiguracionesInicialesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfiguracionesInicialesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
