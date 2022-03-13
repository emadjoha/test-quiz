import 'package:authentication/core/enums/login_enum.dart';
import 'package:authentication/core/images_constant.dart';
import 'package:authentication/helpers/validations.dart';
import 'package:authentication/screens/home/home_screen.dart';
import 'package:authentication/screens/login/data/model/login_request_model.dart';
import 'package:authentication/screens/login/presentation/getX/login_controller_imp.dart';
import 'package:authentication/screens/login/presentation/widgets/custom_button.dart';
import 'package:authentication/screens/login/presentation/widgets/custom_text_field.dart';
import 'package:authentication/screens/login/presentation/widgets/error_text_field.dart';
import 'package:authentication/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
/*
   @NOTE
   #For testing : https://reqres.in/
   #valid email and password :
      "email":"eve.holt@reqres.in",
      "password": you can choose any random password
 */


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // email init
  TextEditingController _emailController = TextEditingController();
  String emailErrorText = "";
  // password  init
  TextEditingController _passwordController = TextEditingController();
  String passwordErrorText = "";
  // getX init
  late LoginControllerImp loginControllerImp = Get.find();

  LoginRequestModel requestModel = LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      designSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      builder: () => Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Images.loginImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  TextFieldInputWithError(
                    errorString: emailErrorText,
                    child: CustomTextField(
                      key: ValueKey("Email_address_key"),
                      hint: "email address",
                      controller: _emailController,
                      textInputAction: TextInputAction.done,
                      onTap: () {
                        setState(() {
                          emailErrorText = "";
                        });
                      },
                      onSaved: (value) {
                        requestModel.email=value;
                      },
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  TextFieldInputWithError(
                    errorString: passwordErrorText,
                    child: CustomTextField(
                      key: ValueKey("password_Key"),
                      hint: "password",
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      onTap: () {
                        setState(() {
                          passwordErrorText = "";
                        });
                      },
                      onSaved: (value) {
                        requestModel.password=value;
                      },
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  CustomButton(
                      onPress: () {
                        login(LoginTypes.Email);
                      },
                      title: 'Login'),
                  SizedBox(height: 20.h,),
                  Text('Or',style: textStyleBody,strutStyle: strutStyleBody,),
                  SizedBox(height: 20.h,),
                  CustomButton(
                      onPress: () {
                        login(LoginTypes.Google);
                      },
                      title: 'Login With Google'),
                  GetBuilder<LoginControllerImp>(builder: (LoginControllerImp state) {
                  if(state.loginState.isLoading){
                    EasyLoading.show(status:'loading');
                  }
                  else if(state.loginState.error.isNotEmpty){
                    EasyLoading.showError(state.loginState.error);
                    state.loginState.error = '';
                  }
                  else if(state.loginState.loginSuccess){
                      EasyLoading.dismiss();
                      state.loginState.loginSuccess = false;
                      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      });
                  }
                  return Container();
                })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(LoginTypes loginTypes) {
      if(loginTypes == LoginTypes.Email) {
        emailErrorText = Validations.emailValidation(_emailController.text);
        passwordErrorText = Validations.passwordValidation(_passwordController.text);
        if (emailErrorText.isNotEmpty || passwordErrorText.isNotEmpty) {
          setState(() {});
        } else {
         _formKey.currentState!.save();
          loginControllerImp.basicLogin(requestModel.email, requestModel.password);
        }
      }else if (loginTypes == LoginTypes.Google){
//        GoogleSignIn().signOut();
       loginControllerImp.googleLogin();
      }
  }
}
