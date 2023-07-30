import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/pages/entities/boyer_moore.dart';
import 'package:guideaut/pages/search_page_detail.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchRecomendations extends StatefulWidget {
  const SearchRecomendations({Key? key}) : super(key: key);

  @override
  State<SearchRecomendations> createState() => _SearchRecomendationsState();
}

class _SearchRecomendationsState extends State<SearchRecomendations> {
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
      final title = doc['title'] as String;
      final description = doc['description'] as String;
      final category = doc['category'] as String;

      final isValid = BoyerMoore.search(
              title.toLowerCase(), term.toLowerCase()) ||
          BoyerMoore.search(description.toLowerCase(), term.toLowerCase()) ||
          BoyerMoore.search(category.toLowerCase(), term.toLowerCase());
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
            Column(
              children: [
                Div(
                  divison: const Division(colS: 12, colM: 12, colL: 9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => _searchItems(value),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .look_for_recomendations,
                      ),
                    ),
                  ),
                ),
                Responsive(
                  children: _searchResultsByCategory.keys
                      .map(
                        (key) => Div(
                          divison: const Division(colS: 12, colM: 6, colL: 3),
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    key.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: _searchResultsByCategory[key]!
                                      .map(
                                        (doc) => Clickable(
                                          onPressed: () {
                                            // Navigate to the detail page when an item is tapped
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchRecomendationDetail(
                                                        doc: doc),
                                              ),
                                            );
                                          },
                                          child: ListTile(
                                            title: Text(doc['title']),
                                            subtitle: Text(
                                              doc['description'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
