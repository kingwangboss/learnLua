-- 定义一个无参数的函数
function greet()
    print("Hello, Lua!")
end

-- 调用函数
greet()  -- 输出：Hello, Lua!

-- 定义一个带参数的函数
local function add(a, b)
    return a + b
end

-- 调用函数并传递参数
local result = add(10, 20)
print("Result:", result)  -- 输出：30

-- 定义一个返回多个值的函数
local function get_coordinates()
    return 10, 20
end

-- 调用函数并接收返回值
local x, y = get_coordinates()
print("X Coordinate:", x)  -- 输出：10
print("Y Coordinate:", y)  -- 输出：20

-- 定义一个接收函数作为参数的函数
local function call_function(func)
    func()  -- 调用传入的函数
end

-- 调用函数并传入另一个函数作为参数
call_function(greet)  -- 输出：Hello, Lua!
