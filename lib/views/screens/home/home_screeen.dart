import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/home/home_screen_controler.dart';

import 'package:testapp/core/functions/alert.dart';

import '../../../core/class/handlingdataview.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreenControlerimp controller = Get.put(HomeScreenControlerimp());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: controller.pages.elementAt(controller.currentindex),
        bottomNavigationBar: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              exitalert();
            },
            child: GetBuilder<HomeScreenControlerimp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        margin: EdgeInsets.all(20),
                        height: size.width * .155,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.100),
                              blurRadius: 30,
                              offset: Offset(0, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ListView.builder(
                          itemCount: controller.pages.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .13),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(
                                () {
                                  controller.currentindex = index;
                                  print(controller.currentindex);
                                },
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 1500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  margin: EdgeInsets.only(
                                    bottom: index == controller.currentindex
                                        ? 0
                                        : size.width * .029,
                                    right: size.width * .0422,
                                    left: size.width * .0422,
                                  ),
                                  width: size.width * .128,
                                  height: index == controller.currentindex
                                      ? size.width * .014
                                      : 0,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Icon(
                                  controller.listOfIcons[index],
                                  size: size.width * .076,
                                  color: index == controller.currentindex
                                      ? Colors.blueAccent
                                      : Colors.black38,
                                ),
                                SizedBox(height: size.width * .03),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))));
  }
}
