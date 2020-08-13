CREATE TABLE UsuarioXTEC(
    idUsuarioXTEC SERIAL PRIMARY KEY,
    idXTEC TEXT NOT NULL,
    password TEXT NOT NULL
);

INSERT INTO UsuarioXTEC(idXTEC, password) VALUES
('2017094138', '123'),
('2000000001', '456'),
('2000000002', '789'),
('2000000003', '101'),
('2000000004', '125'),
('2000000005', '112'),
('2000000006', '155'),
('2000000007', '666'),
('2000000008', '114'),
('2000000009', '160'),
('2000000010', '346'),
('2000000012', '136'),
('2000000013', '001'),
('2000000014', '564'),
('2000000015', '486'),
('2000000016', '199'),
('2000000017', '778'),
('2000000018', '959'),
('2000000019', '636'),
('2000000020', '833'),
('2000000021', '468'),
('2000000022', '428'),
('2000000023', '013'),
('2000000024', '153'),
('2000000025', '185'),
('2000000026', '402'),
('2000000027', '472'),
('2000000028', '662'),
('2000000029', '172'),
('2000000030', '724'),
('2000000031', '752'),
('2000000032', '886'),
('2000000033', '863'),
('2000000034', '574');

CREATE FUNCTION logIn(
    _idXTEC TEXT,
    _password TEXT
)
RETURNS INT AS $$
    DECLARE _user INT;

    BEGIN
        SELECT idusuarioxtec INTO _user FROM UsuarioXTEC
        WHERE idXTEC = _idXTEC;

        IF _user IS NULL THEN
            RETURN 0; -- El usuario no existe en XTEC
        END IF;

        SELECT idUsuarioXTEC INTO _user FROM UsuarioXTEC
        WHERE idUsuarioXTEC = _user AND password = _password;

        IF _user IS NULL THEN
            RETURN 1; -- Contraseña incorrecta
        ELSE
            RETURN 2; -- Log in exitoso
        END IF;

    END;
    $$
LANGUAGE plpgsql;
