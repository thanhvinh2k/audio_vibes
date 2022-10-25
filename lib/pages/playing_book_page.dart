import 'dart:ui';
import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/component/appbar_cpn.dart';
import 'package:audio_vibes/component/drawer_cpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlayingBookPage extends StatelessWidget {
  const PlayingBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
          image: AudioImage.back,
          onPress: () {
            Navigator.pop(context);
          }),
      body: Stack(
        children: [
          Positioned(
            bottom: -45.h,
            left: -235.w,
            child: ClipOval(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AudioImage.backgroundPlayingBook),
                    fit: BoxFit.cover
                  ),
                ),
                alignment: Alignment.center,
                constraints:
                    BoxConstraints(maxHeight: 1024.h, maxWidth: 1552.w),
                child:
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 150.h),
              const AudioDropdownButton(),
              SizedBox(height: 175.h),
              Text('Five Feet Aprt',
                  style: TextStyle(
                      fontSize: 72.sp,
                      color: AudioColor.textColorPrimary,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: EdgeInsets.only(top: 47.h, bottom: 180.h),
                child: Text(
                  'Racheal Lippincott',
                  style: TextStyle(
                      color: AudioColor.textColorPrimary,
                      fontSize: 48.sp,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 196.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Image(image: AssetImage(AudioImage.previous)),
                      iconSize: 100.w,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Image(image: AssetImage(AudioImage.pause)),
                      iconSize: 292.w,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Image(
                          image: AssetImage(AudioImage.fastForward)),
                      iconSize: 100.w,
                    )
                  ],
                ),
              ),
              SizedBox(height: 165.h),
              SizedBox(
                width: 758.w,
                child: LinearPercentIndicator(
                  lineHeight: 26.h,
                  percent: 0.653,
                  backgroundColor: AudioColor.secondColor,
                  progressColor: AudioColor.primaryColor,
                  barRadius: const Radius.circular(20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 36.h, bottom: 170.h),
                child: Text(
                  '25mins left',
                  style: TextStyle(
                      fontSize: 48.sp,
                      fontStyle: FontStyle.italic,
                      color: AudioColor.textColorPrimary),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 212.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 155.w,
                      height: 155.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon:
                            const Image(image: AssetImage(AudioImage.favorite)),
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                      height: 155.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Image(image: AssetImage(AudioImage.time)),
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                      height: 155.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Image(image: AssetImage(AudioImage.volume)),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerComponent(),
    );
  }
}

class AudioDropdownButton extends StatefulWidget {
  const AudioDropdownButton({super.key});

  @override
  State<StatefulWidget> createState() => _AudioDropdownButtonState();
}

class _AudioDropdownButtonState extends State<AudioDropdownButton> {
  @override
  Widget build(BuildContext context) {
    var list = <String>[];
    for (int i = 40; i <= 60; i++) {
      list.add('Chapter $i');
    }
    String? dropdownValue = list.first;
    return SizedBox(
      width: 477.w,
      height: 150.h,
      child: DropdownButtonFormField<String>(
        isExpanded: false,
        isDense: true,
        menuMaxHeight: 1000.h,
        value: dropdownValue,
        icon: Container(
          margin: EdgeInsets.only(right: 25.w),
          child: Image(
            image: const AssetImage(AudioImage.dropdown),
            width: 50.w,
            height: 70.h,
          ),
        ),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                value,
                style: TextStyle(
                    color: AudioColor.textColorPrimary,
                    fontSize: 52.sp,
                    height: 1.0),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AudioColor.primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AudioColor.primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
      ),
    );
  }
}
