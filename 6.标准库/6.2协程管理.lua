-- 生产者协程
local function producer()
    for i = 1, 5 do
        coroutine.yield(i)  -- 产生数据并挂起
    end
end

-- 消费者协程
local function consumer()
    local sum = 0
    for value in coroutine.wrap(producer) do
        sum = sum + value
        print("Received value:", value)  -- 打印每次迭代的值
    end
    return sum  -- 返回结果
end

-- 创建消费者协程
local co = coroutine.create(consumer)

-- 启动消费者协程
local status, result = coroutine.resume(co)

if status then
    print("Sum:", result)  -- 输出：Sum: 15
else
    print("Error occurred while running the coroutine")
end
