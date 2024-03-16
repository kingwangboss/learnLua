#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 执行 Lua 代码（注意：这里故意写错了函数名）
    int status = luaL_dostring(L, "print('Hello, Lua!')");
    
    // 检查执行状态
    if (status != LUA_OK) {
        // 获取错误信息并输出
        const char* errorMessage = lua_tostring(L, -1);
        fprintf(stderr, "Lua error: %s\n", errorMessage);
    }

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
