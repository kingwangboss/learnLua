-- 声明并初始化变量
local age = 30
local name = "Alice"
local is_student = true

-- 全局变量声明和赋值
global_var = 100

-- 局部变量声明和赋值
local local_var = "Hello"

-- 多重赋值
local x, y = 10, 20

print(type(age))  -- 输出：number
print(type(name))  -- 输出：string
print(type(is_student))  -- 输出：boolean

-- 修改变量的值
age = age + 1
name = "Bob"
is_student = false
