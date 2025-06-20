CREATE DEFINER = CURRENT_USER TRIGGER `tourism`.`tour_client_BEFORE_INSERT` BEFORE INSERT ON `tour_client` FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1
			 FROM tour_client AS tc
             WHERE tc.passport_serial = NEW.passport_serial
               AND tc.passport_number = NEW.passport_number) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Ошибка: пользователь с таким паспортом уже зарегистрирован!';
  END IF;
END
