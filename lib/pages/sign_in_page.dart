import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/sign_up_page.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';
import 'package:store_app/widgets/welcome_background.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});
  static const String id = "signInPage";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          welcomeBackground(top: -200, right: -150),
          welcomeBackground(bottom: -200, left: -150),
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "sign_in1".tr(), // Login Here
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1f41bb),
                      ),
                    ),
                    Text(
                      "sign_in2".tr(), // Welcome back...
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 45),
                    customTextFormField(
                      label: "email_hint".tr(),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email_null_error".tr();
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "email_invalid_error".tr();
                        }
                        return null;
                      },
                    ),
                    customTextFormField(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      label: "password_hint".tr(),
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password_null_error".tr();
                        }
                        if (value.length < 6) {
                          return "password_short_error".tr();
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("forgot_password".tr()),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: customElevatedButton(
                        text: "login_button".tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                              context,
                              HomePage.id,
                            );
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SignUpPage.id);
                      },
                      child: Text(
                        "sign_up_text_button".tr(),
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
