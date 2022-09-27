RegisterNetEvent("returnPing")
AddEventHandler("returnPing", function(ping)
    pingNumber = ping
end)

RegisterCommand("ping", function(source)
    PlaySound(source, "CANCEL", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    TriggerServerEvent("pinging")
    chatMessage(pingNumber)
end)


function chatMessage(message)
    TriggerEvent("chatMessage", "", {0, 255, 0}, message)
end
