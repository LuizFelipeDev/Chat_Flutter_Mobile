import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: <Widget>[
            !mine // bloco para caso a mensagem nao seja do usuario atual
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                  )
                : Container(),
            Expanded(
                child: Column(
              crossAxisAlignment:
                  mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: !mine ? Colors.purple[100] : Colors.blue[100],
                      border: !mine ?Border.all(width: 7, color: Colors.purple[100]):Border.all(width: 7, color: Colors.blue[100]),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(15)),
                    ),
                    child: Text(
                      data["senderName"],
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.transparent,
                        fontSize: 15.0,
                      ),
                    )),
                data['imgUrl'] != null
                    ? Image.network(data['imgUrl'], width: 250)
                    : Text(
                        data['text'],
                        textAlign: mine ? TextAlign.end : TextAlign.start,
                        style: TextStyle(fontSize: 16),
                      ),
              ],
            )),
            mine // bloco para caso a mensagem seja o usuario atual
                ? Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
