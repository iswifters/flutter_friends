import 'package:flutter/material.dart';
import 'package:flutter_friends/friends_dialog.dart';
import 'package:flutter_friends/models/friend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends List',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyFlutterList(),
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  State<MyFlutterList> createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  List<Friends> friendList = [
    Friends("Diana", "Diana@gmail.com", "23"),
    Friends("Mura", "Mura@gmail.com", "21"),
    Friends("Dolla", "Dolla@gmail.com", "25"),
    Friends("Mona", "Mona@gmail.com", "25"),
    Friends("Fiana", "Fiana@gmail.com", "22"),
    Friends("Tura", "Tura@gmail.com", "26"),
    Friends("Siana", "Siana@gmail.com", "28"),
    Friends("Lura", "Lura@gmail.com", "20"),
    Friends("Piana", "Piana@gmail.com", "23"),
    Friends("Cura", "Cura@gmail.com", "24"),
  ];

  @override
  Widget build(BuildContext context) {
    void addFriendData(Friends carte) {
      setState(() {
        friendList.add(carte);
      });
    }

    void showCartDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: AddFriendsDialog(addFriend: addFriendData),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            );
          });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showCartDialog,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("THE FRIEND-ZONE",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    title: Text(friendList[index].friendName,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text(friendList[index].email,
                        style: const TextStyle(
                          fontSize: 17,
                        )),
                    trailing: Text(friendList[index].age,
                        style: const TextStyle(
                          fontSize: 21,
                        )),
                  ),
                );
              },
              itemCount: friendList.length),
        ));
  }
}
