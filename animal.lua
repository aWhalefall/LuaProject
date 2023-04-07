local rtl = require("rtl")
local Animal = rtl.class()
function Animal:say()
    -- body
    error("I don't known who i am ")
end
return Animal
