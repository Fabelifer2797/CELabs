import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HomeOperadorComponent } from './home-operador.component';

describe('HomeOperadorComponent', () => {
  let component: HomeOperadorComponent;
  let fixture: ComponentFixture<HomeOperadorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HomeOperadorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HomeOperadorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
