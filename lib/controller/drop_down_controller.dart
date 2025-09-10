import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DropDownController extends GetxController {

  var selectedValue = ''.obs;

  final List<String> pilihan = ['complate', 'progress', 'pending'];

  void setSelected(String value) {
    selectedValue.value = value;
  }
}
