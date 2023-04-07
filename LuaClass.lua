--  https://zhuanlan.zhihu.com/p/123971515
--简单通过元表来实现
local t={}
local mt={
    __index={
        a=10,
        b=20,
        add=function (a,b)
            return a+b
        end
    }
}
setmetatable(t,mt)


print("Type ="..type(getmetatable(t)))
print("Type ="..getmetatable(t))


print(string.format("%d+%d=%d",t.a,t.b,t.add(t.a,t.b)))