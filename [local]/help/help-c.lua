
RegisterCommand("help", function()
    msg("Welcome to masmix's server!")
    msg("Developing for: 1 day")
end, false)

function msg(text)
    TriggerEvent("chat:addMessage", {
        args = {"[SERVER] " .. text }
    })
end