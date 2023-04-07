Lua 模拟oop编程范式

1. 类
1. 对象
1. 类继承
1. 函数
1. 属性
1. 构造函数


定义两个空table表结构
//对象是一个普通的table，把普通table表的元表设为指定的类，那么普通table表就被称为该类的对象
local rtl = {}
//父类
local ksuper = {}

setmetatable(rtl,**{__index=kClass}**)

### 对象  https://blog.csdn.net/somanygenius/article/details/47952467
在这里可以表示为
**{__index=kClass}** rtl；  **{__index=kClass}** 为类，rtl为 **{__index=kClass}** 的对象。

### 类，函数
在访问不到rtl的字段时，回触发类的元方法__index，而元方法可以设为 **{__index=kClass}** 自己，这样就变成访问类的字段。通常把对的功能函数放在类中，让该类的所有对象都共享一套函数。

### 类继承

类继承通过为类设置metatable来实现，当类中也找不到字段时，会触发类的元表__index，元方法，这里会取出来父类并继续访问。直到父类为空为止。

### 对象和类的异同

对象是类的具体化（或者实例化），比如 Cat ,猫类，包含两个属性 weight，color。猫分为很多子类。黑猫，白猫，狸花猫等等。对象是将类的属性具象化之后的衍生类型。


local t = {
    a = 1,
    __index = function()
        print("index")
    end
}

local metetable = {}
local temp = setmetatable(metetable, t)

1. 普通表设置元表，想要触发元表中的__index，元方法，需要调用普通表不存在的索引

2. 如果普通表中定义__index,则可以通过普通表的索引，使用点 .来触发。
   table._index(),如果普通表的__index，是表类型。

何时使用冒号：运算符，何时使用 . 点运算符。（**这里这种着重关注冒号运算符的特性。附带self**）   

定义与表绑定的函数

function t:ctor()
    print(type(self))
end

表的属性，可以使用 . 点 来操作。