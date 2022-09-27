RegisterServerEvent("pinging")
AddEventHandler("pinging", function(source)
    local src = source
    local ping = GetPlayerPing(src)
    TriggerClientEvent("returnPing", src, ping)
end)