import 'package:alfatech/helper/binding.dart';
import 'package:alfatech/view/Control_View.dart';
import 'package:flutter/material.dart';
import 'package:alfatech/view/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/view-model/cart_view_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),

      ),
      theme: ThemeData(fontFamily: 'assets/fonts/SourceSansPro-Regular.ttf'),
    );
  }
}
