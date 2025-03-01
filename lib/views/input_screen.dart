import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/nic_controller.dart';
import '/views/result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController nicTextController = TextEditingController();
  late NICController nicController;

  @override
  void initState() {
    super.initState();
    nicController = Get.find<NICController>(); // Ensure GetX Controller is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 234, 227, 227), // Improved background color
      appBar: AppBar(
        backgroundColor: Colors.blue, // Background color for the AppBar
        centerTitle: true,
        title: Text(
          'NIC Decoder',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 42, 40, 40), // Text color
          ),
        ),
        elevation: 4,
        shadowColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your NIC Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800], // Title text color
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nicTextController,
              onChanged: (value) {
                nicController.nicNumber.value = value; // Update NIC value reactively
              },
              decoration: InputDecoration(
                labelText: 'NIC Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white, // Input field background
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: nicController.nicNumber.value.isNotEmpty
                      ? () {
                          String message = nicController.decodeNIC();
                          if (message == "NIC Decoded Successfully.") {
                            Get.to(() => ResultScreen()); // Navigate to ResultScreen
                          } else {
                            Get.snackbar("Error", message,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                      : null, // Disable if NIC is empty
                  child: const Text(
                    'Decode',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
