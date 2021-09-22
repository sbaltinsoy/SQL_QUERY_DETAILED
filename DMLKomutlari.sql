-- DML Komutlari (Veri)
-- Select	-> Secme , listeleme 
-- Insert	-> Ekleme
-- Update	-> Guncelleme
-- Delete	-> Silme 

Select OGRAD,OGRSOYAD From TBLOGRENCILER
-- * -> All

Select OGRSEHIR From TBLOGRENCILER

-- Where sartli sorgulama komutudur
Select * From TBLOGRENCILER Where OGRAD = 'Ali'

Select * From TBLOGRENCILER where OGRSEHIR = 'Adana' or OGRKULUP = 'Satranç'

-- Decimal(x,y)
-- x: Virgulden once basamak sayisi + virguldedn sonraki basamak sayisi
-- y : Virgundel onceki basamak sayisi
-- ortalama : 78,32 -- 100,000
-- Decimal(5,2)

-- Ortalaama Hesaplama
Select * From TBLNOTLAR
SELECT (SINAV1+SINAV2+SINAV3)/3 As 'Ortalama' From TBLNOTLAR

-- Insert
-- Insert Into Table (Column1, Column2, Column3,...) Values (V1,V2,V3,...)

Insert Into TBLOGRENCILER (OGRAD, OGRSOYAD, OGRSEHIR) Values ('Baran','Altinsoy','Elazýð')
Select * From TBLOGRENCILER

Insert Into TBLNOTLAR (OGRENCI,DERS,SINAV1,SINAV3) values (6,2,88,67)

-- DELETE

-- Tablodaki butun verileri siler
Delete From TBLDERSLER 
-- Ders adina gore silme islemi yapilmaktadir
Delete From TBLDERSLER where DERSAD = 'Algoritma'
-- DersiD ye gore silme islemi yapilmaktadir
Delete From TBLDERSLER where DERSID = 1 

-- TRUNCATE
-- Dersler tablosunu sifirlar butun verileri siler
Truncate Table TBLDERSLER

-- UPDATE
-- OgrID 2 4 ve ya 6 olan verileri kiz olarak guncelledi
Update TBLOGRENCILER Set OGRCINSIYET ='Kýz' where OGRID = 2 or OGRID = 4 or OGRID = 5 
-- OGRAD Baran olan ogrencinin OGRKULUP unu Kitaplik olarak guncellendi
Update TBLOGRENCILER Set OGRKULUP='Kitaplik' where OGRAD = 'Baran'
-- Tablodaki BUTUN DERS leri 2 olarak guncellendi
Update TBLNOTLAR Set DERS = 2
-- Yeni kayit eklendi
Insert Into TBLNOTLAR (OGRENCI,DERS,SINAV1,SINAV2) Values (5,2,78,66)
-- Tablodaki ORTALAMA sutunu guncellendi
Update TBLNOTLAR SET ORTALAMA = (SINAV1 + SINAV2 + SINAV3) / 3
-- Tablodaki DURUM sutunu kosula gore 1 ya da 0 olarak guncellendi
Update Tblnotlar set DURUM = 1 where ORTALAMA >= 50
Update Tblnotlar set DURUM = 0 where ORTALAMA < 50