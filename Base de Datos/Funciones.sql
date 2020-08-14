SET TIMEZONE TO 'GMT';

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
            RETURN 16;
        END IF;

        SELECT validarDiaSemana(_y, _m, _d) INTO diaSemana;

        IF diaSemana = 0 OR diaSemana = 6 THEN
            RETURN 17;
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
            RETURN 18;
        END IF;

        SELECT idreserva INTO idRes FROM Reserva
        WHERE fechareserva = _fechaReserva AND idestadoreserva = 1 AND horainicio <= _horaFinal AND _horaInicio <= horafinal AND idlaboratorio = _idLaboratorio;

        IF idRes IS NULL THEN
            INSERT INTO Reserva(idoperador, idusuario, fechareserva, horainicio, horafinal, fechahorasolicitud, idlaboratorio, idestadoreserva, motivo, idcurso) VALUES
            (_idOperador, _idUsuarioReserva, _fechaReserva, _horaInicio, _horaFinal, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, 1, _motivo, _idCurso);
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
        (_idOperador, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, _computadorasC, _computadorasI, _proyectores, _sillas, _extintores);

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
        (_idOperador, _idLaboratorio, 1, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _activo, _descripcion);

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
        (_idOperador, _horaInicio, _horaFinal, CURRENT_TIMESTAMP AT TIME ZONE 'CST', 1, _actividades);

        RETURN 6;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizarSolicitudRTT(
    _idReporteTT INT,
    _idUsuario INT,
    _idEstadoSolicitud INT
)
RETURNS TABLE(
    codigoCELabs INT,
    idXTEC TEXT,
    tiempoTotal INTERVAL
             ) AS $$
    BEGIN
        INSERT INTO SolicitudRTT(idreportett, idusuario, fechahorarespuesta, idestadosolicitud) VALUES
        (_idReporteTT, _idUsuario, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idEstadoSolicitud);

        UPDATE ReporteTT
        SET idestadosolicitud = _idEstadoSolicitud
        WHERE idreportett = _idReporteTT;

        RETURN QUERY
        SELECT * FROM   (SELECT R.idestadosolicitud + 5, U.idXTEC FROM ReporteTT R  -- 7: Solicitud Aprobada, 8: Solicitud Rechazada
                        INNER JOIN Operador O on R.idoperador = O.idoperador
                        INNER JOIN Usuario U on o.idusuario = U.idusuario
                        WHERE idreportett = _idReporteTT) a,

                        (SELECT RTT.horafinal - RTT.horainicio FROM reportett RTT
                        WHERE RTT.idreportett = _idReporteTT AND idestadosolicitud = 2) b ;


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
        (_idReporteAveria, _idUsuario, _idEstadoAveria, CURRENT_TIMESTAMP AT TIME ZONE 'CST');

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
            RETURN 16;
        END IF;

        SELECT validarDiaSemana(_y, _m, _d) INTO diaSemana;

        IF diaSemana = 1 THEN
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
            RETURN 19;
        END IF;

        SELECT idpalmada INTO idPal FROM Palmada
        WHERE fechahorai <= _fechaHoraF AND _fechaHoraI <= fechahoraf AND idestadosolicitud = 2 AND idlaboratorio = _idLaboratorio;

        IF idPal IS NULL THEN
            INSERT INTO Palmada(idoperador, idusuario, fechahorai, fechahoraf, fechahorasolicitud, idlaboratorio, idestadosolicitud, motivo) VALUES
            (_idOperador, _idUsuario, _fechaHoraI, _fechaHoraF, CURRENT_TIMESTAMP AT TIME ZONE 'CST', _idLaboratorio, 1, _motivo);
            RETURN 4;
        ELSE
            RETURN 5;
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
            RETURN 10;
        ELSE
            RETURN 11;
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
                RETURN 13;
            ELSE
                UPDATE Administrador SET estado = false
                WHERE idusuario = _idUsuario;
            END IF;

        END IF;

        UPDATE Usuario
        SET estado = false
        WHERE idusuario = _idUsuario;

        RETURN 14;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getIdRol(
    _idUsuario INT
)RETURNS INT AS $$
    DECLARE idRol INT;
            rol INT;
    BEGIN
        SELECT rolactual INTO rol FROM Usuario
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

CREATE OR REPLACE FUNCTION buscarCorreo(
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

CREATE OR REPLACE FUNCTION buscarCorreoSeguridad(
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
RETURNS TABLE(
    idreporteinv INT,
    fechaHora TIMESTAMP,
    nombreOperador TEXT,
    apellidosOperador TEXT,
    codigoLab TEXT,
    computadorasC INT,
    computadorasI INT,
    proyectores INT,
    sillas INT,
    extintores INT
             ) AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
    BEGIN
        RETURN QUERY
        SELECT RI.idresporteinv, RI.fechahora, U.nombre, U.apellidos, L.codigo, RI.computadorasc, RI.computadorasi, RI.proyectores, RI.sillas, RI.extintores
        FROM ReporteInventario RI
        INNER JOIN Operador O on RI.idoperador = O.idoperador
        INNER JOIN Usuario U on O.idusuario = U.idusuario
        INNER JOIN Laboratorio L on RI.idlaboratorio = L.idlaboratorio
        ORDER BY fechahora DESC
        LIMIT 10
        OFFSET _offset;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verReportesAverias(
    _pagina INT
)
RETURNS TABLE(
    fechaHora TIMESTAMP,
    idReporteAveria INT,
    idOperador INT,
    nombreOperador TEXT,
    apellidoOperador TEXT,
    codigoLab TEXT,
    activo TEXT,
    estado TEXT,
    descripcion TEXT
             ) AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
    BEGIN
        RETURN QUERY
        SELECT RA.fechahora, RA.idreporteaveria, U.nombre, U.apellidos, L.codigo, RA.activo, E.info, RA.descripcion
        FROM ReporteAveria RA
        INNER JOIN Operador O on RA.idoperador = O.idoperador
        INNER JOIN Usuario U on O.idusuario = U.idusuario
        INNER JOIN Laboratorio L on RA.idlaboratorio = L.idlaboratorio
        INNER JOIN estadoaveria E on RA.idestadoaveria = E.idestadoaveria
        ORDER BY E.idestadoaveria, RA.fechahora DESC
        LIMIT 10
        OFFSET _offset;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verHorasReservadasTR(
)
RETURNS TABLE(
    idLab INT,
    codigoLab TEXT,
    aulaLab TEXT,
    codigoNombreCurso TEXT,
    horaInicio TIME,
    horaFinal TIME
) AS $$
    DECLARE _now TIMESTAMP = CURRENT_TIMESTAMP AT TIME ZONE 'CST';
    BEGIN
        RETURN QUERY
        SELECT L.idlaboratorio, L.codigo, L.aula, C.codigoNombre, R.horainicio, R.horafinal
        FROM Reserva R
        INNER JOIN Laboratorio L on R.idlaboratorio = L.idlaboratorio
        INNER JOIN Curso C on R.idcurso = C.idcurso
        WHERE R.fechareserva = _now::DATE AND R.horainicio < _now::TIME AND R.horafinal > _now::TIME AND R.idestadoreserva = 1
        ORDER BY L.idlaboratorio;
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

        RETURN 21;
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

        RETURN 22;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verEstadosAveria()
RETURNS TABLE(
    idEstadoAveria INT,
    info TEXT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT E.idestadoaveria, E.info FROM EstadoAveria E;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verEstadosSolicitud()
RETURNS TABLE(
    idEstadoSolicitud INT,
    info TEXT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT E.idEstadoSolicitud, E.info FROM EstadoSolicitud E;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verLaboratorios()
RETURNS TABLE(
    idLab INT,
    codigo TEXT,
    aula TEXT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT L.idlaboratorio, L.codigo, L.aula FROM Laboratorio L;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verCursos()
RETURNS TABLE(
    idCurso INT,
    codigoNombre TEXT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT idCurso, codigoNombre FROM Curso;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesCuenta(
    _pagina INT
)
RETURNS TABLE(
    idNuevaCuenta INT,
    fechaHora TIMESTAMP,
    nombre TEXT,
    apellidos TEXT,
    idXTEC TEXT,
    email TEXT
) AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
    BEGIN
        RETURN QUERY
        SELECT NC.idcuenta, NC.fechahora, U.nombre, U.apellidos, U.idxtec, U.email
        FROM NuevaCuenta NC
        INNER JOIN Usuario U on NC.idusuario = U.idusuario
        WHERE NC.idestadosolicitud = 1
        ORDER BY NC.fechahora DESC
        LIMIT 10
        OFFSET _offset;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesRTT(
    _pagina INT
)
RETURNS TABLE(
    idReporteTT INT,
    fechaHora TIMESTAMP,
    idOperador INT,
    nombre TEXT,
    apellidos TEXT,
    horaInicio TIME,
    horaFinal TIME,
    actividades TEXT
) AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
    BEGIN
        RETURN QUERY
        SELECT R.idreportett, R.fechahora, O.idoperador, U.nombre, U.apellidos, R.horainicio, R.horafinal, R.actividades
        FROM ReporteTT R
        INNER JOIN Operador O on R.idoperador = O.idoperador
        INNER JOIN Usuario U on O.idusuario = U.idusuario
        WHERE R.idestadosolicitud = 1
        ORDER BY R.fechahora DESC
        LIMIT 10
        OFFSET _offset;

    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verSolicitudesPalmada(
    _pagina INT
)
RETURNS TABLE(
    idPalmada INT,
    fechaHoraSolicitud TIMESTAMP,
    idOperador INT,
    nombreOperador TEXT,
    apellidosOperador TEXT,
    fechaHoraI TIMESTAMP,
    fechaHoraF TIMESTAMP,
    motivo TEXT,
    idLab INT,
    codigoLab TEXT

) AS $$
    DECLARE _offset INT = _pagina * 10 - 10;
    BEGIN
        RETURN QUERY
        SELECT P.idpalmada, P.fechahorasolicitud, O.idoperador, U.nombre, U.apellidos, P.fechahorai, P.fechahoraf, P.motivo, L.idlaboratorio, L.codigo
        FROM Palmada P
        INNER JOIN Laboratorio L on P.idlaboratorio = L.idlaboratorio
        INNER JOIN Operador O on P.idoperador = O.idoperador
        INNER JOIN Usuario U on O.idusuario = U.idusuario
        WHERE P.idestadosolicitud = 1
        ORDER BY P.fechahorasolicitud DESC
        LIMIT 10
        OFFSET _offset;
    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verReservas(
    _fechaLunes DATE,
    _fechaDomingo DATE,
    _idLaboratorio INT
)RETURNS TABLE(
    idReserva INT,
    horaI TIME,
    horaF TIME,
    fechaReserva DATE,
    idCurso INT,
    codigoNombreCurso TEXT,
    idEstadoReserva INT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT R.idreserva, R.horainicio, R.horafinal, R.fechareserva, C.idcurso, C.codigoNombre, R.idestadoreserva
        FROM Reserva R
        INNER JOIN laboratorio l on R.idlaboratorio = l.idlaboratorio
        INNER JOIN curso c on R.idcurso = c.idcurso
        WHERE R.fechareserva >= _fechaLunes AND R.fechareserva <= _fechaDomingo AND (R.idestadoreserva = 1 OR R.idestadoreserva = 2) AND L.idlaboratorio = _idLaboratorio
        ORDER BY R.fechareserva;

    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verMisReservas(
    _fechaLunes DATE,
    _fechaDomingo DATE,
    _idDocente INT,
    _idLaboratorio INT
)RETURNS TABLE(
    idReserva INT,
    horaI TIME,
    horaF TIME,
    fechaReserva DATE,
    idCurso INT,
    codigoNombreCurso TEXT,
    idEstadoReserva INT
) AS $$
    BEGIN
        RETURN QUERY
        SELECT R.idreserva, R.horainicio, R.horafinal, R.fechareserva, C.idcurso, C.codigoNombre, R.idestadoreserva
        FROM Reserva R
        INNER JOIN Laboratorio L on R.idlaboratorio = L.idlaboratorio
        INNER JOIN Curso C on R.idcurso = C.idcurso
        INNER JOIN Usuario U on R.idusuario = U.idusuario
        INNER JOIN Docente D on U.idusuario = D.idusuario
        WHERE R.fechareserva >= _fechaLunes AND R.fechareserva <= _fechaDomingo AND D.iddocente = _idDocente AND L.idlaboratorio = _idLaboratorio
        ORDER BY R.fechareserva;

    END;
    $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION logIn(
    _idXTEC TEXT
)
RETURNS TABLE(
        idUsuario INT,
        rolActual INT,
        idRol INT
             ) AS $$
    DECLARE _idUsuario INT;
    BEGIN
        SELECT buscarIdUsuario(_idXTEC) INTO _idUsuario;

        RETURN QUERY
        SELECT * FROM (SELECT U.idusuario, U.rolactual FROM Usuario U
                        WHERE U.idusuario = 1) a,

                     (SELECT getIdRol(1) AS idRol) b;


    END;$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verMiTT(
    _idOperador INT
)RETURNS TABLE(
    total INTERVAL
              ) AS $$
    BEGIN
        RETURN QUERY
        SELECT SUM(RTT.horafinal - RTT.horainicio) FROM reportett RTT
        WHERE RTT.idoperador = _idOperador AND RTT.idestadosolicitud = 2;
    END;$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verDashboardAdmin(
    _yearMonth TIMESTAMP
)
RETURNS TABLE(
    promedioSatisfaccionMensual DOUBLE PRECISION,
    promedioReservasDiariasMensuales DOUBLE PRECISION,
    promedioPalmadasQuincenales DOUBLE PRECISION
) AS $$
    BEGIN
        RETURN QUERY
        SELECT * FROM (SELECT CAST((SUM(FS.valor)/COUNT(FS.idfsatisfaccion)) AS DOUBLE PRECISION) FROM fsatisfaccion FS
                       WHERE EXTRACT(YEAR FROM FS.fechahora) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM FS.fechahora) = EXTRACT(MONTH FROM _yearMonth)) a,

                      (SELECT  CAST(COUNT(R.idreserva)/30.0 AS DOUBLE PRECISION) FROM Reserva R
                       WHERE EXTRACT(YEAR FROM R.fechareserva) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM R.fechareserva) = EXTRACT(MONTH FROM _yearMonth)) b,

                      (SELECT  CAST(COUNT(P.idpalmada)/2.0 AS DOUBLE PRECISION) FROM Palmada P
                       WHERE EXTRACT(YEAR FROM P.fechahorai) = EXTRACT(YEAR FROM _yearMonth) AND EXTRACT(MONTH FROM P.fechahorai) = EXTRACT(MONTH FROM _yearMonth)) c;
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
