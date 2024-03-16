local x = 5  -- 二进制为 0101
local y = 3  -- 二进制为 0011
local result = x & y  -- 结果为 0001，即十进制的1
print("Result:", result)  -- 输出：1

local result = x | y  -- 结果为 0111，即十进制的7
print("Result:", result)  -- 输出：7

local result = x ~ y  -- 结果为 0110，即十进制的6
print("Result:", result)  -- 输出：6

local result = ~x  -- 结果为1111 1010，即十进制的-6（取补码）1000 0101 + 1000 0001
print("Result:", result)  -- 输出：-6

local left_shifted = x << 2  -- 左移两位，结果为 10100，即十进制的20
local right_shifted = x >> 1  -- 右移一位，结果为 0010，即十进制的2
print("Left Shifted:", left_shifted)  -- 输出：20
print("Right Shifted:", right_shifted)  -- 输出：2