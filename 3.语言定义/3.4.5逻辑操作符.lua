local a = true
local b = false

print("a and b:", a and b)  -- 输出：false
print("a or b:", a or b)  -- 输出：true
print("not a:", not a)  -- 输出：false

-- 10 or 20            --> 10
-- 10 or error()       --> 10
-- nil or "a"          --> "a"
-- nil and 10          --> nil
-- false and error()   --> false
-- false and nil       --> false
-- false or nil        --> nil
-- 10 and 20           --> 20