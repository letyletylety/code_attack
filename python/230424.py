from heapq import  heappop, heappush
from typing import List


class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        h = []
        for i in stones:
            heappush(h, -i)
 
        while len(h) > 1:
            i = -heappop(h)
            ii = -heappop(h)
            if i == ii:
                pass
            else:
                heappush(h, - i + ii)
        if len(h) >0 :
            return h[0]
        else:
            return 0

