import 'package:flutter/material.dart';
import 'package:guideaut/features/auth/presentation/form_sign_up.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MenuTopBar(),
            FormSignUp(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
