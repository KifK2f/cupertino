import 'package:cupertino/ios_material/ios_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialIos extends StatelessWidget {
  const MaterialIos({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Mon app version iOS",
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        primaryContrastingColor: Colors.blue,
        barBackgroundColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: IosPageScaffold(),
    );
  }
}