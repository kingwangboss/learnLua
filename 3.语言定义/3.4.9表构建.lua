-- 构建数组（索引从 1 开始）
local arr = {10, 20, 30, 40, 50}  -- 创建一个包含整数的数组
print("Array Length:", #arr)  -- 输出数组长度：5
print("Element at Index 3:", arr[3])  -- 输出索引为 3 的元素：30

-- 构建字典（使用键值对）
local dict = {name = "Alice", age = 30, city = "New York"}  -- 创建一个包含键值对的字典
print("Name:", dict["name"])  -- 输出键为 "name" 的值："Alice"
print("Age:", dict.age)  -- 也可以使用点号语法访问值："30"

-- 混合使用数组和字典
local mixed = {10, name = "Bob", 20, age = 25}  -- 创建一个混合数组和字典的表
print("Element at Index 1:", mixed[1])  -- 输出索引为 1 的元素："10"
print("Name:", mixed.name)  -- 输出键为 "name" 的值："Bob"

local nested = {
    {1, 2, 3},  -- 嵌套的数组
    {name = "John", age = 35},  -- 嵌套的字典
    {{10, 20}, {30, 40}},  -- 更深层次的嵌套
}

print("Element at Row 1, Column 2:", nested[1][2])  -- 输出第一行第二列的元素：2
print("Age:", nested[2].age)  -- 输出嵌套字典中的键值："35"
print("Element at Row 3, Column 1:", nested[3][1][1])  -- 输出第三行第一列的元素：10

