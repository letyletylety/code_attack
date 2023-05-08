class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        l = len(s)
        vowels = set('aeiou')
        ch = [c in vowels for c in s]
        cnt = [0] * (l + 1)

        for i in range(1, l + 1):
            if ch[i - 1] == True:
                cnt[i] = 1
            cnt[i] += cnt[i - 1]

        ret = 0
        for i in range(k, l + 1):
            ret = max(ret, cnt[i] - cnt[i - k])
        return ret
