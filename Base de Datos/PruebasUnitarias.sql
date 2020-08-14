SELECT crearHorario('7:30:00', '17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','2020-4-20', '2021-8-30', 1);
SELECT crearHorario('7:30:00', '17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','2020-4-20', '2021-8-25', 1);


SELECT crearreportett(1,'13:00:00', '2:55:00', 'Realizar reportes');


SELECT crearReserva(1,5,'2020-8-14','13:00:00','14:00:00',2,'Clase corta',1);
SELECT crearReserva(1,5,'2020-8-14','15:00:00','16:00:00',2,'Clase corta',1);
SELECT crearReserva(1,5,'2020-8-14','23:00:00','23:50:00',2,'Clase corta',1);
SELECT crearReserva(1,5,'2020-8-14','10:00:00','13:50:00',2,'Clase corta',1);
SELECT crearReserva(1,5,'2020-8-14','10:00:00','13:50:00',1,'Clase corta # ',1);
SELECT crearReserva(1,5,'2020-8-15','10:00:00','13:50:00',1,'Clase corta # ',1);


SELECT crearPalmada(1,1,'2020-8-14 20:00:00', '2020-8-15 4:00:00',2,'Proyecto');
SELECT crearPalmada(1,1,'2020-8-18 10:00:00', '2020-8-19 4:00:00',2,'Proyecto');
SELECT crearPalmada(1,1,'2020-8-16 10:00:00', '2020-8-17 4:00:00',2,'Proyecto');


SELECT verReservas('2020-8-10', '2020-8-16',1);
SELECT verReservas('2020-8-10', '2020-8-16',2);


SELECT verMisReservas('2020-8-10', '2020-8-16',1,1);
SELECT verMisReservas('2020-8-10', '2020-8-16',1,2);
SELECT verMisReservas('2020-8-10', '2020-8-16',2,2);


SELECT verdashboardadmin('2020-8-1');
SELECT verdashboardadmin('2020-7-1');




