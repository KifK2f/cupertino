import 'package:cupertino/ios_material/ios_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosListPage extends StatelessWidget {
  const IosListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("Liste simple"),
        ),
        child: Center(
          child: ListView.separated(
              itemBuilder: ((context, index) => IosListTile(index: index)),
              separatorBuilder: ((context, index) => const Divider()),
              itemCount: 100
          ),
        )
    );
  }
}