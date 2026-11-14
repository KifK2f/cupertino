import 'package:flutter/material.dart';

import 'home_page_android.dart';

class MyMaterialAndroid extends StatelessWidget {
  const MyMaterialAndroid({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Nous sommes sur Android"),
    );
  }

}