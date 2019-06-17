import 'package:chatify_app/single_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'to_chat',
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chatify Contacts'),
        ),
        body: Container(
          child: ListView.separated(
            itemCount: 50,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return contactListTile('johnson', '0245436757', 'avatarUrl');
            },
          ),
        ),
      ),
    );
  }

  Widget contactListTile(var username, var phoneNumber, var avatarUrl) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.amber,
      ),
      title: Text(
        username,
      ),
      subtitle: Text(phoneNumber,
          softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 1),
      trailing: Hero(
        tag: 'to_signgle_chat',
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SingleChatPage()));
          },
          icon: Icon(
            Entypo.getIconData('new-message'),
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
