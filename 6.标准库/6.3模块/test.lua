-- 获取当前工作目录
local current_dir = io.popen("cd"):read("*all"):gsub("\n$", "")

-- 将当前目录添加到 package.path
package.path = package.path .. ";" .. current_dir .. "/6.标准库/6.3模块/?.lua"
-- 加载模块
local my_module = require("my_module")

-- 调用模块中的函数
my_module.say_hello()  -- 输出：Hello from my module!

local sum = my_module.add_numbers(5, 10)
print("Sum:", sum)  -- 输出：Sum: 15
