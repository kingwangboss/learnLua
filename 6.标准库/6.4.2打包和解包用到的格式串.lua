-- 在Lua中，打包和解包数据通常使用 string.pack 和 string.unpack 函数，它们需要用到格式串
-- 来指定数据的打包和解包方式。这些格式串指定了数据的类型、大小和顺序，以确保正确地打包和解包数据。
-- 以下是一些常用的打包和解包格式串示例：

-- 1整数和浮点数：
-- i：有符号整数，占用4个字节。
-- I：无符号整数，占用4个字节。
-- f：单精度浮点数，占用4个字节。
-- d：双精度浮点数，占用8个字节。

-- 2字符串：
-- s：固定长度的字符串，需要指定长度。
-- z：以空字符（\0）结尾的字符串，可以是任意长度。
-- a：以NUL字符（\0）结尾的字符串，包含NUL字符。

-- 3布尔值：
-- b：布尔值，占用1个字节。

-- 4长度和填充：
-- <：小端序（低位字节在前），默认使用小端序。
-- >：大端序（高位字节在前）。
-- =：本机字节序（取决于系统）。
-- !：网络字节序（大端序）。

-- 5数组和重复项：
-- [n]：打包和解包n个重复项。
-- {fmt}：嵌套打包和解包，例如{Ii}表示一个无符号整数和一个有符号整数。

-- 要打包的数据
local data = {
    42,                   -- 整数
    -3.14,                -- 浮点数
    "Hello, Lua!",        -- 字符串
    true,                 -- 布尔值
}

-- 打包数据
local packed_data = ""
for _, value in ipairs(data) do
    if type(value) == "number" then
        packed_data = packed_data .. "n" .. string.pack("n", value)  -- 浮点数
    elseif type(value) == "string" then
        local len = #value
        packed_data = packed_data .. "s" .. string.pack("B", len) .. value  -- 字符串长度 + 字符串内容
    elseif type(value) == "boolean" then
        packed_data = packed_data .. "b" .. (value and "\1" or "\0")  -- 布尔值转换为字符 1 或 0
    else
        error("Unsupported data type")
    end
end
print("打包后的数据:", packed_data)

-- 解包数据
local unpacked_data = {}
local pos = 1
while pos <= #packed_data do
    local flag = string.sub(packed_data, pos, pos)  -- 读取标志位
    pos = pos + 1
    if flag == "n" then
        local num, new_pos = string.unpack("n", packed_data, pos)  -- 解包浮点数
        unpacked_data[#unpacked_data + 1] = num
        pos = new_pos
    elseif flag == "s" then
        local len, new_pos = string.unpack("B", packed_data, pos)  -- 解包字符串长度
        pos = new_pos
        local str = string.sub(packed_data, pos, pos + len - 1)  -- 解包字符串内容
        unpacked_data[#unpacked_data + 1] = str
        pos = pos + len
    elseif flag == "b" then
        local bool = string.sub(packed_data, pos, pos) == "\1"  -- 解包布尔值
        unpacked_data[#unpacked_data + 1] = bool
        pos = pos + 1
    else
        error("Invalid flag")
    end
end
print("解包后的数据:")
for _, value in ipairs(unpacked_data) do
    print(value)
end
