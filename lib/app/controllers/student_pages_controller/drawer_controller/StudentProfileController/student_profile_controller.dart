// profile_controller.dart
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedMarkType = '10th'.obs;

  final marks = {
    '10th': '95%',
    '12th': '90%',
    'CGPA': '9.0',
  }.obs;

  void updateMarkType(String? newValue) {
    if (newValue != null) {
      selectedMarkType.value = newValue;
    }
  }
}
