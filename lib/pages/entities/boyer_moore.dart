import 'dart:math';

class BoyerMoore {
  static Map<int, int> calculateBadCharacterTable(String pattern) {
    final table = <int, int>{};

    for (var i = 0; i < pattern.length - 1; i++) {
      table[pattern.codeUnitAt(i)] = pattern.length - 1 - i;
    }

    return table;
  }

  static List<int> calculateGoodSuffixTable(String pattern) {
    final table = List<int>.filled(pattern.length + 1, 0);

    final suffix = List<int>.filled(pattern.length, 0);
    var lastPrefixPosition = pattern.length;
    for (var i = pattern.length - 1; i >= 0; i--) {
      if (isPrefix(pattern, i + 1)) {
        lastPrefixPosition = i + 1;
      }
      table[pattern.length - 1 - i] =
          lastPrefixPosition - i + pattern.length - 1;
    }

    for (var i = 0; i < pattern.length - 1; i++) {
      final suffixLength = _suffixLength(pattern, i);
      table[suffixLength] = pattern.length - 1 - i + suffixLength;
    }

    return table;
  }

  static bool isPrefix(String pattern, int p) {
    for (var i = p, j = 0; i < pattern.length; i++, j++) {
      if (pattern[i] != pattern[j]) {
        return false;
      }
    }
    return true;
  }

  static int _suffixLength(String pattern, int p) {
    var len = 0;
    for (var i = p, j = pattern.length - 1;
        i >= 0 && pattern[i] == pattern[j];
        i--, j--) {
      len += 1;
    }
    return len;
  }

  static bool search(String text, String pattern) {
    final badCharacterTable = calculateBadCharacterTable(pattern);
    final goodSuffixTable = calculateGoodSuffixTable(pattern);

    var i = 0;
    while (i <= text.length - pattern.length) {
      var j = pattern.length - 1;
      while (j >= 0 && pattern[j] == text[i + j]) {
        j--;
      }
      if (j < 0) {
        // Padrão encontrado
        return true;
      } else {
        i += max(goodSuffixTable[j + 1],
            badCharacterTable[text.codeUnitAt(i + j)] ?? 1);
      }
    }

    return false;
  }
}

void main() {
  final text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
  final pattern = "consectetur";

  final hasOccurrences = BoyerMoore.search(text, pattern);
  if (hasOccurrences) {
    print("Ocorrências encontradas!");
  } else {
    print("Nenhuma ocorrência encontrada.");
  }
}
