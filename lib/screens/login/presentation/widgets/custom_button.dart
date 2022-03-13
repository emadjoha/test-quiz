import 'package:authentication/styles/colors.dart';
import 'package:authentication/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  const CustomButton({Key? key,required this.onPress,required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress();
      },
      child: Container(
          height: 55.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20.r))
          ),
          child: Center(child: Text(title,style: buttonTextStyle,strutStyle: buttonTextStructStyle,))),
    );
  }
}
