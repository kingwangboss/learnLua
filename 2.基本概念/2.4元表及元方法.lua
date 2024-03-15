-- 创建两个表
local t1 = {
    x = 10,
    y = 20
}

local t2 = {
    x = 5,
    y = 15
}

-- 创建元表，并设置相加减的元方法
local mt = {
    __add = function (self, other)
        for key, value in pairs(self) do
            print(key, value)
        end
        for key, value in pairs(other) do
            print(key, value)
        end
        local result = {}
        for key, value in pairs(self) do
            if type(value) == "number" and type(other[key]) == "number" then
                result[key] = value + other[key]
            else
                result[key] = value
            end
        end
        return result
    end,
    __sub = function (self, other)
        local result = {}
        for key, value in pairs(self) do
            if type(value) == "number" and type(other[key]) == "number" then
                result[key] = value - other[key]
            else
                result[key] = value
            end
        end
        return result
    end
}

-- 将元表关联到 t1, t2
setmetatable(t1, mt)
setmetatable(t2, mt)

-- 使用元方法进行相加减操作
local result_add = t1 + t2
local result_sub = t1 - t2

-- 输出相加结果
print("Addition Result:")
for key, value in pairs(result_add) do
    print(key, value)
end

-- 输出相减结果
print("\nSubtraction Result:")
for key, value in pairs(result_sub) do
    print(key, value)
end
print(t1)

-- "mul": * 操作。 行为和 "add" 操作类似。
-- "div": / 操作。 行为和 "add" 操作类似。
-- "mod": % 操作。 行为和 "add" 操作类似。
-- "pow": ^ （次方）操作。 行为和 "add" 操作类似。
-- "unm": - （取负）操作。 行为和 "add" 操作类似。
-- "idiv": // （向下取整除法）操作。 行为和 "add" 操作类似。
-- "band": & （按位与）操作。 行为和 "add" 操作类似， 
-- 不同的是 Lua 会在任何一个操作数无法转换为整数时尝试取元方法。
-- "bor": | （按位或）操作。 行为和 "band" 操作类似。
-- "bxor": ~ （按位异或）操作。 行为和 "band" 操作类似。
-- "bnot": ~ （按位非）操作。 行为和 "band" 操作类似。
-- "shl": << （左移）操作。 行为和 "band" 操作类似。
-- "shr": >> （右移）操作。 行为和 "band" 操作类似。
-- "concat": .. （连接）操作。 行为和 "add" 操作类似，不同的是 Lua 在任何操作数
-- 即不是一个字符串 也不是数字（数字总能转换为对应的字符串）的情况下尝试元方法。
-- "len": # （取长度）操作。 如果对象不是字符串，Lua 会尝试它的元方法。 
-- 如果有元方法，则调用它并将对象以参数形式传入， 而返回值（被调整为单个）则作为结果。 
-- 如果对象是一张表且没有元方法， Lua 使用表的取长度操作。 其它情况，
-- 均抛出错误。
-- "eq": == （等于）操作。 和 "add" 操作行为类似，
-- 不同的是 Lua 仅在两个值都是表或都是完全用户数据 且它们
-- 不是同一个对象时才尝试元方法。 调用的结果总会被转换为布尔量。
-- "lt": < （小于）操作。 和 "add" 操作行为类似， 不同的是 Lua 仅
-- 在两个值不全为整数也不全为字符串时才尝试元方法。 调用的结果总会被转换为布尔量。
-- "le": <= （小于等于）操作。 和其它操作不同， 小于等于操作可能用到两个不同的事件。
-- 首先，像 "lt" 操作的行为那样，Lua 在两个操作数中查找 "__le" 元方法。 
-- 如果一个元方法都找不到，就会再次查找 "__lt" 事件， 它会假设 a <= b 等价于 not (b < a)。 
-- 而其它比较操作符类似，其结果会被转换为布尔量。