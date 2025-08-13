import 'package:flutter/material.dart';
import 'package:latihan1/widgets/widgetcomponents.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController tanggalLahir = TextEditingController();

  String currentOption = 'Other';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "First Time?",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Please enter your data below",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/plane.png',
                    height: 120,
                    width: 120,
                  ),
                ],
              ),
            ),

            ReuseTextField(
              label: "Enter Gmail",
              controller: gmailController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Enter Name",
              controller: namaController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Enter Password",
              controller: passwordController,
              obscureText: true,
              isNUmber: false,
            ),

            const SizedBox(height: 16),
            const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: ['Male', 'Female', 'Other'].map((gender) {
                return ListTile(
                  title: Text(gender),
                  leading: Radio<String>(
                    value: gender,
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            DatePickerField(controller: tanggalLahir),

            CustomButton(
              text: "Register",
              margin: 20,
              onPressed: () {
                // Handle register logic
                print("Name: ${namaController.text}");
                print("Email: ${gmailController.text}");
                print("Password: ${passwordController.text}");
                print("Gender: $currentOption");
                print("Tanggal Lahir: ${tanggalLahir.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
