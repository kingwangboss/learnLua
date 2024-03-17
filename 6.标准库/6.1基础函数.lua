print("Hello, Lua!")  -- 输出：Hello, Lua!

local num = 10
local str = "Lua is awesome!"

print(type(num))  -- 输出：number
print(type(str))  -- 输出：string

local num = 42
local str = tostring(num)

print(type(str))  -- 输出：string

local str = "42"
local num = tonumber(str)

print(type(num))  -- 输出：number

local myTable = {key1 = "value1", key2 = "value2"}

-- pairs() 函数用于迭代表的所有键值对，而 ipairs() 函数用于迭代数组部分的键值对
for key, value in pairs(myTable) do
    print(key, value)
end

local myArray = {10, 20, 30}

for index, value in ipairs(myArray) do
    print(index, value)
end

-- next() 函数用于返回表中指定键的下一个键值对
local myTable = {key1 = "value1", key2 = "value2", key3 = "value3"}
local key, value = next(myTable, nil)  -- 获取第一个键值对

print(key, value)

key, value = next(myTable, "key2")  -- 获取下一个键值对
print(key, value)

-- assert() 函数用于检查条件是否为真，如果为假则抛出错误
local num = 10
assert(num == 11, "Num should be 10")