create database DanKaEDM
use DanKaEDM

drop database DanKaEDM

drop table Khoahocedm

create table Khoahocedm
(
	maKhoahoc int identity(1,1),
	tenKhoahoc nvarchar(100) not null,
	
	donGia money,
	moTa ntext,
	hinhMinhhoa varchar(50),
	maTl int,
	tengiangvien nvarchar(50),
	ngayCapnhat smalldatetime,
	soLuongban int check(soLuongban>0),
	soLanxem int default 0,
	linkdemo varchar(200),
	lotrinh nvarchar(100),
	constraint pk_khoahocedm primary key(maKhoahoc)
)

drop table theloai

create table theloai
(
	maTl int identity(1,1),
	tenTheloai nvarchar(30)
	constraint pk_theloai primary key(maTl)
)



alter table khoahocedm add constraint fk_khoahocedm_theloai foreign key (maTl) references theloai(maTl)
--alter table khoahocedm add constraint fk_khoahocedm_giangvien foreign key (maGv) references giangvien(maGv)


create table khachhang
(
	maKh int identity(1,1),
	hoTenkh nvarchar(50),
	diaChikh nvarchar(50),
	dienThoaikh varchar(10),
	tenDn varchar(15),
	matKhau varchar(15),
	
	ngaySinh smalldatetime,
	gioiTinh bit default 1,
	email varchar(50),
	constraint pk_khachhang primary key(maKh)
)

drop table khachhang
drop table dondathang

create table dondathang
(
	soDh int identity(1,1),
	maKh int,
	ngayDh smalldatetime,
	triGia money check (triGia>0),
	htThanhtoan bit default 0,
	htGiaohang bit default 0,
	constraint pk_dondathang primary key(soDh)
)

drop table ctdathang

create table ctdathang
(
	soDh int,
	maKhoahoc int,
	soLuong int check(soLuong>0),
	donGia decimal(9,2) check(donGia>=0),
	thanhTien as soLuong*donGia,
	constraint pk_ctdathang primary key(soDh,maKhoahoc)
)


alter table dondathang add constraint fk_dondathang_khachhang foreign key (makh) references khachhang(makh)
alter table ctdathang add constraint fk_ctdathang_dondathang foreign key (sodh) references dondathang(sodh)
alter table ctdathang add constraint fk_ctdathang_khoahocedm foreign key (makhoahoc) references khoahocedm(makhoahoc)





set identity_insert [dbo].[khachhang] on
insert [dbo].[khachhang] ([makh], [hotenkh], [diachikh], [dienthoaikh], [tendn], [matkhau], [ngaysinh], [gioitinh], [email]) values (1, N'Hoàng Đức Bình', N'Bến Cát', N'0988936592', N'hoangducbinh', N'12345', cast(0x59310000 as smalldatetime), 1, N'binh@tdmu.edu.vn')

set identity_insert [dbo].[khachhang] off




set identity_insert [dbo].[giangvien] on
insert [dbo].[giangvien] ([magv], [tengv], [diachi], [dienthoai]) values (1, N'Hoàng Đức Bình', N'Bến Cát - Bình Dương ', N'222103969')

set identity_insert [dbo].[giangvien] off



set identity_insert [dbo].[khoahocedm] on
insert [dbo].khoahocedm ([makhoahoc], [tenkhoahoc], [dongia], [mota], [hinhminhhoa], [matl], [magv], [ngaycapnhat], [soluongban], [solanxem]) 
values (1, N'khóa học vinahouse cơ bản', 500000000, 
N'nội dung khóa học : vinahouse cơ bản gồm có 9 bài :
bài 1: Gới thiệu về dòng nhạc vinahouse
bài 2: Hướng dẫn cài đặt phần mềm
bài 3: Hướng dẫn soạn drum 
bài 4: Hướng dẫn mở rộng lên ý tưởng
bài 5: Hướng dẫn soạn bassline
bài 6: Hướng dẫn bố trí hiệu ứng 
bài 7: Hướng dẫn đệm hòa âm với nhạc cụ
bài 8: Hướng dẫn đệm hòa âm với bassline
bài 9: Hướng dẫn mix master
'
, null, 1, 1, cast(0x95270000 as smalldatetime), 120, 0)

set identity_insert [dbo].[khoahocedm] off



set identity_insert [dbo].[dondathang] on
insert [dbo].[dondathang] ([sodh], [makh], [ngaydh], [trigia], [dagiao], [ngaygiaohang]) values (1, 1, cast(0x9d500000 as smalldatetime),  cast(75000.00 as decimal(9, 2)), 0, cast(0x9d500000 as smalldatetime))
set identity_insert [dbo].[dondathang] off



insert [dbo].[ctdathang] ([sodh], [makhoahoc], [soluong], [dongia]) values (1, 19, 1, 25000)







create table quangcao
(
	stt int identity(1,1),
	tencongty nvarchar(200) not null,
	hinhminhhoa varchar(20),
	href varchar(100),
	ngaybatdau smalldatetime,
	ngayhethan smalldatetime,
	constraint pk_quangcao primary key(stt)
)
go









drop table Admin
create table ADMIN
(
	maAdmin int identity(1,1),
	hoTenAdmin nvarchar(50),
	diaChiAdmin nvarchar(50),
	dienThoaiAdmin varchar(10),
	tenDnAdmin varchar(15),
	matKhauAdmin varchar(15),
	ngaySinhAdmin smalldatetime,
	gioiTinhAdmin bit default 1,
	emailAdmin varchar(50),
	quyenAdmin int default 1,
	constraint pk_admin primary key(maAdmin)
)
go


set identity_insert [dbo].[admin] on
insert [dbo].[admin] ([maadmin], [hotenadmin], [diachiadmin], [dienthoaiadmin], [tendnadmin], [matkhauadmin], [ngaysinhadmin], [gioitinhadmin], [emailadmin],[quyenadmin]) values (1, N'Hoàng Đức Bình', N'bến cát', N'2229103969', N'hoangducbinh', N'12345', cast(0x59310000 as smalldatetime), 1, N'hoangducbinh@tdmu.edu.vn',1)
set identity_insert [dbo].[khachhang] off
