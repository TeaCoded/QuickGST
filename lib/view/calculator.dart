import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quick_gst/constant/colors.dart';
import 'package:quick_gst/constant/theme.dart';
import 'package:quick_gst/controller/controller.dart';
import 'package:quick_gst/view/result.dart';
import 'package:quick_gst/widgets/number_button.dart';
import 'package:quick_gst/widgets/operator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                const Spacer(),
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
            const Spacer(),
            Obx(() => SizedBox(
                  width: 355.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 190.h,
                        child: SingleChildScrollView(
                          reverse: true,
                          child: Text(
                            controller.input.value,
                            style: Theme.of(context).textTheme.displayLarge,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Created by TeaCoded',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? MyColors.lightBlackColor
                    : MyColors.lightWhiteColor,
              ),
              width: 360.w,
              child: const Column(
                children: [
                  Row(
                    children: [
                      GstPercentage(
                        percentage: 3,
                      ),
                      GstPercentage(
                        percentage: 5,
                      ),
                      GstPercentage(
                        percentage: 12,
                      ),
                      GstPercentage(
                        percentage: 18,
                      ),
                      GstPercentage(
                        percentage: 28,
                      ),
                    ],
                  ),
                  Row(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          NumberButton(text: '7'),
                          NumberButton(text: '4'),
                          NumberButton(text: '1'),
                          OperatorButton(text: 'C')
                        ],
                      ),
                      Column(
                        children: [
                          NumberButton(text: '8'),
                          NumberButton(text: '5'),
                          NumberButton(text: '2'),
                          NumberButton(text: '0'),
                        ],
                      ),
                      Column(
                        children: [
                          NumberButton(text: '9'),
                          NumberButton(text: '6'),
                          NumberButton(text: '3'),
                          NumberButton(text: '.'),
                        ],
                      ),
                      Column(
                        children: [
                          OperatorButton(text: '/'),
                          OperatorButton(text: '×'),
                          OperatorButton(text: '+'),
                          OperatorButton(text: '-'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GstPercentage extends StatelessWidget {
  final int percentage;

  const GstPercentage({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Container(
      height: 90.h,
      width: 72.w,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white12
          : Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
               if(controller.input.toString().isNotEmpty){
                 controller.additionGST(percentage);
                 Get.to(Result(
                   text: 'Excl. GST',
                   cGSTsGstPer: '${percentage / 2}',
                   percentage: percentage,
                   roundOff: controller.totalAmount.value.round().toDouble() - controller.totalAmount.value,
                   netPrice: controller.output.value.toStringAsFixed(2),
                   cGST: controller.cGST.value.toStringAsFixed(2),
                   totalGST: controller.totalGSTAmount.value.toStringAsFixed(2),
                   totalPrice: controller.totalAmount.value.round().toStringAsFixed(2),
                 ));
                 controller.resetValues();
               }
              },
              child: Text('+$percentage%',
                  style: Theme.of(context).textTheme.bodySmall)),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
              onTap: () {
                if(controller.input.toString().isNotEmpty){
                  controller.subtractionGST(percentage);
                  Get.to(Result(
                    text: 'Incl. GST',
                    cGSTsGstPer: '${percentage / 2}',
                    percentage: percentage,
                    roundOff: controller.totalAmount.value.round().toDouble() - controller.totalAmount.value,
                    netPrice: controller.netPrice.value.toStringAsFixed(2),
                    cGST: controller.cGST.value.toStringAsFixed(2),
                    totalGST: controller.totalGSTAmount.value.toStringAsFixed(2),
                    totalPrice: controller.output.value.round().toStringAsFixed(2),
                  ));
                  controller.resetValues();
                }
              },
              child: Text('-$percentage%',
                  style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}
