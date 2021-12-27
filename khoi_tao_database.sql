CREATE DATABASE IF NOT EXISTS book;

USE book;

CREATE TABLE IF NOT EXISTS khach_hang(
	ma_khach_hang				varchar(10) not null,
	tai_khoan 					varchar(255) not null,
    mat_khau 					varchar(36) not null,
    email 						varchar(255),
    dia_chi 					varchar(255),
    dien_thoai 					varchar(20),
    gioi_tinh 					varchar(6),
    ngay_sinh 					date,
    ho_ten 						varchar(80),
    primary key (ma_khach_hang)
);

CREATE TABLE IF NOT EXISTS don_hang(
	ma_don_hang				varchar(10) not null,
	da_thanh_toan 			varchar(50) not null,
    ngay_giao 				date,
    ngay_dat 				date default now(),
    tinh_trang_giao_hang 	varchar(150),
    khach_hang 				varchar(10) not null,
    primary key (ma_don_hang)
);

CREATE TABLE IF NOT EXISTS sach(
	ma_sach				varchar(10) not null,
	ten_sach 			varchar(255) not null,
    gia_ban 			float default 0,
    mo_ta 				varchar(255),
    anh_bia 			binary,
    ngay_cap_nhat 		date,
    so_luong_ton 		float,
    chu_de 				varchar(10),
    nha_xuat_ban 		varchar(10),
    primary key (ma_sach)
);

CREATE TABLE IF NOT EXISTS tac_gia(
	ma_tac_gia				varchar(10) not null,
	ten_tac_gia 			varchar(155) not null,
    dia_chi 				varchar(255),
    tieu_su 				varchar(255),
    dien_thoai 				varchar(20),
    primary key (ma_tac_gia)
);

CREATE TABLE IF NOT EXISTS chu_de(
	ma_chu_de			varchar(10) not null,
	ten_chu_de 			varchar(155),
    primary key (ma_chu_de)
);

CREATE TABLE IF NOT EXISTS nha_xuat_ban(
	ma_nsb				varchar(10) not null,
	ten_nsb 			varchar(155) not null,
    dien_thoai 			varchar(20),
    dia_chi 			varchar(255),
    primary key (ma_nsb)
);

CREATE TABLE IF NOT EXISTS chi_tiet_hoa_don(
	ma_don_hang			varchar(10) not null,
	ma_sach 			varchar(10) not null,
    so_luong 			int not null,
    don_gia 			float not null,
    primary key (ma_don_hang,ma_sach)
);

CREATE TABLE IF NOT EXISTS chi_tiet_tac_gia_sach(
	ma_tac_gia			varchar(10) not null,
	ma_sach 			varchar(10) not null,
    vai_tro 			varchar(255),
    vi_tri 				varchar(50),
    primary key (ma_tac_gia,ma_sach)
);

ALTER TABLE don_hang
	ADD CONSTRAINT fk_khach_hang_don_hang
    foreign key (khach_hang) REFERENCES khach_hang(ma_khach_hang);

ALTER TABLE sach
	ADD CONSTRAINT fk_chu_de_sach
    foreign key (chu_de) REFERENCES chu_de(ma_chu_de);

ALTER TABLE sach
	ADD CONSTRAINT fk_nha_xuat_ban_sach
    foreign key (nha_xuat_ban) REFERENCES nha_xuat_ban(ma_nsb);
    
ALTER TABLE chi_tiet_hoa_don
	ADD CONSTRAINT fk_chi_tiet_hoa_don_ma_don_hang
    foreign key (ma_don_hang) REFERENCES don_hang(ma_don_hang);
ALTER TABLE chi_tiet_hoa_don
	ADD CONSTRAINT fk_chi_tiet_hoa_don_ma_sach
    foreign key (ma_sach) REFERENCES sach(ma_sach);
    
ALTER TABLE chi_tiet_tac_gia_sach
	ADD CONSTRAINT fk_chi_tiet_tac_gia_sach_ma_tac_gia
    foreign key (ma_tac_gia) REFERENCES tac_gia(ma_tac_gia);
ALTER TABLE chi_tiet_tac_gia_sach
	ADD CONSTRAINT fk_chi_tiet_tac_gia_sach_ma_sach
    foreign key (ma_sach) REFERENCES sach(ma_sach);
