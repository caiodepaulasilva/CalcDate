import 'package:calcdate/Controllers/menuBloc.dart';
import 'package:flutter/material.dart';

Widget featureMenu(BuildContext context) {
  MenuController menu = MenuController();
  return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                menu.onButtonPressed(context);
              },
            )),
        Container(
            padding: EdgeInsets.only(bottom: 12),
            alignment: Alignment.bottomCenter,
            child: StreamBuilder(
              stream: menu.output,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(menu.resource,
                    style: TextStyle(fontSize: 20, color: Colors.white));
              },
            ))
      ]);
}
