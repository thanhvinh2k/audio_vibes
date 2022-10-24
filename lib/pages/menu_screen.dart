import 'dart:ui' show ImageFilter;
import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/component/appbar_cpn.dart';
import 'package:audio_vibes/pages/menu_pages/home_screen.dart';
import 'package:audio_vibes/pages/menu_pages/profile_screen.dart';
import 'package:audio_vibes/pages/menu_pages/shop_screen.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioMenuScreen extends StatefulWidget {
  const AudioMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AudioMenuScreenState();
}

class _AudioMenuScreenState extends State<AudioMenuScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(microseconds: 500), curve: Curves.ease);
    });
  }

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  void pageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        pageChange(index);
      },
      children: const [
        HomePage(),
        ShopPage(),
        ProfilePage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(1080, 2400),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
      appBar: AppBarComponent(image: AudioImage.searchBook, onPress: () {},),
      body: buildPageView(),
      bottomNavigationBar: AudioBottomNavigationBarComponent(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      drawerScrimColor: Colors.transparent,
      drawer: Row(
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
      ),
    );
  }
}

class AudioBottomNavigationBarComponent extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const AudioBottomNavigationBarComponent(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  State<StatefulWidget> createState() =>
      _AudioBottomNavigationBarComponentState();
}

class _AudioBottomNavigationBarComponentState
    extends State<AudioBottomNavigationBarComponent> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    pageIndex = widget.currentIndex;
    return Container(
      height: 218.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black, blurRadius: 5)],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Button home
          ButtonNavigation(
              isSelected: pageIndex == 0 || widget.currentIndex == 0,
              label: 'Home',
              imageSelect: AudioImage.homeSelect,
              imageNonSelect: AudioImage.homeNonSelect,
              onPress: () {
                setState(() {
                  widget.onTap(0);
                  pageIndex = 0;
                });
              }),
          SizedBox(width: 174.w),
          //Button shop
          ButtonNavigation(
              isSelected: pageIndex == 1 || widget.currentIndex == 1,
              label: 'Shop',
              imageSelect: AudioImage.shopSelect,
              imageNonSelect: AudioImage.shopNonSelect,
              onPress: () {
                setState(() {
                  widget.onTap(1);
                  pageIndex = 1;
                });
              }),
          SizedBox(width: 174.w),
          //Button profile
          ButtonNavigation(
              isSelected: pageIndex == 2 || widget.currentIndex == 2,
              label: 'Profile',
              imageSelect: AudioImage.profileSelect,
              imageNonSelect: AudioImage.profileNonSelect,
              onPress: () {
                setState(() {
                  widget.onTap(2);
                  pageIndex = 2;
                });
              }),
        ],
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String imageSelect;
  final String imageNonSelect;
  final VoidCallback onPress;

  const ButtonNavigation(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.imageSelect,
      required this.imageNonSelect,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        constraints: const BoxConstraints(),
        onPressed: onPress,
        padding: EdgeInsets.zero,
        icon:
            isSelected ? Image.asset(imageSelect) : Image.asset(imageNonSelect),
      ),
      SizedBox(
        height: 11.h,
      ),
      Text(
        label,
        style: TextStyle(
            color:
                isSelected ? AudioColor.primaryColor : const Color(0x40000000),
            fontSize: 36.sp),
      )
    ]);
  }
}
