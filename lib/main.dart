import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/nic_controller.dart';
import 'views/input_screen.dart'; 

void main() {
  Get.put(NICController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const InputScreen(), 
    );
  }
}
