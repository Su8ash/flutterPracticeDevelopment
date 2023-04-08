import 'package:get/get.dart';

class HomeController extends GetxController {
  var fruitsList = [
    {
      "id": 1,
      "name": "Newzealand Apples",
      "img":
          "https://freepngimg.com/thumb/fruit/80171-mcintosh-crisp-apple-pie-hq-image-free-png.png",
      "weight": 1,
      "unit": "Kg",
      "price": 99.9,
      "selectedNumber": 0,
    },
    {
      "id": 2,
      "name": "Strawberries Box",
      "img":
          "https://freepngimg.com/thumb/strawberry/5-2-strawberry-high-quality-png.png",
      "weight": 500,
      "unit": "gram",
      "price": 400,
      "selectedNumber": 0,
    },
    {
      "id": 3,
      "name": "Strawberries Packet",
      "img":
          "https://freepngimg.com/thumb/strawberry/5-2-strawberry-high-quality-png.png",
      "weight": 100,
      "unit": "gram",
      "price": 100,
      "selectedNumber": 0,
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onItemIncrease({
    required int index,
  }) {
    fruitsList[index] = {
      ...fruitsList[index],
      "selectedNumber": ((fruitsList[index]['selectedNumber'] as int) + 1)
    };
    update();
  }

  onItemDecrease({
    required int index,
  }) {
    fruitsList[index] = {
      ...fruitsList[index],
      "selectedNumber": ((fruitsList[index]['selectedNumber'] as int) - 1)
    };
    update();
  }
}
