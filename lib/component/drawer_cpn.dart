import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/app/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Drawer(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 155.h, bottom: 305.h, left: 73.w),
                    width: 68.57.w,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Image(image: AssetImage(AudioImage.hideMenu))),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 159.w),
                    child: Wrap(
                      runSpacing: 10.h,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Theme :',
                              style: TextStyle(
                                  color: AudioColor.textColorBlur,
                                  fontSize: 64.sp)),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Import Books',
                              style: TextStyle(
                                  color: AudioColor.textColorBlur,
                                  fontSize: 64.sp)),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Settings',
                              style: TextStyle(
                                  color: AudioColor.textColorBlur,
                                  fontSize: 64.sp)),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Scan Storage',
                              style: TextStyle(
                                  color: AudioColor.textColorBlur,
                                  fontSize: 64.sp)),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Log Out',
                              style: TextStyle(
                                  color: AudioColor.textColorBlur,
                                  fontSize: 64.sp)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 98.w, top: 155.h),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: SizedBox(
                        width: 50.w,
                        height: 50.w,
                        child: const Image(image: AssetImage(AudioImage.closeDrawer))
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ))
      ],
    );
  }
}