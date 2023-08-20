import 'package:flutter/material.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/recomendations/domain/entities/category_entity.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/usecases/add_category.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/usecases/get_categories.dart';

class AddCategoryPopup extends StatefulWidget {
  const AddCategoryPopup({Key? key}) : super(key: key);

  @override
  _AddCategoryPopupState createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<List<CategoryEntity>> _loadCategories() async {
    final getCategories = GetCategories();

    final categoriesResult = await getCategories(NoParams());

    if (categoriesResult.isLeft()) return [];

    return categoriesResult.getOrElse(() => []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Done'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          // const SizedBox(height: 10.0),
          // const SizedBox(height: 10.0),
          // TextField(
          //   controller: _descriptionController,
          //   maxLines: 1,
          //   decoration: const InputDecoration(
          //     labelText: 'Description',
          //   ),
          // ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final useCase = AddCategory();
            await useCase(
              AddCategoryParams(
                category: CategoryEntity(
                    value: _nameController.text.toLowerCase(),
                    text: _nameController.text),
              ),
            );
            // Implementar lógica de salvar ou processar os dados
            Navigator.of(context).pop();
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
