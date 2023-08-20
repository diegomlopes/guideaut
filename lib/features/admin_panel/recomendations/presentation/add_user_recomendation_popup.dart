import 'package:flutter/material.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/recomendations/domain/entities/category_entity.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/usecases/add_recomendation.dart';
import 'package:guideaut/features/admin_panel/recomendations/domain/usecases/get_categories.dart';
import 'package:guideaut/features/admin_panel/recomendations/presentation/add_category_popup.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/theme/theme.dart';

class AddUserRecomendationPopup extends StatefulWidget {
  const AddUserRecomendationPopup({Key? key}) : super(key: key);

  @override
  _AddUserRecomendationPopupState createState() =>
      _AddUserRecomendationPopupState();
}

class _AddUserRecomendationPopupState extends State<AddUserRecomendationPopup> {
  String _selectedCategory = 'colors';

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<List<CategoryEntity>> _loadCategories() async {
    final getCategories = GetCategories();

    final categoriesResult = await getCategories(NoParams());

    if (categoriesResult.isLeft()) return [];

    return categoriesResult.getOrElse(() => []);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Done'),
      content: FutureBuilder<List<CategoryEntity>>(
        future: _loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Exibe um indicador de carregamento enquanto as categorias estão sendo carregadas
          } else if (snapshot.hasError) {
            return const Text('Erro ao carregar as categorias');
          } else {
            List<CategoryEntity> categories = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          value: _selectedCategory,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategory = newValue!;
                            });
                          },
                          items: categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category.value,
                              child: Text(category.text),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            labelText: 'Category',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                  width:
                                      4.0), // Optional spacing between icon and text
                              Text(''),
                            ],
                          ),
                          style: buttonTransparentStyle,
                          onPressed: () => showPopupNewCategory(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ],
            );
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final useCase = AddRecomendation();
            await useCase(
              AddRecomendationParams(
                recomendation: RecomendationEntity(
                    id: "",
                    title: _titleController.text,
                    category: _selectedCategory,
                    description: _descriptionController.text,
                    userId: (await _userLogged())!.id!,
                    ratings: []),
              ),
            );
            Navigator.of(context).pop();
          },
          child: const Text('Done'),
        ),
      ],
    );
  }

  Future<UserEntity?> _userLogged() async {
    final getUser = GetLoggedUser();
    final loggedUserResult = await getUser(NoParams());

    if (loggedUserResult.isLeft()) return null;

    return loggedUserResult.getOrElse(() => null);
  }

  void showPopupNewCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddCategoryPopup();
      },
    ).then((value) => setState(() {}));
  }
}
