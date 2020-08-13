import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FormSatisfaccionComponent } from './form-satisfaccion.component';

describe('FormSatisfaccionComponent', () => {
  let component: FormSatisfaccionComponent;
  let fixture: ComponentFixture<FormSatisfaccionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FormSatisfaccionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FormSatisfaccionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
