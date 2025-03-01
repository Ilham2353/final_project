import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/nic_controller.dart';


class ResultScreen extends StatelessWidget {
  final NICController nicController = Get.find<NICController>();

  ResultScreen({super.key}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 234, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Decoded NIC Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIC Format: ${nicController.nicNumber.value.length == 10 ? 'Old' : 'New'}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Birth Year: ${nicController.birthYear.value}', style: const TextStyle(fontSize: 18)),
            Text('Date of Birth: ${nicController.birthDate.value}', style: const TextStyle(fontSize: 18)),
            Text('Weekday: ${nicController.weekday.value}', style: const TextStyle(fontSize: 18)),
            Text('Age: ${nicController.age.value}', style: const TextStyle(fontSize: 18)),
            Text('Gender: ${nicController.gender.value}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
