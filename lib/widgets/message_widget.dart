import "package:flutter/material.dart";

class MessageWidget extends StatelessWidget {
  final IconData iconData;
  final String message;

  const MessageWidget(
      {this.iconData = Icons.receipt,
      this.message = "Nenhum registro encontrado!"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: MediaQuery.of(context).size.height * 0.1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            message,
            style: _textStyle(),
          )
        ],
      ),
    );
  }

  TextStyle _textStyle(
          {double fontSize = 12, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
