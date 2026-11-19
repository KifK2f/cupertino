import 'package:cupertino/ios_material/ios_detail_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosListTile extends StatelessWidget {
  final int index;
  const IosListTile ({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
        title: Text("Index: ${index + 1 }"),
      subtitle: Text("Mais le vrai count est de $index"),
      leading: Icon(CupertinoIcons.airplane),
      trailing: const CupertinoListTileChevron(),
      onTap: (){
          final route = CupertinoPageRoute(builder: ((context) => IosDetailList(data: "${index + 1 }")));
          Navigator.push(context, route);
      },
    );
  }
}