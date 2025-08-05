import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/sign_in_page.dart';
import 'package:store_app/pages/sign_up_page.dart';
import 'package:store_app/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translation',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.id,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WelcomePage.id:
            return PageRouteBuilder(
              pageBuilder: (_, animation, __) => const WelcomePage(),
              transitionsBuilder: (_, animation, __, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation);
                return SlideTransition(position: offsetAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            );

          case SignInPage.id:
            return PageRouteBuilder(
              pageBuilder: (_, animation, __) => SignInPage(),
              transitionsBuilder: (_, animation, __, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation);
                return SlideTransition(position: offsetAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            );

          case SignUpPage.id:
            return PageRouteBuilder(
              pageBuilder: (_, animation, __) => SignUpPage(),
              transitionsBuilder: (_, animation, __, child) {
                final scaleAnimation = Tween<double>(
                  begin: 0.8,
                  end: 1.0,
                ).animate(animation);
                return ScaleTransition(scale: scaleAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            );

          case HomePage.id:
            return PageRouteBuilder(
              pageBuilder: (_, animation, __) => HomePage(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            );

          default:
            return null;
        }
      },
    );
  }
}
