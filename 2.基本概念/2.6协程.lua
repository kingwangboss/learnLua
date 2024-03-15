-- 创建一个协程
local co = coroutine.create(function ()
    print("Coroutine is running")
    coroutine.yield("Yielded value")
    print("Coroutine is done")
end)

-- 获取协程状态
print("Coroutine status:", coroutine.status(co))

-- 恢复协程的执行
local status, value = coroutine.resume(co)
print("Resume status:", status)
print("Resume value:", value)

-- 再次获取协程的状态
print("Coroutine status:", coroutine.status(co))
