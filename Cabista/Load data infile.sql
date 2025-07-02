LOAD DATA LOCAL INFILE 'E://Mine//Data for Analysis//Ola Data//cabista_bookings_july.csv'
INTO TABLE cabista.booking_july
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile=1;