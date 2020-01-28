import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Barra com icone da camera, campo de texto e icone send

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage); // construtor da classe

  final Function({String text, File imgFile})
      sendMessage; // variavel / função para receber o texto que foi digitado pela arquvio chat_screen.dart

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controllerText = TextEditingController();
  bool _isComposing =
      false; // variavel para verificar se o usuario esta digitando
  void _reset() {
    _controllerText.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async {
                final File imgFile =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                if (imgFile == null) return;
                widget.sendMessage(imgFile: imgFile);
              },
            ),
            Expanded(
              child: TextField(
                controller: _controllerText,
                decoration:
                    InputDecoration.collapsed(hintText: "Escreva sua mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (texto) {
                  widget.sendMessage(text: texto);
                  _reset();
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing
                  ? () {
                      widget.sendMessage(text: _controllerText.text);
                      _reset();
                    }
                  : null,
            )
          ],
        ));
  }
}
