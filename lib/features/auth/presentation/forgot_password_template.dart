import 'package:flutter_auto_form/flutter_auto_form.dart';

class ForgotPasswordTemplate extends TemplateForm {
  ForgotPasswordTemplate();

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
  ];
}
