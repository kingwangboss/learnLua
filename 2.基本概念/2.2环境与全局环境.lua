-- 创建一个新的环境
local env = {}

-- 在环境中定义一个变量和函数
env.x = 10
env.print_x = function ()
    print(env.x)
end

-- 设置env为环境表
setmetatable(env, { __index = _G })

-- 在环境中执行函数
-- 此时代码中的全局变量和函数都会在env环境中查找
-- 因为设置了__index元方法
env.print_x()