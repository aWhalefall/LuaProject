mymetatable = {}
local mytable = setmetatable({key1 = "values1"}, {__newindex = mymetatable})
print(mytable.key1)

--1.对表一个缺少索引赋值，解释器查找__newindex 元方法，如果存在调用函数不赋值，否则进行赋值。
--2.如果元表未定义__newindex 则会在普通表中定义索引赋值，如果定义了非函数类型，则将索引赋值到元表中。
mytable.newkey = "newValue2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "newValue1"
print(mytable.key1, mymetatable.key1)

--元表中定义键值对似乎不起作用
local mymetatable = {__index = {key2 = "mymetatableValue"}}
local test_table =
    setmetatable(
    {
        key = "value2",
        fun = function()
        end,
        ctor = function(a, b)
            self.a = a
            self.b = b
        end
        
    },
    mymetatable
)
print(test_table.key, test_table.key2)



