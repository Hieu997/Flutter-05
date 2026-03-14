import 'dart:io';
import 'dart:math';

void main() {
  //Bài 1: Quản lý sinh viên
  String hoTen = 'Hieu';
  double soGioLamViec = 120;
  double luongMoiGio = 100000;
  double tongLuong = soGioLamViec * luongMoiGio;
  double phuCap = 0;
  double tongLuongSauPhuCap = 0;
  if (soGioLamViec > 40) {
    phuCap = tongLuong * 0.2;
    tongLuongSauPhuCap = phuCap + tongLuong;
  } else {
    tongLuongSauPhuCap = tongLuong;
  }
  double thue = 0;
  if (tongLuongSauPhuCap > 100000000) {
    thue = tongLuongSauPhuCap * 0.1;
  } else if (tongLuongSauPhuCap >= 7000000) {
    thue = tongLuongSauPhuCap * 0.05;
  } else {
    thue = 0;
  }
  double luongThucLanh = tongLuongSauPhuCap - thue;
  print('Họ và tên: $hoTen');
  print('Số giờ làm việc: $soGioLamViec');
  print('Lương trước thuế: $tongLuongSauPhuCap');
  print('Thuế thu nhập: $thue');
  print('Lương thực lãnh: $luongThucLanh');

  //Bài 2: Quản lý đơn hàng
  String tenSanPham = 'Sua';
  int soLuongMua = 200;
  double donGia = 5000;
  double thanhTien = soLuongMua * donGia;
  double giamGia = 0;
  if (thanhTien >= 1000000) {
    giamGia = thanhTien * 0.1;
  } else if (thanhTien >= 500000) {
    giamGia = thanhTien * 0.05;
  } else {
    giamGia = 0;
  }
  double sauGiamGia = (thanhTien - giamGia);
  double thue2 = (sauGiamGia * 0.08);
  double sauThue = sauGiamGia + thue2;
  print('Tên sản phẩm: $tenSanPham');
  print('Số lượng: $soLuongMua');
  print('Đơn giá: $donGia');
  print('Thành tiền: $thanhTien');
  print('Giảm giá: $giamGia');
  print('Thuế: $thue2');
  print("Thành tiền: $sauThue");
}
