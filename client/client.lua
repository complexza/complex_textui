
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
        -- Example arguments
        local text = "Open Garage"
        local keybind = "E"
        local position = "top-middle"

        -- Call the function to initialize the Text UI
        showTextUI(text, keybind, position)
    end, false)

    -- Command to hide the Text UI
    RegisterCommand('hideTextUI', function(source, args, rawCommand)
        -- Call the function to hide the Text UI
        hideTextUI()
    end, false)

    -- Command to change the Text UI text
    RegisterCommand('changeText', function(source, args, rawCommand)
        -- Get the new text from the command arguments
        local newText = table.concat(args, " ")
        -- Call the function to change the text in the Text UI
        changeText(newText)
    end, false)

    -- Command to change the Text UI keybind
    RegisterCommand('changeKeybind', function(source, args, rawCommand)
        -- Get the new keybind from the command arguments
        local newKeybind = args[1] or "E" -- Default to "E" if no keybind is provided
        -- Call the function to change the keybind in the Text UI
        changeKeybind(newKeybind)
    end, false)
end