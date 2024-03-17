-- 导入 utf8 库
local utf8 = require("utf8")

-- UTF-8编码的字符串
local utf8_str = "你好，世界！"

-- 打印字符串长度（以字节为单位）
print("字符串长度（字节）:", #utf8_str)

-- 打印字符串长度（以字符为单位）
local utf8_len = utf8.len(utf8_str)
print("字符串长度（字符）:", utf8_len)

-- 分割字符串为字符
print("分割字符串为字符:")
for _, char in utf8.codes(utf8_str) do
    print(char)
end

-- 截取子串（以字符为单位）
local start_offset = utf8.offset(utf8_str, 1)  -- 获取第一个字符的起始位置
local end_offset = utf8.offset(utf8_str, 2)    -- 获取第二个字符的起始位置
local sub_str = string.sub(utf8_str, start_offset, end_offset - 1)  -- 截取子串
print("截取的子串:", sub_str)

-- 替换子串（按字节替换）
local function utf8_replace(str, old, new)
    local result = ""
    local start_idx = 1
    local old_len = #old
    while true do
        local found_idx = string.find(str, old, start_idx, true)  -- 使用 true 参数进行精确匹配
        if not found_idx then
            break
        end
        result = result .. string.sub(str, start_idx, found_idx - 1) .. new
        start_idx = found_idx + old_len
    end
    result = result .. string.sub(str, start_idx)  -- 添加剩余部分
    return result
end

-- 替换子串
local replaced_str = utf8_replace(utf8_str, "世界", "Lua")
print("替换后的字符串:", replaced_str)
