class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        answer = ""
        l = min(len(word1), len(word2))
        for i in range(l):
            answer = answer + word1[i] + word2[i]
        return answer + word1[l:] + word2[l:]