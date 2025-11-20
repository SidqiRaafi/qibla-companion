import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../auth/auth_choice_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthChoicePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color baseColor = Color(0xFF6D626C);
    const Color spinColor = Color(0xFFFECa7d);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/compass.png',
                    width: 220,
                    height: 220,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppStrings.splashTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    width: 54,
                    height: 54,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(spinColor),
                      backgroundColor: baseColor,
                      strokeWidth: 8.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "@2025, Qibla Companion, Inc",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
