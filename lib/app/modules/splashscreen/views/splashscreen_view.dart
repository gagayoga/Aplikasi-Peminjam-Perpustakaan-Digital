import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SplashscreenView'),
      //   centerTitle: true,
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width, // lebar penuh
        height: MediaQuery.of(context).size.height, // tinggi penuh
        child: Image.asset(
          'assets/images/splashscreen.png',
          fit: BoxFit.fill, // agar gambar menyesuaikan dengan ukuran container
        ),
      ),
    );
  }
}
