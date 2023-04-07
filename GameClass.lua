function class(classname, super)
    local superType = type(super)
    local cls = {}
    if (superType ~= "function" and superType ~= "table") then
        super = nil
        superType = nil
    end
    if super then
        --cls 可以调用父类方法
        setmetatable(cls, {__index = super})
        --这里赋值是否会成功！！！！！
        cls.super = super
    else 
        cls.ctor=function ()
            --body
        end
    end
    cls.__cname=classname or "errName"
    cls.__ctype=2
    cls.__index=cls
    
    function cls.new(...)
        local stn=setmetatable({},cls)
        if cls.super then
            cls.super.ctor(stn,...)
        end        
        stn.class=cls
        stn:ctor(...)
        return stn
    end
    return cls
end

function isKindof(obj,classname)
    local t=type(obj)
    local mt=nil
    if t=="table" then
        mt=getmetatable(obj)
        while mt do
            if mt.__cname=="classname" then
                return true
            end
        end
        mt=mt.super
    else
        print("## is kindof obj type error")
    end
    return false
end
