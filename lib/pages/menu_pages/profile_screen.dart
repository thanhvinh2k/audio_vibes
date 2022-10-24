import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/app/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -487.h,
          left: -571.w,
          child: ClipOval(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxHeight: 1291.h, maxWidth: 665.w),
              color: AudioColor.secondColor,
            ),
          ),
        ),
        Column(
        children: [
          SizedBox(height: 32.h),
          CircleAvatar(
            backgroundColor: AudioColor.secondColor,
            radius: 312.w,
            child: CircleAvatar(
                backgroundColor: const Color(0x73FF9900),
                radius: 271.w,
                child: CircleAvatar(
                  radius: 231.w,
                  child: const Image(
                    image: AssetImage(AudioImage.avatar),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 69.h, bottom: 20.h),
            child: Text('Jeff Bond',
                style: TextStyle(
                    color: AudioColor.textColorPrimary,
                    fontSize: 64.sp,
                    fontWeight: FontWeight.w600)),
          ),
          Text(
            '26 yrs.',
            style: TextStyle(
                color: AudioColor.textColorPrimary,
                fontSize: 48.sp,
                fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.only(left: 73.w, right: 110.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w, bottom: 36.h, top: 104.h),
                  child: Text('Your Preferences',
                      style:
                          TextStyle(color: AudioColor.textColorPrimary, fontSize: 48.sp, fontWeight: FontWeight.w600)),
                ),
                const Divider(height: 2.0, color: AudioColor.textColorBlur),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, top: 60.h, bottom: 54.h),
                  child: Row(
                    children: [
                      Text(
                        'Reading voice: ',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Female 2',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Genres: ',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        AudioString.genresInfo,
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 54.h, bottom: 100.h),
                  child: Row(
                    children: [
                      Text(
                        'Sleep time: ',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        AudioString.sleepTimeInfo,
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, bottom: 36.h),
                  child: Text('Your Stats',
                      style:
                      TextStyle(color: AudioColor.textColorPrimary, fontSize: 48.sp, fontWeight: FontWeight.w600)),
                ),
                const Divider(height: 2.0, color: AudioColor.textColorBlur),
                Padding(
                  padding: EdgeInsets.only(top: 60.h, bottom: 54.h),
                  child: Row(
                    children: [
                      Text(
                        'Books Owned: ',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '23',
                        style: TextStyle(
                            color: AudioColor.textColorPrimary, fontSize: 38.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Hours Spent: ',
                      style: TextStyle(
                          color: AudioColor.textColorPrimary, fontSize: 38.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '250 hrs',
                      style: TextStyle(
                          color: AudioColor.textColorPrimary, fontSize: 38.sp, fontStyle: FontStyle.italic),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
        Positioned(
          bottom: 118.h,
          right: 104.w,
          child: SizedBox(
            width: 202.w,
            height: 202.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Image(
                  image: AssetImage(AudioImage.editFloatButton)),
            ),
          ),
        )
      ],
    );
  }
}
