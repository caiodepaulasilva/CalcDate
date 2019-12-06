import 'package:flutter/material.dart';

class IdiomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 120,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                ("CONFIGURAR O IDIOMA:"),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                alignment: Alignment.bottomCenter),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                         ("Inglês"),
                            style: TextStyle(fontSize: 14.5)),
                        onPressed: () {
                      
                        }),
                    alignment: Alignment.bottomLeft,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Container(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                         ("Português"),
                            style: TextStyle(fontSize: 14.5)),
                        onPressed: () {
                       
             
                          //  GlobalMaterialLocalizations.delegate,
                        }),
                    alignment: Alignment.bottomLeft,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
