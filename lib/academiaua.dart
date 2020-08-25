import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quirkpath/quirkpathui.dart';
import 'package:quirkpath/textcustom/textoscustom.dart';

class AcademiaUA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Image.asset(
              'images/uaacademy.gif',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Parabéns conseguiste entrar na UA, esperamos por ti na próxima aventura!',
                        style: TextStyle(
                          color: Colors.red.shade600,
                          fontSize: 25,
                          fontFamily: 'RussoOne',
                          letterSpacing: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              child: Text(
                                'RECOMEÇAR!',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                    fontFamily: 'RussoOne',
                                    letterSpacing: 1),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuirkPathUi()),
                                );
                              },
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: FlatButton(
                                color: Colors.red,
                                child: Text(
                                  'SAIR',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 20,
                                      fontFamily: 'RussoOne',
                                      letterSpacing: 1),
                                ),
                                onPressed: () {
                                  exit(0);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
