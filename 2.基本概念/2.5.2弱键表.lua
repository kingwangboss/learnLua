-- 创建一个弱键表，键为弱引用
local weak_keys_table = {}
setmetatable(weak_keys_table, { __mode = "k" })  -- 键为弱引用

-- 创建一个强引用的键
local key = {}
weak_keys_table[key] = "value for key"

-- 输出弱键表中的值
for k, v in pairs(weak_keys_table) do
    print("Key in weak keys table:", k, "Value:", v)
end

-- 释放对键的引用
key = nil

-- 手动触发垃圾收集
collectgarbage()

-- 输出弱键表中的值
for k, v in pairs(weak_keys_table) do
    print("Key in weak keys table:", k, "Value:", v)
end