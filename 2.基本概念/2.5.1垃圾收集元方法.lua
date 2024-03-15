
local obj = {
    data = "Some data"
}
setmetatable(obj, {
    __gc = function (self)
        print("Object is being garbage collected")
    end
})

-- 当对象失去引用后自动垃圾回收
obj = nil
-- 手动垃圾回收
collectgarbage()
-- 但是在Lua中无法完全关闭垃圾回收器，因为他是Lua运行时的一部分，只能通过设置垃圾回收器的参数
-- 来影响它的行为，如设置阀值或强制执行垃圾回收。
