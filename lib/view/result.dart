import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_gst/constant/colors.dart';
import 'package:quick_gst/constant/theme.dart';
import 'package:quick_gst/controller/controller.dart';

class Result extends StatelessWidget {
  final String text;
  final String cGSTsGstPer;
  final int percentage;
  final String netPrice;
  final String cGST;
  final String totalGST;
  final String totalPrice;
  final double roundOff;

  const Result(
      {super.key,
      required this.text,
      required this.cGSTsGstPer,
      required this.percentage,
      required this.netPrice,
      required this.cGST,
      required this.totalGST,
      required this.totalPrice, required this.roundOff});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 360.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.resetValues();
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25.sp,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? MyColors.whiteColor
                            : MyColors.blackColor,
                      )),
                  Container(
                      height: 28.h,
                      width: 120.w,
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? MyColors.midBlackColor
                              : MyColors.midWhiteColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text(
                        text,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: GestureDetector(
                      onTap: () => ThemeService().changedThemeMode(),
                      child: Theme.of(context).brightness == Brightness.dark
                          ? Icon(
                              Icons.light_mode,
                              color: MyColors.whiteColor,
                              size: 25.sp,
                            )
                          : Icon(
                              Icons.dark_mode,
                              color: MyColors.blackColor,
                              size: 25.sp,
                            ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                width: 330.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? MyColors.whiteColor
                            : MyColors.blackColor,
                        width: 2)),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'Net Price',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(netPrice,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'CGST(${cGSTsGstPer.endsWith('.0') ? cGSTsGstPer.substring(0, cGSTsGstPer.length - 2) : cGSTsGstPer}%)',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(cGST,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'SGST(${cGSTsGstPer.endsWith('.0') ? cGSTsGstPer.substring(0, cGSTsGstPer.length - 2) : cGSTsGstPer}%)',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(cGST,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, bottom: 10.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'IGST($percentage%)',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(totalGST,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 1.h,
                        width: 320.w,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? MyColors.whiteColor
                            : MyColors.blackColor),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'Total GST',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(totalGST,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'Round off',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(roundOff.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, bottom: 15.h, right: 6.w, left: 6.w),
                      child: Row(
                        children: [
                          Text(
                            'Total Price',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          SizedBox(width: 210.w,
                            child: Text(totalPrice,
                              style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
