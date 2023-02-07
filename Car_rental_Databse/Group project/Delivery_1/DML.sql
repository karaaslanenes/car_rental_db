USE master
GO


USE CAR2GO
GO

SELECT * FROM LOCATION;

INSERT INTO LOCATION VALUES ('MTL01', 'DECARY', 15, 'MOTREAL', 'QC', 'H8P2P6'),
							('MTL02', 'LESAGE', 324, 'MOTREAL', 'QC', 'H3P3Z4'),
							('MTL03', 'ST-PATRICK', 2, 'MOTREAL', 'QC', 'H6P3U6'),
							('LVL01', 'VIMONT', 23, 'LAVAL', 'QC', 'H7P8E4');

							--subcompacts, compacts, sedans, luxury
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

Insert into promotion values('SM2002', 10, 'sedans', '2022-11-01', '2022-12-01');
Insert into promotion values('WT2022', 25, 'LUXURY', '2022-12-01', '2022-12-31');
Insert into promotion values('FL2022', 15, 'compacts', '2022-06-01', '2022-08-31');
SELECT * FROM promotion;

INSERT INTO CUSTOMER VALUES ( 'ZM1976', 'ZAHRA', 'MIRZAEI' 'DU FORT' 1215, 856, 'MONTREAL', 'QC', 'H2H2P7'),
								