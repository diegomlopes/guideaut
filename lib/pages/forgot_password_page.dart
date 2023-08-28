import 'package:flutter/material.dart';
import 'package:guideaut/features/auth/presentation/form_forgot_password.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MenuTopBar(),
            FormForgotPassword(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
