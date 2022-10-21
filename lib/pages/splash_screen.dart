import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/pages/login_screen.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
      body: Stack(
        children: [
          //ellipse top left
          Positioned(
              top: -650.h,
              left: -750.w,
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints(maxHeight: 1355.h, maxWidth: 1517.w),
                  color: AudioColor.secondColor,
                ),
              )),
          //ellipse bottom right
          Positioned(
              bottom: -650.h,
              right: -750.w,
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints(maxHeight: 1355.h, maxWidth: 1517.w),
                  color: AudioColor.secondColor,
                ),
              )),
          //Button sign in to next to signInScreen
          Positioned(
              bottom: 40,
              right: 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (_) => const SignIn()));
                },
                child: const Text('sign in'),
              )),
          //symbol and slogan
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: const AssetImage(AudioImage.audioSplash),
                  width: 398.w,
                  height: 358.19.h,
                ),
                Container(
                    margin: EdgeInsets.only(top: 57.h),
                    child: Text(
                      'AudioVibes',
                      style: TextStyle(fontSize: 64.sp, color: Colors.black),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 33.h),
                  child: Text(
                    'Catch your vibe; On the go.',
                    style: TextStyle(
                      fontSize: 56.sp,
                      color: AudioColor.textColorBlur,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
