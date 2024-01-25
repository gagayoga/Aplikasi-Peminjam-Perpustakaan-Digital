import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  final loadingaddpinjam = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjamController = TextEditingController();
  final TextEditingController tanggalKembaliController = TextEditingController();
  // final BukuController bukuController = Get.find();

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

  postPinjamBuku() async {

    loadingaddpinjam(true);

    try {

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              "user_id": StorageProvider.read(StorageKey.idUser),
              "book_id": Get.parameters['id'],
              "tanggal_pinjam": tanggalPinjamController.text.toString(),
              "tanggal_kembali": tanggalKembaliController.text.toString()
            });

        if (response.statusCode == 201) {
          Get.back();
          ArtSweetAlert.show(
              context: Get.context!,
              artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Ruang Pustaka",
                text: "Pinjam Buku dengan Judul " + Get.parameters['judul'].toString() + " Berhasil",
              )
          );

        } else {
          ArtSweetAlert.show(
              context: Get.context!,
              artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: "Ruang Pustaka",
                text: "Pinjam Buku Gagal",
              )
          );
        }
      }
      loadingaddpinjam(false);

    } on DioException catch (e) {
      loadingaddpinjam(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }

    } catch (e) {
      loadingaddpinjam(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
