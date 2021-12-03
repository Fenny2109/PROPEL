import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propel/theme.dart';

class RateUs extends StatefulWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Text("Rate Us",
          style: GoogleFonts.montserrat(
            fontSize: 25,
            color: Colors.white.withOpacity(0.85),
          ),
        ),
      ),
    );
  }
}
