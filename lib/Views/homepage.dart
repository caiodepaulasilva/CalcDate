import 'package:calcdate/pages/bloc/homepageBloc.dart';
import 'package:calcdate/pages/view/components/inputDate.dart';
import 'package:flutter/material.dart';
import 'package:calcdate/configuration/localization/localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    {
      final menuFeatures = Provider.of<MenuFeatures>(context);
      MenuController menuController = MenuController();

      return Scaffold(
        floatingActionButton: new Row(
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
                      menuFeatures.openMenu(context);
                    },
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 12),
                alignment: Alignment.bottomCenter,
                child:  StreamBuilder(
                  stream: menuController.output,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Text(menuController.resource,
                        style: TextStyle(fontSize: 20, color: Colors.white));
                  },
                ),
              )
            ]),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Stack(children: <Widget>[
            Container(
              color: Colors.black,
            ),
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "lib/Configuration/Assets/images/logo.png",
                            width: 180,
                            height: 180,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Text(
                          MyLocalizations.of(context).trans('Text - HomePage'),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  InputDate(),
                ])),
          ]),
        ),
      );
    }
  }
}
