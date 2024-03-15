-- "index": 索引 table[key]。 当 table 不是表或是表 table 中不存在 key 这个键时，
-- 这个事件被触发。 此时，会读出 table 相应的元方法。
-- 尽管名字取成这样， 这个事件的元方法其实可以是一个函数也可以是一张表。 如果它是一个函数，
-- 则以 table 和 key 作为参数调用它。 如果它是一张表，最终的结果就是以 key 取索引这张表的
-- 结果。 （这个索引过程是走常规的流程，而不是直接索引， 所以这次索引有可能引发另一次元方法。）
local t = {
    a = 10
}
local mt = {
    __index = function (self, key)
        if key == "b" then
            return 20
        else
            return "Key not found"
        end
    end
}
setmetatable(t, mt)
print(t.a)
print(t.b)
print(t.c)

-- "newindex": 索引赋值 table[key] = value 。 和索引事件类似，它发生在 table 不是表或
-- 是表 table 中不存在 key 这个键的时候。 此时，会读出 table 相应的元方法。
-- 同索引过程那样， 这个事件的元方法即可以是函数，也可以是一张表。 如果是一个函数， 
-- 则以 table、 key、以及 value 为参数传入。 如果是一张表， Lua 对这张表做索引赋值操作。
--（这个索引过程是走常规的流程，而不是直接索引赋值， 所以这次索引赋值有可能引发另一次元方法。）
-- 一旦有了 "newindex" 元方法， Lua 就不再做最初的赋值操作。 （如果有必要，在元方法内
-- 部可以调用 rawset 来做赋值。）
local t1 = {}
local mt1 = {
    __newindex = function (self, key, value)
        if key == "a" then
            rawset(self, key, value)
        else
            error("Cannot set key:" .. key)
        end
    end
}
setmetatable(t1, mt1)
t1.a = 10
print(t1.a)
-- t1.b = 20

-- tostring元方法用于将表转换为字符串的行为
local t2 = {
    a = 10,
    b = 20
}

local mt2 = {
    __tostring = function (self)
        local str = "{"
        for key, value in pairs(self) do
            str = str .. key .. "=" .. value .. ","
        end
        str = str:sub(1, -3)  -- 去除最后的逗号和空格
        str = str .. "}"
        return str
    end
}
setmetatable(t2, mt2)
print(t2)

-- "call": 函数调用操作 func(args)。 当 Lua 尝试调用一个非函数的值的时候会触发
-- 这个事件 （即 func 不是一个函数）。 查找 func 的元方法， 如果找得到，就调用这个元
-- 方法， func 作为第一个参数传入，原来调用的参数（args）后依次排在后面。
local t3 = {
    count = 0,
    __call = function (self)
        self.count = self.count + 1
        return self.count
    end
}
-- 将元方法关联到对象的元表上
setmetatable(t3, t3)

print(t3())
print(t3())