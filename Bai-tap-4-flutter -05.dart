import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  List<student> liststudents = [
    student('01', 'Trọng', 16, 'Nam', '10A1', 9.1),
    student('02', 'Hiếu', 15, 'Nam', '10A1', 8.5),
  ];
  List<teacher> listteachers = [
    teacher('GV01', 'Ms. Hương', 25, 'Nữ', 'Ngữ Văn', 9000000),
    teacher('GV2', 'Mr.Tâm', 30, 'Nam', 'Toán', 8500000),
  ];
  classRoom listClassRoom = classRoom('NVT01', 'lớp chuyên 10A1');
  listClassRoom.getTeacherForClassRoom(listteachers[0]);
  listClassRoom.addStudent(liststudents[0]);
  listClassRoom.displayClassRoom();
}

//lớp cha person
class person {
  String id;
  String name;
  int age;
  String gender;
  person(this.id, this.name, this.age, this.gender);
}

//Lớp con là student của lớp cha person
class student extends person {
  String grade;
  double score;
  student(
    String id,
    String name,
    int age,
    String gender,
    this.grade,
    this.score,
  ) : super(id, name, age, gender);
  void displayStudent() {
    print(
      'Học sinh: $name, số ID là: $id, Tuổi: $age, đang học lớp: $grade, có số điển là: $score',
    );
  }
}

//Lớp con là teacher của lớp cha person
class teacher extends person {
  String subject;
  double salary;
  teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);
  void displayTeacher() {
    print(
      'Giáo viên: $name, số ID là: $id, đang dạy môn: $subject, với mức lương: $salary',
    );
  }
}

//Lớp classroom
class classRoom {
  String id;
  String name;
  List<student> students = [];
  teacher? Teacher;
  classRoom(this.id, this.name);
  void addStudent(student) {
    students.add(student);
  }

  void getTeacherForClassRoom(teacher Teacher) {
    this.Teacher = Teacher;
  }

  void displayClassRoom() {
    print('Giáo viên chủ nhiệm $name là:');
    Teacher!.displayTeacher();
    print('Danh sách học sinh:');
    for (var a in students) {
      a.displayStudent();
    }
  }
}
