INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
('Luis Diego', 'Noguera Mena', '----', 'lnoguera@itcr.ac.cr', '----', true, 1);

INSERT INTO  Administrador(idusuario, estado) VALUES (1, true);

INSERT INTO EstadoReserva(info) values
('Reservada'),
('Terminada'),
('Cancelada');

INSERT INTO EstadoAveria(info) values
('Pendiente de atencion'),
('En proceso'),
('Terminada');

INSERT INTO EstadoSolicitud(info) values
('Pendiente de atencion'),
('Aprobada'),
('Rechazada');

INSERT INTO Laboratorio(codigo, aula) VALUES
('Lab-01','F2-09'),
('Lab-02','F2-10');

INSERT INTO CorreoSeguridad(correo, estado) VALUES
('seguridad@XTEC.com',true);

INSERT INTO MotivoCorreo(motivo) VALUES
('Reserva Aprobada'),
('Palmada Aprobada'),
('Palmada Cancelada');

INSERT INTO Curso(codigonombre) VALUES
('CE2003: Curso de ejemplo de CE')
