local display = false

RegisterCommand("nui", function(source)
    SetDisplay(not display)
end)

RegisterNUICallback("main", function(data)
    chat(data.text, {0, 255, 0})
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255, 0 ,0})
    SetDisplay(false)
end)

RegisterNUICallback("exit", function(data)
    chat("Exited", {0, 255, 0})
    SetDisplay(false)
    EnableAllControlActions()
    SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(2)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

function chat(str, color)
    TriggerEvent("chat:addMessage", {
        color = color,
        multiline = true,
        args = {str}
    })
end