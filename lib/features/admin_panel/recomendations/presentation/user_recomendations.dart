import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/admin_panel/recomendations/presentation/add_user_recomendation_popup.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserRecomendations extends StatefulWidget {
  const UserRecomendations({Key? key}) : super(key: key);

  @override
  State<UserRecomendations> createState() => _UserRecomendationsState();
}

class _UserRecomendationsState extends State<UserRecomendations> {
  final int itemsPerPage = 10;
  int currentPage = 0;
  QuerySnapshot? snapshot;

  Future<void> fetchPage(int page) async {
    QuerySnapshot querySnapshot;
    // if (snapshot != null) {
    querySnapshot = await FirebaseFirestore.instance
        .collection('recomendations')
        // .startAfter([snapshot!.docs.last['title']])
        .where('userId', isEqualTo: (await _userLogged())!.id!)
        // .limit(itemsPerPage)
        .get();
    // } else {
    //   querySnapshot = await FirebaseFirestore.instance
    //       .collection('recomendations')
    //       .where('userId', isEqualTo: (await _userLogged())!.id!)
    //       .limit(itemsPerPage)
    //       .get();
    // }
    setState(() {
      currentPage = page;
      snapshot = querySnapshot;
    });
  }

  Future<UserEntity?> _userLogged() async {
    final getUser = GetLoggedUser();
    final loggedUserResult = await getUser(NoParams());

    if (loggedUserResult.isLeft()) return null;

    return loggedUserResult.getOrElse(() => null);
  }

  @override
  void initState() {
    super.initState();
    fetchPage(0);
  }

  @override
  Widget build(BuildContext context) {
    if (snapshot == null) {
      return const CircularProgressIndicator();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: PaginatedDataTable(
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.user_recomendations),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => showPopupNewRecomendation(),
              ),
            ],
          ),
          rowsPerPage: itemsPerPage,
          availableRowsPerPage: [itemsPerPage],
          onPageChanged: (int pageIndex) => fetchPage(pageIndex),
          source: _MyDataTableSource(snapshot!,
              onDeletePressed: (String id) => showDeletePopup(id)),
          sortColumnIndex: 0,
          sortAscending: true,
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Title')),
            DataColumn(label: Text('Actions')),
          ],
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => fetchPage(currentPage),
            ),
          ],
        ),
      ),
    );
  }

  void showDeletePopup(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remover Recomendação'),
          content:
              const Text('Você realmente deseja remover esta recomendação?'),
          actions: [
            TextButton(
              onPressed: () async {
                final recomendationRef = FirebaseFirestore.instance
                    .collection('recomendations')
                    .doc(id);

                var documentoSnapshot = await recomendationRef.get();
                if (documentoSnapshot.exists) {
                  await recomendationRef.delete();
                }

                fetchPage(currentPage);

                Navigator.of(context).pop();
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  void showPopupNewRecomendation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddUserRecomendationPopup();
      },
    ).then((value) => setState(() {
          fetchPage(currentPage);
        }));
  }
}

class _MyDataTableSource extends DataTableSource {
  final QuerySnapshot snapshot;

  _MyDataTableSource(this.snapshot, {required this.onDeletePressed});

  final Function(String) onDeletePressed;

  @override
  DataRow? getRow(int index) {
    if (index >= snapshot.size) {
      return null;
    }

    final doc = snapshot.docs[index];
    return DataRow(cells: [
      DataCell(Text(doc.id)),
      DataCell(Text(doc['title'])),
      DataCell(
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onDeletePressed(doc.id),
        ),
      ),
    ]);
  }

  @override
  int get rowCount => snapshot.size;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
