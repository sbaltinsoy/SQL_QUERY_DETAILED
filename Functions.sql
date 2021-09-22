-- Count Fonksiyonu icine girilen parametredeki sutunun satir sayisini yani veri sayisini geri dondurur
Select Count(*) As 'Toplam Kayit' From TBLOGRENCILER
Select Count(*) As 'Toplam Kayit' From TBLOGRENCILER Where OGRSEHIR = 'Adana'
-- SUM Fonksiyonu parametre olarak girilen sutundaki degerleri toplar
Select Sum(SINAV1), Sum(SINAV2), SUM(SINAV3) From TBLNOTLAR
-- AVG Fonksiyonu parametre olarak girilen sutundaki degerleri ortalamasini alir
Select AVG(SINAV1), AVG(SINAV2), AVG(SINAV3) From TBLNOTLAR
-- MAX Fonksiyonu parametre olarak girilen sutundaki degerlerin maximumunu geri dondurur
Select MAX(SINAV1), MAX(SINAV2), MAX(SINAV3) From TBLNOTLAR
-- MIN Fonksiyonu parametre olarak girilen sutundaki degerlerin minimumunu geri dondurur
Select MIN(SINAV1), MIN(SINAV2), MIN(SINAV3) From TBLNOTLAR
-- Tablodaki sehirlerin turune gore gruplandirip sayisini veren sorgu
Select OGRSEHIR,Count(*) as 'Toplam' From TBLOGRENCILER GROUP BY OGRSEHIR
-- Tablodaki cinsiyet sutunundaki verilerinin turlerine gore sayilarini veren sorgu
Select OGRCINSIYET, Count(*) AS 'Toplam' FROM TBLOGRENCILER GROUP BY OGRCINSIYET

Update TBLNOTLAR Set ORTALAMA = (SINAV1+SINAV2+SINAV3)/3
Update TBLNOTLAR Set DURUM = 1 Where ORTALAMA >= 50
Update TBLNOTLAR Set DURUM = 0 Where ORTALAMA < 50

Select OGRKULUP,COUNT(*) FROM TBLOGRENCILER GROUP BY OGRKULUP

-- HAVING -> Gruplandirma sonrasinda where komutu kullanilamiyor onun yerine HAVING kullaniliyor sart komutudur
-- Sehir sayisi 2 olanlari gruplayip getirme sorgusu
Select OGRSEHIR,COUNT(*) AS 'SAYI' FROM TBLOGRENCILER GROUP BY OGRSEHIR HAVING COUNT(*) = 2
-- OGRKULUP Kitaplik olanlarin sayisini ekrana getiren sorgu
SELECT OGRKULUP,COUNT(*) FROM TBLOGRENCILER GROUP BY OGRKULUP HAVING OGRKULUP = 'Kitaplik'
-- Gecenler ve gecemeyenlerin sayisini veren sorgu _?
SELECT DURUM,COUNT(*) AS 'GECENLER' FROM TBLNOTLAR GROUP BY DURUM HAVING DURUM = 'True'
SELECT DURUM,COUNT(*) AS 'GECEMEYENLER' FROM TBLNOTLAR GROUP BY DURUM HAVING DURUM = 'False'
-- 
SELECT*,'Üstünde' as 'DURUM2' FROM TBLNOTLAR
WHERE  ORTALAMA>(SELECT AVG(ORTALAMA) FROM TBLNOTLAR WHERE DERS IN(1,2))
union  select*,'Altýnda' as 'DURUM2'
FROM TBLNOTLAR WHERE  ORTALAMA<(SELECT AVG(ORTALAMA)  FROM TBLNOTLAR  WHERE DERS IN (1,2))

SELECT OGRAD, OGRSOYAD, DURUM, ORTALAMA , 'ALTINDA' AS 'DURUM2' FROM TBLNOTLAR
INNER JOIN TBLOGRENCILER ON TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID WHERE ORTALAMA < 50
UNION
SELECT OGRAD, OGRSOYAD, DURUM, ORTALAMA , 'USTUNDE' AS 'DURUM2' FROM TBLNOTLAR
INNER JOIN TBLOGRENCILER ON TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID WHERE ORTALAMA >= 50