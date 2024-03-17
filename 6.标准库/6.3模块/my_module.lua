-- 定义模块表
local my_module = {}

-- 模块中的函数
function my_module.say_hello()
    print("Hello from my module!")
end

function my_module.add_numbers(a, b)
    return a + b
end

-- 返回模块表
return my_module
