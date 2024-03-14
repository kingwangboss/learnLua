-- 1.nil:表示无效值或者缺失值
-- 2.boolean:表示true或false
-- 3.number:表示实数
-- 4.string:表示文本字符串
-- 5.function:表示函数。
-- 6.userdata:表示用户自定义数据。
-- 7.thread:表示执行的独立线程。
-- 8.table:表示关联数组，用于组织数据。
print(type(nil))
print(type(true))
print(type(42))
print(type("hello"))
print(type(function ()
    
end))
print(type({}))

local function my_thread_func()
    for i = 1, 5, 1 do
        print("Thread:", i)
        -- 模拟线程工作
        coroutine.yield()
    end
end

local my_thread = coroutine.create(my_thread_func)
coroutine.resume(my_thread)
coroutine.resume(my_thread)
-- 检查线程类型
print(type(my_thread))