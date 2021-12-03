import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:propel/theme.dart';
import 'package:propel/user_prefrence.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'geolocator_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing firebase core
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    Timer(const Duration(seconds: 5), () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserPrefrence())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 4,),
            SizedBox(
              height: 0.4 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
            const Spacer(flex: 6,),
            SizedBox(
              child: Shimmer.fromColors(
                period: const Duration(milliseconds: 2000),
                baseColor: primaryColor,
                highlightColor: Colors.white.withOpacity(0.8),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "PROPEL",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 10,
                        fontSize:30.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            //const CircularProgressIndicator(),
            const Spacer(flex: 4,)
          ],
        ),
      ),
    );
  }
}
