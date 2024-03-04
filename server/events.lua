--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),cRP)


-- TwoNa = exports["2na_core"]:getSharedObject() --convertido por .mur4i (discord caso tenha dúvidas, suporte pago)
CarMedias = {}

function cRP.GetMileage(payload)
    if Config.EnableMileageSystem then 
        local carMileageResult = MySQL.Sync.fetchAll("SELECT * FROM carmileages WHERE plate = @plate", { ["@plate"] = payload })
        if #carMileageResult > 0 then 
            return carMileageResult[1].mileage
        else
            return false
        end
    else
        return false
    end
end

function cRP.GetCarMedia(source)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local carMedia = GetCarMedia(vehicle)

    return carMedia
end


RegisterServerEvent("2na_carcontrol:Server:ControlCarMedia")
AddEventHandler("2na_carcontrol:Server:ControlCarMedia", function(payload)
    local source = source
    -- local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)

    -- if vehicle then 
        local carMedia = GetCarMedia(vehicle)

        if not carMedia then 
            carMedia = {
                vehicle = vehicle,
                startedAt = nil,
                musicLink = nil,
                playerState = nil
            }
            table.insert(CarMedias, carMedia)
        end

        if payload.action == "playMusic" then
            carMedia = {
                vehicle = vehicle,
                startedAt = os.time(),
                musicLink = payload.musicLink,
                playerState = "playing"
            }
        elseif payload.action == "pauseMusic" then
            carMedia.pausedAt = os.time()
            carMedia.playerState = "paused"
        elseif payload.action == "resumeMusic" then
            carMedia.playerState = "playing"
        elseif payload.action == "endMusic" then
            carMedia.playerState = "idle"
            carMedia.musicLink = nil
            carMedia.startedAt = nil
        end


        payload.playerState = carMedia.playerState
        for k,v in ipairs(CarMedias) do 
            if v.vehicle == vehicle then 
                CarMedias[k] = carMedia
            end
        end

        -- local players = GetPlayersInCar(vehicle)

        -- for _, player in ipairs(players) do 
        --     print(player,payload )
        --     TriggerClientEvent("2na_carcontrol:Client:ControlCarMedia", player, payload)
        -- end
        TriggerClientEvent("2na_carcontrol:Client:ControlCarMedia", source, payload)

        
    -- end

end)

RegisterServerEvent("2na_carcontrol:Server:ToggleVehicleLock")
AddEventHandler("2na_carcontrol:Server:ToggleVehicleLock", function() 
    local source = source
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)

    if vehicle then 
        if GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(source) then 
            local lockStatus = GetVehicleDoorLockStatus(vehicle)
            local newLockStatus = nil

            if lockStatus == 4 then 
                newLockStatus = 0
            else
                newLockStatus = 4
            end

            SetVehicleDoorsLocked(vehicle, newLockStatus) 
        end
    end
end)

if Config.EnableMileageSystem then
    RegisterServerEvent("2na_carcontrol:Server:AddMileage")
    AddEventHandler("2na_carcontrol:Server:AddMileage", function(plate, traveled) 
        local source = source
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
        if vehicle and GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(source) and not IsCarIgnored(vehicle) and GetVehicleNumberPlateText(vehicle) == plate then 
            local carOldMileage = MySQL.Sync.fetchAll("SELECT * FROM carmileages WHERE plate = @plate", { ["@plate"] = plate })
            if #carOldMileage > 0 then 
                MySQL.Sync.execute("UPDATE carmileages SET mileage = @mileage WHERE plate = @plate", { ["@plate"] = plate, ["@mileage"] = carOldMileage[1].mileage + traveled })
            else
                MySQL.Sync.execute("INSERT INTO carmileages (plate, mileage) VALUES (@plate, @mileage)", { ["@plate"] = plate, ["@mileage"] = traveled })
            end
        end
    end)
end

Citizen.Wait(1000)
print("SCRIPT CONVERTIDO E TRADUZIDO DE QBCORE PARA VRP POR: DISCORD --> .mur4i (QBCORE BRASIL)")