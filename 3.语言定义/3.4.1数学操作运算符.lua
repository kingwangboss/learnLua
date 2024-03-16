-- 加减乘除取余幂运算
local x1 = 20
local y1 = 10
local sum = x1 + y1
local difference = x1 - y1
local product = x1 * y1
local quotient = x1 / y1
local remainder = x1 % y1
local result = x1 ^ y1
print("Sum:", sum)
print("Difference:", difference)
print("Product:", product)
print("Quotient:", quotient)
print("Remainder:", remainder)
print("Result:", result)

-- 取整除法
local x2 = 17
local y2 = 5
local quotient2 = x2 // y2
print("Quotient2:", quotient2)

-- 绝对值函数
local x3 = -10
local abs_value = math.abs(x3)
print("Absolute Value:", abs_value)

-- 取最大值函数
local max_value = math.max(10, 20, 30, 40)
print("Max Value:", max_value)

-- 取最小值函数
local min_value = math.min(10, 20, 30, 40)
print("Min Value:", min_value)

-- 取整函数 math.floor() 用于向下取整， math.ceil()用于向上取整
local x4 = 5.6
local floor_value = math.floor(x4)
local ceil_value = math.ceil(x4)
print("Floor Value:", floor_value)
print("Ceil Value:", ceil_value)

-- 四舍五入
local function round(number)
    return math.floor(number + 0.5)
end
local rounded_value = round(x4)
print("Rounded Value:", rounded_value)