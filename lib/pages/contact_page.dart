import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  bool _isLoading = false;

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Substitua 'user_id' pelo seu user_id do EmailJS
      const emailJSUrl = 'https://api.emailjs.com/api/v1.0/email/send';
      final params = {
        'user_id': 'Mp_H0HG9fl2_3Fcpl',
        'template_id': 'template_yawzttn',
        'service_id': 'service_59pvgv9',
        'template_params': {
          'from_name': _name,
          'email': _email,
          'message': _message,
          'to_name': 'Guideaut',
          'reply_to': _email
        },
      };

      try {
        final response = await http.post(Uri.parse(emailJSUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(params));
        if (response.statusCode == 200) {
          setState(() {
            _name = "";
            _email = "";
            _message = "";
            _isLoading = false;
          });
          showSuccessSubmit();
        } else {
          setState(() {
            _isLoading = false;
          });
          showErrorSubmit();
        }
      } catch (e) {
        print('Erro ao enviar e-mail: $e');
      }
    }
  }

  void showSuccessSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('E-mail enviado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void showErrorSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text('E-mail não pode ser enviado!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.enter_contact,
                                style: imageHomeTitleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context)!.name),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .enter_name;
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value!;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context)!.email),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!.email;
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value!;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context)!.message),
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .enter_message;
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _message = value!;
                                },
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: _submitForm,
                                style: menuButtonStyle,
                                child: Text(AppLocalizations.of(context)!.send),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
