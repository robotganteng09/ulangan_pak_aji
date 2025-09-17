import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // ⬅️ import intl

class DateController extends GetxController {
  final dateController = TextEditingController();
  var selectedDate = Rxn<DateTime>();

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;


      String formattedDate = DateFormat("d MMMM yyyy").format(picked);
      dateController.text = formattedDate;
    }
  }

    void clear() {
    selectedDate.value = null;
    dateController.clear();
  }


  @override
  void onClose() {
    dateController.dispose();
    super.onClose();
  }
}
