class Solution:

    def arraySign(self, nums: List[int]) -> int:
        cnt = 0
        for i in nums:
            if i == 0:
                return 0
            if i < 0:
                cnt+=1
        if cnt % 2 == 0:
            return 1
        else:
            return -1

