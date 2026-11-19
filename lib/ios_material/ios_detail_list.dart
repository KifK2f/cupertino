import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosDetailList extends StatelessWidget {
  final String data;
  const IosDetailList ({super.key, required this.data}); //On le mets en required car on l'a mis en final

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Datas"),
        automaticBackgroundVisibility: false,
      ),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.airplane, size: 54,),
              Text(data, style: const TextStyle(fontSize: 30),)
            ],
          ),
        )
    );
  }
}