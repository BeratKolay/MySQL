create schema Eczane;
use Eczane;

create table Gorev(
gorev_no int not null Primary key,
g_ad varchar(20));

create table EgitimDuzeyi(
egt_no int not null Primary key,
e_ilkokul int,
e_ortaokul int);

create table Personel(
Sicil_No int not null Primary key,
p_ad varchar(20),
p_soyad varchar(20),
p_yas int,
gorev_no int,
egt_no int,
p_baslama date,
p_bitis varchar(20));

create table İlac(
Ilac_No int not null Primary key,
Ilac_Ad varchar(20),
Ilac_stok int,
Ilac_sontarih date,
Ilac_acıklama varchar(20),
Ilac_Fiyat int);

create table Musteri(
M_no int not null Primary key,
M_ad varchar(20),
M_soyad varchar(20),
egt_no int,
M_adres varchar(20),
M_telefon int);

create table Siparis(
M_no int,
Ilac_No int,
Sicil_No int,
İlac_adet int,
Sip_tarih date);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Tabloları ilişkilendiriniz. (Foreign Key) ? 

Alter table Personel add constraint fk_p_g foreign key(gorev_no) references Gorev(gorev_no);
Alter table Personel add constraint fk_p_e foreign key(egt_no) references EgitimDuzeyi(egt_no);
Alter table Musteri add constraint fk_m_e foreign key(egt_no) references EgitimDuzeyi(egt_no);
Alter table Siparis add constraint fk_s_m foreign key(M_no) references Musteri(M_no);
Alter table Siparis add constraint fk_s_ı foreign key(Ilac_No) references İlac(Ilac_No);
Alter table Siparis add constraint fk_s_p foreign key(Sicil_No) references Personel(Sicil_No);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Oluşturduğunuz tablolara 10’ar kayıt ekleyiniz.
Select * From Gorev;
Insert into Gorev values(1,"Müdür"),(2,"Müdür Yardımcısı"),(3,"Muhasebe Mü."),(4,"Muhasebe Ça."),(5,"Bilgisayat Mü."),(6,"Kayıt Tutan"),(7,"Kasiyer"),(8,"Bilgilendiren"),(9,"Sekreter"),(10,"Hademe");

Select * From EgitimDuzeyi;
Insert into EgitimDuzeyi values(1,90,100),(2,70,100),(3,40,50),(4,90,30),(5,25,100),(6,60,95),(7,90,100),(8,60,100),(9,100,100),(10,100,100);

Select * From Personel;
Insert into Personel values(1,"Berat","Kolay",20,1,2,"2002-07-16","");
Insert into Personel values(2,"Şükriye","Akbulut",73,10,7,"1965-07-16","2021-12-28");
Insert into Personel values(3,"Rasim Ozan","Kütahyalı",31,2,2,"1970-08-30","");
Insert into Personel values(4,"Ahmet","Çakar",58,3,6,"1970-07-16","2020-07-01");
Insert into Personel values(5,"Fatih","Terim",60,9,1,"2001-06-11","2015-09-25");
Insert into Personel values(6,"Gizem","Koçyiğit",25,8,9,"2002-07-16","");
Insert into Personel values(7,"Aslıhan","Küçük",31,7,5,"2000-10-15","2022-06-01");
Insert into Personel values(8,"Yunus","Kolay",20,5,2,"2002-07-11","2021-12-28");
Insert into Personel values(9,"Ahmet Sefa","Demirci",98,10,7,"1900-11-06","1980-10-10");
Insert into Personel values(10,"Emrehan","Tosun",30,4,4,"2002-06-14","");

Select * From İlac;
Insert into İlac values(1,"AFINITOR",5,"2025-01-01","Böbrek İlacı",30);
Insert into İlac values(2,"ALOMIDE",6,"2021-12-28","Antialerjik İlacı",15);
Insert into İlac values(3,"ARZERRA",10,"2026-07-16","Lösemi İlacı",100);
Insert into İlac values(4,"BETOPTIC",100,"2025-01-01","Hipertansiyon İlacı",40);
Insert into İlac values(5,"CATAFLAM",50,"2026-07-16","Diklofenak İlacı",30);
Insert into İlac values(6,"DESFERAL",55,"2024-06-10","Demir İlacı",10);
Insert into İlac values(7,"DUOTRAV",65,"2030-01-15","Göz İlacı",100);
Insert into İlac values(8,"EMADİNE",72,"2021-12-18","Alerjik İlacı",35);
Insert into İlac values(9,"FLAREX",31,"2021-12-28","Göz İlacı",100);
Insert into İlac values(10,"GALVUS MET",90,"2026-07-16","Diyabet İlacı",65);

Select * From Musteri;
Insert into Musteri values(1,"Erkin","Yıldırım",6,"İstanbul",54126);
Insert into Musteri values(2,"Neslihan","Atagül",1,"Trabzon",0587956321);
Insert into Musteri values(3,"Mehmet","Hiçyılmaz",7,"Rize",054855);
Insert into Musteri values(4,"Ceren","Gemici",3,"Eskişehir",054756);
Insert into Musteri values(5,"Anıl","Hiçyılmaz",10,"Antalya",054789);
Insert into Musteri values(6,"Semih","Uzanma",6,"Van",05478);
Insert into Musteri values(7,"Mihriban","Zor",5,"Rize",056258);
Insert into Musteri values(8,"Yavus Sultan","Selim",2,"Amasya",054685);
Insert into Musteri values(9,"Cem","Şahin",5,"Tokat",054656);
Insert into Musteri values(10,"Çağla","Polatoğlu",2,"Mersin",05446);

Select * From Siparis;
Insert into Siparis values(1,2,3,10,"2021-12-10"),(2,3,4,15,"2020-12-10"),(3,4,5,10,"2021-11-11"),(4,5,6,10,"2021-12-11"),(5,6,7,11,"2021-10-10"),(6,7,8,2,"2015-01-11"),(7,8,9,5,"2012-02-10"),(8,9,10,11,"2021-07-11"),(9,2,3,10,"2024-10-10"),(10,4,5,2,"2021-12-10");

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Var olan bir ilacın fiyatını güncelleyiniz.
UPDATE İlac set Ilac_Fiyat = 40 where Ilac_No=2;

-- 5. İlaç adı A veya D ile başlayan ürünlerin hangi müşteriler tarafından alındığını ilaç adı bilgisi ile görüntüleyen sorguyu yazın.
select m.M_Ad as "Müşteri Adı",  i.Ilac_Ad as "İlaç Adı" from siparis s  inner join musteri m on s.M_no = m.M_no 
inner join ilac i on s.Ilac_No = i.Ilac_No where i.Ilac_Ad LIKE 'A%' or i.Ilac_Ad LIKE 'D%';

-- 6. En çok ilaç alan müşterinin bilgilerini ve ilacın bilgilerini getiren sorguyu yazın. (inner join ile)
select m.M_Ad as "Müşteri Adı",  i.Ilac_Ad as "İlaç Adı", max(s.İlac_adet) as "En Çok İlaç Alan" from siparis s inner join musteri m on s.M_no = m.M_no
inner join ilac i on s.Ilac_No = i.Ilac_No;

-- 7. Müşterileri eğitim düzeylerine göre kategorize eden sorguyu yazın. 
Select m.M_Ad as "Müşteri Adı", e.e_ilkokul as "İlkOkul Notu", e.e_ortaokul as "OrtaOkul Notu" from musteri m inner join egitimduzeyi e on m.egt_no = e.egt_no 
order by e.e_ilkokul and e.e_ortaokul;

-- 8. İlaçlara en çok ücret ödeyen müşteriden en az ücret ödeyen müşteriye doğru sıralama yapan sorguyu yazınız.
Select m.M_Ad as "Müşteri Adı", i.Ilac_Ad as "İlaç Adı", i.Ilac_Fiyat from siparis s inner join musteri m on s.M_no = m.M_no 
inner join ilac i on s.Ilac_No = i.Ilac_No order by i.Ilac_Fiyat asc;

-- 9. Bu soruların dışında 3 adet soru üretip yanıtlayınız.
-- 9.1 Personel yaşlarının 60 küçük olmaynların sayısını ver ? 
Select Personel.p_ad as "60 Yaşından küçük olmayanlar" from Personel where not p_yas < 60;

-- 9.2 İlac Adı 'A' ile başlayan ve fiyatı 20 ve 70 arasındaki ilaçları getir ? 
Select Ilac_Ad as "İLAÇLAR" from Ilac where Ilac_Ad LIKE "A%" AND Ilac_Fiyat > 20 AND Ilac_Fiyat < 70;

-- 9.3 Personellerden yaşı 50'den küçük olan rasgele bir personellerin adını ve soyadını yazan sorguyu getirin ? 
Select p_ad,p_soyad,p_yas from Personel where p_yas < 50 order by rand();

-- 9.4 = Personellerin görevlerini getiren sorgu ?
Select p.p_ad as"Personel Ad", g.g_Ad as "Görev Ad" from personel p inner join gorev g on g.gorev_no = p.gorev_no;