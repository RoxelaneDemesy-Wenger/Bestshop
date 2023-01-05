CREATE DATABASE IF NOT EXISTS bestshop;

USE bestshop;

CREATE TABLE portable (
	id_portable	INT NOT NULL AUTO_INCREMENT,
    marque			VARCHAR(150),
    couleur			VARCHAR(200),
    memoire			INT UNSIGNED,
    prix			INT,
    photo1			VARCHAR(50),
    photo2          VARCHAR(50),
    photo3	        VARCHAR(20),
    taille	        VARCHAR(20),
    description		MEDIUMTEXT,
    
    PRIMARY KEY (id_portable)
) ENGINE=INNODB CHARACTER SET=utf8;