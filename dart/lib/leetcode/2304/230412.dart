class Solution {
  String simplifyPath(String path) {
    final sp = (path.split('/'));

    List<String> dirStack = [];
    final ret = StringBuffer();

    for (String element in sp) {
      if (element.isEmpty || element == '.') {
        continue;
      } else if (element == '..') {
        if (dirStack.isNotEmpty) {
          dirStack.removeLast();
        }
        continue;
      } else {
        dirStack.add(element);
      }
    }

    if (dirStack.isEmpty) {
      return '/';
    }

    for (String element in dirStack) {
      ret.write('/$element');
    }
    return ret.toString();
  }
}

main() {
  Solution().simplifyPath('/home/path');
  Solution().simplifyPath('/home//path');
  Solution().simplifyPath('/../');
  Solution().simplifyPath('/../../');
}
