import 'package:flutter/material.dart';
import 'package:flutter_friends/models/friend.dart';

class AddFriendsDialog extends StatefulWidget {
  final Function(Friends) addFriend;

  const AddFriendsDialog({
    Key? key,
    required this.addFriend,
  }) : super(key: key);

  @override
  State<AddFriendsDialog> createState() => _AddFriendsDialogState();
}

class _AddFriendsDialogState extends State<AddFriendsDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        height: 350,
        width: 400,
        child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Friends Listing",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.pinkAccent,
                  ),
                ),
                buildTextfield("friendName", itemController),
                buildTextfield("email", catController),
                buildTextfield("Age", amountController),
                const SizedBox(
                  height: 7.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    final friendInfo = Friends(itemController.text, catController.text,
                        amountController.text);
                    widget.addFriend(friendInfo);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add Friend"),
                ),
              ],
            )));
  }

  var itemController = TextEditingController();
  var catController = TextEditingController();
  var amountController = TextEditingController();

  Widget buildTextfield(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            )),
        controller: controller,
      ),
    );
  }
}
