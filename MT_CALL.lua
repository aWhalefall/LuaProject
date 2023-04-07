local function table_maxn(t)
    local mn = 0
    for k, v in ipairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

--模拟表的方法，增加元表，增加复写元方法__call,如何给一个表定义多个方法
local table =
    setmetatable(
    {10},
    {
        __call = function(table, newtable)
            local sum = 0
            for i = 1, table_maxn(table) do
                sum = sum + table[i]
            end
            for i = 1, table_maxn(newtable) do
                sum = sum + newtable[i]
            end
            return sum
        end
    }
)

local newtable = {10, 20, 30}
print(table(newtable))

