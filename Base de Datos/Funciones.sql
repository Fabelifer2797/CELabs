SET TIMEZONE TO 'GMT';

CREATE OR REPLACE FUNCTION buscarIdUsuario( -- Retorna el idUsuario que posee el idXTEC ingresado
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
        INSERT INTO NuevaCuenta(idusuario, fechahora, idestadosolicitud) VALUES (idU, CURRENT_TIMESTAMP AT TIME ZONE 'CST', 1);

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
        INSERT INTO NuevaCuenta(idusuario, fechahora, idestadosolicitud) VALUES (idU, CURRENT_TIMESTAMP AT TIME ZONE 'CST', 1);

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
    _codigoNombre TEXT
)
RETURNS VOID AS $$
    BEGIN
        INSERT INTO Curso(codigonombre) VALUES (_codigoNombre);
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
            diaSemana INT;
            _fecha timestamp = _fechaReserva + _horaInicio;
            _y  INT = EXTRACT(YEAR FROM _fecha);
            _m INT = EXTRACT(MONTH FROM _fecha);
            _d INT = EXTRACT(DAY FROM _fecha);
            _idHorario INT;
    BEGIN
        SELECT idhorario INTO _idHorario FROM horario
        WHERE fechainicio < _fechaReserva AND fechafinal > _fechaReserva;

        IF _idHorario IS NULL THEN
            RETURN 16; -- Reserva fuera de las fechas de horario
        END IF;

        SELECT validarDiaSemana(_y, _m, _d) INTO diaSemana;

        IF diaSemana = 0 OR diaSemana = 6 THEN -- Valida que la reserva se realice entre los dias y las horas del horario especificadas
            RETURN 17; -- La reserva es en un fin de semana
        ELSEIF diaSemana = 1 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciolunes < _horaInicio AND horafinallunes > _horaFinal;
        ELSEIF diaSemana = 2 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciomartes < _horaInicio AND horafinalmartes > _horaFinal;
        ELSEIF diaSemana = 3 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciomiercoles < _horaInicio AND horafinalmiercoles > _horaFinal;
        ELSEIF diaSemana = 4 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciojueves < _horaInicio AND horafinaljueves > _horaFinal;
        ELSE
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainicioviernes < _horaInicio AND horafinalviernes > _horaFinal;
        END IF;

        IF _idHorario IS NULL THEN
            RETURN 18; -- Reservación fuera del horario de trabajo
        END IF;

        SELECT idreserva INTO idRes FROM Reserva
        WHERE fechareserva = _fechaReserva AND idestadoreserva = 1 AND horainicio <= _horaFinal AND _horaInicio <= horafinal AND idlaboratorio = _idLaboratorio;

        IF idRes IS NULL THEN
            INSERT INTO Reserva(idoperador, idusuario, fechareserva, horainicio, horafinal, fechahorasolicitud, idlaboratorio, idestadoreserva, motivo, idcurso) VALUES
            (_idOperador, _idUsuarioReserva, _fechaReserva, _horaInicio, _horaFinal, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, 1, _motivo, _idCurso);
            RETURN 4; -- Nueva reserva creada
        ELSE
            RETURN 5; -- Reserva choca con otra
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
        (_idOperador, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, _computadorasC, _computadorasI, _proyectores, _sillas, _extintores);

        RETURN 6; -- Reporte creado
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
        (_idOperador, _idLaboratorio, 1, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _activo, _descripcion);

        RETURN 6; -- Reporte creado
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
        (_idOperador, _horaInicio, _horaFinal, CURRENT_TIMESTAMP AT TIME ZONE 'CST', 1, _actividades);

        RETURN 6; -- Reporte creado
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarSolicitudRTT(
    _idReporteTT INT,
    _idUsuario INT,
    _idEstadoSolicitud INT
)
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Se guarda el registro del cambio de estado en la solicitud ingresada
        INSERT INTO SolicitudRTT(idreportett, idusuario, fechahorarespuesta, idestadosolicitud) VALUES
        (_idReporteTT, _idUsuario, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idEstadoSolicitud);
        -- Se cambia el estado del reporte
        UPDATE ReporteTT
        SET idestadosolicitud = _idEstadoSolicitud
        WHERE idreportett = _idReporteTT;

        -- Se retorna un json con el codigo de ejecucuióon (7: Solicitud Aprobada, 8: Solicitud Rechazada),
        -- el carnet del operador que realizó el trabajo en el lab y las horas laboradas para ser enviados a la BD de Becas
        SELECT to_json(r) INTO j FROM (SELECT * FROM   (SELECT R.idestadosolicitud + 5 AS codigoCELabs, U.idXTEC FROM ReporteTT R  -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
                        INNER JOIN Operador O on R.idoperador = O.idoperador
                        INNER JOIN Usuario U on o.idusuario = U.idusuario
                        WHERE idreportett = _idReporteTT) a,

                        (SELECT RTT.horafinal - RTT.horainicio AS tiempototal FROM reportett RTT
                        WHERE RTT.idreportett = _idReporteTT AND idestadosolicitud = 2) b) r ;

        RETURN j;
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
        -- Se guarda el registro del cambio de estado en la solicitud ingresada
        INSERT INTO SeguimientoAveria(idreporteaveria, idusuario, idestadoaveria, fechahora) VALUES
        (_idReporteAveria, _idUsuario, _idEstadoAveria, CURRENT_TIMESTAMP AT TIME ZONE 'CST');
        -- Se cambia el estado del reporte
        UPDATE reporteaveria
        SET idestadoaveria = _idEstadoAveria
        WHERE idreporteaveria = _idReporteAveria;

        RETURN 9;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearPalmada(
    _idOperador INT,
    _idUsuario INT,
    _fechaHoraI TIMESTAMP,
    _fechaHoraF TIMESTAMP,
    _idLaboratorio INT,
    _motivo TEXT
)
RETURNS INT AS $$
    DECLARE idPal INT;
            diaSemana INT;
            _y  INT = EXTRACT(YEAR FROM _fechaHoraI);
            _m INT = EXTRACT(MONTH FROM _fechaHoraI);
            _d INT = EXTRACT(DAY FROM _fechaHoraI);
            _idHorario INT;
            _horaI TIME = _fechaHoraI::TIME;
            _horaF TIME = _fechaHoraF::TIME;
    BEGIN

        SELECT idhorario INTO _idHorario FROM horario
        WHERE fechainicio < _fechaHoraI AND fechafinal > _fechaHoraI;

        IF _idHorario IS NULL THEN
            RETURN 16; -- Reserva fuera de las fechas de horario
        END IF;

        SELECT validarDiaSemana(_y, _m, _d) INTO diaSemana;

        IF diaSemana = 1 THEN  -- Valida que la reserva se realice fuera de las horas del horario especificadas
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciomartes > _horaF AND horafinallunes < _horaI;
        ELSEIF diaSemana = 2 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciomiercoles > _horaF AND horafinalmartes < _horaI;
        ELSEIF diaSemana = 3 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciojueves > _horaF AND horafinalmiercoles < _horaI;
        ELSEIF diaSemana = 4 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainicioviernes > _horaF AND horafinaljueves < _horaI;
        ELSEIF diaSemana = 5 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horafinalviernes < _horaI;
        ELSEIF diaSemana = 0 THEN
            SELECT idhorario INTO _idHorario FROM Horario
            WHERE horainiciolunes > _horaF;
        END IF;

        IF _idHorario IS NULL THEN
            RETURN 19; -- La palmada no se puede reservar durante las horas de trabajo regulares
        END IF;

        SELECT idpalmada INTO idPal FROM Palmada
        WHERE fechahorai <= _fechaHoraF AND _fechaHoraI <= fechahoraf AND idestadosolicitud = 2 AND idlaboratorio = _idLaboratorio;

        IF idPal IS NULL THEN
            INSERT INTO Palmada(idoperador, idusuario, fechahorai, fechahoraf, fechahorasolicitud, idlaboratorio, idestadosolicitud, motivo) VALUES
            (_idOperador, _idUsuario, _fechaHoraI, _fechaHoraF, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, 1, _motivo);
            RETURN 24; -- Se crea la palmada
        ELSE
            RETURN 5; -- La palmada presenta choque de horas con otra
        END IF;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarSolicitudPalmada(
    _idPalmada INT,
    _idAdministrador INT,
    _idEstadoSolicitud INT
)
RETURNS INT AS $$
    BEGIN
        -- Se guarda el registro del cambio de estado
       INSERT INTO SolicitudPalmada(idpalmada, idadministrador, fechahorarespuesta, idestadosolicitud) VALUES
        (_idPalmada, _idAdministrador, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idEstadoSolicitud);

       UPDATE Palmada
       SET idestadosolicitud = _idEstadoSolicitud
       WHERE idpalmada = _idPalmada;

       RETURN 5 + _idEstadoSolicitud; -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarSolicitudCuenta(
    _idCuenta INT,
    _idAdministrador INT,
    _idEstadoSolicitud INT
)
RETURNS INT AS $$
    DECLARE _idUsuario INT;
            rol INT;
            _idRol INT;
    BEGIN
        -- Se guarda el registro del cambio de estado de la solicitud
        INSERT INTO solicitudcuenta(idcuenta, idadministrador, fechahorarespuesta, idestadosolicitud)  VALUES
        (_idCuenta, _idAdministrador, CURRENT_TIMESTAMP, _idEstadoSolicitud);
        -- Se actualiza el estado de la nueva cuenta
        UPDATE NuevaCuenta
        SET idestadosolicitud = _idEstadoSolicitud
        WHERE idcuenta = _idCuenta
        RETURNING idusuario INTO _idUsuario;

        IF _idEstadoSolicitud = 2 THEN -- Cuenta aprobada
            -- se activa el estado del usuario
            UPDATE Usuario
            SET estado = true
            WHERE idusuario = _idUsuario
            RETURNING rolactual INTO rol;

            -- Se agrega el nuevo usuario a su rol respectivo o se actualiza si ya es existente
            IF rol = 4 THEN
                SELECT idDocente INTO _idRol FROM Docente
                WHERE idusuario = _idUsuario;

                IF _idRol IS NULL THEN
                    INSERT INTO Docente(idusuario, estado) VALUES
                    (_idUsuario, true);
                ELSE
                    UPDATE Docente
                    SET estado = true
                    WHERE idusuario = _idUsuario;
                END IF;

            ELSE
                SELECT idEDA INTO _idRol FROM EDA
                WHERE idusuario = _idUsuario;

                IF _idRol IS NULL THEN
                    INSERT INTO EDA(idusuario, estado) VALUES
                    (_idUsuario, true);
                ELSE
                    UPDATE EDA
                    SET estado = true
                    WHERE idusuario = _idUsuario;
                END IF;
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
            RETURN 10; -- Se crea el nuevo horario de trabajo
        ELSE
            RETURN 11; -- Horario de trabajo presenta choques
        END IF;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION crearEstadoAveria(
    _info INT
)
RETURNS INT AS $$
    BEGIN
        INSERT INTO EstadoAveria(info) VALUES (_info);
        RETURN 20;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarUsuario(
    _idUsuario INT,
    _nombre TEXT,
    _apellidos TEXT,
    _telefono TEXT
)
RETURNS INT AS $$
    BEGIN
        -- Actualiza los datos del usuario
        UPDATE Usuario
        SET nombre = _nombre, apellidos = _apellidos, telefono = _telefono
        WHERE idusuario = _idUsuario;

        RETURN 12;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION desactivarUsuario(
    _idUsuario INT
)
RETURNS INT AS $$
    DECLARE rol INT;
            cantAdmins INT;
    BEGIN
        SELECT rolactual INTO rol FROM Usuario
        WHERE idusuario = _idUsuario;

        IF rol != 1 THEN --Desactivar rol anterior
            IF rol = 2 THEN
                UPDATE EDA SET estado = false
                WHERE idusuario = _idUsuario;
            ELSEIF rol = 3 THEN
                UPDATE Operador SET estado = false
                WHERE idusuario = _idUsuario;
            ELSEIF rol = 4 THEN
                UPDATE Docente SET estado = false
                WHERE idusuario = _idUsuario;
            ELSEIF rol = 5 THEN
                UPDATE PA SET estado = false
                WHERE idusuario = _idUsuario;
            END IF;
        ELSE
            SELECT count(*) INTO cantAdmins FROM Administrador
            WHERE estado = true;

            IF cantAdmins = 1 THEN
                RETURN 13; -- El usuario no se puede desactivar ya que es el ultimo administrador del sistema
            ELSE
                UPDATE Administrador SET estado = false
                WHERE idusuario = _idUsuario;
            END IF;

        END IF;
        -- Se desactiva el usuario
        UPDATE Usuario
        SET estado = false
        WHERE idusuario = _idUsuario;

        RETURN 14; -- Usuario desactivado
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdRol( -- Obtiene el id del rol asignado a ese usuario
    _idUsuario INT
)RETURNS INT AS $$
    DECLARE idRol INT = 0;
            rol INT = 0;
    BEGIN
        SELECT CAST(rolactual AS INT) INTO rol FROM Usuario
        WHERE idusuario = _idUsuario;

        IF rol = 1 THEN
            SELECT idadministrador INTO idRol FROM Administrador
            WHERE idusuario = _idUsuario;
        ELSEIF rol = 2 THEN
            SELECT ideda INTO idRol FROM EDA
            WHERE idusuario = _idUsuario;
        ELSEIF rol = 3 THEN
            SELECT idoperador INTO idRol FROM Operador
            WHERE idusuario = _idUsuario;
        ELSEIF rol = 4 THEN
            SELECT iddocente INTO idRol FROM Docente
            WHERE idusuario = _idUsuario;
        ELSE
            SELECT idpa INTO idRol FROM PA
            WHERE idusuario = _idUsuario;
        END IF;

        RETURN idRol;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION buscarCorreo( -- Obtiene el correo del usuario ingresado
    _idUsuario INT
)
RETURNS TEXT AS $$
    DECLARE _correo INT;
    BEGIN
        SELECT email INTO _correo FROM Usuario
        WHERE idusuario = _idUsuario;

        RETURN _correo;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION buscarCorreoSeguridad( -- Obtiene el correo del personal de seguridad
)
RETURNS TEXT AS $$
    DECLARE _correo INT;
    BEGIN
        SELECT correo INTO _correo FROM CorreoSeguridad
        WHERE estado = true
        LIMIT 1;

        RETURN _correo;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION registrarCorreoEnviado(
    _correo TEXT,
    _idMotivoCorreo INT
)
RETURNS INT AS $$
    BEGIN
        -- Guarda el registro del correo enviado
        INSERT INTO RegistroCorreos(correo, fechahora, idmotivocorreo) VALUES
        (_correo, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idMotivoCorreo);

        RETURN 15;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validarDiaSemana(
    _ano INT,
    _mes INT,
    _dia INT
)
RETURNS INT AS $$
    DECLARE t int array[12] = '{ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 }';
    BEGIN
        IF _mes < 3 THEN
            _ano = _ano - 1;
        END IF;
        RETURN ((_ano + _ano / 4 - _ano / 100 + _ano / 400 + t[_mes] + _dia) % 7);
        -- D:0, L:1, K:2, M:3, J:4, V:5, S:6

    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verReportesInventario(
    _pagina INT
)
RETURNS json AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
            j json;
    BEGIN
        -- Retorna un json con 10 reportes de inventario, ordenados de mas nuevo a mas viejo
        SELECT json_agg(r) into j FROM (SELECT RI.idresporteinv, RI.fechahora, U.nombre AS nombreOperador, U.apellidos AS apellidosOperador, L.codigo AS codigoLab, RI.computadorasc, RI.computadorasi, RI.proyectores, RI.sillas, RI.extintores
                FROM ReporteInventario RI
                INNER JOIN Operador O on RI.idoperador = O.idoperador
                INNER JOIN Usuario U on O.idusuario = U.idusuario
                INNER JOIN Laboratorio L on RI.idlaboratorio = L.idlaboratorio
                ORDER BY fechahora DESC
                LIMIT 10
                OFFSET _offset) r;

        RETURN j;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verReportesAverias(
    _pagina INT
)
RETURNS json AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
            j json;
    BEGIN
        -- Retorna un json con 10 reportes de averias, ordenados de la mas nueva a la mas vieja y por su estado
        SELECT json_agg(r) into j FROM (SELECT RA.fechahora, RA.idreporteaveria, U.nombre AS nombreOperador, U.apellidos AS apellidosOperador, L.codigo AS codigoLab, RA.activo, E.info AS estado, RA.descripcion
                FROM ReporteAveria RA
                INNER JOIN Operador O on RA.idoperador = O.idoperador
                INNER JOIN Usuario U on O.idusuario = U.idusuario
                INNER JOIN Laboratorio L on RA.idlaboratorio = L.idlaboratorio
                INNER JOIN estadoaveria E on RA.idestadoaveria = E.idestadoaveria
                ORDER BY E.idestadoaveria, RA.fechahora DESC
                LIMIT 10
                OFFSET _offset) r;

        RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verHorasReservadasTR(
)
RETURNS json AS $$
    DECLARE _now TIMESTAMP = CURRENT_TIMESTAMP AT TIME ZONE 'CST';
            j json;
    BEGIN
        -- Retorna un json con la reserva actual de cada laboratorio, si el lab se omite significa que no hay reservas
        SELECT json_agg(r) into j FROM (SELECT L.idlaboratorio, L.codigo AS codigolab, L.aula AS aulalab, C.codigoNombre AS codigonombrecurso, R.horainicio, R.horafinal
                FROM Reserva R
                INNER JOIN Laboratorio L on R.idlaboratorio = L.idlaboratorio
                INNER JOIN Curso C on R.idcurso = C.idcurso
                WHERE R.fechareserva = _now::DATE AND R.horainicio < _now::TIME AND R.horafinal > _now::TIME AND R.idestadoreserva = 1
                ORDER BY L.idlaboratorio) r;

        RETURN j;
    END;

$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cancelarReserva(
    _idReserva INT
)RETURNS INT AS $$
    BEGIN
        UPDATE Reserva
        SET idestadoreserva = 3
        WHERE idreserva = _idReserva;

        RETURN 21; -- Se cancela la reserva
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cancelarPalmada(
    _idPalmada INT
)RETURNS INT AS $$
    BEGIN
        UPDATE Palmada
        SET idestadosolicitud = 3
        WHERE idpalmada = _idPalmada;

        RETURN 22; -- Se cancela la palmada
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verEstadosAveria()
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con los estados de avería existentes
        SELECT json_agg(r) into j FROM (SELECT E.idestadoaveria, E.info FROM EstadoAveria E) r;
        RETURN j;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verEstadosSolicitud()
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con los estados de solicitud existentes
        SELECT json_agg(r) into j FROM (SELECT E.idEstadoSolicitud, E.info FROM EstadoSolicitud E) r;
        RETURN j;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verLaboratorios()
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con los laboratorios
        SELECT json_agg(r) into j FROM (SELECT L.idlaboratorio AS idlab, L.codigo, L.aula FROM Laboratorio L) r;
        RETURN j;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verCursos()
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con los cursos
        SELECT json_agg(r) into j FROM (SELECT idCurso, codigoNombre FROM Curso) r;
        RETURN j;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesCuenta(
    _pagina INT
)
RETURNS json AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
            j json;
    BEGIN
        -- Retorna un json con 10 solicitudes de cuenta, ordenados de la mas nueva a la mas vieja
        SELECT json_agg(r) into j FROM (SELECT NC.idcuenta AS idNuevaCuenta, NC.fechahora, U.nombre, U.apellidos, U.idxtec, U.email
                FROM NuevaCuenta NC
                INNER JOIN Usuario U on NC.idusuario = U.idusuario
                WHERE NC.idestadosolicitud = 1
                ORDER BY NC.fechahora DESC
                LIMIT 10
                OFFSET _offset) r;
        RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesRTT(
    _pagina INT
)
RETURNS json AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
            j json;
    BEGIN
        -- Retorna un json con 10 reportes de tiempo trabajado, ordenados del mas nuevo al mas viejo
        SELECT json_agg(r) into j FROM (SELECT R.idreportett, R.fechahora, O.idoperador, U.nombre, U.apellidos, R.horainicio, R.horafinal, R.actividades
                FROM ReporteTT R
                INNER JOIN Operador O on R.idoperador = O.idoperador
                INNER JOIN Usuario U on O.idusuario = U.idusuario
                WHERE R.idestadosolicitud = 1
                ORDER BY R.fechahora DESC
                LIMIT 10
                OFFSET _offset) r;
        RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesPalmada(
    _pagina INT
)
RETURNS json AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
            j json;
    BEGIN
        -- Retorna un json con 10 solicitudes de palmada, ordenados de la mas nueva a la mas vieja
        SELECT json_agg(r) into j FROM (SELECT P.idpalmada, P.fechahorasolicitud, O.idoperador, U.nombre AS nombreOperador, U.apellidos AS apellidosOperador, P.fechahorai, P.fechahoraf, P.motivo, L.idlaboratorio AS idLab, L.codigo AS codigolab
                FROM Palmada P
                INNER JOIN Laboratorio L on P.idlaboratorio = L.idlaboratorio
                INNER JOIN Operador O on P.idoperador = O.idoperador
                INNER JOIN Usuario U on O.idusuario = U.idusuario
                WHERE P.idestadosolicitud = 1
                ORDER BY P.fechahorasolicitud DESC
                LIMIT 10
                OFFSET _offset) r;
        RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verReservas(
    _fechaLunes DATE,
    _fechaDomingo DATE,
    _idLaboratorio INT
)RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con todas las reservas existentes en un lab entre la fecha inicial (_fechaLunes) y la fecha final (_fehcaDomingo)
        SELECT json_agg(r) into j FROM (SELECT R.idreserva, R.horainicio, R.horafinal, R.fechareserva, C.idcurso, C.codigoNombre AS codigonombrecurso, R.idestadoreserva
                FROM Reserva R
                INNER JOIN laboratorio l on R.idlaboratorio = l.idlaboratorio
                INNER JOIN curso c on R.idcurso = c.idcurso
                WHERE R.fechareserva >= _fechaLunes AND R.fechareserva <= _fechaDomingo AND (R.idestadoreserva = 1 OR R.idestadoreserva = 2) AND L.idlaboratorio = _idLaboratorio
                ORDER BY R.fechareserva) r;
        RETURN  j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verMisReservas(
    _fechaLunes DATE,
    _fechaDomingo DATE,
    _idDocente INT,
    _idLaboratorio INT
)RETURNS json AS $$
    DECLARE j json;
    BEGIN
        -- Retorna un json con todas las reservas del docente existentes en un lab entre la fecha inicial (_fechaLunes) y la fecha final (_fehcaDomingo)
        SELECT json_agg(r) into j FROM (SELECT R.idreserva, R.horainicio, R.horafinal, R.fechareserva, C.idcurso, C.codigoNombre AS codigonombrecurso, R.idestadoreserva
                FROM Reserva R
                INNER JOIN Laboratorio L on R.idlaboratorio = L.idlaboratorio
                INNER JOIN Curso C on R.idcurso = C.idcurso
                INNER JOIN Usuario U on R.idusuario = U.idusuario
                INNER JOIN Docente D on U.idusuario = D.idusuario
                WHERE R.fechareserva >= _fechaLunes AND R.fechareserva <= _fechaDomingo AND D.iddocente = _idDocente AND L.idlaboratorio = _idLaboratorio
                ORDER BY R.fechareserva) r;
        RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION logIn(
    _idXTEC TEXT
)
RETURNS json AS $$
    DECLARE _idUsuario INT;
            j json;
    BEGIN
        SELECT buscarIdUsuario(_idXTEC) INTO _idUsuario;

        -- Retorna un json con el idUsuario, su rol en el sistema y su id de ese rol
        SELECT json_agg(r) into j FROM (SELECT * FROM (SELECT U.idusuario, U.rolactual FROM Usuario U
                                        WHERE U.idusuario = _idUsuario) a,
                                        (SELECT getIdRol(_idUsuario) AS idRol) b) r;
        RETURN j;
    END;$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verMiTT(
    _idOperador INT
)RETURNS INTERVAL AS $$
    DECLARE total INTERVAL;
    BEGIN
        SELECT SUM(RTT.horafinal - RTT.horainicio) INTO total FROM reportett RTT
        WHERE RTT.idoperador = _idOperador AND RTT.idestadosolicitud = 2;

        RETURN total;
    END;$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verDashboardAdmin(
    _yearMonth TIMESTAMP
)
RETURNS json AS $$
    DECLARE j json;
    BEGIN
        SELECT json_agg(r) into j FROM (SELECT * FROM (SELECT CAST((SUM(FS.valor)/COUNT(FS.idfsatisfaccion)) AS DOUBLE PRECISION) AS promedioSatisfaccionMensual FROM fsatisfaccion FS
                               WHERE EXTRACT(YEAR FROM FS.fechahora) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM FS.fechahora) = EXTRACT(MONTH FROM _yearMonth)) a,

                              (SELECT  CAST(COUNT(R.idreserva)/30.0 AS DOUBLE PRECISION) AS promedioReservasDiariasMensuales FROM Reserva R
                               WHERE EXTRACT(YEAR FROM R.fechareserva) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM R.fechareserva) = EXTRACT(MONTH FROM _yearMonth)) b,

                              (SELECT  CAST(COUNT(P.idpalmada)/2.0 AS DOUBLE PRECISION) AS promedioPalmadasQuincenales FROM Palmada P
                               WHERE EXTRACT(YEAR FROM P.fechahorai) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM P.fechahorai) = EXTRACT(MONTH FROM _yearMonth)) c) r;

    RETURN j;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION responderFSatisfaccion(
    _valor INT
)RETURNS INT AS $$
    BEGIN
        INSERT INTO fsatisfaccion(valor, fechahora) VALUES
        (_valor, CURRENT_TIMESTAMP AT TIME ZONE 'CST');

        RETURN 23;
    END;
    $$
LANGUAGE plpgsql;
---------------------------------------------------------------
SELECT crearHorario('7:30:00', '17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','7:30:00','17:30:00','2021-7-20', '2021-8-20', 1);