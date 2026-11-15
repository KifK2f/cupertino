import 'package:cupertino/ios_material/ios_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialIos extends StatelessWidget {
  const MaterialIos({super.key});

  CupertinoThemeData light() {
    return CupertinoThemeData(
      brightness: Brightness.light,
    );
  }
  CupertinoThemeData dark() {
    return CupertinoThemeData(
      brightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isLight = brightness == Brightness.light;
    return CupertinoApp(
      title: "Mon app version iOS",
      theme: isLight ? light() : dark(),
      // theme: CupertinoThemeData(
      //   brightness: Brightness.light,
      //   // brightness: Brightness.dark,
      //   // primaryColor: Colors.lightBlue,
      //   // primaryContrastingColor: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      home: const IosPageScaffold(),
    );
  }
}