-- 这种类似扩展函数的写法，定义table内函数，与table结构绑定在一起
-- require  "文件路径"，获取并赋值给变量。使用变量.进行调用
-- lua的标准库大多数用表把功能归类起来
local M = {}
function M.print()
    print("test")
end
function nihao()
    print("hellowrold")
end
return M