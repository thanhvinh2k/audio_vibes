import 'package:audio_vibes/bottomNavigationBar/audio_bottom_navigation_bar.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/app/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_vibes/app/color_constants.dart';

class AudioConnection extends StatelessWidget {
  const AudioConnection({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 321.h),
            child: Text(
              AudioString.audioVibes,
              style: TextStyle(color: Colors.white, fontSize: 72.sp),
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          Divider(
            height: 1.h,
            thickness: 2,
            indent: 148.w,
            endIndent: 148.w,
            color: AudioColor.backgroundColor,
          ),
          SizedBox(
            height: 198.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 116.w),
              child: Text(
                AudioString.connectionDescription,
                style: TextStyle(
                    fontSize: 52.sp,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          //Connect Audible button
          Container(
            margin: EdgeInsets.only(top: 193.h),
            width: 766.w,
            height: 153.h,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Container(
                    margin: EdgeInsets.only(left: 45.85.w),
                    width: 101.86.w,
                    height: 63.h,
                    child: const Image(
                        image: AssetImage(AudioImage.connectAudible))),
                label: Text(
                  AudioString.connectAudible,
                  style: TextStyle(
                      fontSize: 52.sp, color: AudioColor.primaryColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          //Connect Story button
          Container(
            margin: EdgeInsets.only(top: 103.h),
            width: 766.w,
            height: 153.h,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Container(
                    margin: EdgeInsets.only(left: 45.85.w),
                    width: 101.86.w,
                    height: 63.h,
                    child: const Image(
                        image: AssetImage(AudioImage.connectStory))),
                label: Text(
                  AudioString.connectStory,
                  style: TextStyle(
                      fontSize: 52.sp, color: AudioColor.primaryColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          //Not now Button
          Container(
            width: 461.w,
            height: 139.h,
            margin: EdgeInsets.only(top: 212.h),
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const AudioBottomNavigationBar()));
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2.0)),
              child: Text(
                AudioString.notNow,
                style: TextStyle(
                    color: AudioColor.backgroundColor,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFFFF9900),
    );
  }
}
