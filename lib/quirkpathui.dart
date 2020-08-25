import 'package:flutter/material.dart';
import 'package:quirkpath/academiaua.dart';
import 'package:quirkpath/bancohistoria.dart';
import 'package:quirkpath/textcustom/textoscustom.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuirkPathUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 43, 58, 1),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(
              'images/bokulogo.jpg',
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Será que tens o que é preciso?',
                style: textoEstatico(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              QuirkPath(),
            ],
          )
        ],
      )),
    );
  }
}

class QuirkPath extends StatefulWidget {
  @override
  _QuirkPathState createState() => _QuirkPathState();
}

class _QuirkPathState extends State<QuirkPath> {
  BancoHistoria bancoHistoria = BancoHistoria();
  bool ultima = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                bancoHistoria.getPergunta(),
                style: textoPerguntasStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 10.0, left: 20.0, right: 20.0),
            child: FlatButton(
              color: Colors.blue.shade900,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bancoHistoria.getResposta1(),
                  style: textoDoBotao(Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                setState(() {});
                bancoHistoria.perguntaSeguinte(1);
                ultima = bancoHistoria.getBoolAcabou();
                print('$ultima / ${bancoHistoria.getBoolAcabou()}');
                if (ultima == true) {
                  _alerta(
                    context,
                    'PARABÉNS',
                    'O All Might convidou-te a entrar na U.A para seguires a carreira de Herói!',
                    'ÓTIMO',
                    1,
                  );
                }
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: FlatButton(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bancoHistoria.getResposta2(),
                  style: textoDoBotao(Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                setState(() {
                  _alerta(
                    context,
                    'Perdeste',
                    'Escolheste a opção errada, pensa melhor e tenta de novo.',
                    'RECOMEÇAR',
                    2,
                  );
                });
                bancoHistoria.perguntaSeguinte(2);
              },
            ),
          ),
        ],
      ),
    );
  }

  _alerta(context, String title, String desc, String textBotao, int numPass) {
    // Reusable alert style
    int passar = 0;
    var alertStyle = AlertStyle(
      backgroundColor: Colors.blue.shade900,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(
        fontFamily: 'RussoOne',
        fontSize: 18,
        color: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
        fontFamily: 'RussoOne',
        letterSpacing: 2.0,
        fontSize: 20,
      ),
      constraints: BoxConstraints.expand(width: 400),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            textBotao,
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontFamily: 'RussoOne',
                letterSpacing: 1),
          ),
          onPressed: () {
            ultima = false;
            passar = numPass;
            setState(() {
              if (passar == 2) {
                bancoHistoria.reset();
                Navigator.pop(context);
              } else {
                bancoHistoria.reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcademiaUA()),
                );
              }
            });
          },
          color: Colors.red,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
