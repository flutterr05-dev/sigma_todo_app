import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/auth_controller.dart';
import 'package:sigma_todo_app/screens/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailCtrl = TextEditingController(text: "test@test.test");
  final passCtrl = TextEditingController(text: "testtest");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            children: [
              Spacer(),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Enter your Email",
                ),
              ),
              TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter your Password",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final message = await Get.find<AuthController>().signin(
                    emailCtrl.text.trim(),
                    passCtrl.text,
                  );

                  if (message == "success") {
                    Get.offAll(() => Home());
                  }

                  ScaffoldMessenger.of(
                    // ignore: use_build_context_synchronously
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text("Signin"),
              ),

              GestureDetector(
                onTap: () async {
                   await Get.find<AuthController>()
                      .signinWithGoogle();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Sign in with Google"),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
