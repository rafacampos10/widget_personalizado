import 'package:flutter/material.dart';
import 'package:widget_personalizado/one_page.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retirar o banner debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ), //trocando a cor do appBar
      home: OnePage(),
    );
  }
}
