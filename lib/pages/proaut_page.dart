import 'package:flutter/material.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';

class ProautPage extends StatefulWidget {
  const ProautPage({Key? key}) : super(key: key);

  @override
  State<ProautPage> createState() => _ProautPageState();
}

class _ProautPageState extends State<ProautPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          MiddleBar(),
          MenuTopBar(),
        ],
      ),
    );
  }
}
