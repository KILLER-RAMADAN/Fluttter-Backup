
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testapp/controller/onboarding/on-boarding-controller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/data/datasource/static/static.dart';

class custome_controller_on_boader extends StatelessWidget {
  const custome_controller_on_boader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<On_Boarding_imp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    on_boarding_list.length,
                    (Index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 10),
                          duration: const Duration(milliseconds: 900),
                          width: controller.current_page == Index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColors.primary_color,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
