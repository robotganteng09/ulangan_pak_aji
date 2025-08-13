import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:latihan1/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginStatus = "Please fill each form";
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();

  void handleLogin() {
    setState(() {
      if (user.text == "admin" && password.text == "123") {
        loginStatus = "Login berhasil";
      } else {
        loginStatus = "Login gagal";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page 01")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please fill username and password"),
            Center(
              child: Image.asset(
                'assets/images/plane.png',
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: user,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleLogin,
                child: Text("Login"),
              ),
            ),
            Center(child: Text(loginStatus)),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Belum punya akun? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
