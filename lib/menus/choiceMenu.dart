import 'package:flutter/material.dart';
import 'package:dateCalculator/menus/calendarMenu.dart';

class ChoiceMenu extends StatefulWidget {
  final input;
  ChoiceMenu({Key key, int input}) : this.input = input;

  @override
  _ChoiceMenuState createState() => _ChoiceMenuState(input: this.input);
}

class _ChoiceMenuState extends State<ChoiceMenu> {
  final int input;
  List<bool> precisaoSelecionada = [false, false, false];
  DateTime periodoUsuario;
  _ChoiceMenuState({this.input});

  void escolherPrecisao(int precisaoUsuario) async {
    precisaoSelecionada.clear();

    if (precisaoUsuario == 1) {
      setState(() {
        precisaoSelecionada = [true, false, false];
      });
    }
    if (precisaoUsuario == 2) {
      setState(() {
        precisaoSelecionada = [false, true, false];
      });
    }
    if (precisaoUsuario == 3) {
      setState(() {
        precisaoSelecionada = [false, false, true];
      });
    }

    //modelo de retorno temporário
    periodoUsuario = await showDialog(
      context: context,
      builder: (
        context,
      ) =>
          DatePickerMenu(
        precision: precisaoUsuario,
        input: input,
      ),
    );
    Navigator.pop(context, '$precisaoUsuario' + '|' + '$periodoUsuario');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
        ("ESCOLHA A PRECISÃO:"),
        ),
        content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                    width: 170,
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
                    ("Somente ano"),
                            style: TextStyle(fontSize: 13)),
                        onPressed: precisaoSelecionada[0]
                            ? null
                            : () {
                                escolherPrecisao(1);
                              })),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Text(
                  "Ex: 2019",
                  style: (TextStyle(fontSize: 13)),
                )
              ]),
              Row(children: <Widget>[
                Container(
                  width: 170,
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
                        ("Mês e ano"),
                          style: TextStyle(fontSize: 13)),
                      onPressed: precisaoSelecionada[1]
                          ? null
                          : () {
                              escolherPrecisao(2);
                            }),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Text(
                  "Ex: 12/2019",
                  style: (TextStyle(fontSize: 13)),
                ),
              ]),
              Row(children: <Widget>[
                Container(
                    width: 170,
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
                    ("Dia, mês e ano"),
                            style: TextStyle(fontSize: 13)),
                        onPressed: precisaoSelecionada[2]
                            ? null
                            : () {
                                escolherPrecisao(3);
                              })),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Text(
                  "Ex: 10/12/2019",
                  style: (TextStyle(fontSize: 13)),
                )
              ])
            ]));
  }
}
