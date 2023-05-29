
EventManager = {}
local this = EventManager

function EventManager.init()
    this.eventHandle = {}
end

function EventManager.clear()
    this.eventHandle = {}
end
---------------------------------------------------------------

function EventManager.CallEvents(eventType, ...)
    if this.eventHandle == nil or eventType == nil then
        return
    end
    local eventHandleInfo = this.eventHandle[eventType]
    if (eventHandleInfo ~= nil) then
        for k, v in pairs(eventHandleInfo) do
            if v ~= nil then
                v.handle(...)
            end
        end
    end
end

function EventManager.AddEventHandle(eventType, handle)
	local eventHandleInfo = {};
    eventHandleInfo.handle = handle
    local eventHandleMapInfo = this.eventHandle[eventType]
    if (eventHandleMapInfo == nil) then
        eventHandleMapInfo = {}
        this.eventHandle[eventType] = eventHandleMapInfo
    end
    table.insert(eventHandleMapInfo, eventHandleInfo)
end

function EventManager.RemoveEvent(eventType, handle)
    local eventHandleInfo = this.eventHandle[eventType];
    if (eventHandleInfo ~= nil) then
        for k, v in pairs(eventHandleInfo) do
            if v.handle == handle then
                eventHandleInfo[k] = nil
                return
            end
        end
    end
end

--初始化
EventManager.init()

TestEventManager={}

function TestEventManager.fun1()
    print("fun1")
end

function TestEventManager.fun2()
    print("fun2")
end

print(package.path)

EventManager.AddEventHandle(1000,TestEventManager.fun1)
EventManager.AddEventHandle(1000,TestEventManager.fun2)

for key, value in pairs(EventManager.eventHandle) do
   print(key..type(value)) 
end