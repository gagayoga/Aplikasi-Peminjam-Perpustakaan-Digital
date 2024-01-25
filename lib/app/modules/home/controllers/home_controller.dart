import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/data/model/response_getbook.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/data/provider/api_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/storage_provider.dart';

class HomeController extends GetxController with StateMixin<List<DataBook>>{
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    String status = StorageProvider.read(StorageKey.status);
    getDataBook();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataBook() async{
    change(null, status: RxStatus.loading());

    try {

      final response = await ApiProvider.instance().get(Endpoint.book,);
      if (response.statusCode == 200) {
        final ResponseGetbook responsePetugasbook = ResponseGetbook.fromJson(response.data);
        if(responsePetugasbook.data!.isEmpty){
          change(null, status: RxStatus.empty());
        }else{
          change(responsePetugasbook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error("${e.response?.data['message']}"));
      }

    } catch (e) {
      change(null, status: RxStatus.error("{e.message.data['message']}"));
    }
  }
}
