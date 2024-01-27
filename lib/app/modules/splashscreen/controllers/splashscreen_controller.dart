import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

class SplashscreenController extends GetxController  {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    navigateLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  navigateLogin() async{
    await Future.delayed(Duration(seconds: 5));
    Get.offAll(Routes.LOGIN);
  }
}
