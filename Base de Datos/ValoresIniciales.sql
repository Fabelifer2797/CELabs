INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
('Luis Diego', 'Noguera Mena', '0000', 'lnoguera@itcr.ac.cr', '----', true, 1);

INSERT INTO  Administrador(idusuario, estado) VALUES (1, true);

INSERT INTO EstadoReserva(info) values
('Reservado'),
('Terminada'),
('Cancelada');

INSERT INTO EstadoAveria(info) values
('Pendiente de atencion'),
('En progreso'),
('Terminada');

INSERT INTO EstadoSolicitud(info) values
('Pendiente de atencion'),
('Aprobada'),
('Rechazada');

INSERT INTO Laboratorio(codigo, aula) VALUES
('Lab-01','F2-09'),
('Lab-02','F2-10');