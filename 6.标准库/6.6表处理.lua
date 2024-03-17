-- 创建一个空表
local my_table = {}

-- 创建一个包含键值对的表
local person = {
    name = "Alice",
    age = 30,
    city = "New York",
    contacts = {
        email = "alice@example.com",
        phone = "123-456-7890"
    },
    hobbies = {"reading", "traveling", "cooking"}
}

-- 添加新元素到表中
person.contacts.address = "123 Main St"
person.hobbies[4] = "painting"

-- 访问表中的元素
print("姓名:", person.name)
print("年龄:", person.age)
print("城市:", person.city)
print("邮箱:", person.contacts.email)
print("电话:", person.contacts.phone)
print("地址:", person.contacts.address)
print("兴趣爱好:")
for _, hobby in ipairs(person.hobbies) do
    print("  - " .. hobby)
end

-- 遍历表中的元素
print("\n遍历表中的元素:")
for key, value in pairs(person) do
    if type(value) == "table" then
        print(key .. ":")
        for k, v in pairs(value) do
            print("  " .. k, v)
        end
    else
        print(key, value)
    end
end

-- 删除表中的元素
person.contacts.address = nil
person.hobbies[4] = nil

-- 再次遍历表中的元素
print("\n删除后的表元素:")
for key, value in pairs(person) do
    if type(value) == "table" then
        print(key .. ":")
        for k, v in pairs(value) do
            print("  " .. k, v)
        end
    else
        print(key, value)
    end
end
