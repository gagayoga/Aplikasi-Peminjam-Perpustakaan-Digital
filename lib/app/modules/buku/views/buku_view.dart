import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buku_controller.dart';

class BukuView extends GetView<BukuController> {
  const BukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BukuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BukuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
