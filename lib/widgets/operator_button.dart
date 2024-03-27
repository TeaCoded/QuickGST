import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_gst/constant/colors.dart';
import 'package:quick_gst/controller/controller.dart';

class OperatorButton extends StatelessWidget {
  final String text;
  const OperatorButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Controller gstController = Get.put(Controller());
    return Padding(
      padding: EdgeInsets.only(left: 13.w, top: 15.h, right: 13.w),
      child: GestureDetector(
        onTap: () => gstController.onButtonPress(text),
        child: Container(
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? MyColors.blackColor
                    : MyColors.whiteColor,
                borderRadius: BorderRadius.circular(360.r),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1.5,
                      blurRadius: 4,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? MyColors.whiteColor.withOpacity(0.1)
                          : MyColors.blackColor.withOpacity(0.1),
                      offset: const Offset(4.0, 5.0))
                ]),
            child: Center(
                child: Text(text,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.redColor,
                    )))),
      ),
    );
  }
}
