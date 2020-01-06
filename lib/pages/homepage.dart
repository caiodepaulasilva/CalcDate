import 'package:CalcDate/pages/bloc/homepageBloc.dart';
import 'package:CalcDate/pages/view/components/inputDate.dart';
import 'package:flutter/material.dart';
import 'package:CalcDate/localization/localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MenuController menu = MenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // TODO: reduzir escopo para um componente chamado menu
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
                          "lib/images/logo.png",
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
