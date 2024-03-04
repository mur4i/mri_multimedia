--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
function IsCarIgnored(vehicle) 
    local plate = GetVehicleNumberPlateText(vehicle)
    local isIgnored = false

    for _,v in ipairs(Config.IgnoredPlates) do 
        if v == plate then 
            isIgnored = true
            break
        end
    end

    return isIgnored
end