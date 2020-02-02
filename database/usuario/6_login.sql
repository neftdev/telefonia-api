USE telefonia;
DROP PROCEDURE IF EXISTS ChecarPassword;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE ChecarPassword(
    IN _email VARCHAR(255),
    IN _password VARCHAR(256)
)
BEGIN
    SELECT * FROM usuario
    WHERE email = _email AND password = _password;
END $$
$$
DELIMITER ;

CALL ChecarPassword('admin@gmail.com', '12345678');