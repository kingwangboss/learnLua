-- Lua 中字符串的连接操作符写作两个点（'..'）。 
-- 如果两个操作数都是字符串或都是数字， 连接操作将以 §3.4.3 中提到的规则把其转换为字符串。
-- 否则，会调用元方法 __concat （参见 §2.4）。