import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:upwork_fruit_app/controller/AreaController.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({super.key});

  // AreaController controller = Get.find(tag: "AreaController");
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<AreaController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        bottomSheet: controller.selectedCity > 0
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    minimumSize: Size(screenWidth, 30),
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.go("/");
                  },
                  child: Text(
                    "Continue",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            : Container(
                height: 0,
              ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.cityNames.length > 0
                  ? SelectBoxWithTitle(
                      screenWidth: screenWidth,
                      selectedIndex: controller.selectedCity,
                      title: "City",
                      controller: controller,
                      isCity: true,
                      selectList: controller.cityNames,
                    )
                  : Container(
                      child: Text("No city name found"),
                    ),
              SizedBox(
                height: 20,
              ),
              controller.areaNames[controller.selectedCity].length > 0
                  ? SelectBoxWithTitle(
                      screenWidth: screenWidth,
                      selectList: controller.areaNames[controller.selectedCity],
                      selectedIndex: controller.selectedArea,
                      title: "Area",
                      controller: controller,
                    )
                  : Container(
                      child: Text("No Area name found"),
                    ),
            ],
          ),
        ),
      );
    });
  }
}

class SelectBoxWithTitle extends StatelessWidget {
  const SelectBoxWithTitle({
    super.key,
    required this.screenWidth,
    required this.selectedIndex,
    required this.title,
    required this.controller,
    this.isCity = false,
    required this.selectList,
  });

  final double screenWidth;
  final int selectedIndex;
  final String title;
  final AreaController controller;
  final bool isCity;
  final List selectList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton(
            // Initial Value
            value: selectedIndex,

            isExpanded: true,
            underline: const SizedBox(),

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            dropdownColor: Colors.amber[400],

            // Array list of items
            items: selectList.map((items) {
              int idx = selectList.indexOf(items);
              return DropdownMenuItem(
                value: idx,
                child: Text(items),
                enabled: isCity
                    ? idx == 0
                        ? false
                        : true
                    : true,
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (Object? value) {
              log(jsonEncode(value));
              int intValue = value as int;

              if (intValue != 0) {
                isCity
                    ? controller.onSelectCity(intValue)
                    : controller.onSelectArea(intValue);

                controller.update();
              } else {
                log("Please select a specific city name");
              }
            },
          ),
        ),
      ],
    );
  }
}
