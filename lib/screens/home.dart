import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:upwork_fruit_app/controller/AreaController.dart';
import 'package:upwork_fruit_app/controller/HomeController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    AreaController areaController = Get.find();

    return SafeArea(
      child: GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.amber,
          body: Container(
            width: screenWidth,
            height: screenHeight,
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push("/area");
                  },
                  child: Row(
                    children: [
                      Text(
                        areaController.areaNames[areaController.selectedCity]
                            [areaController.selectedArea],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("-"),
                      Text(
                        areaController.cityNames[areaController.selectedCity],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.fruitsList.length,
                        (index) => Container(
                          width: screenWidth,
                          height: screenHeight * 0.35,
                          color: Colors.amber,
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: screenWidth * 0.45,
                                margin: EdgeInsets.only(
                                  right: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                      controller.fruitsList[index]['img']
                                          as String,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.fruitsList[index]['name']
                                          as String,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "${controller.fruitsList[index]['weight']} ${controller.fruitsList[index]['unit']}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Rs. ${controller.fruitsList[index]['price']}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: BorderSide(
                                                width: 3,
                                                color: Colors.black,
                                              )),
                                          backgroundColor:
                                              (controller.fruitsList[index]
                                                              ['selectedNumber']
                                                          as int) >
                                                      0
                                                  ? Colors.white
                                                  : Colors.transparent,
                                          foregroundColor: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 4,
                                          ),
                                          minimumSize:
                                              Size(screenWidth * 0.3, 30),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          controller.onItemIncrease(
                                              index: index);
                                        },
                                        child: (controller.fruitsList[index]
                                                    ['selectedNumber'] as int) >
                                                0
                                            ? Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    constraints:
                                                        BoxConstraints(),
                                                    onPressed: () {
                                                      controller.onItemDecrease(
                                                          index: index);
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${controller.fruitsList[index]['selectedNumber']}",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    constraints:
                                                        BoxConstraints(),
                                                    onPressed: () {
                                                      controller.onItemIncrease(
                                                          index: index);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Icon(
                                                Icons.add,
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
