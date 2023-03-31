// * Trie() Initializes the trie object.
// * void insert(String word) Inserts the string word into the trie.
// * boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
// * boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
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
      final found = currentNode.child.containsKey(ch);
      if (!found) return false;
      currentNode = currentNode.child[ch]!;
    }
    return true;
  }
}

// TODO : be a immutable
class TrieNode {
  final int? val;

  bool isFinalLetter;
  final child = <int, TrieNode>{};

  TrieNode(this.val, this.isFinalLetter);

  void insert(int ch) {
    child.putIfAbsent(ch, () => TrieNode(ch, false));
  }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = Trie();
 * obj.insert(word);
 * bool param2 = obj.search(word);
 * bool param3 = obj.startsWith(prefix);
 */