// BrowserHistory(string homepage) Initializes the object with the homepage of the browser.
// void visit(string url) Visits url from the current page. It clears up all the forward history.
// string back(int steps) Move steps back in history. If you can only return x steps in the history and steps > x, you will return only x steps. Return the current url after moving back in history at most steps.
// string forward(int steps) Move steps forward in history. If you can only forward x steps in the history and steps > x, you will forward only x steps. Return the current url after forwarding in history at most steps.

class BrowserHistory {
  List<String> history = [];
  int pointer = -1;

  BrowserHistory(String homepage) {
    visit(homepage);
  }

  void visit(String url) {
    history = [...history.sublist(0, pointer + 1), url];
    pointer = history.length - 1;
  }

  String back(int steps) {
    pointer -= steps;
    if (pointer < 0) pointer = 0;
    return history[pointer];
  }

  String forward(int steps) {
    pointer += steps;
    if (pointer >= history.length) pointer = history.length - 1;
    return history[pointer];
  }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory obj = BrowserHistory(homepage);
 * obj.visit(url);
 * String param2 = obj.back(steps);
 * String param3 = obj.forward(steps);
 */