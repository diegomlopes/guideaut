import 'package:flutter/material.dart';
import 'package:guideaut/features/auth/presentation/form_sign_in.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MenuTopBar(),
            FormSignIn(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
