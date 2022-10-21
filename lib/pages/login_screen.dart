import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/pages/connection_screen.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderAudioLogin(),
          FormLogin(),
          BottomLogin()
        ],
      ),
    ));
  }
}

class HeaderAudioLogin extends StatelessWidget {
  const HeaderAudioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 600.w,
          height: 500.h,
          child: const Image(
              image: AssetImage(AudioImage.audioSignIn)),
        ),
        Container(
          margin: EdgeInsets.only(left: 211.73.w),
          child: Text(
            'skip',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AudioColor.textColorBlur,
                fontSize: 48.sp),
          ),
        )
      ],
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Container(
          margin: EdgeInsets.only(top: 70.h, left: 135.w),
          child: Text(
            'Sign In',
            style:
            TextStyle(fontSize: 144.sp, color: const Color(0xFF1F1F1F)),
          ),
        ),
        //username field
        Container(
          padding: EdgeInsets.only(top: 126.h, left: 126.w, right: 126.w),
          child: TextFormField(
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Username',
                labelStyle: TextStyle(
                    color: AudioColor.textColorBlur, fontSize: 48.sp),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange))),
          ),
        ),
        //password field
        Container(
          padding: EdgeInsets.only(top: 126.h, left: 126.w, right: 126.w),
          child: TextFormField(
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: AudioColor.textColorBlur, fontSize: 48.sp),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange))),
            obscureText: true,
          ),
        ),
        //button login
        Container(
          margin: EdgeInsets.only(left: 126.w, top: 98.h),
          width: 308.w,
          height: 102.h,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const AudioConnection()));
            },
            child: Text('Let\'s Go',
                style: TextStyle(color: Colors.white, fontSize: 42.sp)),
          ),
        ),
      ],
    );
  }
}

class BottomLogin extends StatelessWidget {
  const BottomLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 94.h),
              child: Text(
                '- OR -',
                style: TextStyle(
                    color: AudioColor.textColorBlur, fontSize: 48.sp),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 70.h, right: 92.w),
                width: 168.w,
                height: 168.w,
                child:
                const Image(image: AssetImage(AudioImage.googleLogin))),
            Container(
                margin: EdgeInsets.only(top: 70.h),
                width: 168.w,
                height: 168.w,
                child:
                const Image(image: AssetImage(AudioImage.faceBookLogin)))
          ],
        ),
        SizedBox(height: 90.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Account? ',
              style: TextStyle(color: const Color(0xFF1F1F1F), fontSize: 48.sp),
            ),
            Text(
              'Sign up now',
              style: TextStyle(
                  color: const Color(0xFF1F1F1F),
                  fontSize: 48.sp,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
            )
          ],
        )
      ],
    );
  }
}
