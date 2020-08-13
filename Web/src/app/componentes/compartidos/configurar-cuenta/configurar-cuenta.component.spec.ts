import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurarCuentaComponent } from './configurar-cuenta.component';

describe('ConfigurarCuentaComponent', () => {
  let component: ConfigurarCuentaComponent;
  let fixture: ComponentFixture<ConfigurarCuentaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurarCuentaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurarCuentaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
