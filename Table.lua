--针对单表赋值
local mytable = {}
mytable.hellworld = "hellowrold"
print(mytable.hellworld)

--如果表中附带元表，并且重写了__newindex 元方法，对不存在的索引赋值，赋值不成功
local mytable2 = setmetatable({}, {__newindex = {}})
mytable2.hellowrold = "hellworld"
print(mytable2.hellowrold)

--如果表中附带元表，并且重写了__newindex 元方法，元方法类型是function，则会调用这个函数，并返回函数执行结果，不会触发赋值
local mytable3 =
    setmetatable(
    {},
    {
        __newindex = function(mytable3,key,value)
            rawset(mytable3,key,"\""..value.."\"")
        end
    }
)
mytable3.hellowrold = "hellworld"
print(mytable3.hellowrold)
