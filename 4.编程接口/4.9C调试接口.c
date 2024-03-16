#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

// 我们定义了一个 Lua 函数 test_debug，它使用 Lua 的调试接口获取当前函数的调用栈信息，
// 并输出到标准输出流中。然后，它还获取了局部变量信息并输出。最后，在主函数中执行 Lua 代码，
// 调用了我们定义的 Lua 函数进行测试。

// 定义一个 Lua 函数，用于测试调试接口
static int test_debug(lua_State *L) {
    lua_Debug ar;
    int level = 0;

    // 获取当前函数调用栈信息并输出
    while (lua_getstack(L, level, &ar)) {
        lua_getinfo(L, "Sln", &ar);
        printf("Function: %s, Line: %d, Source: %s\n", ar.name, ar.currentline, ar.short_src);
        level++;
    }

    // 获取局部变量信息并输出
    lua_getinfo(L, "l", &ar);
    for (int i = 1; i <= ar.nparams + ar.nvars; i++) {
        const char *var_name = lua_getlocal(L, &ar, i);
        if (var_name != NULL) {
            printf("Local variable: %s\n", var_name);
            lua_pop(L, 1);  // 弹出变量值
        }
    }

    return 0;
}

int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 注册 Lua 函数到全局环境
    lua_pushcfunction(L, test_debug);
    lua_setglobal(L, "test_debug");

    // 执行 Lua 代码
    luaL_dostring(L,
        "local x = 10\n"
        "local y = 20\n"
        "test_debug()\n"
    );

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
