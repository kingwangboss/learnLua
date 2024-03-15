-- 创建一个弱键值表，键和值都是弱引用
local weak_keys_values_table = {}
setmetatable(weak_keys_values_table, { __mode = "kv" })  -- 键和值都为弱引用

-- 创建一个强引用的键和值
local key = {}
local value = {}
weak_keys_values_table[key] = value

-- 输出弱键值表中的键值对
for k, v in pairs(weak_keys_values_table) do
    print("Key in weak keys-values table:", k, "Value:", v)
end

-- 释放对键和值的引用
key = nil
value = nil

-- 手动触发垃圾收集
collectgarbage()

-- 输出弱键值表中的键值对
for k, v in pairs(weak_keys_values_table) do
    print("Key in weak keys-values table:", k, "Value:", v)
end