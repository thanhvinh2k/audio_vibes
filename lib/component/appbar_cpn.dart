
import 'package:flutter/material.dart';
import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarComponent extends StatelessWidget implements PreferredSize{
  final String image;
  final void Function() onPress;
  const AppBarComponent({super.key, required this.image, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return AppBar (
      title: Text(
        'AudioVibes',
        style: TextStyle(fontSize: 52.sp, color: const Color(0xFF1F1F1F)),
      ),
      backgroundColor: AudioColor.backgroundColor,
      elevation: 0.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 73.w),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Image(image: AssetImage(AudioImage.showMenu)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        );
      }),
      leadingWidth: 141.57.w,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 30.w),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onPress,
            icon: SizedBox(
                width: 54.w,
                height: 54.w,
                child: Image(
                    image: AssetImage(image))),
          ),
        )
      ],
    );
  }

  @override
  Widget get child => Text('child');

  @override
  Size get preferredSize => Size(100.w, 140.h);
}