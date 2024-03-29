# mri_multimedia - Multimídia para Carros vRP

Este projeto é uma multimídia para carros que permite controle de várias funcionalidades do veículo, integrado com a framework vRP.
O script foi convertido por mim (discord: .mur4i) de QBCore para vRP.

Sinta-se à vontade para fazer um fork e mandar um pull request caso faça alguma alteração interessante!

## Disclaimer
mri_multimedia é um script 100% OPEN SOURCE, sinta-se a vontade para fazer um fork e trazer atualizações para o script caso encontre algum erro. Caso seja necessário entre em contato comigo que estaremos ajudando muito mais pessoas se esse script estiver perfeito!

## QBCore Brasil
Este script é um oferecimento da comunidade QBCore Brasil. Ele não é oficial e, portanto, pode ter erros ou falhas.

Discord da comunidade: [QBCore Brasil](https://discord.gg/uEfGD4mmVh)

Meu discord pessoal: [.mur4i](https://discordapp.com/users/600843526825181219)

## Video Tutorial
[Clique para assistir](https://youtu.be/wVGXcI_zM8w)
[![Vídeo Preview](thumb.png)](https://youtu.be/wVGXcI_zM8w)

## Dependências
Necessário possuir os seguintes scripts abaixo para funcionar o script:
- [xsound](https://github.com/Xogy/xsound)
- 2na_core (dependência removida)

## Atalhos
- Pressione `M` dentro do carro para abrir o painel (por padrão)

## Funcionalidades
- Controle das partes do veículo (portas, capô, porta-malas).
- Controle do motor, luzes e outros sistemas do veículo.
- Reprodução de música sincronizada do YouTube, permitindo que os usuários ouçam músicas enquanto dirigem.
- Sistema de câmera de estacionamento para facilitar o estacionamento.
- Sistema de quilometragem que rastreia as milhas do veículo (possível desativar a partir da configuração).

## Preview
![Preview 1](preview1.png)
![Preview 2](preview2.png)
![Preview 3](preview3.png)

## Configurações externas

```lua
Config = {}

Config.MenuKey = 'M'

-- ATIVAR SISTEMA DE QUILOMETRAGEM
Config.EnableMileageSystem = false

Config.OptimizationMode = "fast" -- fast, medium, low, ultralow 

-- Em quantos milissegundos o sistema de quilometragem deve ser executado. Diminuir este valor aumentará o aumento da quilometragem em cada carro
-- Quanto maior o número, mais otimizado .mur4i
Config.MileageUpdateInterval = 1500

-- O script nunca contará a quilometragem de carros com essas placas
Config.IgnoredPlates = {
    "ADMIN",
    "ADMINCAR"
}
```

## Créditos

Este projeto foi baseado no script original "Advanced Car Control v2 - Mileage System" criado por [0Resmondev](https://forum.cfx.re/t/advanced-car-control-v2-mileage-system/5128322). Certifique-se de conferir o trabalho deles!
