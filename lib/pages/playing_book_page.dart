
import 'package:audio_vibes/app/image_constants.dart';
import 'package:audio_vibes/component/appbar_cpn.dart';
import 'package:audio_vibes/component/drawer_cpn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayingBookPage extends StatelessWidget {
  const PlayingBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    var list = <String>[];
    for (int i = 40; i <= 60; i++) {
      list.add('Chapter $i');
    }

    String dropdownValue = list.first;

    return Scaffold(
      appBar: AppBarComponent(
          image: AudioImage.back,
          onPress: () {
            Navigator.pop(context);
          }),
      body: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
              icon: const Image(image: AssetImage(AudioImage.dropdown)),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: null
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
                    icon: const Image(image: AssetImage(AudioImage.fastForward)),
                  iconSize: 100.w,
                )
              ],
            ),
          )
        ],
      ),
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerComponent(),
    );
  }
}

class AudioDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AudioDropdownButtonState();
}

class _AudioDropdownButtonState extends State<AudioDropdownButton> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}