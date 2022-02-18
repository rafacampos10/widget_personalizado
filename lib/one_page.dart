import 'dart:math';

import "package:flutter/material.dart";
import 'package:widget_personalizado/widgets/custom_buttom_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  ValueNotifier <int> valorAleatorio = ValueNotifier <int> (0);

  random() async{
    for(int i = 0; i<10; i++){
      await Future.delayed(Duration(seconds: 1));
        valorAleatorio.value = Random().nextInt(1000);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: valorAleatorio,
                builder: (_,value,__) => Text(
                  "Valor é: $value",
                  style: TextStyle(fontSize: 20),
                ),
            ),
            SizedBox(height: 10),
            CustomButtomWidget(
          disable: false,
          onPressed: () => random(),
          title: "Custom BTN",
          titleSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}


