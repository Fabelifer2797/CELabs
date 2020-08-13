import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReservaLabComponent } from './reserva-lab.component';

describe('ReservaLabComponent', () => {
  let component: ReservaLabComponent;
  let fixture: ComponentFixture<ReservaLabComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReservaLabComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReservaLabComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
