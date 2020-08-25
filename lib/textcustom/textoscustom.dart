import 'package:flutter/material.dart';

TextStyle textoEstatico() {
  return TextStyle(
      color: Colors.yellow,
      fontSize: 30,
      fontFamily: 'RussoOne',
      letterSpacing: 2.0);
}

TextStyle textoPerguntasStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontFamily: 'RussoOne',
    letterSpacing: 1.0,
  );
}

TextStyle textoDoBotao(Color cor) {
  return TextStyle(
    color: cor,
    fontSize: 18,
    fontFamily: 'RussoOne',
    letterSpacing: 1.0,
  );
}
