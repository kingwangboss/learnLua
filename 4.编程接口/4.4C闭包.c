#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

// 定义了一个名为 my_closure 的 C 函数作为闭包，它接受一个 Lua 函数作为 upvalue。
// 然后，我们使用 lua_pushcclosure将这个闭包传递给Lua，并将闭包函数赋值给Lua全局变量my_closure。
// 接着，在Lua代码中调用这个闭包函数，并传入一个匿名Lua函数作为参数，该匿名函数返回传入的两个参数的和。

// 定义 C 函数作为闭包
static int my_closure(lua_State *L) {
    // 获取闭包的 upvalue（即 C 函数传递给 Lua 的闭包函数）
    lua_pushvalue(L, lua_upvalueindex(1));
    lua_pushinteger(L, 10);  // 传入闭包的参数
    lua_pushinteger(L, 20);  // 传入闭包的参数
    lua_call(L, 2, 1);  // 调用闭包函数并获取返回值
    return 1;  // 返回闭包的返回值数量
}

int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 将 C 函数作为闭包传递给 Lua
    lua_pushcclosure(L, my_closure, 1);

    // 将闭包函数赋值给 Lua 全局变量
    lua_setglobal(L, "my_closure");

    // 执行 Lua 代码
    luaL_dostring(L, "result = my_closure(function(x, y) return x + y end)");

    // 获取结果并输出
    lua_getglobal(L, "result");
    double result = lua_tonumber(L, -1);
    lua_pop(L, 1);  // 弹出栈顶值

    printf("Result: %f\n", result);

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
