import 'package:flutter/material.dart';
import 'package:flutter_auto_form/flutter_auto_form.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/features/auth/domain/usecases/signin.dart';
import 'package:guideaut/features/auth/presentation/sign_in_template.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: Responsive(children: <Widget>[
          Div(
            divison: const Division(colS: 0, colM: 6, colL: 6),
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
                ],
              ),
            ),
          ),
          Div(
            divison: const Division(colS: 12, colM: 6, colL: 4),
            child: FormBackground(
                title: AppLocalizations.of(context)!.sign_in.toUpperCase(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 260,
                      child: AFWidget<SignInTemplate>(
                        handleErrorOnSubmit: print,
                        formBuilder: () => SignInTemplate(),
                        submitButton: (Function() submit) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: ElevatedButton(
                              child:
                                  Text(AppLocalizations.of(context)!.confirm),
                              style: menuButtonStyle,
                              onPressed: () => submit(),
                            ),
                          );
                        },
                        onSubmitted: (SignInTemplate form) async {
                          final usecase = SignIn();

                          final result = await usecase(
                            SignInParams(
                              email: form.get("email"),
                              password: form.get("password"),
                            ),
                          );

                          if (result.isRight()) {
                            await Navigator.pushNamed(
                                context, Routes.adminPanelPage);
                          } else {
                            await showPopupUserNotFound();
                          }
                        },
                      ),
                    ),
                    Clickable(
                      onPressed: () async =>
                          await Navigator.pushNamed(context, Routes.signup),
                      child: Text(
                        AppLocalizations.of(context)!.new_user_register,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Clickable(
                      onPressed: () => null,
                      child: Text(
                        AppLocalizations.of(context)!.forgot_password,
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }

  Future<void> showPopupUserNotFound() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.user_not_found),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

class FormBackground extends StatelessWidget {
  const FormBackground({Key? key, required this.child, required this.title})
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
