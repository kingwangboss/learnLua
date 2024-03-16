#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

// 定义了一个自定义类型 Point，包含了 x 和 y 两个属性，并注册了两个 C 函数来操作这个类型的对象。
// 其中 new_point 函数用于创建 Point 对象，point_get_x 函数用于获取对象的 x 属性。

// 通过使用 Lua C API，我们可以在 C 代码中定义更多的操作，并让 Lua 脚本方便地调用这些操作。

// 定义自定义类型结构体
typedef struct {
    int x;
    int y;
} Point;

// C 函数：创建 Point 对象
static int new_point(lua_State *L) {
    int x = luaL_checkinteger(L, 1);  // 获取参数 x
    int y = luaL_checkinteger(L, 2);  // 获取参数 y

    Point *point = (Point *)lua_newuserdata(L, sizeof(Point));  // 创建 Point 对象
    point->x = x;
    point->y = y;

    luaL_setmetatable(L, "Point");  // 设置 Point 对象的元表
    return 1;  // 返回对象数量
}

// C 函数：获取 Point 对象的 x 属性
static int point_get_x(lua_State *L) {
    Point *point = (Point *)luaL_checkudata(L, 1, "Point");  // 获取对象
    lua_pushinteger(L, point->x);  // 返回 x 属性值
    return 1;  // 返回值数量
}

int main() {
    lua_State *L = luaL_newstate();  // 创建 Lua 解释器状态
    luaL_openlibs(L);  // 加载 Lua 标准库

    // 注册自定义类型 Point
    luaL_newmetatable(L, "Point");
    lua_pushcfunction(L, point_get_x);  // 注册获取 x 属性的函数
    lua_setfield(L, -2, "__index");  // 将函数设置为元表的 __index 域
    lua_pop(L, 1);  // 弹出元表

    // 注册创建 Point 对象的函数到全局环境
    lua_pushcfunction(L, new_point);
    lua_setglobal(L, "Point");

    // 执行 Lua 代码
    luaL_dostring(L,
        "pt = Point(10, 20)\n"
        "print(pt.x)  -- 调用对象的属性\n"
    );

    lua_close(L);  // 关闭 Lua 解释器状态

    return 0;
}
