RegisterNetEvent("output")
AddEventHandler("output", function(arg)
    TriggerEvent("chatMessage", "[Success]", {0, 255, 0}, "Added " .. arg .. " into database.")
end)