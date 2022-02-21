
import "package:flutter/material.dart";
import 'package:widget_personalizado/controllers/posts_controller.dart';
import 'package:widget_personalizado/widgets/custom_buttom_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([_controller.posts, _controller.inLoader]),
                builder: (_,__) => _controller.inLoader.value
                    ? CircularProgressIndicator() : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _controller.posts.value.length,
                  itemBuilder: (_, idx) => ListTile(
                    title: Text(_controller.posts.value[idx].title),
                  ),
                ),
            ),
            SizedBox(height: 10),
            CustomButtomWidget(
          disable: false,
          onPressed: () => _controller.callAPI(),
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




