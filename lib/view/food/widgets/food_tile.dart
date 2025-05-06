import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/constants/uidata.dart';


class FoodTitle extends StatelessWidget {
  const FoodTitle({
    super.key, required this.foods,
  });

  final Map<String, dynamic> foods;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4),
      child: Container(
        height: 76.h,
       decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(12.r)
       ),
       child: Stack(
         children: [
           Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: SizedBox(
                  width: 62.w,
                  height: 62.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(foods['imageUrl'], fit: BoxFit.cover),
                  ),
                ),
              ),
           
              SizedBox(width: 12.w,),
           
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableText(text: foods['title'], style: appStyle(11, kDark, FontWeight.w500)),
                  ReusableText(text: "Delivery Time: ${foods['time']}", style: appStyle(9, kGray, FontWeight.w500)),
           
                  SizedBox(
                    height: 16.h,
                    width: width*0.7,
                    child: ListView.builder(
                      itemCount: foods['additives'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,i){
                        String text = foods['additives'][i]['title'];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kSecondary,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 4.w),
                              child: ReusableText(text: text, style: appStyle(8, kGray, FontWeight.w400)),
                            ),
                          ),
                        );
                      },
                    ),
                  )
           
                ],
              )
            ],
           ),
         ],
       ),

       
      ),
    );
  }
}
