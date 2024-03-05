--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
Config = {}

Config.MenuKey = 'M'

-- ATIVAR SISTEMA DE QUILOMETRAGEM
Config.EnableMileageSystem = false

Config.OptimizationMode = "fast" -- fast, medium, low, ultralow 

-- Em quantos milissegundos o sistema de quilometragem deve ser executado. Diminuir este valor aumentará o aumento da quilometragem em cada carro
-- Quanto maior o número mais otimizado .mur4i
Config.MileageUpdateInterval = 1500

-- O script nunca contará a quilometragem de carros com essas placas
Config.IgnoredPlates = {
    "ADMIN",
    "ADMINCAR"
}