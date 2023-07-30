import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guideaut/pages/entities/boyer_moore.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchRecomendationDetail extends StatefulWidget {
  const SearchRecomendationDetail({required this.doc, Key? key})
      : super(key: key);

  final DocumentSnapshot<Object?> doc;

  @override
  State<SearchRecomendationDetail> createState() =>
      _SearchRecomendationDetailState();
}

class _SearchRecomendationDetailState extends State<SearchRecomendationDetail> {
  final _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];
  Map<String, List<DocumentSnapshot>> _searchResultsByCategory = {};

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchItems("");
    });
  }

  void _searchItems(String searchTerm) {
    FirebaseFirestore.instance
        .collection('recomendations')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults = getValidDocuments(querySnapshot.docs, searchTerm);
        _searchResultsByCategory = getDocumentsByCategory(_searchResults);
      });
    });
  }

  Map<String, List<DocumentSnapshot>> getDocumentsByCategory(
      List<DocumentSnapshot> results) {
    Map<String, List<DocumentSnapshot>> categoryMap = {};

    for (var result in results) {
      final category = (result['category'] as String).toLowerCase();
      if (categoryMap.containsKey(category)) {
        categoryMap[category]?.add(result);
      } else {
        categoryMap.putIfAbsent(category, () => [result]);
      }
    }
    return categoryMap;
  }

  List<DocumentSnapshot> getValidDocuments(
      List<DocumentSnapshot> documents, String term) {
    List<DocumentSnapshot> validDocuments = [];

    for (var doc in documents) {
      final title = doc['title'];
      final description = doc['description'];

      final isValid = BoyerMoore.search(title, term) ||
          BoyerMoore.search(description, term);
      if (isValid) {
        validDocuments.add(doc);
      }
    }

    return validDocuments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Div(
              divison: const Division(colS: 12, colM: 10, colL: 8),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.doc["title"].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.doc['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
