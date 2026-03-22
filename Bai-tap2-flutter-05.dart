import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  //Bài tập vòng lập
  //Bài 1: Quản lý sinh viên
  List<sinhVien> danhSachSV = [
    sinhVien("Hieu", 9, 9, 9),
    sinhVien("Trong", 5, 7, 8),
  ];
  getAllSinhVien(danhSachSV);
  getSinhVienXuatSac(danhSachSV);

  //Bài 2: Quản lý sản phẩm
  List<sanPham> danhSachSP = [
    sanPham("Iphone 15 Pro", 15000000, 5),
    sanPham("Cáp sạc Iphone", 200000, 2),
  ];
  getAllSanPham(danhSachSP);
  getTimKiemSanPham(danhSachSP);
  getMuaBanSanPham(danhSachSP);
}

//Bài 1:
class sinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;
  sinhVien(this.hoTen, this.diemToan, this.diemLy, this.diemHoa);
  double diemTrungBinh() => (diemToan + diemLy + diemHoa) / 3;
  String xepLoai() {
    double DTB = diemTrungBinh();
    if (DTB > 9) {
      return "Xuất sắc";
    } else if (DTB >= 7) {
      return "Giỏi";
    } else if (DTB >= 5) {
      return "Khá";
    } else {
      return "Kém";
    }
  }
}

void getAllSinhVien(List<sinhVien> danhSachSV) {
  for (var sv in danhSachSV) {
    print(
      'Tên sinh viên: ${sv.hoTen}, Điểm trung bình: ${sv.diemTrungBinh()}, Xếp loại: ${sv.xepLoai()}',
    );
  }
}

void getSinhVienXuatSac(List<sinhVien> danhSachSV) {
  sinhVien sinhVienXuatSac = danhSachSV[0];
  for (int i = 0; i < danhSachSV.length; i++) {
    if (danhSachSV[i].diemTrungBinh() > sinhVienXuatSac.diemTrungBinh()) {
      sinhVienXuatSac = danhSachSV[i];
    }
  }
  print('Sinh viên xuất sắc là: ${sinhVienXuatSac.hoTen}');
}

//Bài 2:
class sanPham {
  String tenSanPham;
  double giaTien;
  int soLuong;
  sanPham(this.tenSanPham, this.giaTien, this.soLuong);
}

void getAllSanPham(List<sanPham> danhSachSP) {
  for (var sp in danhSachSP) {
    print(
      'Sản phẩm: ${sp.tenSanPham}, Giá: ${sp.giaTien} VNĐ, Số lượng: ${sp.soLuong}',
    );
  }
}

void getTimKiemSanPham(List<sanPham> danhSachSP) {
  String tuKhoa = "Cáp sạc Iphone";
  for (var sp in danhSachSP) {
    if (tuKhoa == sp.tenSanPham) {
      print(
        'Sản phẩm bạn tìm: ${sp.tenSanPham}, Giá: ${sp.giaTien} VNĐ, Số lượng: ${sp.soLuong}',
      );
    }
  }
}

void getMuaBanSanPham(List<sanPham> danhSachSP) {
  String sanPhamCanMua = 'Cáp sạc Iphone';
  int soLuongCanMua = 1;
  for (var sp in danhSachSP) {
    if (sanPhamCanMua == sp.tenSanPham) {
      if (sp.soLuong >= soLuongCanMua) {
        sp.soLuong -= soLuongCanMua;
        print('Bạn đã mua thành công sản phẩm: ${sp.tenSanPham}');
      } else {
        print('Sản phẩm đã hết hoặc không còn đủ hàng');
      }
      break;
    }
  }
  getAllSanPham(danhSachSP);
}
