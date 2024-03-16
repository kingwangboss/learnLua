#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
// 使用 Lua C API 将一些全局数据存储到注册表中，并在 Lua 中通过注册表来获取和输出这些数据。
// 需要注意的是，注册表是全局的，可以被所有 Lua 线程共享。因此，在多线程环境下使用注册表时需要
// 注意数据的访问和修改权限，避免数据冲突和安全问题。
int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 设置一些全局数据到注册表中
    lua_getregistry(L);  // 获取注册表
    lua_pushstring(L, "name");  // 键名
    lua_pushstring(L, "Lua Registry");  // 键值
    lua_settable(L, -3);  // 设置键值对到注册表
    lua_pushstring(L, "version");  // 键名
    lua_pushstring(L, "1.0");  // 键值
    lua_settable(L, -3);  // 设置键值对到注册表
    lua_pop(L, 1);  // 弹出注册表

    // 获取注册表中的数据并输出
    luaL_dostring(L, "print('Name:', registry.name)");
    luaL_dostring(L, "print('Version:', registry.version)");

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
