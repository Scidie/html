function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function giveWeapon(weaponHash, ped)
    print(weaponHash)
    print("ped: " .. ped)
    GiveWeaponToPed(ped, weaponHash, 999, false, false)
    print("after")
end

function spawnCar(car)
    local carModel = GetHashKey(car)
    RequestModel(carModel)
    while not HasModelLoaded(carModel) do
        Wait(500)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local vehicleEntity = CreateVehicle(carModel, x + 2, y + 2, z, GetEntityHeading(PlayerPedId()), true, false)
    SetEntityAsNoLongerNeeded(vehicleEntity)
    SetModelAsNoLongerNeeded(carModel)
end

function weaponComponent(weaponHash, component)
    if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false) then
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(component))
    end
end