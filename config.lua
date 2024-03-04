--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
Config = {}

Config.MenuKey = 'M'

-- ATIVAR SISTEMA DE QUILOMETRAGEM
Config.EnableMileageSystem = false

Config.OptimizationMode = "fast" -- fast, medium, low, ultralow 

-- In how many milliseconds should the mileage system be run // Decrementing this value will increase the rise of mileage in every car
-- Quanto maior o número mais otimizado .mur4i
Config.MileageUpdateInterval = 1500

-- Script will never count the mileage of cars with these plates
Config.IgnoredPlates = {
    "ADMIN",
    "ADMINCAR"
}