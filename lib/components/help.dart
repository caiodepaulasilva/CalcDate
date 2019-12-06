import 'package:dateCalculator/menus/aboutMenu.dart';
import 'package:dateCalculator/menus/idiomMenu.dart';
import 'package:flutter/material.dart';

class HelpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: Container(
                    alignment: Alignment.bottomRight,
                    width: 50,
                    child: FlatButton(
                      padding: EdgeInsets.only(right: 00),
                      color: Colors.black,
                      child: Icon(
                        Icons.language,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => IdiomMenu());
                      },
                    ))),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                alignment: Alignment.bottomLeft,
                width: 50,
                child: FlatButton(
                  color: Colors.black,
                  padding: EdgeInsets.only(right:10),
                  child: Icon(
                    Icons.help_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => AboutMenu());
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
