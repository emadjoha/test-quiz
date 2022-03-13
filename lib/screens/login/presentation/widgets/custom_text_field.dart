import 'package:authentication/helpers/locale_helper.dart';
import 'package:authentication/styles/colors.dart';
import 'package:authentication/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class CustomTextField extends StatefulWidget {
  final String? hint;
  final Widget? icon;
  final String? prefixIcon;
  final bool? obscure;
  final TextInputType? textType;
  final TextEditingController? controller;
  FocusNode? currentFocusNode=FocusNode();
  FocusNode? nextFocusNode=FocusNode();
  final TextInputAction? textInputAction;
  final String? helper;
  final double? height, width;
  final int? maxLines;
  final int? minLines;
  final int? textInputFormatter;
  final Function? onValid;
  final Function(String)? onChange;
  final bool? enableField;
  final TextAlign? textAlign;
  final TextDirection textDirection;
  final double bottomPadding;
  final Key? key;
  final Widget? suffixIcon;
  final Function? onTap;
  final Function(dynamic value)? onSaved;
  CustomTextField({
    this.key,
    this.suffixIcon,
    this.enableField = true,
    this.hint,
    this.onTap,
    this.onSaved,
    this.prefixIcon,
    this.icon,
    this.obscure=false,
    this.textType= TextInputType.visiblePassword,
    this.controller,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction=TextInputAction.done,
    this.helper='',
    this.height=55,
    this.width,
    this.minLines=1,
    this.maxLines=30,
    this.textInputFormatter=50,
    this.onValid,
    this.bottomPadding=0.0,
    this.onChange,this.textAlign=TextAlign.left,this.textDirection = TextDirection.ltr});

  @override
  _CustomTextFieldState createState() =>  _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool isArabicLanguage = LocaleHelper.isArabicLanguage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 330.w,
      padding: EdgeInsets.zero,
      child: Directionality(
        textDirection:isArabicLanguage? ui.TextDirection.rtl :  ui.TextDirection.ltr,
        child: TextFormField(
          key: widget.key,
          onTap:(){ if(widget.onTap !=null) widget.onTap!();},
          onSaved:(value) { if(widget.onSaved != null) widget.onSaved!(value);},
          enableInteractiveSelection: widget.enableField!,
          readOnly: !widget.enableField!,
          textDirection: ui.TextDirection.ltr,
          onChanged: widget.onChange,
          focusNode: widget.currentFocusNode,
          controller: widget.controller,
          autofocus: false,
          minLines:null,
          maxLines: null,
          textAlign: isArabicLanguage?TextAlign.right:TextAlign.left,
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            isDense: true,
            labelStyle:  textStyleInput,
            prefixIcon:Padding(
              padding:  EdgeInsetsDirectional.only(top:2.h),),
            border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              borderSide: BorderSide(color: inputFillColor),
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              borderSide: BorderSide(color: inputFillColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              borderSide: BorderSide(color: inputFillColor),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              borderSide: BorderSide(color: Colors.red, width:0.2),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              borderSide: BorderSide(color: Colors.red, width:0.2),
            ),
            contentPadding: EdgeInsets.zero,
            hintText: widget.hint,
            suffixIcon: widget.suffixIcon,
          ),
          expands: true,
          keyboardType: widget.textType,
          cursorColor: kPrimaryColor,
          style: textStyleInput,
          obscureText: widget.obscure!,
          textInputAction: widget.textInputAction,
          inputFormatters: <TextInputFormatter>[
            new LengthLimitingTextInputFormatter(widget.textInputFormatter),
          ],
          validator: (String? value) {
            var v = widget.onValid!(value);
            if (v != null) return (v.toString());
          },
        ),
      ),
    );
  }
}


