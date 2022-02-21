import 'dart:convert';

import "package:flutter/material.dart";
import 'package:widget_personalizado/widgets/custom_buttom_widget.dart';

import "package:http/http.dart" as http; //instala a lib http

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  ValueNotifier <List<Post>> posts = ValueNotifier <List<Post>> ([]);
  ValueNotifier <bool> inLoader = ValueNotifier <bool> (false);

  //consumindo a API
  callAPI() async{
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoader.value = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([posts, inLoader]),
                builder: (_,__) => inLoader.value
                    ? CircularProgressIndicator() : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: posts.value.length,
                  itemBuilder: (_, idx) => ListTile(
                    title: Text(posts.value[idx].title),
                  ),
                ),
            ),
            SizedBox(height: 10),
            CustomButtomWidget(
          disable: false,
          onPressed: () => callAPI(),
          title: "Custom BTN",
          titleSize: 15,
            ),
          ],
        ),
      ), // Para aumentar a visualização
      ),
    );
  }
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json){
    return Post(json['userId'],json['id'],json['title'],json['body']);
  }

  @override
  String toString() {
    return 'id: $id';
  }

}


