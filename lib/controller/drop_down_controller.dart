import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DropDownController extends GetxController {
  var selectedValue = ''.obs; // tetap pakai RxString
  final List<String> pilihan = ['Sangat Penting', 'Penting', 'Bisa Nanti'];

  void setSelected(String value) {
    selectedValue.value = value;
  }

  void clear() {
    selectedValue.value = ''; // reset ke kosong
  }
}
