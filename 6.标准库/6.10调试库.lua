-- 获取当前函数调用堆栈信息
local info = debug.getinfo(1, "nSl")
print("当前函数名称:", info.name)
print("当前函数所在行号:", info.currentline)
print("当前函数定义的行号:", info.linedefined)

-- 设置断点，跳出调试器
function breakpoint()
    print("Breakpoint hit!")
    debug.debug()
end

-- 调用断点函数
breakpoint()

-- 从控制台读取输入，演示调试器功能
io.write("请输入一个数字: ")
local num = tonumber(io.read())
print("输入的数字:", num)
