import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

import '../controllers/buku_controller.dart';

class BukuView extends GetView<BukuController> {
  const BukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF080ba1),
        title: const Text('Halaman Buku',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),

      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(FontAwesomeIcons.book),
            title: Text(
              "${state[index].judul}",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Color(0xFF080ba1),
              ),
            ),
            subtitle: Text(
              "Kategori buku ${state[index].kategori?.nama}",
              style: TextStyle(
                fontSize: 14.0,
                height: 1.8,
                color: Color(0xFF61677D),
                letterSpacing: -0.3,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF080ba1),
                ),
                onPressed: (){
                  Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                    'id' : (state[index].id??0).toString(),
                    'judul' : (state[index].judul).toString()
                  });
                },
                child: Text(
                  'Pinjam',
                ),
              ),
            )

          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
      )),
    );
  }
}
