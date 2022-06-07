create database quan_li_ban_hang_2022
go
use quan_li_ban_hang_2022
go
create table KH(
	maKH char(10) primary key, hoten char(50),
	diachi char(100), sodt int, hinhthuc bit
)
go
create table HH
(
	maHH char(10) primary key,
	tenHH char(50),
	DVT char(100), dongia float, trangthai bit
)
go
create table HD
(
	soHD char(10) primary key,
	ngaylap date, ngaygiao date,
	tongtien float,
	maKH char(10) references KH(maKH),
	nguoilap char(50)
)
go
create table CT_HD
(
	soHD char(10) references HD(soHD),
	maHH char(10) references HH(maHH), soluong int,
	thanhtien money
)
go
drop table CT_HD

--insert bang HH
insert into HH Values('H1', N'bánh oreo', N'túi', '5000', 1)
insert into HH Values('H2', N'coca cola', N'chai', '10000', 1)
insert into HH Values('H3', N'kẹo', N'túi', '5000', 1)
insert into HH Values('H4', N'nước lọc', N'chai', '7000', 1)
insert into HH Values('H5', N'kem', N'cái', '2000', 1)
insert into HH Values('H6', N'đường', N'gói', '12000', 1)
insert into HH Values('H7', N'sữa', N'hộp', '20000', 1)
insert into HH Values('H8', N'cafe', N'hộp', '35000', 1)
go
-- them du lieu vao bảng khách hàng
insert into KH values('K1', N'Linh', N'Trương Định', 2423423, 0)
insert into KH values('K2', N'Trang', N'Hai Bà Trưng', 02022, 1)
insert into KH values('K3', N'khánh', N'Đống Đa', 2215120, 0)
insert into KH values('K4', N'Hoàng', N'Mỹ Đình', 51062, 1)
insert into KH values('K5', N'Xuân',N'Thanh Xuân', 3423435, 0)
insert into KH values('K6', N'Vũ', N'Hà Tây', 522342, 1)
--them dữ liệu vào bảng HD
 insert into HD(soHD, ngaylap, ngaygiao, maKH, nguoilap) values ('HD01', '2021-12-30', '2021-12-30', 'K1', N'Ngọc')
 insert into HD(soHD, ngaylap, ngaygiao, maKH, nguoilap) values ('HD02', '2021-10-28', '2021-10-29', 'K1', N'Linh')
 insert into HD(soHD, ngaylap, ngaygiao, maKH, nguoilap) values ('HD03', '2021-11-30', '2021-11-30', 'K2', N'Khánh')
 insert into HD(soHD, ngaylap, ngaygiao, maKH, nguoilap) values ('HD04', '2021-09-30', '2021-09-30', 'K2', N'An')
 insert into HD(soHD, ngaylap, ngaygiao, maKH, nguoilap) values ('HD05', '2021-08-30', '2021-08-30', 'K1', N'Vy')

 select * from CT_HD
 --them vao bang CT_HD 
 insert into CT_HD(soHD, maHH, soluong) values('HD01', 'H8', 2)
 insert into CT_HD(soHD, maHH, soluong) values('HD02', 'H2', 10)
 insert into CT_HD(soHD, maHH, soluong) values('HD05', 'H3', 3)
 insert into CT_HD(soHD, maHH, soluong) values('HD03', 'H2', 4)
 insert into CT_HD(soHD, maHH, soluong) values('HD04', 'H4', 5)



 --update cot thanh tien trong CT_HD
 update CT_HD set thanhtien=dongia*soluong from HH, CT_HD where 
 HH.maHH=CT_HD.maHH
 --tao view bang HH va bang CT_HD
 create view V_tonghop
 as
 select HH.maHH, HH.tenHH, HH.DVT, HH.dongia, HH.trangthai, soluong, thanhtien
 from HH, CT_HD
 where HH.maHH=CT_HD.maHH

 -- tao view tong hop 1
create view v_tonghop1
as
select HD.soHD, ngaylap, ngaygiao, CT_HD.maHH, tenHH, DVT, dongia, trangthai
from HH, KH, CT_HD, HD
where KH.maKH=HD.maKH and HD.soHD=CT_HD.soHD and HH.maHH=CT_HD.maHH

--tao view v_tonghop2
alter view v_tonghop2
as
select HD.soHD, ngaylap, ngaygiao, HD.maKH,hoten as tenKH , diachi, sodt, hinhthuc
from KH, HD, CT_HD
where HD.soHD=CT_HD.soHD and HD.maKH=KH.maKH and hinhthuc=0

select * from v_tonghop2
 select * from v_tonghop1
 select COUNT(maHH) as soluong from V_tonghop where maHH='H2'
 --toi dang o day :
 --Khan da den day