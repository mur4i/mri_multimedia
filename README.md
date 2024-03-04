# mri_multimedia - Multimídia para Carros vRP

Este projeto é uma multimídia para carros que permite controle de várias funcionalidades do veículo, integrado com a framework vRP.
O script foi convertido por mim (discord: .mur4i) de qbcore para vRP.

## Funcionalidades
- Controle das partes do veículo (portas, capô, porta-malas).
- Controle do motor, luzes e outros sistemas do veículo.
- Reprodução de música sincronizada do YouTube, permitindo que os usuários ouçam músicas enquanto dirigem.
- Sistema de câmera de estacionamento para facilitar o estacionamento.
- Sistema de quilometragem que rastreia as milhas do veículo (possível desativar a partir da configuração).

## Preview
![Preview 1](preview1.png)
![Preview 2](preview2.png)

## Configurações externas

```lua
Config = {}

Config.MenuKey = 'M'

-- ATIVAR SISTEMA DE QUILOMETRAGEM
Config.EnableMileageSystem = false

Config.OptimizationMode = "fast" -- rápido, médio, baixo, ultrabaixo 

-- Em quantos milissegundos o sistema de quilometragem deve ser executado. Diminuir este valor aumentará o aumento da quilometragem em cada carro
-- Quanto maior o número, mais otimizado .mur4i
Config.MileageUpdateInterval = 1500

-- O script nunca contará a quilometragem de carros com essas placas
Config.IgnoredPlates = {
    "ADMIN",
    "ADMINCAR"
}