
local weaponSmg = 736523883

RegisterCommand("clear", function()
    RemoveAllPedWeapons(PlayerPedId(), true)
    notify("~r~Weapons cleared.")
end)

local cars = {"adder", "comet", "cheetah", "faggio"}

RegisterCommand("car", function()
    local randomCar = (cars[math.random(#cars)])
    spawnCar(randomCar)
    notify("~p~Spawned: ~h~~g~" .. randomCar)
end)

Citizen.CreateThread(function()
    local hKey = 74

    while true do
        Citizen.Wait(1)

        if IsControlJustReleased(1, hKey) then
            print("Key" .. hKey .. " was pressed")
            giveWeapon(weaponSmg, PlayerPedId())
            giveWeapon("weapon_pumpshotgun", PlayerPedId())
                weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_SR_SUPP")

            alert("~b~Given weapons with ~INPUT_VEH_HEADLIGHT~")
        end
    end
end)

RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
    notify("~r~You died.")
end)