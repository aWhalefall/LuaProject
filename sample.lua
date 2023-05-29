--类需要包含成员属性，方法，类继承通过metatable来实现
Shape = {area = 0}

--类似构造函数
function Shape:new(o, side)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self --关键点 [对象中成员属性]和[成员函数]
    side = side or 0
    self.area = side * side
    return o
end

-- 基础类方法 printArea
function Shape:printArea()
    print("area is ", self.area)
end

--创建对象

local newShape = Shape:new(nil, 6)

newShape:printArea()
print(newShape.area)

Square = Shape:new()

--派生类方法new
function Square:new(o, side)
    o = o or Shape:new(o, side)
end



local test=function (o)
    o = o or 1
end

