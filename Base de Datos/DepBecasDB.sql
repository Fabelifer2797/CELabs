CREATE TABLE IF NOT EXISTS estudiante(
    idEstudiante SERIAL PRIMARY KEY,
    idXTEC TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS horasTrabajadas(
    idHorasTrabajadas SERIAL PRIMARY KEY,
    idEstudiante INT NOT NULL REFERENCES estudiante(idEstudiante),
    jornada INTERVAL NOT NULL
);
INSERT INTO estudiante(idXTEC) VALUES
('2017094138'),
('2000000001'),
('2000000002'),
('2000000003'),
('2000000004'),
('2000000005'),
('2000000006'),
('2000000007'),
('2000000008'),
('2000000009'),
('2000000010'),
('2000000012'),
('2000000013'),
('2000000014'),
('2000000015'),
('2000000016'),
('2000000017'),
('2000000018'),
('2000000019'),
('2000000020'),
('2000000021'),
('2000000022'),
('2000000023'),
('2000000024'),
('2000000025'),
('2000000026'),
('2000000027'),
('2000000028'),
('2000000029'),
('2000000030'),
('2000000031'),
('2000000032'),
('2000000033'),
('2000000034');

CREATE FUNCTION registrarHoras(
    _idXTEC TEXT,
    _jornada INTERVAL
)
RETURNS INT AS $$
    DECLARE _idEstudiante INT;
    BEGIN
        SELECT idEstudiante INTO _idEstudiante FROM estudiante
        WHERE idXTEC = _idXTEC;

        INSERT INTO horasTrabajadas(idEstudiante, jornada) VALUES
        (_idEstudiante, _jornada);

        RETURN 0;

    END;
    $$
LANGUAGE plpgsql;

SELECT registrarHoras('2000000019', interval '1 hour');