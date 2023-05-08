class Solution:
    def numSubseq(self, nums: List[int], target: int) -> int:
        modulo = 10**9 + 7
        l = len(nums)
        d = [-1] * l
        M = [-1] * l
        m = [-1] * l

        M_temp = nums[l - 1]
        m_temp = nums[l - 1]
        for i in range(l - 2, 0, -1):
            M[i] = max(M_temp, M[i + 1])

        for i in range(l - 2, 0, -1):
            m[i] = min(m_temp, m[i + 1])

        def dp( index: int) -> int:
            if index >= l:
                return 0

            if d[index] != -1:
                return d[index]

            if target >= M[index] + m[index]:
                d[index] = 1
            d[index] += dp(index + 1)

            return d[index]

        return dp(0)
