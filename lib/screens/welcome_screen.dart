import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/home_screen.dart';

import '../utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/Star 1.png'),
              ],
            ),
            const SizedBox(
              height: 210,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: RichText(
                text: TextSpan(
                  text: 'Let’s See\n',
                  style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 42.16,
                    height: 1.1,
                  ),
                  children: [
                    const TextSpan(text: 'The '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Image.asset(
                        'assets/images/text image.png',
                      ),
                    ),
                    const TextSpan(text: '\nWeather \nAround you'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 173,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Material(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  minWidth: double.infinity,
                  height: 62.0,
                  child: Text(
                    'Let’s Check',
                    style: GoogleFonts.poppins(
                      color: AppColors.secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
