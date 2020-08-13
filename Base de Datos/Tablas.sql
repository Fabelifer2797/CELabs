CREATE TABLE IF NOT EXISTS Usuario(
    idUsuario SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellidos TEXT NOT NULL,
    idXTEC TEXT NOT NULL,
    email TEXT NOT NULL,
    telefono TEXT NOT NULL,
    estado BOOLEAN NOT NULL,
    rolActual INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Administrador(
    idAdministrador SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    estado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Operador(
    idOperador SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    estado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Docente(
    idDocente SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    estado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS PA(
    idPA SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    estado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS EDA(
    idEDA SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    estado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Laboratorio(
    idLaboratorio SERIAL PRIMARY KEY,
    codigo TEXT NOT NULL,
    aula TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Curso(
    idCurso SERIAL PRIMARY KEY,
    codigo TEXT NOT NULL,
    nombre TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS EstadoReserva(
    idEstadoReserva SERIAL PRIMARY KEY,
    info TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Reserva(
    idReserva SERIAL PRIMARY KEY,
    idOperador INT REFERENCES Operador(idOperador),
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    fechaReserva date NOT NULL,
    horaInicio TIME NOT NULL,
    horaFinal TIME NOT NULL,
    fechaHoraSolicitud timestamp NOT NULL,
    idLaboratorio INT NOT NULL REFERENCES Laboratorio(idLAboratorio),
    idEstadoReserva INT NOT NULL REFERENCES EstadoReserva(idEstadoReserva),
    motivo TEXT NOT NULL,
    idCurso INT NOT NULL REFERENCES Curso(idCurso)
);

CREATE TABLE IF NOT EXISTS ReporteInventario(
    idResporteInv SERIAL PRIMARY KEY,
    idOperador INT NOT NULL REFERENCES Operador(idOperador),
    fechaHora TIMESTAMP NOT NULL,
    idLaboratorio INT NOT NULL REFERENCES Laboratorio(idLaboratorio),
    computadorasC INT NOT NULL,
    computadorasI INT NOT NULL,
    proyectores INT NOT NULL,
    sillas INT NOT NULL,
    extintores INT NOT NULL
);

CREATE TABLE IF NOT EXISTS EstadoAveria(
    idEstadoAveria SERIAL PRIMARY KEY,
    info TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ReporteAveria(
    idReporteAveria SERIAL PRIMARY KEY,
    idOperador INT NOT NULL REFERENCES Operador(idOperador),
    idLaboratorio INT NOT NULL REFERENCES Laboratorio(idLaboratorio),
    idEstadoAveria INT NOT NULL REFERENCES EstadoAveria(idEstadoAveria),
    fechaHora TIMESTAMP NOT NULL,
    activo TEXT NOT NULL,
    descripcion TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS SeguimientoAveria(
    idSeguiminetoAveria SERIAL PRIMARY KEY,
    idReporteAveria INT NOT NULL REFERENCES ReporteAveria(idReporteAveria),
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    idEstadoAveria INT NOT NULL REFERENCES EstadoAveria(idEstadoAveria),
    fechaHora TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS EstadoSolicitud(
    idEstadoSolicitud SERIAL PRIMARY KEY,
    info TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ReporteTT(
    idReporteTT SERIAL PRIMARY KEY,
    idOperador INT NOT NULL REFERENCES Operador(idOperador),
    horaInicio TIME NOT NULL,
    horaFinal TIME NOT NULL,
    fechaHora TIMESTAMP NOT NULL,
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud),
    actividades TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS SolicitudRTT(
    idSolicitudRTT SERIAL PRIMARY KEY,
    idReporteTT INT NOT NULL REFERENCES ReporteTT(idReporteTT),
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    fechaHoraRespuesta TIMESTAMP NOT NULL,
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud)
);

CREATE TABLE IF NOT EXISTS Palmada(
    idPalmada SERIAL PRIMARY KEY,
    idOperador INT NOT NULL REFERENCES Operador(idOperador),
    idUsuario INT NOT NULL REFERENCES Usuario(idusuario),
    fechaHoraI TIMESTAMP NOT NULL,
    fechaHoraF TIMESTAMP NOT NULL,
    fechaHoraSolicitud TIMESTAMP NOT NULL,
    motivo TEXT NOT NULL,
    idLaboratorio INT NOT NULL REFERENCES Laboratorio(idLaboratorio),
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud)
);

CREATE TABLE IF NOT EXISTS SolicitudPalmada(
    idSolicitudPalmada SERIAL PRIMARY KEY,
    idPalmada INT NOT NULL REFERENCES Palmada(idPalmada),
    idAdministrador INT NOT NULL REFERENCES Administrador(idAdministrador),
    fechaHoraRespuesta TIMESTAMP NOT NULL,
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud)
);

CREATE TABLE IF NOT EXISTS NuevaCuenta(
    idCuenta SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL REFERENCES Usuario(idUsuario),
    fechaHora TIMESTAMP NOT NULL,
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud)
);

CREATE TABLE IF NOT EXISTS SolicitudCuenta(
    idSolicitudCuenta SERIAL PRIMARY KEY,
    idCuenta INT NOT NULL REFERENCES NuevaCuenta(idCuenta),
    idAdministrador INT NOT NULL REFERENCES Administrador(idAdministrador),
    fechaHoraRespuesta TIMESTAMP NOT NULL,
    idEstadoSolicitud INT NOT NULL REFERENCES EstadoSolicitud(idEstadoSolicitud)
);

CREATE TABLE IF NOT EXISTS FSatisfaccion(
    idFSatisfaccion SERIAL PRIMARY KEY,
    valor INT NOT NULL,
    fechaHora TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS Horario(
  idHorario SERIAL PRIMARY KEY,
  horaInicioLunes TIME NOT NULL,
  horaFinalLunes TIME NOT NULL,
  horaInicioMartes TIME NOT NULL,
  horaFinalMartes TIME NOT NULL,
  horaInicioMiercoles TIME NOT NULL,
  horaFinalMiercoles TIME NOT NULL,
  horaInicioJueves TIME NOT NULL,
  horaFinalJueves TIME NOT NULL,
  horaInicioViernes TIME NOT NULL,
  horaFinalViernes TIME NOT NULL,
  fechaInicio DATE NOT NULL,
  fechaFinal DATE NOT NULL,
  idAdministrador INT REFERENCES Administrador(idAdministrador)
);

CREATE TABLE IF NOT EXISTS CorreoSeguridad(
    idCorreoSeguridad SERIAL PRIMARY KEY,
    correo TEXT NOT NULL,
    estado BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS MotivoCorreo(
    idMotivoCorreo SERIAL PRIMARY KEY,
    motivo TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS RegistroCorreos(
    idRegistro SERIAL PRIMARY KEY,
    correo TEXT NOT NULL,
    fechaHora TIMESTAMP NOT NULL,
    idMotivoCorreo INT NOT NULL REFERENCES MotivoCorreo(idMotivoCorreo)
);