--- Used to send NUI events to the UI
--- @param action string
--- @param data any
function SendNUIEvent(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

--- Prints Debug Information if Debug Mode is Enabled
--- @param ... any
function DebugPrint(...)
    if not Config.debugMode then return end
    local args <const> = { ... }

    local appendStr = ''
    for _, v in ipairs(args) do
        appendStr = appendStr .. ' ' .. tostring(v)
    end
    local msgTemplate = '^2[%s]^0%s'
    local finalMsg = msgTemplate:format("complex-textui", appendStr)
    print(finalMsg)
end