-- 字符串拼接
local str1 = "Hello, "
local str2 = "Lua!"
local combined_str = str1 .. str2
print("拼接后的字符串:", combined_str)

-- 获取字符串长度
local len = #"Lua programming"
print("字符串长度:", len)

-- 字符串索引和截取子串
local original_str = "Lua is a powerful scripting language"
local sub_str = string.sub(original_str, 5, 12) -- 从第5个字符到第12个字符
print("截取的子串:", sub_str)

-- 字符串查找和替换
local find_pos = string.find(original_str, "powerful") -- 查找子串的位置
if find_pos then
    print("子串'powerful'的位置:", find_pos)
end

local replaced_str = string.gsub(original_str, "powerful", "versatile") -- 替换子串
print("替换后的字符串:", replaced_str)

-- 字符串分割
local words = {}
for word in string.gmatch(original_str, "%S+") do
    table.insert(words, word)
end
print("分割后的单词:")
for i, word in ipairs(words) do
    print(i, word)
end

-- 字符串转换
local upper_case = string.upper(original_str)
local lower_case = string.lower(original_str)
print("大写形式:", upper_case)
print("小写形式:", lower_case)

-- 字符串格式化
local formatted_str = string.format("Lua版本号：%d.%d", 5, 4)
print("格式化后的字符串:", formatted_str)
