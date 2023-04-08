import 'package:get/get.dart';

class AreaController extends GetxController {
  int selectedCity = 0;
  int selectedArea = 0;

  var cityNames = [
    'Select a city',
    'California',
    'New Delhi',
    'Kathmandu',
  ];

  var areaNames = [
    ['Select a city'],
    ['LA', "New York"],
    ['Maharastra', "Lal Kila", "Maharajgung", "BaghBazar"],
    ['Pashupatinath', "Narayanhiti"],
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onSelectCity(int index) {
    selectedCity = index;
    selectedArea = 0;
    update();
  }

  onSelectArea(int index) {
    selectedArea = index;
    update();
  }
}
