local rtl = require("rtl")
local Animal = require("animal")

local Cat = rtl.class(Animal)
--构造函数
function Cat:_init(name)
    self.name = name
end

function Cat:say()
    -- body
    print(string.format("I am a cat, my name is %s", self.name))
end

local Dog = rtl.class(Animal)

local cat = Cat("tom")
cat:say()

-- local dog = Dog()
--  dog:say()

local t = {
    a = 1,
    __index = function()
        print("index")
    end
}

local metetable = {}
local temp = setmetatable(metetable, t)

function t:ctor()
    print(type(self))
end

--t.__index()

print(type(t.__index))

local isNull = nil

-- 是否为空
if not isNull then
    print("not null")
else
    print("null")
end

local temp = {}
local ksuper = {}
local super = {}
function temp.class(super)
    local innerClass = {}
    innerClass[ksuper] = super
    print(innerClass)
end

temp.class(super)

a = {1, "sdafadsf", [12121] = "false", 4}

for i = 1, #a do
    print("========" .. a[i])
end

for k, v in pairs(a) do
    print(string.format("table %s = %s", k, v))
end

local a = {}
for i = 1, 5 do
    a[i] = 0
end
a[8] = 0 -- 虽然索引不连贯，但长度是以最大索引为准
print(#a)
a[10] = 0 -- 索引不连贯，而且长度不再以最大索引为准了
print(#a)
local count=0
for index, value in ipairs(a) do
    count=count+1
    print(index,value)
end

print(count)

print(type(_G))

for k,v in pairs(_G) do
    print(k,"->",v)
end


