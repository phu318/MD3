create database quanly;
use quanly;
CREATE TABLE VatTu (
                       id INT PRIMARY KEY,
                       ma_vat_tu VARCHAR(255),
                       ten_vat_tu VARCHAR(255),
                       don_vi_tinh VARCHAR(50),
                       gia_tien DECIMAL(10, 2)
);
INSERT INTO VatTu VALUES
                      (1, 'VT001', 'Vật tư 1', 'Cái', 10.5),
                      (2, 'VT002', 'Vật tư 2', 'Hộp', 15.75),
                      (3, 'VT003', 'Vật tư 3', 'Bộ', 25),
                      (4, 'VT004', 'Vật tư 4', 'Kg', 8.2),
                      (5, 'VT005', 'Vật tư 5', 'Cái', 12.5);
CREATE TABLE TonKho (
                        id INT PRIMARY KEY,
                        vat_tu_id INT,
                        so_luong_dau INT,
                        tong_so_luong_nhap INT,
                        tong_so_luong_xuat INT,
                        FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
INSERT INTO TonKho VALUES
                       (1, 1, 100, 200, 50),
                       (2, 2, 50, 150, 30),
                       (3, 3, 20, 60, 10),
                       (4, 4, 80, 120, 40),
                       (5, 5, 30, 80, 20);
CREATE TABLE NhaCungCap (
                            id INT PRIMARY KEY,
                            ma_nha_cung_cap VARCHAR(255),
                            ten_nha_cung_cap VARCHAR(255),
                            dia_chi VARCHAR(255),
                            so_dien_thoai VARCHAR(20)
);
INSERT INTO NhaCungCap VALUES
                           (1, 'NCC001', 'Nhà cung cấp 1', 'Địa chỉ 1', '123456789'),
                           (2, 'NCC002', 'Nhà cung cấp 2', 'Địa chỉ 2', '987654321'),
                           (3, 'NCC003', 'Nhà cung cấp 3', 'Địa chỉ 3', '111222333');
CREATE TABLE DonDatHang (
                            id INT PRIMARY KEY,
                            ma_don VARCHAR(255),
                            ngay_dat_hang DATE,
                            nha_cung_cap_id INT,
                            FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);
INSERT INTO DonDatHang VALUES
                           (1, 'DH001', '2024-01-01', 1),
                           (2, 'DH002', '2024-01-02', 2),
                           (3, 'DH003', '2024-01-03', 3);
CREATE TABLE PhieuNhap (
                           id INT PRIMARY KEY,
                           ma_phieu_nhap VARCHAR(255),
                           ngay_nhap DATE,
                           don_dat_hang_id INT,
                           FOREIGN KEY (don_dat_hang_id) REFERENCES DonDatHang(id)
);
INSERT INTO PhieuNhap VALUES
                          (1, 'PN001', '2024-01-05', 1),
                          (2, 'PN002', '2024-01-06', 2),
                          (3, 'PN003', '2024-01-07', 3);
CREATE TABLE PhieuXuat (
                           id INT PRIMARY KEY,
                           ma_phieu_xuat VARCHAR(255),
                           ngay_xuat DATE,
                           ten_khach_hang VARCHAR(255)
);
INSERT INTO PhieuXuat VALUES
                          (1, 'PX001', '2024-01-10', 'Khách hàng A'),
                          (2, 'PX002', '2024-01-11', 'Khách hàng B'),
                          (3, 'PX003', '2024-01-12', 'Khách hàng C');
CREATE TABLE ChiTietDonHang (
                                id INT PRIMARY KEY,
                                don_hang_id INT,
                                vat_tu_id INT,
                                so_luong_dat INT,
                                FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
                                FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
INSERT INTO ChiTietDonHang VALUES
                               (1, 1, 1, 30),
                               (2, 1, 2, 20),
                               (3, 2, 3, 10),
                               (4, 2, 4, 15),
                               (5, 3, 5, 25),
                               (6, 3, 1, 15);
CREATE TABLE ChiTietPhieuNhap (
                                  id INT PRIMARY KEY,
                                  phieu_nhap_id INT,
                                  vat_tu_id INT,
                                  so_luong_nhap INT,
                                  don_gia_nhap DECIMAL(10, 2),
                                  ghi_chu TEXT,
                                  FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
                                  FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
INSERT INTO ChiTietPhieuNhap VALUES
                                 (1, 1, 1, 50, 10.5, 'Ghi chú 1'),
                                 (2, 1, 2, 30, 15.75, 'Ghi chú 2'),
                                 (3, 2, 3, 15, 25, 'Ghi chú 3'),
                                 (4, 2, 4, 20, 8.2, 'Ghi chú 4'),
                                 (5, 3, 5, 35, 12.5, 'Ghi chú 5'),
                                 (6, 3, 1, 20, 10.5, 'Ghi chú 6');
CREATE TABLE ChiTietPhieuXuat (
                                  id INT PRIMARY KEY,
                                  phieu_xuat_id INT,
                                  vat_tu_id INT,
                                  so_luong_xuat INT,
                                  don_gia_xuat DECIMAL(10, 2),
                                  ghi_chu TEXT,
                                  FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
                                  FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);
INSERT INTO ChiTietPhieuXuat VALUES
                                 (1, 1, 1, 25, 12.5, 'Ghi chú PX1'),
                                 (2, 1, 2, 15, 18.75, 'Ghi chú PX2'),
                                 (3, 2, 3, 8, 30, 'Ghi chú PX3'),
                                 (4, 2, 4, 10, 15.5, 'Ghi chú PX4'),
                                 (5, 3, 5, 20, 20.5, 'Ghi chú PX5'),
                                 (6, 3, 1, 10, 15, 'Ghi chú PX6');
# bai1
CREATE VIEW vw_CTPNHAP AS
SELECT
    ctpn.id AS so_phieu_nhap_hang,
    ctpn.vat_tu_id AS ma_vat_tu,
    ctpn.so_luong_nhap,
    ctpn.don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM ChiTietPhieuNhap ctpn;
# cau 2
CREATE VIEW vw_CTPNHAP_VT AS
SELECT
    ctpn.id AS so_phieu_nhap_hang,
    ctpn.vat_tu_id AS ma_vat_tu,
    vt.ten_vat_tu,
    ctpn.so_luong_nhap,
    ctpn.don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM ChiTietPhieuNhap ctpn
         JOIN VatTu vt ON ctpn.vat_tu_id = vt.id;
# cau 3
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT
    ctpn.id AS so_phieu_nhap_hang,
    pn.ngay_nhap AS ngay_nhap_hang,
    pn.don_dat_hang_id AS so_don_dat_hang,
    ctpn.vat_tu_id AS ma_vat_tu,
    vt.ten_vat_tu,
    ctpn.so_luong_nhap,
    ctpn.don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM ChiTietPhieuNhap ctpn
         JOIN PhieuNhap pn ON ctpn.phieu_nhap_id = pn.id
         JOIN VatTu vt ON ctpn.vat_tu_id = vt.id;
# cau5
CREATE VIEW vw_CTPNHAP_loc AS
SELECT
    ctpn.id AS so_phieu_nhap_hang,
    ctpn.vat_tu_id AS ma_vat_tu,
    ctpn.so_luong_nhap,
    ctpn.don_gia_nhap,
    (ctpn.so_luong_nhap * ctpn.don_gia_nhap) AS thanh_tien_nhap
FROM ChiTietPhieuNhap ctpn
WHERE ctpn.so_luong_nhap > 5;



