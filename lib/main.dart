import 'package:audio_vibes/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audio_vibes/app/color_constants.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Vibes',
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(scrimColor: Color(0x59FFFFFF)),
        scaffoldBackgroundColor: AudioColor.backgroundColor,
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange
        )
      ),
      home: const Splash(),
    );
  }
}
