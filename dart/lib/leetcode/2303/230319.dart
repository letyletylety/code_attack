class WordDictionary {
  final trie = Trie();

  WordDictionary();

  void addWord(String word) {
    trie.insert(word);
  }

  bool search(String word) {
    return trie.partialSearch(trie._root, word);
  }
}

extension TrieWildcardSearch on Trie {
  /// dots '.' where dots can be matched with any letter.
  // bool wildCardSearch(String word) {
  //   var currentNode = _root;

  // }

  /// 특정 [node] 에서 시작해서
  /// [word] 를 찾을 수 있는지?
  /// 주의 : 현재 node 는 포함하지 않음
  bool partialSearch(TrieNode node, String word) {
    if (word.isEmpty) {
      return node.isFinalLetter;
    }

    final firstCh = word.codeUnits.first;

    // is wildcard?
    if (firstCh == '.'.codeUnits.first) {
      bool found = false;
      for (final n in node.child.values) {
        if (partialSearch(n, word.substring(1))) {
          found = true;
          break;
        }
      }
      return found;
    }

    bool found = node.find(firstCh);
    if (found) {
      return partialSearch(node.child[firstCh]!, word.substring(1));
    }
    return false;
  }
}

class Trie {
  final _root = TrieNode(null, false);

  void insert(String word) {
    var currentNode = _root;

    for (final ch in word.codeUnits) {
      currentNode.insert(ch);
      currentNode = currentNode.child[ch]!;
    }

    currentNode.isFinalLetter = true;
  }

  bool search(String word) {
    var currentNode = _root;

    for (final ch in word.codeUnits) {
      final found = currentNode.child.containsKey(ch);
      if (!found) return false;
      currentNode = currentNode.child[ch]!;
    }
    return currentNode.isFinalLetter;
  }

  bool startsWith(String prefix) {
    var currentNode = _root;

    for (final ch in prefix.codeUnits) {
      final found = currentNode.find(ch);
      if (!found) return false;
      currentNode = currentNode.child[ch]!;
    }
    return true;
  }
}

class TrieNode {
  final int? val;

  bool isFinalLetter;
  final child = <int, TrieNode>{};

  TrieNode(this.val, this.isFinalLetter);

  void insert(int ch) {
    child.putIfAbsent(ch, () => TrieNode(ch, false));
  }

  bool find(int ch) {
    return child.containsKey(ch);
  }
}
