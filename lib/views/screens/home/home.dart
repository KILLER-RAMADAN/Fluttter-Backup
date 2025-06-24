import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobikul_carousel_slider/mobikul_carousel_slider.dart';
import 'package:path/path.dart';
import 'package:testapp/controller/home/home_controller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/servers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("182".tr),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GetBuilder<HomeController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: MobikulCarouselSlider(
                          items: [
                            Image.network(
                              "${Api.sider}/1.png",
                              fit: BoxFit.fill,
                            ),
                            Image.network(
                              "${Api.sider}/2.jpg",
                              fit: BoxFit.fill,
                            ),
                            Image.network(
                              "${Api.sider}/3.jpg",
                              fit: BoxFit.fill,
                            ),
                            Image.network(
                              "${Api.sider}/4.jpg",
                              fit: BoxFit.fill,
                            ),
                          ],
                          autoPlay: true,
                          loop: true,
                          showIndicators: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    ],
                  ))),
        ));
  }
}
