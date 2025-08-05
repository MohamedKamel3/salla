import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/sign_in_page.dart';
import 'package:store_app/widgets/welcome_background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const String id = "welcomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text(
          'Salla',
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E),
          ),
        ),
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
                    'Find everything you need \nin one place',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Browse all the latest trends and must-have items for your lifestyle',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  const SizedBox(height: 40),

                  //Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInPage.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A73E8),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  //Register
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    child: const Text(
                      'Continue as Guest',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
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
