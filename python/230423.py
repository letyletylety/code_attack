class Solution:
    def numberOfArrays(self, s: str, k: int) -> int:
        n = len(s)
        d = [-1] * n
        mod = 1000000007

        def dp(i):
            if i == n:
                return 1

            if d[i] != -1:
                return d[i]

            if s[i] == "0":
                return 0

            ret = 0

            for j in range(1, 11):
                if i + j > n:
                    break
                candi = s[i : i + j]
                l = int(candi)

                if l <= k:
                    ret += dp(i + j) % mod
                else:
                    break

            d[i] = ret % mod
            return d[i]

        return dp(0)