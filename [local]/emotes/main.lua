player = nil
status = false

RegisterCommand("emote", function(source, args)
    player = PlayerPedId()
    local emoteToPlay = args[1]

    if GetVehiclePedIsIn(player, false) ~= 0 then return end

    startEmote(emoteToPlay)
end)

RegisterCommand("cancel", function(source, args)
    print("clearing tasks!")
    ClearPedTasks(PlayerPedId())
    status = false
end)

function startEmote(name)
    if emotes[name] and player and status == false then
        TaskStartScenarioInPlace(player, emotes[name].anim, 0, true)
        status = true
    else
        return
    end
end