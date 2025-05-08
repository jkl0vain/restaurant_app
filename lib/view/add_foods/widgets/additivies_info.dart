import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_foodly/common/custom_textfield.dart';
import 'package:restaurant_foodly/controllers/food_controller.dart';
import 'package:restaurant_foodly/models/additives_model.dart';
import '../../../common/app_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';

class AdditivesInfo extends StatelessWidget {
  const AdditivesInfo({super.key, required this.additivePrice, required this.additiveTitle});

  final TextEditingController additivePrice;
  final TextEditingController additiveTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: "Add Additives",
                    style: appStyle(16, kGray, FontWeight.w600)),

                ReusableText(
                    text: "You are required to add additives info for your product if it has any",
                    style: appStyle(11, kGray, FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(
            height: height*0.8,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),

                  CustomTextfield(
                      controller: additiveTitle,
                      hintText: "Additives Title",
                      prefixIcon: const Icon(Icons.keyboard_capslock)),

                  SizedBox(
                    height: 15.h,
                  ),

                  CustomTextfield(
                      controller: additivePrice,
                      hintText: "Additives Price",
                      prefixIcon: const Icon(Icons.keyboard_capslock)),

                  SizedBox(
                    height: 15.h,
                  ),

                  Obx(() => controller.additiveList.isNotEmpty? Column(
                    children:
                    List.generate(controller.additiveList.length, (i){
                      final additive = controller.additiveList[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: kGrayLight,
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  text: additive.title,
                                  style: appStyle(11, kLightWhite, FontWeight.normal)),

                              ReusableText(
                                  text: "\$${additive.price.toString()}",
                                  style: appStyle(11, kLightWhite, FontWeight.normal)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ): const SizedBox.shrink(),),

                  SizedBox(
                    height: 15.h,
                  ),



                  CustomButton(
                    text: "A D D  A D D I T T I V E S",
                    btnWidth: width,
                    btnRadius: 9,
                    onTap: (){
                      if(additivePrice.text.isNotEmpty && additiveTitle.text.isNotEmpty){
                        Additive additive = Additive(
                            id: controller.generateId(),
                            title: additiveTitle.text,
                            price: additivePrice.text);

                        controller.addAdditive = additive;
                        additivePrice.text = '';
                        additiveTitle.text = '';
                      }else{
                        Get.snackbar(
                            colorText: kLightWhite,
                            backgroundColor: kPrimary,
                            "You need data to add additives", "Please fill all fields");
                      }
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
