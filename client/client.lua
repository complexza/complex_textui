
--- Initialize the Text UI
--- @param text string
--- @param keybind string
--- @param position string
local showTextUI = function(text, keybind, position)
    SendNUIEvent(Send.showTextUI, {text = text, keybind = keybind, position = position})
end

--- Hides the Text UI
local hideTextUI = function()
    SendNUIEvent(Send.hideTextUI)
end

--- Changes TextUI Text
--- @param text string
local changeText = function(text)
    SendNUIEvent(Send.changeText, text)
end

--- Changes TextUI Keybind
--- @param keybind string
local changeKeybind = function(keybind)
    SendNUIEvent(Send.changeKeybind, keybind)
end

exports('showTextUI', showTextUI)
exports('hideTextUI', hideTextUI)
exports('ChangeKeybind', changeKeybind)
exports('ChangeText', changeText)

if Config.debugMode then
    -- Command to initialize the Text UI
    RegisterCommand('showTextUI', function(source, args, rawCommand)
        exports.complex_textui:showTextUI("Open Garage", "F1", "bottom-middle")
    end, false)

    -- Command to hide the Text UI
    RegisterCommand('hideTextUI', function(source, args, rawCommand)
        exports.complex_textui:hideTextUI()
    end, false)

    -- Command to change the Text UI text
    RegisterCommand('changeText', function(source, args, rawCommand)
        local newText = table.concat(args, " ")
        exports.complex_textui:changeText(newText)
    end, false)

    -- Command to change the Text UI keybind
    RegisterCommand('changeKeybind', function(source, args, rawCommand)
        local newKeybind = args[1] or "E"
        exports.complex_textui:changeKeybind(newKeybind)
    end, false)
end