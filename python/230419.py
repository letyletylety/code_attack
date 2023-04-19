class Solution:
    def longestZigZag(self, root: Optional[TreeNode]) -> int:
        pathLength = 0
        
        def dfs(root : Optional[TreeNode], left, right):
            if root:
                nonlocal pathLength
                pathLength = max(pathLength, max(left, right))
                dfs(root.left, right + 1, 0)
                dfs(root.right, 0, left + 1)

        dfs(root, 0, 0)
        return pathLength