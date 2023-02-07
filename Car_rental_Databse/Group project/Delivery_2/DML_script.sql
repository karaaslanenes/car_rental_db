USE master
GO


USE CAR2GO
GO


INSERT INTO LOCATION VALUES ('MTL01', 'DECARY', 15, 'MOTREAL', 'QC', 'H8P2P6'),
							('MTL02', 'LESAGE', 324, 'MOTREAL', 'QC', 'H3P3Z4'),
							('MTL03', 'ST-PATRICK', 2, 'MOTREAL', 'QC', 'H6P3U6'),
							('LVL01', 'VIMONT', 23, 'LAVAL', 'QC', 'H7P8E4');

SELECT * FROM LOCATION; 


INSERT INTO CAR_CLASS VALUES ('SUBCOMPACTS', $30),
							 ('COMPACTS', $45),
							 ('SEDANS', $70),
							 ('LUXURY', $100);

SELECT * FROM CAR_CLASS;


INSERT INTO CAR VALUES ('E34XPT', '1J4GZ78YXSC720733', 1995, 'Jeep', 'Grand Cherokee', 'RED', 'COMPACTS', 'MTL01'),
					   ('FLV4344', 'JT6HT00W4Y0093462', 2000, 'Lexus', 'LX 470', 'WHITE', 'LUXURY', 'LVL01'),
					   ('FFF2342', '1G1ZD5E09CF251160', 2012, 'Chevrolet', 'Malibu', 'BLUE', 'SEDANS', 'MTL03'),
					   ('A33CDK', 'ZAMCE39A060023181', 2006, 'Maserati', 'Quattroporte', 'PURL GREY', 'LUXURY', 'LVL01'),
					   ('D45GFD', '1B3ES66S13D202162', 2003, 'Dodge', 'Neon', 'ORANGE', 'COMPACTS', 'MTL02');

SELECT * FROM CAR;


Insert into promotion values('SM2002', 0.1, 'sedans', '2022-11-01', '2022-12-01');
Insert into promotion values('WT2022', 0.25, 'LUXURY', '2022-12-01', '2022-12-31');
Insert into promotion values('FL2022', 0.15, 'compacts', '2022-06-01', '2022-08-31');

SELECT * FROM promotion;


INSERT INTO CUSTOMER VALUES ('ZM1976', 'ZAHRA', 'MIRZAEI', 'DU FORT', 1215, 856, 'MONTREAL', 'QC', 'H2H2P7', 'CANADA'),
							('AL1986', 'ALEXANDER', 'GUTKOVSKY', 'LA SALLE', 1250, 950, 'MONTREAL', 'QC', 'H1H2H3', 'CANADA'),
                            ('EN2000', 'ENES', 'KARAASLAN', 'COTE-VERTUE', 545, 324, 'MONTREAL', 'QC', 'N1N2H6', 'CANADA'),
                            ('CH0400', 'CHRISTOFER', 'CHAVSKY', 'VERDUN', 6666, 555, 'MONTREAL', 'QC', 'V6V3M8', 'CANADA');

SELECT * FROM CUSTOMER;   

INSERT INTO CUSTOMER_PH VALUES (001, 514, 2969280, 'ZM1976'),
                               (001, 438, 3455800, 'AL1986'),
                               (001, 438, 7009876, 'EN2000'),
                               (001, 514, 5460021, 'CH0400');

SELECT * FROM CUSTOMER_PH; 

INSERT INTO CUSTOMER_EMAIL VALUES ('MIRZAEI_ZAHRA76@YAHOO.COM', 'ZM1976'),
                                  ('ALEXANDER_1986@GMAIL.COM', 'AL1986'),
                                  ('ENESKARAASLAN_2000', 'EN2000'),
                                  ('CHSISTOPHER_2020', 'CH0400');

SELECT * FROM CUSTOMER_EMAIL; 


INSERT INTO RENT VALUES ('CO1240', '2022-01-22', '2022-01-24', 'FULL', 9098, 10000, 'COMPACTS', 'COMPACTS', 'E34XPT', 'ZM1976'),
                        ('LU1340', '2022-03-13', '2022-03-17', 'ONE THIRD', 1187, 1202, 'LUXURY', 'LUXURY', 'FLV4344', 'AL1986'),
                        ('SE1440', '2022-03-13', '2022-03-19', 'EMPTY', 7223, 7300, 'SEDANS', 'SEDANS', 'FFF2342', 'EN2000'),
                        ('SE1441', '2022-04-14', '2022-04-25', 'HALF', 1404, 1498, 'SEDANS', 'SEDANS', 'FFF2342', 'CH0400');

SELECT * FROM RENT;


INSERT INTO LOCATION_RENT VALUES('MTL01','MTL01', 'CO1240'),
                                ('LVL01','MTL02', 'LU1340'),
                                ('MTL03','MTL03', 'SE1440'),
                                ('MTL03','MTL03', 'SE1441');

SELECT * FROM LOCATION_RENT; 


INSERT INTO RESERVATION VALUES ('CO12400', 3, 45 * 3, 'CO1240', NULL),
                               ('LU13400', 5, 100 * 5, 'LU1340', NULL),
                               ('SE14400', 7, 70 * 7, 'SE1440', NULL),
                               ('SE14410', 12, 70*12-(70 * 12*(SELECT DISCOUNT FROM PROMOTION WHERE class_name='SEDANS')), 'SE1441', 'SM2002');

SELECT * FROM RESERVATION;
