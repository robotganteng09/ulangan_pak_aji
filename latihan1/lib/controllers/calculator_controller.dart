import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();
  var texthasil = "".obs;

  void tambah() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);
    int hasiljumlah = angka2 + angka1;
    print("hasil = " + hasiljumlah.toString());
    texthasil.value = hasiljumlah.toString();
  }

  void kurang() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);
    int hasiljumlah = angka2 - angka1;
    print("hasil = " + hasiljumlah.toString());
    texthasil.value = hasiljumlah.toString();
  }

  void kali() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);
    int hasiljumlah = angka2 * angka1;
    print("hasil = " + hasiljumlah.toString());
    texthasil.value = hasiljumlah.toString();
  }

  void bagi() {
    double angka1 = double.parse(txtangka1.text);
    double angka2 = double.parse(txtangka2.text);
    double hasiljumlah = angka2 / angka1;
    print("hasil = " + hasiljumlah.toString());
    texthasil.value = hasiljumlah.toString();
  }

  void clear() {
    txtangka1.clear();
    txtangka2.clear();
    texthasil.value = " ";
  }
}
