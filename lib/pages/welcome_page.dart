import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/sign_in_page.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'package:store_app/widgets/welcome_background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const String id = "welcomePage";

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Text(
          'app_name', // Assuming you have a translation setup
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E),
          ),
        ).tr(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/welcome_image.png", height: 350),
                  const SizedBox(height: 32),
                  const Text(
                    'welcome1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ).tr(),

                  const SizedBox(height: 12),

                  const Text(
                    'welcome2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ).tr(),

                  const SizedBox(height: 40),

                  //Login
                  SizedBox(
                    width: double.infinity,
                    child: customElevatedButton(
                      text: 'login_button'.tr(),
                      onPressed: () {
                        Navigator.pushNamed(context, SignInPage.id);
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  //Register
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    child: const Text(
                      'guest_button',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ).tr(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120,
                        child: customElevatedButton(
                          text: 'English',
                          onPressed: () {
                            context.setLocale(const Locale('en', 'US'));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: customElevatedButton(
                          text: 'العربية',
                          onPressed: () {
                            context.setLocale(const Locale('ar', 'EG'));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          welcomeBackground(top: -200, right: -150),
        ],
      ),
    );
  }
}
