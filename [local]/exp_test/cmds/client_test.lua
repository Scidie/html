RegisterCommand("exports_client", function(source, args)
    local argString = table.concat(args, " ")

    exports.exp:notify(argString)
    exports.exp:chat(argString)
    exports.exp:client_log(argString)
end)