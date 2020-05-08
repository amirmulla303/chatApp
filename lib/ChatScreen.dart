import 'package:flutter/material.dart';
import 'package:flutterchat/ChatMessage.dart';

class ChatScreen extends StatefulWidget{
  @override

  State createState()=> new ChatScreenState();


}
class ChatScreenState extends State<ChatScreen>{

  final List<ChatMessage> _message = <ChatMessage> [];



  final TextEditingController textController = new TextEditingController();

  void _handleSubmitted(String text){
    textController.clear();



    ChatMessage message = new ChatMessage(
      text: text,

    );

   setState(() {
     _message.insert(0, message);
   });

  }


  Widget _textComposeWidget(){git
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Send a message"
                ),
                controller: textController,
                onSubmitted: _handleSubmitted,
              ),

            ),
            new Container(
              margin:  const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {

    return  new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _message[index],
            itemCount: _message.length,
          ),),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposeWidget(),
        )
      ],
    );
  }
}