USE telefonia;

-- FECHA SIN MORA
SET @fecha_pagar = (SELECT DATE_ADD("2019-10-17", INTERVAL 1 MONTH));
-- FECHAS CON MORA
SET @fecha_pagar1 = (SELECT DATE_ADD("2019-10-16", INTERVAL 1 MONTH));
SET @fecha_pagar2 = (SELECT DATE_ADD("2019-10-14", INTERVAL 1 MONTH));
-- FACTURAS ATRASADAS
SET @fecha_pagar3 = (SELECT DATE_ADD("2019-09-17", INTERVAL 1 MONTH));
SET @fecha_pagar4 = (SELECT DATE_ADD("2019-01-17", INTERVAL 1 MONTH));

INSERT INTO usuario (cui, email, nombre, direccion, telefono, fecha_pagar, total_pagar, password, rol_id)
VALUES
  (123456895, 'user1@gmail.com',   'user 1', '1 calle 48-58 zona 9', 40564099, @fecha_pagar, 150,  '12345678', 2),
  (128456804, 'user2@gmail.com',   'user 2', '2 calle 48-58 zona 9', 41563191, @fecha_pagar, 150,  '12345678', 2),
  (228456803, 'user3@gmail.com',   'user 3', '3 calle 48-58 zona 9', 42362292, @fecha_pagar, 150,  '12345678', 2),
  (328456802, 'user4@gmail.com',   'user 4', '4 calle 48-58 zona 9', 43541393, @fecha_pagar, 150,  '12345678', 2),
  (428456801, 'user5@gmail.com',   'user 5', '5 calle 48-58 zona 9', 44560494, @fecha_pagar, 150,  '12345678', 2),
  (528456800, 'user6@gmail.com',   'user 6', '6 calle 48-58 zona 9', 45567675, @fecha_pagar, 150,  '12345678', 2),
  (628456809, 'user7@gmail.com',   'user 7', '7 calle 48-58 zona 9', 46567896, @fecha_pagar, 150,  '12345678', 2),
  (728456808, 'user8@gmail.com',   'user 8', '8 calle 48-58 zona 9', 47567817, @fecha_pagar, 150,  '12345678', 2),
  (828456807, 'user9@gmail.com',   'user 9', '9 calle 48-58 zona 9', 48567298, @fecha_pagar, 150,  '12345678', 2),
  (928456806, 'user10@gmail.com', 'user 10', '1 calle 48-58 zona 1', 49563899, @fecha_pagar, 150,  '12345678', 2),
  (138456805, 'user11@gmail.com', 'user 11', '2 calle 48-58 zona 1', 40547890, @fecha_pagar, 150,  '12345678', 2),
  (238456804, 'user12@gmail.com', 'user 12', '3 calle 48-58 zona 1', 41667891, @fecha_pagar, 150,  '12345678', 2),
  (338456803, 'user13@gmail.com', 'user 13', '4 calle 48-58 zona 1', 42567882, @fecha_pagar, 150,  '12345678', 2),
  (438456802, 'user14@gmail.com', 'user 14', '5 calle 48-58 zona 1', 43267873, @fecha_pagar, 150,  '12345678', 2),
  (538456801, 'user15@gmail.com', 'user 15', '6 calle 48-58 zona 1', 44337864, @fecha_pagar, 150,  '12345678', 2),
  (638456800, 'user16@gmail.com', 'user 16', '7 calle 48-58 zona 1', 45247855, @fecha_pagar1, 150, '12345678', 2),
  (738456809, 'user17@gmail.com', 'user 17', '8 calle 48-58 zona 1', 46987846, @fecha_pagar1, 150, '12345678', 2),
  (813459898, 'user18@gmail.com', 'user 18', '9 calle 48-58 zona 1', 47457837, @fecha_pagar1, 150, '12345678', 2),
  (823459897, 'user19@gmail.com', 'user 19', '1 calle 48-58 zona 2', 48468828, @fecha_pagar1, 150, '12345678', 2),
  (833459896, 'user20@gmail.com', 'user 20', '2 calle 48-58 zona 2', 49456819, @fecha_pagar1, 150, '12345678', 2),
  (843459895, 'user21@gmail.com', 'user 21', '3 calle 48-58 zona 2', 40123800, @fecha_pagar1, 150, '12345678', 2),
  (853459894, 'user22@gmail.com', 'user 22', '4 calle 48-58 zona 2', 41321891, @fecha_pagar1, 150, '12345678', 2),
  (863459893, 'user23@gmail.com', 'user 23', '5 calle 48-58 zona 2', 42596882, @fecha_pagar2, 150, '12345678', 2),
  (873459892, 'user24@gmail.com', 'user 24', '6 calle 48-58 zona 2', 43523873, @fecha_pagar2, 150, '12345678', 2),
  (883459891, 'user25@gmail.com', 'user 25', '7 calle 48-58 zona 2', 44557864, @fecha_pagar2, 150, '12345678', 2),
  (893459890, 'user26@gmail.com', 'user 26', '8 calle 48-58 zona 2', 45569855, @fecha_pagar2, 150, '12345678', 2),
  (891059899, 'user27@gmail.com', 'user 27', '9 calle 48-58 zona 2', 46565846, @fecha_pagar2, 150, '12345678', 2),
  (892059898, 'user28@gmail.com', 'user 28', '1 calle 48-58 zona 4', 47567837, @fecha_pagar2, 150, '12345678', 2),
  (893059897, 'user29@gmail.com', 'user 29', '2 calle 48-58 zona 4', 48567828, @fecha_pagar2, 150, '12345678', 2),
  (894059896, 'user30@gmail.com', 'user 30', '3 calle 48-58 zona 4', 49567119, @fecha_pagar2, 150, '12345678', 2),
  (195056895, 'user31@gmail.com', 'user 31', '4 calle 48-58 zona 4', 40567890, @fecha_pagar2, 150, '12345678', 2),
  (196056894, 'user32@gmail.com', 'user 32', '5 calle 48-58 zona 4', 41567821, @fecha_pagar2, 150, '12345678', 2),
  (197056893, 'user33@gmail.com', 'user 33', '6 calle 48-58 zona 4', 42587882, @fecha_pagar2, 150, '12345678', 2),
  (198056892, 'user34@gmail.com', 'user 34', '7 calle 48-58 zona 4', 43567873, @fecha_pagar2, 150, '12345678', 2),
  (199056891, 'user35@gmail.com', 'user 35', '8 calle 48-58 zona 4', 44567864, @fecha_pagar2, 150, '12345678', 2),
  (951305789, 'user36@gmail.com', 'user 36', '9 calle 48-58 zona 4', 45567855, @fecha_pagar2, 150, '12345678', 2),
  (952305789, 'user37@gmail.com', 'user 37', '1 calle 48-58 zona 3', 46567846, @fecha_pagar4, 150, '12345678', 2),
  (953305789, 'user38@gmail.com', 'user 38', '2 calle 48-58 zona 3', 47567937, @fecha_pagar4, 150, '12345678', 2),
  (954345789, 'user39@gmail.com', 'user 39', '3 calle 48-58 zona 3', 48167828, @fecha_pagar4, 150, '12345678', 2),
  (955345789, 'user40@gmail.com', 'user 40', '4 calle 48-58 zona 3', 49567819, @fecha_pagar4, 150, '12345678', 2),
  (956345789, 'user41@gmail.com', 'user 41', '5 calle 48-58 zona 3', 41567801, @fecha_pagar4, 150, '12345678', 2),
  (957345789, 'user42@gmail.com', 'user 42', '6 calle 48-58 zona 3', 42567891, @fecha_pagar4, 150, '12345678', 2),
  (958345789, 'user43@gmail.com', 'user 43', '7 calle 48-58 zona 3', 43567882, @fecha_pagar3, 150, '12345678', 2),
  (959345789, 'user44@gmail.com', 'user 44', '8 calle 48-58 zona 3', 44567873, @fecha_pagar3, 150, '12345678', 2),
  (950345789, 'user45@gmail.com', 'user 45', '9 calle 48-58 zona 3', 45567864, @fecha_pagar3, 150, '12345678', 2),
  (952145789, 'user46@gmail.com', 'user 46', '1 calle 48-58 zona 5', 46567855, @fecha_pagar3, 150, '12345678', 2),
  (952245789, 'user47@gmail.com', 'user 47', '2 calle 48-58 zona 5', 47567846, @fecha_pagar3, 150, '12345678', 2),
  (563451780, 'user48@gmail.com', 'user 48', '3 calle 48-58 zona 5', 48567837, @fecha_pagar3, 150, '12345678', 2),
  (563456780, 'user49@gmail.com', 'user 49', '4 calle 48-58 zona 5', 49567828, @fecha_pagar3, 150, '12345678', 2),
  (563456380, 'user50@gmail.com', 'user 50', '5 calle 48-58 zona 5', 40567819, @fecha_pagar3, 150, '12345678', 2),
  (563456480, 'user51@gmail.com', 'user 51', '6 calle 48-58 zona 5', 41567800, @fecha_pagar3, 150, '12345678', 2);

SELECT * FROM usuario;