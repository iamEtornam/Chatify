import 'package:chatify_app/contact_list_page.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Entypo.getIconData('new-message')),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.getIconData('settings')),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return Animator(
              tween: Tween<Offset>(
                  begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0)),
              duration: Duration(milliseconds: 700),
              cycles: 1,
              builder: (anim) {
                return SlideTransition(
                  position: anim,
                  child: chatListTile(
                      'Etornam',
                      '12:30 am',
                      'It\'s been awhile. where have u being? 😀😀😀',
                      'avatarUrl',
                      false),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'to_chat',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContactListPage()));
        },
        child: Icon(Entypo.getIconData('new-message')),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                AntDesign.getIconData('home'),
                color: Colors.black,
              ),
              activeIcon: Icon(
                AntDesign.getIconData('home'),
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Ionicons.getIconData('ios-search'),
                color: Colors.black,
              ),
              activeIcon: Icon(
                Ionicons.getIconData('ios-search'),
                color: Colors.deepPurple,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Ionicons.getIconData('ios-contacts'),
                color: Colors.black,
              ),
              activeIcon: Icon(
                Ionicons.getIconData('ios-contacts'),
                color: Colors.indigo,
              ),
              title: Text("Contacts")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                AntDesign.getIconData('wallet'),
                color: Colors.black,
              ),
              activeIcon: Icon(
                AntDesign.getIconData('wallet'),
                color: Colors.green,
              ),
              title: Text("Wallet"))
        ],
      ),
    );
  }
}

Widget chatListTile(
    var username, var lastTime, var lastMsg, var avatarUrl, bool isOnline) {
  return Slidable(
    actionPane: SlidableStrechActionPane(),
    actionExtentRatio: 0.25,
    child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.amber,
      ),
      title: Row(
        children: <Widget>[
          Text(
            username,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            lastTime,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
      subtitle: Text(lastMsg,
          softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 1),
      trailing: Text(
        isOnline ? 'Online' : 'Offline',
        style: TextStyle(
            color: isOnline ? Colors.green : Colors.red, fontSize: 14),
      ),
    ),
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Hide',
        color: Colors.black45,
        icon: Icons.visibility_off,
        onTap: () {},
      ),
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {},
      )
    ],
  );
}
