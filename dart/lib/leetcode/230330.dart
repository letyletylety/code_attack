import 'package:dart/leetcode/helpers/ds_helper.dart';

class Solution {
  bool isScramble(String s1, String s2) {
    final n = s1.length;

    final d = List.generate(
      n + 1,
      (_) => List.generate(
        n + 1,
        (_) => List.generate(n + 1, (_) => false),
      ),
    );

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (s1[i] == s2[j]) {
          d[1][i][j] = true;
        }
      }
    }

    for (int len = 2; len <= n; len++) {
      for (int i = 0; i < n + 1 - len; i++) {
        for (int j = 0; j < n + 1 - len; j++) {
          for (int newlen = 1; newlen < len; newlen++) {
            d[len][i][j] |=
                d[newlen][i][j] && d[len - newlen][i + newlen][j + newlen];
            d[len][i][j] |= d[newlen][i][j + len - newlen] &&
                d[len - newlen][i + newlen][j];
          }
        }
      }
    }
    return d[n][0][0];
  }
}

// void main(List<String> args) {
//   Solution().isScramble('123', '231');
// }

// Iterate i from 0 to n-1.
// Iterate j from 0 to n-1.
// Set dp[1][i][j] to the boolean value of s1[i] == s2[j]. (The base case of the DP).
// Iterate length from 2 to n.
// Iterate i from 0 to n + 1 - length.
// Iterate j from 0 to n + 1 - length.
// Iterate newLength from 1 to length - 1.
// If dp[newLength][i][j] && dp[length-newLength][i+newLength][j+newLength]) || (dp[newLength][i][j+l-newLength] && dp[l-newLength][i+newLength][j] is true, set dp[length][i][j] to true.
// Return dp[n][0][0].
