import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Deland Woii'),
      //   centerTitle: true,
      // ),

      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
                children: [

                  Container(
                    margin: const EdgeInsets.only(top: 40.0, bottom: 5.0),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFF080ba1),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.0
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    alignment:Alignment.center,
                    child: const Text(
                      'Silakan masuk ke akun Anda untuk menikmati akses penuh ke koleksi digital kami.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.7,
                        fontSize: 16.0,
                        color: Color(0xFF61677D),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 35,
                  ),

                  Container(
                    child: Column(
                      children: [

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Username tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return 'Password tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Obx(() => controller.loadinglogin.value?
                        CircularProgressIndicator():
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: (){
                              controller.login();
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                              ),
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF080ba1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                        )
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun ?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF61677D),
                            letterSpacing: -0.3,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(
                          width: 5.0,
                        ),

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF080ba1),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          height: 1,
                          child: ColoredBox(
                            color: Color(0xFF61677D),
                          ),
                        ),

                        SizedBox(
                          width: 5.0,
                        ),

                        Text(
                          'Or',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF61677D),
                            letterSpacing: -0.3,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(
                          width: 5.0,
                        ),

                        SizedBox(
                          height: 1,
                          child: ColoredBox(
                            color: Color(0xFF61677D),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Expanded(
                          child: SizedBox(
                            height: 45.0,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFAFAFA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(
                                FontAwesomeIcons.facebook,
                                color: Color(0xFF080ba1),
                              ),
                              label: const Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Color(0xFF61677D),
                                ),
                              ),
                              onPressed: () {
                                // Tambahkan fungsi untuk tombol Facebook di sini
                              },
                            ),
                          ),
                        ),

                        SizedBox(width: 5),

                        Expanded(
                          child: SizedBox(
                            height: 45.0,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF080ba1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: Icon(FontAwesomeIcons.google),
                              label: Text('Google'),
                              onPressed: () {
                                // Tambahkan fungsi untuk tombol Facebook di sini
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ]
            ),
          )
      ),
    );
  }
}
