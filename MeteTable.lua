local mytable = {} -- 普通表
local mymetatable = {} -- 元表
setmetatable(mytable, mymetatable) -- 把 mymetatable 设为 mytable 的元表
print(getmetatable(mytable))

--
table = setmetatable({}, {})
print(getmetatable(mytable))

--元表测试

--元方法 __index
local other_table = {foo = 3}
local t = setmetatable({}, {__index = other_table})
print(t.foo)
-- [[1.检查表中是否有foo
-- 2.检查是否有元表，元表中是否包含__index这个元方法
-- 3.元方法包含的类型。表格，function，如果是表格循环、1,2,3，如果function会function（table，key）进行调用]]

local tablefuntion =
    setmetatable(
    {key1 = "values1"},
    {
        __index = function(tablefuntion, key)
            if (key == "key2") then
                return "metatablevalue"
            else
                return nil
            end
        end
    }
)

print(tablefuntion.key1, tablefuntion.key2)

--上面的代码简写
local simpleTable = setmetatable({key1 = "value1"}, {__index = {key2 = "mymetatable"}})
print(simpleTable.key1, simpleTable.key2)

[[总结]]
--1.在表中查找如果找到返回，否则继续
--2.判断该表是否有元表，没有返回nil，有则元表继续
--3.判断元表中是否定义了__index 元方法，未定义的返回nil，定义了。确定元表类型是表则循环1,2,3；如果是函数，则返回该函数的返回值。
