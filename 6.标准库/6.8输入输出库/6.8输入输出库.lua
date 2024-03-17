local current_dir = io.popen("cd"):read("*all"):gsub("\n$", "")
print("当前工作目录:", current_dir)
-- 打开文件（绝对路径）
local file_path = current_dir .. "/6.标准库/6.8输入输出库/"
local file = io.open(file_path .. "input.txt", "r")

-- 打开文件（只读模式，相对当前文件夹）
-- local file = io.open("./input.txt", "r")

if file then
    -- 读取整个文件内容
    local content = file:read("*a")
    print("文件内容:", content)

    -- 关闭文件
    file:close()
else
    print("无法打开文件")
end

-- 打开文件（写入模式，相对当前文件夹）
local output_file = io.open(file_path .. "output.txt", "w")

if output_file then
    -- 写入内容到文件
    output_file:write("Hello, Lua!")

    -- 关闭文件
    output_file:close()
else
    print("无法打开文件")
end

-- 从控制台读取输入
io.write("请输入你的名字: ")
local name = io.read()
print("你好，" .. name)
