-- Patient
-- Create auto increment id start with a specific value(1000)
CREATE TABLE `hospitaldb`.`patient` (
  `patientId` INT NOT NULL AUTO_INCREMENT,
  `patientName` VARCHAR(45) NOT NULL,
  `patientEmail` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`patientId`),
  UNIQUE INDEX `patientId_UNIQUE` (`patientId` ASC) VISIBLE,
  UNIQUE INDEX `patientEmail_UNIQUE` (`patientEmail` ASC) VISIBLE
) AUTO_INCREMENT=1000;

-- Adding the status column for deletion purpose
ALTER TABLE `hospitaldb`.`patient`
    ADD COLUMN `status` INT NOT NULL DEFAULT 1 AFTER `password`;



-- Doctor
-- Create auto increment id start with a specific value(100)
CREATE TABLE `hospitaldb`.`doctor` (
  `doctorId` INT NOT NULL AUTO_INCREMENT,
  `doctorName` VARCHAR(45) NOT NULL,
  `doctorEmail` VARCHAR(45) NOT NULL,
  `doctorPhone` VARCHAR(45) NOT NULL,
  `specialization` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  UNIQUE INDEX `doctorId_UNIQUE` (`doctorId` ASC) VISIBLE,
  PRIMARY KEY (`doctorId`),
  UNIQUE INDEX `doctorEmail_UNIQUE` (`doctorEmail` ASC) VISIBLE)
  AUTO_INCREMENT=100;

-- Adding the status column for deletion purpose
ALTER TABLE `hospitaldb`.`doctor`
    ADD COLUMN `status` INT NOT NULL DEFAULT 1 AFTER `password`;

  
  -- Inseting records into doctor
  insert into doctor (doctorName,doctorEmail,doctorPhone,specialization,password) values ("Dr. B.N Panda","bnpanda@gmail.com","9845653215","cardiologist","1234");
   insert into doctor (doctorName,doctorEmail,doctorPhone,specialization,password) values ("Dr. S.K Ali","sekhali@gmail.com","9938456751","dermatologist","1234");
   
   -- Admin
   CREATE TABLE `hospitaldb`.`admin` (
  `adminId` INT NOT NULL AUTO_INCREMENT,
  `adminName` VARCHAR(45) NOT NULL,
  `adminEmail` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adminId`));


-- Appointment Booking
CREATE TABLE `hospitaldb`.`appointments` (
  `appointmentId` INT NOT NULL AUTO_INCREMENT,
  `patientId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `disease` VARCHAR(45) NOT NULL,
  `doctor` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT 'pending',
  `remark` VARCHAR(500) NULL,
  PRIMARY KEY (`appointmentId`),
  CONSTRAINT `patientId`
    FOREIGN KEY (`patientId`)
    REFERENCES `hospitaldb`.`patient` (`patientId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
