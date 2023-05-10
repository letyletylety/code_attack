from typing import List


class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        m = len(matrix)
        n = len(matrix[0])
        y, x = 0, -1
        cd = 0
        d = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        dy, dx = d[cd]
        ret = []

        while True:
            print(dy, dx)
            ny = y + dy
            nx = x + dx
            cnt = 0
            while nx >= n or ny >= m or nx < 0 or ny < 0 or matrix[ny][nx] == -123:
                if cnt == 4:
                    return ret
                cnt += 1
                cd = (cd + 1) % 4
                dy, dx = d[cd]
                ny = y + dy
                nx = x + dx

            y += dy
            x += dx
            print(y, x)
            ret.append(matrix[y][x])
            matrix[y][x] = -123


case = [
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
    [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]],
]
print(Solution.spiralOrder(Solution, case[0]))
print(Solution.spiralOrder(Solution, case[1]))
