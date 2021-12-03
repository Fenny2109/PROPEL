import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propel/auth/screens/login_screen.dart';
import 'package:propel/auth/screens/registration_screen.dart';
import 'package:propel/theme.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max;
    if ((size.height > size.width)) {
      max = size.height;
    } else {
      max = size.width;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                  child: Text("Let's Get Started",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 0.5 * max,
                  child: Image.asset("assets/images/propel.png",fit: BoxFit.fitWidth,),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: SizedBox(
                    height: 56,
                    width: 0.85 * size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade500,
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: Text("Login",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: SizedBox(
                    height: 56,
                    width: 0.85 * size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationScreen()));

                      },
                      child: Text("Sign Up",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
