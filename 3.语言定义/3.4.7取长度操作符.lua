-- 获取字符串长度
local str = "Hello,Lua!"
local length = #str
print("Length:", length)  -- 输出：10
local length = string.len(str)
print("Length:", length)  -- 输出：10
local str = "Hello\0Lua!"
local length = #str
print("Length:", length)  -- 输出：10



-- 获取表的数组部分长度
local tbl = {10, 20, 30, 40, 50}
local length = #tbl
print("Length:", length)  -- 输出：5

-- 对于含有空值的表
local tbl1 = {10, nil, 30, nil, 50}
local length1 = #tbl1
print("Length:", length1)  -- 输出：5


-- 对于非连续索引的表
local tbl = {1, 2, 3, key1 = "value1", key2 = "value2"}
local length = #tbl
print("Length:", length)  -- 输出：3（只计算数组部分）
