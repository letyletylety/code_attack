from typing import List


class Solution:
    def diagonalSum(self, mat: List[List[int]]) -> int:
        l = len(mat)
        s = 0
        for i, line in enumerate(mat):
            # print(line)
            for j, item in enumerate(line):
                if i + j == l - 1 or i == j:
                    # print(item)
                    s += item
        return s


mat = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(Solution.diagonalSum(Solution, mat))
