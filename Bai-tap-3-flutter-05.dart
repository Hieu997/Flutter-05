import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  //Bài tập về Function
  List<Map<String, dynamic>> gioHang = [
    {'ten': 'Iphone 15 Pro', 'gia': 15000000, 'soLuong': 5},
    {'ten': 'Cáp sạc Iphone', 'gia': 2000000, 'soLuong': 2},
  ];
  getThemSanPham(gioHang, 'Macbook Pro M1', 45000000, 1);
  //getHienThiGioHang(gioHang);
  getSuaSoLuong(gioHang, 'Iphone 15 Pro', 1);
  getXoaSanPham(gioHang, 'Cáp sạc Iphone');
  getHienThiGioHang(gioHang);
  getTinhTongGioHang(gioHang);
}

void getThemSanPham(
  List<Map<String, dynamic>> ds,
  String ten,
  double gia,
  int soLuong,
) {
  ds.add({'ten': ten, 'gia': gia, 'soLuong': soLuong});
}

void getHienThiGioHang(List<Map<String, dynamic>> ds) {
  for (var i = 0; i < ds.length; i++) {
    var sp = ds[i];
    print('${sp['ten']}, Giá :${sp['gia']}, Số Lượng: ${sp['soLuong']}');
  }
}

void getSuaSoLuong(List<Map<String, dynamic>> ds, String ten, int soLuongMoi) {
  for (var sp in ds) {
    if (sp['ten'] == ten) {
      sp['soLuong'] = soLuongMoi;
      print(
        'Đã cập nhật số lượng cho sản phẩm: $ten với số lượng mới là: $soLuongMoi',
      );
    }
  }
}

void getXoaSanPham(List<Map<String, dynamic>> ds, String ten) {
  ds.removeWhere((sp) => sp['ten'] == ten);
  print('Đã xóa sản phẩm: $ten thành công');
}

void getTinhTongGioHang(List<Map<String, dynamic>> ds) {
  double tong = 0;
  for (var sp in ds) {
    tong += sp['soLuong'] * sp['gia'];
  }
  print('Tổng hóa đơn của bạn là: $tong VNĐ');
}
