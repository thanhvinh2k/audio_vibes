import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/pages/book_pages/buy_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_vibes/app/image_constants.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Widget> _listBookTrending() {
    var listBook = <Widget>[];
    for (int i = 0; i < 10; i++) {
      listBook.add(_bookItem(AudioImage.bookItem2));
    }
    return listBook;
  }

  List<Widget> _wishListBook() {
    var listBook = <Widget>[];
    for (int i = 0; i < 10; i++) {
      listBook.add(_bookItem(AudioImage.bookItem3));
    }
    return listBook;
  }

  List<Widget> _listTopFree() {
    var listBook = <Widget>[];
    for (int i = 0; i < 10; i++) {
      listBook.add(_bookItem(AudioImage.bookItem4));
    }
    return listBook;
  }

  Widget _bookItem (String asset) {
    return Container(
      width: 297.w,
      height: 484.h,
      margin: EdgeInsets.only(left: 90.w),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (_) => BuyBook(image: asset)));
        },
        icon: Image(
          image: AssetImage(asset),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: -515.w,
          child: ClipOval(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxHeight: 1857.h, maxWidth: 664.w),
              color: AudioColor.secondColor,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 73.w, right: 110.w, bottom: 72.h),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: const Color(0xFF1F1F1F), fontSize: 52.sp),
                      label: Padding(
                        padding: EdgeInsets.only(left: 28.w),
                        child: Text('Trending',
                            style: TextStyle(
                                color: const Color(0xFF1F1F1F),
                                fontSize: 52.sp,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                height: 484.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _listBookTrending(),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 73.w, right: 110.w, bottom: 72.h),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: const Color(0xFF1F1F1F), fontSize: 52.sp),
                      label: Padding(
                        padding: EdgeInsets.only(left: 28.w),
                        child: Text('Your Wishlist',
                            style: TextStyle(
                                color: const Color(0xFF1F1F1F),
                                fontSize: 52.sp,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                height: 484.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _wishListBook(),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 73.w, right: 110.w, bottom: 72.h),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: const Color(0xFF1F1F1F), fontSize: 52.sp),
                      label: Padding(
                        padding: EdgeInsets.only(left: 28.w),
                        child: Text('Top Free',
                            style: TextStyle(
                                color: const Color(0xFF1F1F1F),
                                fontSize: 52.sp,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                height: 484.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _listTopFree(),
                ),
              ),
            ],
          ),
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
                  image: AssetImage(AudioImage.shoppingFloatButton)),
            ),
          ),
        )
      ],
    );
  }
}
