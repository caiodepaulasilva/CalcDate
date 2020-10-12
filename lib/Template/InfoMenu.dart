import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Views/Home/Menus/AboutMenu.dart';
import 'package:flutter/material.dart';

class InfoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              color: Colors.yellowAccent[400],
                              height: 300,
                              child: Column(children: <Widget>[
                                new ListTile(
                                    leading: new Icon(
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),
                                    autofocus: true,
                                    onTap: () {},
                                    title: new Text(
                                      Translate.of(context)
                                          .key('Menu Title - Date'),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    subtitle: Text(Translate.of(context)
                                        .key('Menu Subtitle - Date'))),
                                Opacity(
                                    opacity: 0.3,
                                    child: new ListTile(
                                        leading: new Icon(Icons.access_time,
                                            color: Colors.black45),
                                        title: new Text(
                                          Translate.of(context)
                                              .key('Menu Title - Time'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          Translate.of(context)
                                              .key('Menu Subtitle - Time'),
                                        ))),
                                Opacity(
                                    opacity: 0.3,
                                    child: new ListTile(
                                        leading: new Icon(Icons.event_busy),
                                        title: new Text(
                                          Translate.of(context)
                                              .key('Menu Title - Work day'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          Translate.of(context)
                                              .key('Menu Subtitle - Work day'),
                                        ))),
                                Opacity(
                                    opacity: 0.3,
                                    child: new ListTile(
                                        leading: new Icon(Icons.filter_7),
                                        title: new Text(
                                          Translate.of(context)
                                              .key('Menu Title - Week day'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          Translate.of(context)
                                              .key('Menu Subtitle - Week day'),
                                        ))),
                              ]));
                        });
                  })),
          Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                  color: Colors.black,
                  child: Icon(
                    Icons.help_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => AboutMenu());
                  }))
        ]));
  }
}
