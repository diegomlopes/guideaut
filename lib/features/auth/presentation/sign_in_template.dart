import 'package:flutter_auto_form/flutter_auto_form.dart';

class SignInTemplate extends TemplateForm {
  SignInTemplate();

  @override
  final List<Field> fields = [
    AFTextField(
      id: 'email',
      name: "Email",
      validators: [
        MinimumStringLengthValidator(
          5,
          (e) => 'Min 5 characters, currently ${e?.length ?? 0} ',
        )
      ],
      type: AFTextFieldType.USERNAME,
    ),
    AFTextField(
      id: 'password',
      name: 'Password',
      validators: [
        MinimumStringLengthValidator(
          6,
          (e) => 'Min 6 characters, currently ${e?.length ?? 0} ',
        )
      ],
      type: AFTextFieldType.PASSWORD,
    ),
    // AFBooleanField(
    //   id: 'accept-condition',
    //   name: 'Accept terms',
    //   validators: [ShouldBeTrueValidator('Please accept terms')],
    //   value: false,
    // ),
  ];
}
