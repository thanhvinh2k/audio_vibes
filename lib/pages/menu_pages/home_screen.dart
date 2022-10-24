import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/pages/playing_book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:audio_vibes/app/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> listBook() {
    var listBook = <Widget>[];
    for (int i = 0; i < 10; i++) {
      listBook.add(const SizedBox(
        child: Image(
          image: AssetImage(AudioImage.bookItem1),
          fit: BoxFit.fill,
        ),
      ));
    }
    return listBook;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true);
    return Stack(
      children: [
        //ellipse top left
        Positioned(
          top: -100.h,
          left: -656.w,
          child: ClipOval(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  maxHeight: 1005.h,
                  maxWidth: 810.w
              ),
              color: AudioColor.secondColor,
            ),
          ),
        ),
        //ellipse bottom
        Positioned(
          bottom: -902.h,
          right: -629.w,
          child: ClipOval(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  maxHeight: 1188.h,
                  maxWidth: 1953.w
              ),
              color: AudioColor.secondColor,
            ),
          ),
        ),
        Padding(
        padding: EdgeInsets.only(left: 92.w, right: 92.w),
        child: Column(
              children: [
                const PlayingBook(),
                TextFormField(
                  decoration: InputDecoration(
                      labelStyle:
                      TextStyle(color: const Color(0xFF1F1F1F), fontSize: 52.sp),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Shelf',
                              style: TextStyle(
                                  color: const Color(0xFF1F1F1F), fontSize: 52.sp, fontWeight: FontWeight.w600)),
                          SizedBox(
                              width: 68.w,
                              height: 68.w,
                              child: const Image(image: AssetImage(AudioImage.searchBook)))
                        ],
                      )),
                ),
                SizedBox(height: 75.h),
                Expanded(
                  child: GridView.count(
                      childAspectRatio: (371/606),
                      crossAxisCount: 2,
                      primary: false,
                      padding: EdgeInsets.only(left: 34.w, right: 34.w),
                      crossAxisSpacing: 91.w,
                      mainAxisSpacing: 85.h,
                      children: listBook()
                  ),
                ),
              ],
            ),
      ),
        // floating action button
        Positioned(
          bottom: 118.h,
          right: 104.w,
          child: SizedBox(
            width: 202.w,
            height: 202.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const PlayingBookPage()));
              },
              icon: const Image(image: AssetImage(AudioImage.playBook)),
            ),
          ),
        ),
      ],
    );
  }
}

class PlayingBook extends StatelessWidget {
  const PlayingBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 114.h),
        // playing book
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 12.w, right: 94.w),
                width: 317.w,
                height: 501.h,
                child:
                const Image(image: AssetImage(AudioImage.bookPlaying))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Currently vibing.',
                    style: TextStyle(fontSize: 42.sp, color: Colors.black)),
                SizedBox(height: 50.h),
                Text('2hrs 51mins',
                    style: TextStyle(color: Colors.black, fontSize: 72.sp)),
                SizedBox(height: 8.h),
                Text('left in book',
                    style: TextStyle(fontSize: 42.sp, color: Colors.black)),
                SizedBox(height: 54.h),
                LinearPercentIndicator(
                  width: 436.w,
                  lineHeight: 26.h,
                  percent: 0.653,
                  backgroundColor: AudioColor.secondColor,
                  progressColor: AudioColor.primaryColor,
                  barRadius: const Radius.circular(20),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 44.h,)
      ],
    );
  }
}
