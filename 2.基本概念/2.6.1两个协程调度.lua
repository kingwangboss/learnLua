-- 创建两个协程
local co1 = coroutine.create(function()
    for i = 1, 3 do
        print("Coroutine 1:", i)
        coroutine.yield()  -- 让出执行权
    end
end)

local co2 = coroutine.create(function()
    for i = 1, 5 do
        print("Coroutine 2:", i)
        coroutine.yield()  -- 让出执行权
    end
end)

-- 协程调度函数
local function scheduler(...)
    local coroutines = {...}
    while true do
        local running = false
        for _, co in ipairs(coroutines) do
            if coroutine.status(co) == "suspended" then
                running = true
                local status, msg = coroutine.resume(co)
                if not status then
                    print("Error:", msg)
                    return
                end
            end
        end
        if not running then
            break  -- 所有协程都完成了，跳出循环
        end
    end
end

-- 调度两个协程
scheduler(co1, co2)
