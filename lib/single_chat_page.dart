import 'package:flutter/material.dart';

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
            title: Text('johnson'),
            actions: <Widget>[
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
              )
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[chatList('2:00 am', 'hello there')],
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
