import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SingleChatPage extends StatefulWidget {
  @override
  _SingleChatPageState createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  bool isMe = false;
  bool isDelivered = false;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'to_single_chat',
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Bryte'),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[chatList('2:00 am', 'hello there')],
            ),
          ),
          bottomNavigationBar: Material(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    labelText: 'Say something...',
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(15.0),
                    hasFloatingPlaceholder: false,
                    suffixIcon: Container(
                      width: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Entypo.getIconData('emoji-happy'),
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Entypo.getIconData('attachment'),
                                color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget chatList(var time, var message) {
    final bg = isMe ? Colors.white : Colors.greenAccent.shade100;
    final align = isMe ? WrapAlignment.start : WrapAlignment.end;
    final icon = isDelivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );
    return Wrap(
      alignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
