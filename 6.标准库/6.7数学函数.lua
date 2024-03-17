-- 导入 math 库
local math = require("math")

-- 四舍五入函数（自定义）
function round(num)
    return math.floor(num + 0.5)
end

-- 常用的数学函数
-- 1. 绝对值函数
print("绝对值:", math.abs(-10))  -- 输出 10

-- 2. 取整函数
print("向下取整:", math.floor(10.5))  -- 输出 10
print("向上取整:", math.ceil(10.5))   -- 输出 11
print("四舍五入:", round(10.5))  -- Lua 中没有内置的 round 函数，需要自定义

-- 3. 幂运算函数
print("2的3次方:", math.pow(2, 3))  -- 输出 8

-- 4. 开方函数
print("平方根:", math.sqrt(16))  -- 输出 4

-- 5. 三角函数（需要传入弧度值）
print("sin(π/2):", math.sin(math.pi/2))  -- 输出 1
print("cos(π):", math.cos(math.pi))      -- 输出 -1
print("tan(π/4):", math.tan(math.pi/4))  -- 输出 1

-- 6. 随机数函数
math.randomseed(os.time())  -- 设置随机数种子
print("随机整数:", math.random(1, 100))  -- 生成1到100之间的随机整数
print("随机浮点数:", math.random())      -- 生成0到1之间的随机浮点数
