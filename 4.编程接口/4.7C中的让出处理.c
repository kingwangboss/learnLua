#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

// 创建了一个名为c_yield的C函数，它作为 Lua 函数被调用。在这个函数中，我们调用了lua_yield函数来
// 让出处理。然后，在 Lua 代码中，我们创建了一个协程（coroutine），并在协程中调用了这个 C 函数。
// 通过 coroutine.resume 函数来唤醒协程并恢复执行。

// 需要注意的是，让出处理是协作式的，即在 C 代码中调用 lua_yield 后，需要等待 Lua 代码主动唤醒
// 并恢复执行。如果没有适当的唤醒操作，C 代码将一直处于等待状态。

// C 函数作为 Lua 函数调用
static int c_yield(lua_State *L) {
    lua_pushinteger(L, 10);  // 返回值
    return lua_yield(L, 1);  // 让出处理
}

int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 注册 C 函数到 Lua 中
    lua_register(L, "c_yield", c_yield);

    // 执行 Lua 代码
    luaL_dostring(L,
        "co = coroutine.create(function()\n"
        "    print('Coroutine start')\n"
        "    local result = c_yield()\n"
        "    print('Coroutine resumed:', result)\n"
        "end)\n"
        "coroutine.resume(co)\n"
    );

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
