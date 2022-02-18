import "package:flutter/material.dart";
import 'package:widget_personalizado/widgets/custom_buttom_widget.dart';

    class OnePage extends StatelessWidget {
      const OnePage({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CustomButtomWidget(
              disable: false,
              onPressed: (){},
              title: "Custom BTN",
              titleSize: 15,
            ),
          ),
        );
      }
    }
