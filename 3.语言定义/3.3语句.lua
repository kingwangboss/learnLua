-- 赋值语句
local x = 10  -- 单个变量赋值
local y, z = 20, 30  -- 多个变量赋值

-- 条件语句
local age = 25
if age >= 18 then
    print("成年人")
else
    print("未成年人")
end

-- 循环语句
for i = 1, 5 do
    print(i)
end

local count = 0
while count < 5 do
    print(count)
    count = count + 1
end

-- 函数定义
function greet(name)
    print("Hello, " .. name)
end

greet("Alice")  -- 调用函数

-- 重复执行语句（repeat-until）
local count = 0
repeat
    print(count)
    count = count + 1
until count >= 5

-- 跳转语句
for i = 1, 10 do
    if i > 5 then
        break  -- 跳出循环
    end
    print(i)
end