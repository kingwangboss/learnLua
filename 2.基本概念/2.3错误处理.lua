-- 实例函数，可能会抛出错误
local function divide(a, b)
    if b == 0 then
        error("Division by zero")
    end
    return a / b
end

-- 使用pcall 捕获可能的错误
local success, result = pcall(divide, 10, 1)
if not success then
    print("Error:", result)
else
    print("Result:", result)
end

-- 自定义错误处理函数
local function error_handler(err)
    print("Error occurred:" .. err)
    -- 这里可以进行更多的错误处理逻辑，比如记录日志或恢复状态
end

-- 使用xpcall捕获可能的错误，并指定自定义的错误处理函数
local status, result = xpcall(divide, error_handler, 10, 0)
if status then
    print("Result:", result)
end
