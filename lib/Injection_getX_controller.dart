import 'package:authentication/screens/login/presentation/getX/login_controller_imp.dart';
import 'package:get/get.dart';

Future iniGetXController() async {
  Get.lazyPut<LoginControllerImp>(() => LoginControllerImp());
}
