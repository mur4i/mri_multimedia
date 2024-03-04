--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

-- TwoNa = exports["2na_core"]:getSharedObject() --convertido por .mur4i (discord caso tenha dúvidas, suporte pago)
ShowingMenu = false
ParkCam = nil

RegisterNetEvent("2na_carcontrol:Client:ShowMenu")
AddEventHandler("2na_carcontrol:Client:ShowMenu", function() 
    local vehicle = GetPedVehicleData(GetPlayerPed(-1))

    if vehicle then 
        local mileage = vSERVER.GetMileage(GetVehicleNumberPlateText(vehicle.vehicle))

            vehicle.mileage = vSERVER.GetMileage(GetVehicleNumberPlateText(vehicle.vehicle))

            SetNuiFocus(true, true)

            SendNUIMessage({
                action = "show",
                vehicle = vehicle
            })

            ShowingMenu = true
    end
end)

RegisterNetEvent("2na_carcontrol:Client:HideMenu")
AddEventHandler("2na_carcontrol:Client:HideMenu", function() 
    SendNUIMessage({
        action = "hide",
    })

    SetNuiFocus(false, false)

    ShowingMenu = false
end)

RegisterNetEvent("2na_carcontrol:Client:ControlCarMedia")
AddEventHandler("2na_carcontrol:Client:ControlCarMedia", function(payload) 
    SendNUIMessage(payload)
end)

RegisterNetEvent("2na_carcontrol:Client:ShowParkCam")
AddEventHandler("2na_carcontrol:Client:ShowParkCam", function() 
    if ParkCam then 
        DisableParkCam()
    else
        EnableParkCam()
    end

    TriggerEvent("2na_carcontrol:Client:HideMenu")
end)

