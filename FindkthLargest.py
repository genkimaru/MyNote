def partition(nums, low, high):
    pivot = nums[high]
    i = low - 1
    for j in range(low, high):
        if nums[j] <= pivot:
            i += 1
            nums[i], nums[j] = nums[j], nums[i]
    nums[i + 1], nums[high] = nums[high], nums[i + 1]
    return i + 1

def findKthLargest(nums, k):
    stack = [(0, len(nums) - 1)]
    while stack:
        low, high = stack.pop()
        pivot_index = partition(nums, low, high)
        if pivot_index == len(nums) - k:
            return nums[pivot_index]
        elif pivot_index < len(nums) - k:
            stack.append((pivot_index + 1, high))
        else:
            stack.append((low, pivot_index - 1))

# Example usage:
nums = [3, 2, 1, 5, 6, 4]
k = 2
print("The", k, "th largest element is:", findKthLargest(nums, k))
