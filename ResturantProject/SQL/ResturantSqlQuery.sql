-- Resturant's table Details

CREATE TABLE `resturantdbcustomer_details`.`resturant_table` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `tableId` INT NOT NULL,
  `capacity` INT NOT NULL,
  `available` TINYINT(1) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `tableId_UNIQUE` (`tableId` ASC) VISIBLE);


SELECT * FROM resturantdb.resturant_table;


-- Customer Deatils 

CREATE TABLE `resturantdb`.`customer_details` (
  `custId` INT NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(45) NOT NULL,
  `customerEmail` VARCHAR(45) NOT NULL,
  `customerPassword` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`custId`));
  
  
  -- Table Reservation
  
  CREATE TABLE `resturantdb`.`table_reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `custId` INT NOT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `partysize` INT NOT NULL,
  `customername` VARCHAR(45) NOT NULL,
  `phoneno` VARCHAR(45) NULL,
  `tableId` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT -1,
  `remark` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `custId_idx` (`custId` ASC) VISIBLE,
  INDEX `tableId_idx` (`tableId` ASC) VISIBLE,
  CONSTRAINT `custId`
    FOREIGN KEY (`custId`)
    REFERENCES `resturantdb`.`customer_details` (`custId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tableId`
    FOREIGN KEY (`tableId`)
    REFERENCES `resturantdb`.`resturant_table` (`tableId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



