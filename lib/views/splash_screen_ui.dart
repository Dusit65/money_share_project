import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/input_money_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // Delay 3 second and open to IntroductionUI page
    Future.delayed(
        Duration(
          // days: 366,
          seconds: 3,
        ),
        // until 3 sec open to next page that you want
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InputMoneyUi(),
              ),
            ));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 26, 11),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CircularProgressIndicator(
              color: Colors.yellow,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'แชร์เงินกันเถอะ',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Colors.white,
              ),
            ),
            Text(
              'Copyright ©️ 2024 by Dusit6552410011',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
            Text(
              'Version 1.0.0',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
