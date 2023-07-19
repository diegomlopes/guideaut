import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';

class SearchRecomendations extends StatefulWidget {
  const SearchRecomendations({Key? key}) : super(key: key);

  @override
  State<SearchRecomendations> createState() => _SearchRecomendationsState();
}

class _SearchRecomendationsState extends State<SearchRecomendations> {
  TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];
  int _currentPage = 1;
  int _totalPages = 1;

  void _searchItems(String searchTerm) {
    print("Entou1 ${searchTerm}");
    FirebaseFirestore.instance
        .collection('recomendations')
        // .where('title', arrayContains: searchTerm)
        // .where('title', isLessThan: searchTerm + 'z')
        // .orderBy('title')
        // .limit(10)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults = getValidDocuments(querySnapshot.docs, searchTerm);
        _currentPage = 1;
        _totalPages = querySnapshot.docs.isNotEmpty
            ? (querySnapshot.docs.length - 1) ~/ 10 + 1
            : 1;
      });
    });
  }

  List<DocumentSnapshot> getValidDocuments(
      List<DocumentSnapshot> documents, String term) {
    List<DocumentSnapshot> validDocuments = [];

    for (var doc in documents) {
      final title = doc['title'];
      final description = doc['description'];

      final isValid = boyerMooreSearch(title, term).isNotEmpty ||
          boyerMooreSearch(description, term).isNotEmpty;

      if (isValid) {
        validDocuments.add(doc);
      }
    }

    return validDocuments;
  }

  List<int> boyerMooreSearch(String text, String pattern) {
    final int n = text.length;
    final int m = pattern.length;
    List<int> occurrences = [];

    // Pré-processamento para criar a tabela de saltos de caracteres
    Map<String, int> badCharTable = {};
    for (int i = 0; i < m - 1; i++) {
      badCharTable[pattern[i]] = m - 1 - i;
    }

    int i = 0;
    while (i <= n - m) {
      int j = m - 1;

      // Comparar o padrão de trás para frente
      while (j >= 0 && pattern[j] == text[i + j]) {
        j--;
      }

      if (j < 0) {
        // Ocorrência encontrada
        occurrences.add(i);
        i += (i + m < n) ? m - badCharTable[text[i + m]]! : 1;
      } else {
        // Deslocamento baseado na tabela de saltos de caracteres
        int shift = badCharTable.containsKey(text[i + j])
            ? badCharTable[text[i + j]]!
            : m;

        i += shift;
      }
    }

    return occurrences;
  }

  void _getNextPage() {
    print("Entou2");
    if (_currentPage < _totalPages) {
      FirebaseFirestore.instance
          .collection('recomendations')
          .where('title', isGreaterThanOrEqualTo: _searchController.text)
          // .where('title', isLessThan: _searchController.text + 'z')
          .startAfter([_searchResults.last['title']])
          .limit(10)
          .get()
          .then((QuerySnapshot querySnapshot) {
            setState(() {
              _searchResults.addAll(querySnapshot.docs);
              _currentPage++;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MiddleBar(),
            MenuTopBar(),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1000,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) => _searchItems(value),
                        decoration: InputDecoration(
                          labelText: 'Search for Recomendatios',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == _searchResults.length) {
                            return _currentPage < _totalPages
                                ? TextButton(
                                    onPressed: _getNextPage,
                                    child: Text('Load More'),
                                  )
                                : Container();
                          } else {
                            final doc = _searchResults[index];
                            return ListTile(
                              title: Text(doc['title']),
                              subtitle: Text(doc['description']),
                              // Adicione aqui ações ou outros widgets para cada item da lista
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )),
            Footer(),
          ],
        ),
      ),
    );
  }
}
