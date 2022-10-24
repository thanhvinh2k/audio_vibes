import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/app/string_constants.dart';
import 'package:audio_vibes/component/appbar_cpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/component/drawer_cpn.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuyBook extends StatelessWidget {
  final String image;

  const BuyBook({super.key, required this.image});

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
            top: 0,
            right: -367.w,
            child: ClipOval(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxHeight: 851.h, maxWidth: 585.w),
                color: AudioColor.secondColor,
              ),
            ),
          ),
          Positioned(
            top: 270.h,
            left: -367.w,
            child: ClipOval(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxHeight: 851.h, maxWidth: 585.w),
                color: AudioColor.secondColor,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80.h),
              SizedBox(
                width: 432.w,
                height: 683.h,
                child: Image(image: AssetImage(image)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 89.h, bottom: 20.h),
                child: Text(
                  'The Swallows',
                  style: TextStyle(
                      color: AudioColor.textColorPrimary,
                      fontSize: 64.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Lisa Lutz',
                style: TextStyle(
                    color: AudioColor.textColorPrimary,
                    fontSize: 48.sp,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 84.h),
              Padding(
                padding: EdgeInsets.only(left: 91.w, right: 88.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('8.56 \$',
                                style: TextStyle(
                                    color: const Color(0xFF2D7215),
                                    fontSize: 72.sp,
                                    fontWeight: FontWeight.w600)),
                            Padding(
                              padding: EdgeInsets.only(top: 21.h),
                              child: Text(
                                AudioString.seller,
                                style: TextStyle(color: Colors.black, fontSize: 42.sp),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Image(image: AssetImage(AudioImage.buyBook)),
                          padding: EdgeInsets.zero,
                          iconSize: 164.w,
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 28.w, right: 25.w, bottom: 24.h, top: 105.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reviews',
                              style: TextStyle(
                                  fontSize: 52.sp,
                                  color: AudioColor.textColorPrimary)),
                          RatingBar(
                            ratingWidget: RatingWidget(
                                full: const Image(
                                    image: AssetImage(AudioImage.fullStar),
                                    fit: BoxFit.fill),
                                half: const Image(
                                    image: AssetImage(AudioImage.halfStar),
                                    fit: BoxFit.fill),
                                empty: const Image(
                                  image: AssetImage(AudioImage.emptyStar),
                                  fit: BoxFit.fill,
                                )),
                            onRatingUpdate: (_) {},
                            initialRating: 3.5,
                            allowHalfRating: true,
                            itemSize: 43.w,
                          )
                        ],
                      ),
                    ),
                    const Divider(height: 2.0, color: Colors.black),
                    SizedBox(height: 78.h),
                    Padding(
                      padding: EdgeInsets.only(left: 55.w),
                      child: Text(AudioString.quote,
                          style: TextStyle(
                              fontSize: 36.sp,
                              color: AudioColor.textColorPrimary,
                              fontStyle: FontStyle.italic)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 60.w, top: 60.h),
                        child: Text('- The Times', style: TextStyle(fontSize: 42.sp, color: Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
              Image(image: const AssetImage(AudioImage.more), width: 40.w, height: 50.h)
            ],
        )
        ],
      ),
      drawerScrimColor: Colors.transparent,
      drawer: DrawerComponent(),
    );
  }
}
