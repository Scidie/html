RegisterCommand("announce", function(soucre, args)
    TriggerServerEvent("announce", table.concat(args, " "))
end)