import 'package:flutter/cupertino.dart';

class IosSectionPage extends StatefulWidget{
  const IosSectionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SectionState();
  }
}

class _SectionState extends State<IosSectionPage>{
  User user = User(
      firstName: "Kodzovi Friedo",
      lastName: "FIANYO",
      phoneNumber: "+2282280000005879",
      address: "Lomé-Togo",
      isAGirl: false
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Secton"),
      ),
        child: ListView(
          children: [
            CupertinoListSection(
              header: const Text("Présentation"),
              children: [
                CupertinoListTile(title: Text(user.firstName)),
                CupertinoListTile(title: Text(user.lastName))
              ],
            ),
            CupertinoListSection(
              header: const Text("Informations personnelles"),
              footer: const SizedBox(height: 8,),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.location_circle_fill),
                    title: Text(user.address),
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.phone_circle_fill),
                    title: Text("user.phoneNumber")
                ),
              ],
            ),

            CupertinoListSection.insetGrouped(header: const Text("Modifiable"),
              children: [
                CupertinoListTile(title: Text(user.isAGirl ? "Fille" : "Garçon"),
                  trailing: CupertinoSwitch(value: user.isAGirl,
                      onChanged: (newValue){
                        setState(() {
                          user.isAGirl = newValue;
                        });
                      }),
                ),
              ],
            )

          ],
        )
    );
  }
}

class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  bool isAGirl;

  User({ required this.firstName, required this.lastName, required this.phoneNumber,  required this.address,
    required this.isAGirl});


}