import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
       child: Row(
        children: [
          SizedBox(
            width: 62.w,
            height: 62.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(foods['imageUrl'], fit: BoxFit.cover),
            ),
          )
        ],
       ),
      ),
    );
  }
}
