from typing import List


class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        y, x = 0, -1
        cd = 0
        d = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        dy, dx = d[cd]
        ret = [[0] * n for i in range(n)]

        c = 0
        while True:
            ny = y + dy
            nx = x + dx
            cnt = 0
            while nx >= n or ny >= n or nx < 0 or ny < 0 or ret[ny][nx] != 0:
                if cnt == 4:
                    return ret
                cnt += 1
                cd = (cd + 1) % 4
                dy, dx = d[cd]
                ny = y + dy
                nx = x + dx

            y += dy
            x += dx
            # print(y, x)
            c += 1
            ret[y][x] = c


case = [3, 4]
print(Solution.spiralOrder(Solution, case[0]))
print(Solution.spiralOrder(Solution, case[1]))
