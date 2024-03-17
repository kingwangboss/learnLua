-- 执行系统命令（返回执行结果）
local result = io.popen("dir"):read("*a")  -- 在 Windows 中使用 "dir" 命令查看当前目录文件列表
print("执行结果:", result)

-- 获取环境变量的值
local home_dir = os.getenv("USERPROFILE")  -- Windows 中可以使用 "USERPROFILE" 环境变量表示用户主目录
print("用户主目录:", home_dir)

-- 从控制台读取输入
io.write("请输入你的名字: ")
local name = io.read()
print("你好，" .. name)