
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testapp/controller/onboarding/on-boarding-controller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/data/datasource/static/static.dart';

class full_on_boarding_page_view extends GetView<On_Boarding_imp> {
  const full_on_boarding_page_view({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onpagechanged(value);
      },
      itemCount: on_boarding_list.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(height: 10),
          Text(
            on_boarding_list[i].title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            on_boarding_list[i].image_url!,
            height: Get.width / 1.9,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              on_boarding_list[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  height: 2,
                  color: Color.fromARGB(255, 91, 90, 90)),
            ),
            height: 105,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
