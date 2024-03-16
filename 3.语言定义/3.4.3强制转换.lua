local number = 10
local str_number = tostring(number)
print("String Number:", str_number)  -- 输出：10（字符串类型）

local str_number = "20"
local number = tonumber(str_number)
print("Number:", number)  -- 输出：20（数字类型）

local boolean_value = true
local number_from_bool = tonumber(boolean_value)  -- 将布尔值转换为数字（1或0）
print("Number from Bool:", number_from_bool)  -- 输出：1

local str_true = "true"
local str_false = "false"
local bool_true = str_true == "true"  -- 字符串比较转换为布尔值
local bool_false = str_false == "true"
print("Bool True:", bool_true)  -- 输出：true
print("Bool False:", bool_false)  -- 输出：false

local number1 = 10
local str1 = "Lua"
local bool1 = true

local table_from_number = {number1}  -- 将数字转换为表
local table_from_str = {str1}  -- 将字符串转换为表
local table_from_bool = {bool1}  -- 将布尔值转换为表

print("Table from Number:", table_from_number[1])  -- 输出：10
print("Table from Str:", table_from_str[1])  -- 输出：Lua
print("Table from Bool:", table_from_bool[1])  -- 输出：true
