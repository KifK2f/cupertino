import 'dart:io';

import 'package:cupertino/android_material/my_material_android.dart';
import 'package:cupertino/ios_material/material_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

PlatformType type(){
  if (kIsWeb) {
    return PlatformType.web;
  } else if (Platform.isAndroid){
    return PlatformType.android;
  } else if (Platform.isIOS){
    return PlatformType.iOS;
  } else {
    return PlatformType.other;
  }
}

void main() {
  runApp(const MyApp());
}

enum PlatformType{
  web, iOS, android, other;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final PlatformType platform = type();
    if (platform == PlatformType.iOS){
      return const MaterialIos();
    } else {
      return const MyMaterialAndroid();
    }
  }
}
