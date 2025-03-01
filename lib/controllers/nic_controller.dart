import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var weekday = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;

  String decodeNIC() {
    String nic = nicNumber.value.trim(); // Trim spaces

    if (nic.isEmpty) {
      resetValues();
      return "NIC Number is empty.";
    }

    try {
      if (nic.length == 10) {
        // Old NIC format (e.g., 199345678V)
        birthYear.value = "19${nic.substring(0, 2)}";
        int days = int.parse(nic.substring(2, 5));
        gender.value = days > 500 ? "Female" : "Male";
        days = days > 500 ? days - 500 : days;
        return _calculateDate(days, int.parse(birthYear.value));
      } else if (nic.length == 12) {
        // New NIC format (e.g., 200012345678)
        birthYear.value = nic.substring(0, 4);
        int days = int.parse(nic.substring(4, 7));
        gender.value = days > 500 ? "Female" : "Male";
        days = days > 500 ? days - 500 : days;
        return _calculateDate(days, int.parse(birthYear.value));
      } else {
        resetValues();
        return "Invalid NIC format.";
      }
    } catch (e) {
      resetValues();
      return "Error processing NIC.";
    }
  }

  String _calculateDate(int days, int year) {
    if (days < 1 || days > 366) { // Ensure valid days
      resetValues();
      return "Invalid days count in NIC.";
    }

    DateTime date = DateTime(year).add(Duration(days: days - 1));
    birthDate.value = DateFormat('yyyy-MM-dd').format(date);
    weekday.value = DateFormat('EEEE').format(date);
    age.value = (DateTime.now().year - year).toString();

    return "NIC Decoded Successfully.";
  }

  void resetValues() {
    birthYear.value = "";
    birthDate.value = "";
    weekday.value = "";
    age.value = "";
    gender.value = "";
  }
}
