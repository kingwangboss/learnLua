-- 创建一个弱值表，值为弱引用
local weak_values_table = {}
setmetatable(weak_values_table, { __mode = "v" })  -- 值为弱引用

-- 创建一个强引用的值
local value = {}
weak_values_table["key"] = value

-- 输出弱值表中的键值对
for k, v in pairs(weak_values_table) do
    print("Key in weak values table:", k, "Value:", v)
end

-- 释放对值的引用
value = nil

-- 手动触发垃圾收集
collectgarbage()

-- 输出弱值表中的键值对
for k, v in pairs(weak_values_table) do
    print("Key in weak values table:", k, "Value:", v)
end