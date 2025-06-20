CREATE DEFINER = CURRENT_USER TRIGGER `tourism`.`hotel_catalogue_BEFORE_INSERT` BEFORE INSERT ON `hotel_catalogue` FOR EACH ROW
BEGIN
  IF NEW.star_rating NOT BETWEEN 1 AND 5 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Star rating must be between 1 and 5';
  END IF;
END
