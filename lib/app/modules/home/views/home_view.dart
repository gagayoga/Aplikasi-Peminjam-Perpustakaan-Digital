import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),

        body: ListView(
          children:[
            Column(
              children: [
                Container(
                  child: Image.asset('assets/images/ImageHome.png'),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                  child: const Text(
                    'Welcome To Ruang Pustaka',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'Montserrat',
                      letterSpacing: -0.5,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0.3,
                    child: ColoredBox(
                      color: Color(0xFF61677D),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF080ba1),
                            ),
                            onPressed: ()
                            {
                              Get.toNamed(Routes.BUKU
                              );
                            },
                            child: const Text(
                              'Halaman Buku',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF080ba1),
                            ),
                            onPressed: ()
                            {
                              Get.toNamed(Routes.PEMINJAMAN
                              );
                            },
                            child: const Text(
                              'Peminjaman Buku',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB80000),
                            ),
                            onPressed: ()
                            {
                              Get.toNamed(Routes.LOGIN
                              );
                            },
                            child: const Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Buku Rekomendasi'),
                          Text('Lihat Semua'),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
                      child: SizedBox(
                        width: double.infinity,
                        height: 0.5,
                        child: ColoredBox(
                          color: Color(0xFF61677D),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 250,
                    //   child: ListView(
                    //     children: [
                    //       controller.obx((state) => ListView.separated(
                    //         itemCount: state!.length > 10 ? 10 : state!.length,
                    //         itemBuilder: (context, index){
                    //           return ListTile(
                    //             leading: Icon(FontAwesomeIcons.book),
                    //             title: Text(
                    //               "${state[index].judul}",
                    //               style: TextStyle(
                    //                 fontSize: 16.0,
                    //                 fontFamily: 'Montserrat',
                    //                 fontWeight: FontWeight.w700,
                    //                 color: Color(0xFF080ba1),
                    //               ),
                    //             ),
                    //             subtitle: Text(
                    //               "Kategori buku ${state[index].kategori?.nama}",
                    //               style: TextStyle(
                    //                 fontSize: 14.0,
                    //                 height: 1.8,
                    //                 color: Color(0xFF61677D),
                    //                 letterSpacing: -0.3,
                    //                 fontFamily: 'Montserrat',
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //         separatorBuilder: (context, index){
                    //           return Divider();
                    //         },
                    //       )),
                    //     ],
                    //   )
                    // )
                  ],
                )
              ],
            ),
          ]
        )    // body: Ce
    );
  }
}
