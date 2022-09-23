import 'package:flutter/material.dart';
import 'package:flutter_auto_form/flutter_auto_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/features/signin/presentation/sign_in_template.dart';
import 'package:guideaut/theme/colors.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:responsive_ui/responsive_ui.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({Key? key}) : super(key: key);

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Responsive(
          children: <Widget>[
            Div(
              divison: const Division(
                colS: 0,
                colM: 6,
                colL: 6
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/banner_login.png",
                      height: 300,
                    ),
                    // Text(
                    //   'GUIDEAUT',
                    //   style: GoogleFonts.montserrat(
                    //     color: textPrimary,
                    //     fontSize: 60,
                    //     letterSpacing: 3,
                    //     fontWeight: FontWeight.w500,
                    //   )
                    // ),
                    
                  ],
                ),
              )
            ),
            Div(
              divison: const Division(
                colS: 12,
                colM: 6,
                colL: 4
              ),
              child: FormShowcaseTile(
                title: "SIGN IN",
                child: AFWidget<SignInTemplate>(
                  handleErrorOnSubmit: print,
                  formBuilder: () => SignInTemplate(),
                  submitButton: (Function() submit) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: ElevatedButton(
                        child: const Text('Confirm'),
                        style: menuButtonStyle,
                        onPressed: () => submit(),
                      ),
                    );
                  },
                  onSubmitted: (SignInTemplate form) async {
                    await Future.delayed(
                        const Duration(seconds: 2));
                    print(form.toMap());
                  },
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class FormShowcaseTile extends StatelessWidget {
  const FormShowcaseTile({Key? key, required this.child, required this.title})
      : super(key: key);

  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                color: Colors.black12,
                offset: Offset(0, 10),
              ),
            ],
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: imageHomeTitleTextStyle,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}