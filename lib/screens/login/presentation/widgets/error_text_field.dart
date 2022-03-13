import 'package:authentication/styles/colors.dart';
import 'package:authentication/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldInputWithError extends StatelessWidget {
  final String? errorString;
  final Widget? child;
  final double? height;
  TextFieldInputWithError({this.errorString, this.child, this.height = 55});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: height!.h,
            width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    color: errorString!.isNotEmpty
                        ? errorTextFiledColor
                        : defaultTextFiledColor)),
            child: child),
        Container(
          height: 1.h,
          width: 1.w,
        ),
        errorString!.isNotEmpty
            ? Container(
          padding: EdgeInsetsDirectional.only(start: 60.w),
          child: Row(
            children: [
              Text(
                errorString!,
                style: textStyleInputError,
                strutStyle: textStyleInputErrorStruct,
              )
            ],
          ),
        )
            : Container(
          height: 0.h,
          width: 0.h,
        )
      ],
    );
  }
}


