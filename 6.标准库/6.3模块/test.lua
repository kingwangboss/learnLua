
-- 加载模块
local my_module = require("my_module")

-- 调用模块中的函数
my_module.say_hello()  -- 输出：Hello from my module!

local sum = my_module.add_numbers(5, 10)
print("Sum:", sum)  -- 输出：Sum: 15
