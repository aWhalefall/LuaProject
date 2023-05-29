--x=p->a这句话的意思就是取出p所指向的结构体中包含的数据项a赋值给
local function class(className, super)
    -- 构建类
    local clazz = { __cname = className, super = super }
    if super then
        -- 设置类的元表，此类中没有的，可以查找父类是否含有
        setmetatable(clazz, { __index = super })
    end
    -- new 方法创建类对象
    clazz.new = function(...)
        -- 构造一个对象
        local instance = {}
        -- 设置对象的元表为当前类，这样，对象就可以调用当前类生命的方法了
        setmetatable(instance, { __index = clazz })
        if clazz.ctor then
            clazz.ctor(instance, ...)
        end
        return instance
    end
    return clazz
end

local printf = function(str, ...)
    return print(string.format(str, ...))
end

-- 声明  classA
local ClassA = class("ClassA")
ClassA.static = 'Static A'
function ClassA:ctor(a, b)
    self.a = a or 0
    self.b = b or 0
end

function ClassA:print()
    printf("%s, a = %s, b = %d, static = %s", self.__cname, self.a, self.b, self.static)
end

function ClassA:getSum()
    return self.a + self.b
end

-- 声明  classB， 并且继承 ClassA
local ClassB = class("ClassB", ClassA)
function ClassB:ctor(...)
    self.super.ctor(self, ...)
end


local ClassC = class("ClassC")

function ClassC:ctor(a, func)
    self.a = a or 0
    self.b = func
end


-- overwrite
function ClassB:print()
    print('Class B overwrite super print')
end

-- 声明 classC, 并且继承 ClassB
-- local ClassC = class("ClassC", ClassA)
-- ClassC.static = 'Static C'

-- local obja1 = ClassA.new(10, 20)
-- local obja2 = ClassA.new(100, 200)
-- local objb1 = ClassB.new(1, 2)
-- local objc = ClassC.new(3, 4)
-- obja1:print()
-- obja2:print()
-- objb1:print()
-- objc:print()
-- printf("3 + 4 = %s", objc:getSum())
--[[
ClassA, a = 10, b = 20, static = Static A
ClassA, a = 100, b = 200, static = Static A
Class B overwrite super print
ClassC, a = 3, b = 4, static = Static C
3 + 4 = 7
]]

function ClassB.T()
    
end

print("-----------------------")

local ClassC1 = ClassC.new(10, ClassB.T)
local ClassC2 = ClassC.new(10, ClassB.T)


print(ClassC1==ClassC2)
print(ClassC1)
print(ClassC2)

print(type(ClassC1))


print(tostring(ClassC1))