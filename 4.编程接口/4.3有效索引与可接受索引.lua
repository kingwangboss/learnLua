-- 在 Lua 中，有效索引（Valid Index）和可接受索引（Acceptable Index）是指在访问表中元素
-- 或者栈中值时所使用的索引类型和范围。理解这两个概念对于编写正确的Lua代码和使用LuaAPI非常重要。
-- 1.有效索引（Valid Index）：
-- 在 Lua 中，有效索引是指可以用来访问表中元素或者栈中值的合法索引。对于表来说，
-- 有效索引是整数（整数索引）或者字符串（字符串索引）类型的键。对于栈来说，有效索引是整数类型的索引，
-- 可以用来访问栈中的值。
-- 2.可接受索引（Acceptable Index）：
-- 可接受索引是指在 Lua API 中可以接受的用来访问表中元素或者栈中值的索引。
-- Lua API 中的很多函数和方法都接受可接受索引作为参数，用来指定要操作的元素或值。

-- 表中的有效索引
local table1 = {10, 20, 30, 40}
local table2 = {name = "Alice", age = 25}

-- 整数索引是有效索引
print(table1[1])  -- 输出：10

-- 字符串索引也是有效索引
print(table2["name"])  -- 输出："Alice"

-- 栈中的有效索引
-- 假设栈中有一些值
local value1 = 10
local value2 = "Hello, Lua!"

-- 整数索引是有效索引
print(value1)  -- 输出：10

-- 无效索引（浮点数索引）会导致错误
-- print(value1[1.5])  -- 这里会报错

-- Lua API 中的可接受索引
-- 获取表中指定索引位置的值
local value = table1[1]  -- 这里的整数索引 1 是可接受索引
print(value)  -- 输出：10