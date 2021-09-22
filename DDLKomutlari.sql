-- DDL KOMUTLARI (Tablo uzerinde degisiklikler yapiyor yani nesneler uzerinde)
-- CREATE	-> Oluþturma için
-- ALTER	-> Düzenlemek için
-- DROP		-> Silmek için

Create Table TBLDERSLER
(
	DERSID tinyint,
	DERSAD varchar(20)
)

-- Yeni sutun eklemek istersek
Alter Table TBLDERSLER
Add KONTENJAN	smallint

-- Sutun silmek istersek
Alter Table TBLDERSLER
Drop Column KONTENJAN

-- Tablonun tamamini silmek icin DROP TABLE dememiz gerekiyor