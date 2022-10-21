import 'package:audio_vibes/app/color_constants.dart';
import 'package:audio_vibes/pages/menu/home_screen.dart';
import 'package:audio_vibes/pages/menu/profile_screen.dart';
import 'package:audio_vibes/pages/menu/shop_screen.dart';
import 'package:audio_vibes/app/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioBottomNavigationBar extends StatefulWidget {
  const AudioBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _AudioBottomNavigationBarState();
}

class _AudioBottomNavigationBarState extends State<AudioBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
          index, duration: const Duration(microseconds: 500), curve: Curves.ease);
    });
  }

  final PageController _pageController = PageController(
      initialPage: 0,
      keepPage: true
  );

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
      children: [
        const HomePage(),
        ShopPage(),
        ProfilePage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildPageView(),
        bottomNavigationBar: AudioBottomNavigationBarComponent(
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onItemTapped(index);
          },
        )
    );
  }
}

class AudioBottomNavigationBarComponent extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;
  const AudioBottomNavigationBarComponent({super.key, required this.currentIndex, required this.onTap});

  @override
  State<StatefulWidget> createState() => _AudioBottomNavigationBarComponentState();
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

  const ButtonNavigation({super.key,
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
        icon: isSelected
            ? Image.asset(imageSelect)
            : Image.asset(imageNonSelect),
      ),
      SizedBox(height: 11.h,),
      Text(
        label,
        style: TextStyle(
            color: isSelected
                ? AudioColor.primaryColor
                : const Color(0x40000000),
            fontSize: 36.sp),
      )
    ]);
  }
}
