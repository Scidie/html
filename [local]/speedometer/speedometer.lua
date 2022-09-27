--- draws text
--  @param content text to draw
function text(content)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.4, 1.4)
    SetTextEntry("String")
    AddTextComponentString(content .. " KMH")
    DrawText(0.85, 0.7)
end

Citizen.CreateThread(function()
    local speed = nil
    
    while true do
        Citizen.Wait(5)
        speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 3.65 -- 3.65 for kilometers
        -- check if ped is in vehicle
        if (IsPedInAnyVehicle(PlayerPedId(), false)) then
            text(math.floor(speed))
        end
    end
end)
