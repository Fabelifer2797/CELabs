CREATE OR REPLACE FUNCTION buscarIdUsuario(
    _idXtec TEXT
)
RETURNS INT AS $$
    DECLARE id INTEGER;
    BEGIN
        SELECT idusuario INTO id FROM Usuario
        WHERE idxtec = _idXtec;

        RETURN id;
    END
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearAdministrador(
    _nombre TEXT,
    _apellidos TEXT,
    _idXTEC TEXT,
    _email TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    DECLARE idU INTEGER;
            rolAnterior INT = 0;
            idAdmin INT;
    BEGIN

        SELECT buscarIdUsuario(_idXTEC) INTO idU;

        IF idU IS NULL THEN --Crear nuevo usuario
            INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
            (_nombre,_apellidos, _idXTEC, _email, _telefono, true, 1)
            RETURNING idusuario INTO idU;

        ELSE --Actualizar datos de viejo usuario
            SELECT rolactual INTO rolAnterior FROM Usuario
            WHERE idusuario = idU;

            IF rolAnterior != 1 THEN --Desactivar rol anterior
                IF rolAnterior = 2 THEN
                    UPDATE EDA SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 3 THEN
                    UPDATE Operador SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 4 THEN
                    UPDATE Docente SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 5 THEN
                    UPDATE PA SET estado = false
                    WHERE idusuario = idU;
                END IF;
            END IF;
            --Actualizar datos del usuario viejo
            UPDATE Usuario SET nombre = _nombre, apellidos = _apellidos, email = _email, telefono = _telefono, estado = true, rolactual = 1
            WHERE idusuario = idU;
        END IF;

        SELECT idadministrador INTO idAdmin FROM Administrador
        WHERE idusuario = idU;

        IF idAdmin IS NULL THEN --Registrar nuevo adinistrador
            INSERT INTO Administrador(idusuario, estado) VALUES (idU, true);
        ELSE
            UPDATE Administrador SET estado = true --Reactivar viejo administrador
            WHERE idadministrador = idAdmin;
        END IF;
        RETURN 1;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearEDA(
    _nombre TEXT,
    _apellidos TEXT,
    _idXTEC TEXT,
    _email TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    DECLARE idU INTEGER;
            rolAnterior INT = 0;
            idE INT;
    BEGIN

        SELECT buscarIdUsuario(_idXTEC) INTO idU;

        IF idU IS NULL THEN --Crear nuevo usuario
            INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
            (_nombre,_apellidos, _idXTEC, _email, _telefono, true, 2)
            RETURNING idusuario INTO idU;

        ELSE --Actualizar datos de viejo usuario
            SELECT rolactual INTO rolAnterior FROM Usuario
            WHERE idusuario = idU;

            IF rolAnterior != 2 THEN --Desactivar rol anterior
                IF rolAnterior = 1 THEN
                    UPDATE Administrador SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 3 THEN
                    UPDATE Operador SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 4 THEN
                    UPDATE Docente SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 5 THEN
                    UPDATE PA SET estado = false
                    WHERE idusuario = idU;
                END IF;
            END IF;
            --Actualizar datos del usuario viejo
            UPDATE Usuario SET nombre = _nombre, apellidos = _apellidos, email = _email, telefono = _telefono, estado = true, rolactual = 2
            WHERE idusuario = idU;
        END IF;

        SELECT ideda INTO idE FROM EDA
        WHERE idusuario = idU;

        IF idE IS NULL THEN --Registrar nuevo EDA
            INSERT INTO EDA(idusuario, estado) VALUES (idU, true);
        ELSE
            UPDATE EDA SET estado = true --Reactivar viejo EDA
            WHERE ideda = idE;
        END IF;
        RETURN 1;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearOperador(
    _nombre TEXT,
    _apellidos TEXT,
    _idXTEC TEXT,
    _email TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    DECLARE idU INTEGER;
            rolAnterior INT = 0;
            idOp INT;
    BEGIN

        SELECT buscarIdUsuario(_idXTEC) INTO idU;

        IF idU IS NULL THEN --Crear nuevo usuario
            INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
            (_nombre,_apellidos, _idXTEC, _email, _telefono, true, 3)
            RETURNING idusuario INTO idU;

        ELSE --Actualizar datos de viejo usuario
            SELECT rolactual INTO rolAnterior FROM Usuario
            WHERE idusuario = idU;

            IF rolAnterior != 3 THEN --Desactivar rol anterior
                IF rolAnterior = 1 THEN
                    UPDATE Administrador SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 2 THEN
                    UPDATE EDA SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 4 THEN
                    UPDATE Docente SET estado = false
                    WHERE idusuario = idU;
                ELSEIF rolAnterior = 5 THEN
                    UPDATE PA SET estado = false
                    WHERE idusuario = idU;
                END IF;
            END IF;
            --Actualizar datos del usuario viejo
            UPDATE Usuario SET nombre = _nombre, apellidos = _apellidos, email = _email, telefono = _telefono, estado = true, rolactual = 3
            WHERE idusuario = idU;
        END IF;

        SELECT idoperador INTO idOp FROM Operador
        WHERE idusuario = idU;

        IF idOp IS NULL THEN --Registrar nuevo operador
            INSERT INTO Operador(idusuario, estado) VALUES (idU, true);
        ELSE
            UPDATE Operador SET estado = true --Reactivar viejo operador
            WHERE idoperador = idOp;
        END IF;
        RETURN 1;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearDocente(
    _nombre TEXT,
    _apellidos TEXT,
    _idXTEC TEXT,
    _email TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    DECLARE idU INTEGER;
            estadoAnterior INT = 0;
    BEGIN

        SELECT buscarIdUsuario(_idXTEC) INTO idU;

        IF idU IS NULL THEN --Crear nuevo usuario
            INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
            (_nombre,_apellidos, _idXTEC, _email, _telefono, false, 4)
            RETURNING idusuario INTO idU;

        ELSE --Actualizar datos de viejo usuario
            SELECT estado INTO estadoAnterior FROM Usuario
            WHERE idusuario = idU;

            IF estadoAnterior = true THEN -- Error: Usuario activo del sistema
                RETURN 2;
            ELSE --Actualizar datos del usuario viejo
                UPDATE Usuario SET nombre = _nombre, apellidos = _apellidos, email = _email, telefono = _telefono, estado = false, rolactual = 4
                WHERE idusuario = idU;
            END IF;
        END IF;

        -- Enviar solicitud de cuenta nueva
        INSERT INTO NuevaCuenta(idusuario, fechahora, idestadosolicitud) VALUES (idU, CURRENT_TIMESTAMP, 1);

        RETURN 3;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearPA(
    _nombre TEXT,
    _apellidos TEXT,
    _idXTEC TEXT,
    _email TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    DECLARE idU INTEGER;
            estadoAnterior INT = 0;
    BEGIN

        SELECT buscarIdUsuario(_idXTEC) INTO idU;

        IF idU IS NULL THEN --Crear nuevo usuario
            INSERT INTO Usuario(nombre, apellidos, idxtec, email, telefono, estado, rolactual) VALUES
            (_nombre,_apellidos, _idXTEC, _email, _telefono, false, 5)
            RETURNING idusuario INTO idU;

        ELSE --Actualizar datos de viejo usuario
            SELECT estado INTO estadoAnterior FROM Usuario
            WHERE idusuario = idU;

            IF estadoAnterior = true THEN -- Error: Usuario activo del sistema
                RETURN 2;
            ELSE --Actualizar datos del usuario viejo
                UPDATE Usuario SET nombre = _nombre, apellidos = _apellidos, email = _email, telefono = _telefono, estado = false, rolactual = 5
                WHERE idusuario = idU;
            END IF;
        END IF;

        -- Enviar solicitud de cuenta nueva
        INSERT INTO NuevaCuenta(idusuario, fechahora, idestadosolicitud) VALUES (idU, CURRENT_TIMESTAMP, 1);

        RETURN 3;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearLaboratorio(
    _codigo TEXT,
    _aula TEXT
)
RETURNS VOID AS $$
    BEGIN
        INSERT INTO laboratorio(codigo, aula) VALUES (_codigo, _aula);
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearCurso(
    _codigo TEXT,
    _nombre TEXT
)
RETURNS VOID AS $$
    BEGIN
        INSERT INTO Curso(codigo, nombre) VALUES (_codigo, _nombre);
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearReserva(
    _idOperador INT,
    _idUsuarioReserva INT,
    _fechaReserva DATE,
    _horaInicio TIME,
    _horaFinal TIME,
    _idLaboratorio INT,
    _motivo TEXT,
    _idCurso INT
)
RETURNS INT AS $$
    DECLARE idRes INT;
    BEGIN

        SELECT idreserva INTO idRes FROM Reserva
        WHERE fechareserva = _fechaReserva AND idestadoreserva = 1 AND horainicio <= _horaFinal AND _horaInicio <= horafinal;

        IF idRes IS NULL THEN
            INSERT INTO Reserva(idoperador, idusuario, fechareserva, horainicio, horafinal, fechahorasolicitud, idlaboratorio, idestadoreserva, motivo, idcurso) VALUES
            (_idOperador, _idUsuarioReserva, _fechaReserva, _horaInicio, _horaFinal, CURRENT_TIMESTAMP, _idLaboratorio, 1, _motivo, _idCurso);
            RETURN 4;
        ELSE
            RETURN 5;
        END IF;
    END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearReporteInventario(
    _idOperador INT,
    _idLaboratorio INT,
    _computadorasC INT,
    _computadorasI INT,
    _proyectores INT,
    _sillas INT,
    _extintores INT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO ReporteInventario(idoperador, fechahora, idlaboratorio, computadorasc, computadorasi, proyectores, sillas, extintores) VALUES
        (_idOperador, CURRENT_TIMESTAMP, _idLaboratorio, _computadorasC, _computadorasI, _proyectores, _sillas, _extintores);

        RETURN 6;
    END;

$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearReporteAveria(
    _idOperador INT,
    _idLaboratorio INT,
    _activo TEXT,
    _descripcion TEXT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO ReporteAveria(idoperador, idlaboratorio, idestadoaveria, fechahora, activo, descripcion) VALUES
        (_idOperador, _idLaboratorio, 1, CURRENT_TIMESTAMP, _activo, _descripcion);

        RETURN 6;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearReporteTT(
    _idOperador INT,
    _horaInicio TIME,
    _horaFinal TIME,
    _actividades TEXT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO ReporteTT(idoperador, horainicio, horafinal, fechahora, idestadosolicitud, actividades) VALUES
        (_idOperador, _horaInicio, _horaFinal, CURRENT_TIMESTAMP, 1, _actividades);

        RETURN 6;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearSolicitudRTT(
    _idReporteTT INT,
    _idUsuario INT,
    _idEstadoSolicitud INT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO SolicitudRTT(idreportett, idusuario, fechahorarespuesta, idestadosolicitud) VALUES
        (_idReporteTT, _idUsuario, CURRENT_TIMESTAMP, _idEstadoSolicitud);

        UPDATE ReporteTT
        SET idestadosolicitud = _idEstadoSolicitud
        WHERE idreportett = _idReporteTT;

        RETURN 5 + _idEstadoSolicitud; -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION darSeguimientoAveria(
    _idReporteAveria INT,
    _idUsuario INT,
    _idEstadoAveria INT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO SeguimientoAveria(idreporteaveria, idusuario, idestadoaveria, fechahora) VALUES
        (_idReporteAveria, _idUsuario, _idEstadoAveria, CURRENT_TIMESTAMP);

        UPDATE reporteaveria
        SET idestadoaveria = _idEstadoAveria
        WHERE idreporteaveria = _idReporteAveria;

        RETURN 9;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearPalmada(
    _idOperador INT,
    _fechaHoraI TIMESTAMP,
    _fechaHoraF TIMESTAMP,
    _idLaboratorio INT
)
RETURNS INT AS $$
    DECLARE idPal INT;
    BEGIN
        SELECT idpalmada INTO idPal FROM Palmada
        WHERE fechahorai <= _fechaHoraF AND _fechaHoraI <= fechahoraf;

        IF idPal IS NULL THEN
            INSERT INTO Palmada(idoperador, fechahorai, fechahoraf, fechahorasolicitud, idlaboratorio, idestadosolicitud) VALUES
            (_idOperador, _fechaHoraI, _fechaHoraF, CURRENT_TIMESTAMP, _idLaboratorio, 1);
            RETURN 4;
        ELSE
            RETURN 5;
        END IF;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearSolicitudPalmada(
    _idPalmada INT,
    _idAdministrador INT,
    _idEstadoSolicitud INT
)
RETURNS INT AS $$
    BEGIN
       INSERT INTO SolicitudPalmada(idpalmada, idadministrador, fechahorarespuesta, idestadosolicitud) VALUES
        (_idPalmada, _idAdministrador, CURRENT_TIMESTAMP, _idEstadoSolicitud);

       UPDATE Palmada
       SET idestadosolicitud = _idEstadoSolicitud
       WHERE idpalmada = _idPalmada;

       RETURN 5 + _idEstadoSolicitud; -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
    END;
    $$
LANGUAGE plpgsql;

CREATE FUNCTION crearSolicitudCuenta(
    _idCuenta INT,
    _idAdministrador INT,
    _idEstadoSolicitud INT
)
RETURNS INT AS $$
    DECLARE _idUsuario INT;
            rol INT;
    BEGIN

        INSERT INTO solicitudcuenta(idcuenta, idadministrador, fechahorarespuesta, idestadosolicitud)  VALUES
        (_idCuenta, _idAdministrador, CURRENT_TIMESTAMP, _idEstadoSolicitud);

        UPDATE NuevaCuenta
        SET idestadosolicitud = _idEstadoSolicitud
        WHERE idcuenta = _idCuenta
        RETURNING idusuario INTO _idUsuario;

        IF _idEstadoSolicitud = 2 THEN
            UPDATE Usuario
            SET estado = true
            WHERE idusuario = _idUsuario
            RETURNING rolactual INTO rol;

            IF rol = 4 THEN
                UPDATE Docente
                SET estado = true
                WHERE idusuario = _idUsuario;
            ELSE
                UPDATE EDA
                SET estado = true
                WHERE idusuario = _idUsuario;
            END IF;
        END IF;
    RETURN 5 + _idEstadoSolicitud; -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearHorario(
    _horaInicioLunes TIME,
    _horaFinalLunes TIME,
    _horaInicioMartes TIME,
    _horaFinalMartes TIME,
    _horaInicioMiercoles TIME,
    _horaFinalMiercoles TIME,
    _horaInicioJueves TIME,
    _horaFinalJueves TIME,
    _horaInicioViernes TIME,
    _horaFinalViernes TIME,
    _fechaInicio DATE,
    _fechaFinal DATE,
    _idAdministrador INT
)
RETURNS INT AS $$
    DECLARE idHor INT;
    BEGIN
        SELECT idHorario INTO idHor FROM horario
        WHERE fechainicio <= _fechaFinal AND _fechaInicio <= fechafinal;

        IF idHor IS NULL THEN
            INSERT INTO Horario(horainiciolunes, horafinallunes, horainiciomartes, horafinalmartes, horainiciomiercoles, horafinalmiercoles, horainiciojueves, horafinaljueves, horainicioviernes, horafinalviernes, fechainicio, fechafinal, idadministrador) VALUES
            (_horaInicioLunes, _horaFinalLunes, _horaInicioMartes, _horaFinalMartes, _horaInicioMiercoles, _horaFinalMiercoles, _horaInicioJueves, _horaFinalJueves, _horaInicioViernes, _horaFinalViernes, _fechaInicio, _fechaFinal, _idAdministrador);
            RETURN 10;
        ELSE
            RETURN 11;
        END IF;
    END;
    $$
LANGUAGE plpgsql;
---------------------------------------------------------------
select crearEDA('Oscar', 'Arias', '2017094138', '@gmail.com', '8888');

select crearOperador('Jose', 'a', '2000', '@', '123');
select crearDocente('a','b','10','@','1');
select crearCurso('intro','a');
select crearLaboratorio('1','f2-10');

select crearReserva(null, 1, '2020 8 6', '10:00:00', '12:00:00', 1, 'examen', 1);
select crearReserva(1, 1, '2020 8 4', '12:00:01', '14:00:00', 1, 'examen', 1);
select crearReserva(1, 1, '2020 8 5', '9:00:01', '15:00:00', 1, 'examen', 1);

select * from administrador;

select * from usuario;

select * from docente;

select * from eda;

select * from operador;

select * from reserva;

SELECT COUNT(*) FROM USUARIO;

insert into docente(idusuario, estado) VALUES (1, true);

