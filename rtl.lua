-- 模拟类 我们可以将lua文件看成一个函数，文件中的返回语句就是这个函数的返回值，从这里也了解到，返回的不一定是表，也可以是函数，或是其他任意类型的对象。
-- [[使用lua table结构，模拟oop编程

-- 1、类
-- 2、对象
-- 3、类继承
-- 4、函数
-- 5、属性
-- 6、构造函数]]
local rtl = {}
local ksuper = {}
function rtl.class(super)
    -- body
    local kclass = {} --代表类
    kclass[ksuper] = super --把父类 table 保存起来,方面后面进行查找父类中函数，子类不存在的函数
    kclass.__index = kclass -- 定义table的__index

    local _class_metatable = rtl._class_metatable --这是类的元表，所有类都设置值同一个元表
    if not _class_metatable then
        _class_metatable = {
            __index = function(table, ksuper)
                local super = rawget(table, ksuper)
                if super then
                    -- body
                    return super[ksuper]
                else
                    return nil
                end
            end,
            __call = function(cls, ...)
                --创建类对象，cls就是类
                local obj = {}
                setmetatable(obj, cls)
                -- 约定_init为类的构造函数，所以这里会调用构造函数
                local _init=cls._init
                if _init then
                    -- body
                     _init(obj,...)
                end
                --最后返回这个对象
                return obj
            end
        }
        rtl._class_metatable=_class_metatable
    end
    --设置类的元表
    setmetatable(kclass,_class_metatable)
    -- 最后的返回类
    return kclass
end

return rtl