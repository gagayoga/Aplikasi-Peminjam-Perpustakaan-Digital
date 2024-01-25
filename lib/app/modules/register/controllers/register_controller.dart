import 'dart:math';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class RegisterController extends GetxController {
  final loadingregister = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  postRegister() async {

    loadingregister(true);

    try {

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "telp": teleponController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString(),
            });

        if (response.statusCode == 201) {
          Get.snackbar("Information", "Register Succes", backgroundColor: Colors.green, colorText: Colors.white);
          Get.offAllNamed(Routes.LOGIN);

          ArtSweetAlert.show(
              context: Get.context!,
              artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Ruang Pustaka",
                text: "Register Berhasil, Silakan Login Kembali ",
              )
          );
        } else {
          Get.snackbar("Sorry", "Register Gagal", backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
      loadingregister(false);

    } on DioException catch (e) {
      loadingregister(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red, colorText: Colors.white);
      }

    } catch (e) {
      loadingregister(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
