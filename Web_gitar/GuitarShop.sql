create database GuitarShop -- Web
on
(name = 'Guitar_Data', filename = 'F:\Web\ThucHanh\GuitarShop\CSDL\Guitar.MDF')
log on
(name = 'Guitar_Log', filename = 'F:\Web\ThucHanh\GuitarShop\CSDL\Guitar.LDF')

use GuitarShop
--------------------------

create table TheLoaiDan
(
	MaTheLoai	int identity(1,1) primary key,
	TheLoai	nvarchar(30)
)

---------------------------
create table ThuongHieuDan
(
	MaThuongHieu	int identity(1,1) primary key,
	TenThuongHieu	nvarchar(30),
	Logo			varchar(50)
)
----------------------------
Create table ChiTietDan
(
	MaDan			int identity(1,1) primary key,
	NgayCapNhat		datetime,
	TenDan			nvarchar(50) not null,
	ChatLieu		nvarchar(30),
	GiaBan			decimal(18,0),
	MoTa			nText,
	AnhBia			varchar(40),
	SlTon			int,
	MaThuongHieu	int,
	MaTheLoai		int,
	Anh_1			varchar(50),
	Anh_2			varchar(50),
	Anh_3			varchar(50),
	foreign key(MaThuongHieu) references ThuongHieuDan(MaThuongHieu) on update cascade,
	foreign key(MaTheLoai) references TheLoaiDan(MaTheLoai) on update cascade
)
------------------------------

------------------------

create table KhachHang
(
	MaKH			int identity(1,1) primary key,
	HoTen			nvarchar(50) ,
	TaiKhoan		nvarchar(50),
	MatKhau			nvarchar(50) unique,
	Email			varchar(50),
	DiaChi_KH		nvarchar(70),
	DienThoai_KH	varchar(13),
)
-------------------------

create table DonDatHang
(
	MaDonHang			int identity(1,1) primary key,
	DaThanhToan			bit,
	TinhTrangGiaoHang	bit,	
	NgayDat				datetime,
	NgayGiao			datetime,
	MaKH				int,--varchar(5),
	foreign key(MaKH) references KhachHang(MaKH) on update cascade
)

--------------------------
create table ChiTietDonHang
(
	MaDonHang	int ,
	MaDan		int ,--varchar(5),
	primary key(MaDonHang,MaDan),
	SlMua		int,
	DonGia		decimal(18,0),
	foreign key (MaDan) references ChiTietDan(MaDan) on update cascade,
	foreign key (MaDonHang) references DonDatHang(MaDonHang) on update cascade
)
------------------------
Create table Admin
(
	MaAdmin		int identity(1,1),
	User_Admin	varchar(30) primary key,
	Pass_Admin	varchar(30) not null,
	HoTen_Admin	nVarchar(50)
)
------------------------

Create table CapNhat_LogoCuaHang
(
	LogoCuaHang	varchar(50),
)
------------------------
Create table CapNhat_SdtCuaHang
(
	SdtCuaHang	varchar(50),
)
------------------------

-------------------------

INSERT TheLoaiDan(TheLoai) VALUES (N'Guitar Classic')
INSERT TheLoaiDan(TheLoai) VALUES (N'Guitar Acoustic')
--------------------------
INSERT ThuongHieuDan(TenThuongHieu,Logo) VALUES (N'Guitar Taylor','logo_Taylor.jpg')
INSERT ThuongHieuDan(TenThuongHieu,Logo) VALUES (N'Guitar Yamaha','logo_Yamaha.jpg')
INSERT ThuongHieuDan(TenThuongHieu,Logo) VALUES (N'Guitar Trần','logo_guitrTran.png')
INSERT ThuongHieuDan(TenThuongHieu,Logo) VALUES (N'Guitar Suzuki','logo_Suzuki.png')

--------------------------
set dateformat dmy
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'Guitar Ván Ép Cao Cấp Cho Beginer',N'Ván Ép Cao Cấp',900000,N'Đây là dòng sản xuất dành cho đa phần sinh viên hạn hẹp về tài chính nhưng muốn có cây đàn để tập ĐÚNG NGHĨA.Vì đa phần những cây đàn rẻ tiền thường ACTION RẤT CAO.Hầu như ko thể tập được.Bấm xíu sẽ đau tay chịu ko nổi. Còn bạn nào không đến nỗi khó khăn nên mua dòng tư 1.300.000 đến 2.000.000...','1a.jpg',50,'3','2','1b.jpg','1c.jpg','1d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'GUITAR ACOUSTIC HỒNG ĐÀO',N'Gỗ Hồng Đào',1500000,N'Cần Bằng Lăng Có ty chỉnh,dây Alice 436,Khóa Đúc nhập ,ngựa lược bằng xương bò cao cấp,Action thấp dễ bấm, Đây là dòng guitar dành cho các bạn chơi đệm hay hay fingerstyle đều tốt.','2a.jpg',50,'3','2','2b.jpg','2c.jpg','2d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'TAYLOR ACADEMY SERIES A12E-N',N'Gỗ Layered Sapele',16900000,N'Kích thước nhỏ gọn, phù hợp để chơi fingerstyle, Sự kết hợp tự nhiên của Sitka và gỗ vân sam trắng đặc điểm với vân sam Adirondack, đáp ứng với sức mạnh, sự phong phú và âm lượng tốt.','3a.jpg',50,'1','2','3b.jpg','3c.jpg','3d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'BABY TAYLOR',N'Gỗ Sitka Spruce',8500000,N'Tâm điểm của cây đàn là âm thanh guitar thực thụ và mời gọi sự trải nghiệm chơi đàn. Tích hợp 1 tấm sapele đen phía sau và các mặt bên và phần trên bằng gỗ spruce hay mahogany. Phiên bản cây đàn có phần trên gỗ mahogany sẽ làm âm thanh trầm hơn một chút so với phần trên bằng gỗ spruce.','4a.jpg',50,'1','2','4b.jpg','4c.jpg','4d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'YAMAHA FG-201B',N'Gỗ vân sam ',3400000,N'Vẻ đẹp bề ngoài khá truyền thống và đơn giản, mộc mạc nhưng âm thanh buông phím đầu tiên là ấm và ngọt vô cùng.Mặt sườn, lưng, ngựa và phím được chế tạo từ gỗ Nato','5a.jpg',50,'2','2','5b.jpg','5c.jpg','5d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'Custom Điệp-OD29',N'Gỗ điệp',2900000,N'Cần Bằng Lăng nguyên khối Có ty chỉnh, Khóa Đúc nhập , ngựa lược bằng xương bò cao cấp,Action thấp dễ bấm, Khóa Đúc nhập , ngựa lược bằng xương bò cao cấp,Action thấp dễ bấm','6a.jpg',50,'3','2','6b.jpg','6c.jpg','6d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'Acoustic Electric YAMAHA EF-06',N'Gỗ vân sam',6900000,N'Đây là dòng đàn tầm trung của Yamaha được sản xuất tại Nhật Bản, Đàn còn nguyên zin không sửa chữa, các thông số chuẩn, Đàn cần thẳng, action nhẹ dễ bấm.','7a.jpg',50,'2','2','7b.jpg','7c.jpg','7d.jpg')


INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'HỒNG ĐÀO-CHD13',N'Gỗ Spruce',1300000,N'Cần Hồng đào Có ty chỉnh, Khóa Gold nhập , ngựa lược bằng xương bò cao cấp, Action thấp dễ bấm, Đây là dòng guitar dành cho các bạn chơi đệm hát,người mới chơi.','8a.jpg',50,'3','1','8b.jpg','8c.jpg','8d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'Còng Cườm-CC35',N' Gỗ Enngelmann Spruce',3200000,N'Khóa Gold nhập , ngựa lược bằng xương bò cao cấp,Action thấp dễ bấm, Mức độ gia công: Kĩ, Cần Bằng lăng Có ty chỉnh','9a.jpg',50,'3','1','9b.jpg','9c.jpg','9d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'YAMAHA C-150',N'Gỗ Spruce',3200000,N'Đàn còn rất tốt, âm thanh trong sáng, đàn được vệ sinh sạch sẽ, và không bị bất cứ lỗi nào,  Guitar Classic với hình thức rất đẹp và âm thanh ngọt ngào ấm áp đặc trưng.','10a.jpg',50,'2','1','10b.jpg','10c.jpg','10d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'Terada TG-307N',N'Gỗ Spruce',6950000,N'Guitar Classic Terada TG-307N mang lại hiệu suất cao do sử dụng bộ khuếch đại có sẵn để tạo sự thoải mái khi sử dụng và điều khiển. Kiểu dáng hiện đại, phá cách, thân đàn lướt nhẹ, thích hợp với những liveshow nhạc rock.','11a.jpg',50,'2','1','11b.jpg','11c.jpg','11d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('14/3/2018',N'TAYLOR 214E-N',N'Rosewood Laminate',23400000,N'Thuộc Series 200 được làm từ gỗ hồng dát mỏng, thiết kế dựa trên những yếu tố cơ bản để tạo ra một cây guitar mang lại những trải nghiệm tuyệt vời, tiếng và âm thanh rõ ràng, cân bằng và trung thực','12a.jpg',50,'1','1','12b.jpg','12c.jpg','12d.jpg')


INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'TAYLOR 312CE-N',N'Sitka Spruce',49300000,N'Đàn guitar Taylor 312CE-N có dây bàng nylon thuộc dòng 300 cao cấp của Taylor. Đây là một sự lựa chọn tuyệt vời cho người chơi yêu thích sự thoải mái của một cây đàn ghi-ta acoustic nhỏ và các tính năng hiện đại như tích hợp máy ghi âm và phát lại, mang lại những trải nghiệm tuyệt vời, tiếng và âm thanh rõ ràng, cân bằng và trung thực.','13a.jpg',50,'1','1','13b.jpg','13c.jpg','13d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'SUZUKI SDG-45CE NL',N'Gỗ vân sam',6900000,N'Đàn guitar Suzuki SDG-45 CENL nổi bật với kiểu dáng hiện đại, là mẫu thiết kế chuẩn cho nhiều kiểu đàn Modern hiện nay','14a.jpg',50,'4','2','14b.jpg','14c.jpg','14d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'Yamaha FX310AII',N'Gỗ vân sam',5490000,N'Thuộc Series 200 được làm từ gỗ hồng dát mỏng, thiết kế dựa trên những yếu tố cơ bản để tạo ra một cây guitar mang lại những trải nghiệm tuyệt vời, tiếng và âm thanh rõ ràng, cân bằng và trung thực','15a.jpg',50,'2','2','15b.jpg','15c.jpg','15d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'TAYLOR 110E',N'Sitka Spruce',17900000,N'Tương tự Series 200, Series 100 cung cấp khả năng phục hồi trong điều kiện khí hậu biến đổi, và cần đàn hẹp hơn một chút, thùng đàn 11/16 inch, đàn Guitar Taylor 110E là một trong những cây guitar tốt nhất bạn sẽ tìm thấy, phù hợp với túi tiền của mình.','16a.jpg',50,'1','2','16b.jpg','16c.jpg','16d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'FG180-50TH',N'Gỗ vân sam nguyên tấm',19150000,N'TFG180 là loại guitar dân gian đầu tiên của Yamaha, có từ 50 năm đến 1966. Mô hình này đã được phát triển dựa trên các thông số kỹ thuật từ năm đó, tạo ra một phiên bản hiện đại bằng cách áp dụng kỹ thuật mới nhất của Yamaha.','17a.jpg',50,'2','2','17b.jpg','17c.jpg','17d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'FG830',N'Solid Spruce',9370000,N'Những âm thanh sống động và được cải tiến nhờ phần lưng và mặt sau bằng gỗ hồng ngoại cung cấp âm thanh được cải thiện thông qua độ sâu hơn. Sự xuất hiện, với lớp vỏ bào ngư quanh lỗ âm thanh, là sang trọng hơn và rõ ràng là bước lên','18a.jpg',50,'2','2','18b.jpg','18c.jpg','18d.jpg')

INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'Taylor 314CE-N',N'Solid Spruce',46500000,N'Đàn Guitar Classic Taylor 314CE-N là model classic cao cấp của Taylor, đáp ứng hoàn hảo trong phòng thu cũng như trên các sân khấu lớn.','19a.jpg',50,'1','1','19b.jpg','19c.jpg','19d.jpg')
INSERT ChiTietDan(NgayCapNhat,TenDan,ChatLieu,GiaBan,MoTa,AnhBia,SlTon,MaThuongHieu,MaTheLoai,Anh_1,Anh_2,Anh_3) VALUES('13/4/2018',N'Yamaha CG112 MC',N'Gỗ Vân Sam',5200000,N'Đàn Guitar Classic Yamaha CG-112 MC với mặt top là gỗ thịt Tuyết Tùng, mang lại âm thanh trầm, ấm, dầy, âm thanh có thể lan tỏa đầy căn phòng bạn chơi. Model tương tự là CG-112 MS với mặt top là gỗ Vân Sam.','20a.jpg',50,'2','1','20b.jpg','20c.jpg','20d.jpg')


--------------------------

INSERT KhachHang(HoTen,TaiKhoan,MatKhau,Email,DiaChi_KH,DienThoai_KH) VALUES(N'Nguyễn Thành Luận','luan','1','thanhluan0932777503@gmail.com',N'22/4,Khu Phố 4,P.Hiệp Thành,Q.12','0932777503')
INSERT KhachHang(HoTen,TaiKhoan,MatKhau,Email,DiaChi_KH,DienThoai_KH) VALUES(N'Nguyễn Cát Tiên','tien','2','nguyencattien@gmail.com',N'475A Điện Biên Phủ','0932777503')
INSERT KhachHang(HoTen,TaiKhoan,MatKhau,Email,DiaChi_KH,DienThoai_KH) VALUES(N'Nguyễn Ngọc Hùng','hung','3','hung@gmail.com',N'475A Điện Biên Phủ','0932777503')

-------------------------

Insert Admin(User_Admin,Pass_Admin,HoTen_Admin) Values('admin','123',N'Nguyễn Thành Luận')
--------------------------
Insert CapNhat_LogoCuaHang(LogoCuaHang) Values('logo_GuitarShop.png')
---------------------------------------------------------
Insert CapNhat_SdtCuaHang(SdtCuaHang) Values('0123456789')
---------------------------------------------------------
--DBcC checkident ('ThuongHieuDan', reseed, 0)
--DBcC checkident ('TheLoaiDan', reseed, 0)
--DBcC checkident ('KhachHang', reseed, 3)


--drop table ChiTietDonHang
--drop table DonDatHang
--drop table KhachHang
--drop  table ChiTietDan
--drop table ThuongHieuDan
--drop  table TheLoaiDan
--drop table Admin
--drop table CapNhat_LogoCuaHang
--drop table CapNhat_SdtCuaHang


select * from TheLoaiDan
select	* from ThuongHieuDan
select TenDan,GiaBan from ChiTietDan
select	NgayCapNhat,TenDan,TheLoai,ChatLieu,GiaBan,MoTa,AnhBia,Anh_1,Anh_2,Anh_3,TenThuongHieu from ChiTietDan,ThuongHieuDan,TheLoaiDan where TheLoaiDan.MaTheLoai=ChiTietDan.MaTheLoai and ThuongHieuDan.MaThuongHieu=ChiTietDan.MaThuongHieu

select * from KhachHang
select * from DonDatHang
select * from ChiTietDonHang
select DonDatHang.MaDonHang,TenDan,HoTen,Email,DiaChi_KH,DienThoai_KH,SlMua,NgayDat,NgayGiao from DonDatHang,ChiTietDonHang,KhachHang,ChiTietDan where DonDatHang.MaDonHang=ChiTietDonHang.MaDonHang and KhachHang.MaKH=DonDatHang.MaKH and ChiTietDonHang.MaDan=ChiTietDan.MaDan

select * from Admin

select * from CapNhat_LogoCuaHang
select * from CapNhat_SdtCuaHang
select * from ThuongHieuDan

