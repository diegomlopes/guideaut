import 'package:flutter/material.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';

class MiddleBar extends StatelessWidget {
  const MiddleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Wrap(
                    children: <Widget>[
                      
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.signin),
                        style: middleButtonStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "SIGN IN",
                            ),
                            Icon(
                              Icons.account_circle,
                              color: textPrimary,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
