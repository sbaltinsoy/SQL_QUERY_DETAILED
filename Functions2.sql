-- Like : Bir sorgunun icinde olup olmadigini sorgulayan fonk

Select * From TBLOGRENCILER WHERE OGRAD = 'Ali'
-- icerisinde a gecen degerleri ekrana getiren sorgu
Select * From TBLOGRENCILER WHERE OGRAD LIKE '%a%' OR OGRSOYAD LIKE '%a%'
-- Adi a harfi ile baslayan ve erkek olan ogrencileri getiren sorgu
Select * From TBLOGRENCILER WHERE OGRAD LIKE 'a%'and OGRCINSIYET = 'erkek'
-- OGRAD ICERISINDE A HARFI ICERMEYEN OGRENCILERI GETIRDI
Select * From TBLOGRENCILER WHERE OGRAD NOT LIKE '%a%'
-- alt tirenin ( _ ) anlami harften once kullanilirsa _a 2. harfi a olan demek
-- a_ sondan 1 onceki harf a demek
-- a_% son harfi a olmayan demek
-- sondan bir onceki harf a olan kosul sarti bulunmaktadir
Select * From TBLOGRENCILER WHERE OGRAD LIKE '%a_'
-- Ilk harfi a ya da z olan isimleri getiren sorgu
Select * From TBLOGRENCILER WHERE OGRAD LIKE '[AZB]%' -- [a,z,b] = [azb]
-- Ilk harfi a ile e arasinda olan isimleri getiren sorgu
Select * From TBLOGRENCILER WHERE OGRAD LIKE '[A-E]%'

-- DISTINCT -> TEKRARSIZ OLARAK DEGER GETIRIYOR
-- ayni verilerin tekrar etmeden ogrsehirleri ekrana yazan sorgu
Select DISTINCT OGRSEHIR FROM TBLOGRENCILER
-- Farkli OGRSEHIRLER IN sayisini ekrana yazdiran sorgu
Select COUNT(DISTINCT(OGRSEHIR)) AS 'Sehir Cesidi' FROM TBLOGRENCILER

-- ORDER BY -> Siralama islemi
Select * From TBLOGRENCILER ORDER BY OGRSEHIR
-- DESC -> Tersten siralama yapmayi saglar
-- ASC -> Kucukten buyuge siralama yapmaya yarar default degerdir
SELECT DISTINCT OGRKULUP FROM TBLOGRENCILER ORDER BY OGRKULUP DESC

-- TOP 
--> USTTEN TOP TAN SONRA YAZILAN SAYI KADAR SORGU GETIRIR
-- SON 4 KAYDI GETIRIR
Select top 4 * From TBLOGRENCILER order by OGRID desc
-- ILK 4 KAYDI GETIRIR
Select top 4 * From TBLOGRENCILER order by OGRID 
-- PERCENT
-- YUZDELIK IFADE EEDER
-- TABLODA BULUNAN VERILERIN YUZDE 65 INI GETIRIR EGER 6.1 OLSA BILE 7 TANE GETIRIR
Select TOP 65 PERCENT* From TBLOGRENCILER

-- IN - IN NOT
Select * From TBLOGRENCILER WHERE OGRSEHIR = 'uþak' or OGRSEHIR='Adana' or OGRSEHIR = 'Edirne'
Select * From TBLOGRENCILER WHERE OGRSEHIR IN ('uþak','Adana','Edirne')
Select * From TBLOGRENCILER WHERE OGRSEHIR NOT IN ('uþak','Adana','Edirne')

-- BETWEEN
-- 100 dahil olmayacak sekilde 74 ile 100 arasinda ortalamasi olan notlari ekrana getiren sorgu
Select * From TBLNOTLAR WHERE ORTALAMA between 74 and 100
-- e dahil olmayacak sekilded a ile e arasinda baslayan isimleri getiren sorgu
Select * From TBLOGRENCILER WHERE OGRAD between 'A' and 'e'

-- NOT BETWEEN
Select * From TBLOGRENCILER WHERE OGRAD NOT between 'A' and 'N'