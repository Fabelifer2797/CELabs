import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ContenidoPrincipalComponent } from './contenido-principal.component';

describe('ContenidoPrincipalComponent', () => {
  let component: ContenidoPrincipalComponent;
  let fixture: ComponentFixture<ContenidoPrincipalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ContenidoPrincipalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ContenidoPrincipalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
