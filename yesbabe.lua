# stealagacha
-- VARIAVEIS DE CONFIGURACAO
local keyToActivate = Enum.KeyCode.K -- TECLA 'K' para comprar a sequencia

local nomeDaGUI = "LojaFixa"
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = nomeDaGUI
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 180) -- Altura ajustada para 180 (cabem 4 botoes + status)
frame.Position = UDim2.new(1, -250, 0, 0) -- Canto Superior Direito
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = gui

-- ### INDICADOR DE STATUS NO TOPO ###
local statusLabel = Instance.new("TextLabel")
statusLabel.Text = "SCRIPT ATIVO" -- Frase solicitada
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundColor3 = Color3.fromRGB(0, 100, 0) 
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Font = Enum.Font.SourceSansBold
statusLabel.Parent = frame

-- Area dos Botoes (Comeca abaixo do indicador de status)
local buttonArea = Instance.new("Frame")
buttonArea.Size = UDim2.new(1, 0, 1, -20) 
buttonArea.Position = UDim2.new(0, 0, 0, 20) 
buttonArea.BackgroundTransparency = 1
buttonArea.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5) 
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.Parent = buttonArea

-- ### 1. FUNÇÕES SEPARADAS (SUA LOGICA) ###

local function buySpeedCoil()
    print("Comando para SpeedCoil ativado.")
    local args = {"SpeedCoil"}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
end

local function buyGravityCoil()
    print("Comando para GravityCoil ativado.")
    local args = {"GravityCoil"}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
end

local function buyGlove()
    print("Comando para Oren Slapper ativado.")
    local args = {"OrenSlapStick"}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
end

local function buyTrap()
    print("Comando para Trap ativado.")
    local args = {"Trap"}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
end

-- ### 2. LOGICA DA SEQUENCIA DE COMPRA (TECLA 'K') ###

local function executeSequence()
    print("Sequencia de compra ativada pela tecla K...")
    
    -- 1. Oren Slapper
    buyGlove()
    wait(0.1) 
    
    -- 2. Speed Coil
    buySpeedCoil()
    wait(0.1)
    
    -- 3. Gravity Coil
    buyGravityCoil()
    wait(0.1)
    
    -- 4. Trap
    buyTrap()
    
    print("Sequencia de compra concluida.")
end

local function onKeyPress(input)
    if input.KeyCode == keyToActivate and input.UserInputType == Enum.UserInputType.Keyboard and input.UserInputState == Enum.UserInputState.Begin then
        spawn(executeSequence)
    end
end

game:GetService("UserInputService").InputBegan:Connect(onKeyPress)

-- ### 3. CRIAÇÃO E CONEXÃO DOS BOTÕES ###

local btn1 = Instance.new("TextButton")
btn1.Text = "Comprar SpeedCoil"
btn1.Size = UDim2.new(0.9, 0, 0, 30)
btn1.Parent = buttonArea
btn1.MouseButton1Click:Connect(buySpeedCoil)

local btn2 = Instance.new("TextButton")
btn2.Text = "Comprar GravityCoil"
btn2.Size = UDim2.new(0.9, 0, 0, 30)
btn2.Parent = buttonArea
btn2.MouseButton1Click:Connect(buyGravityCoil)

local btn3 = Instance.new("TextButton")
btn3.Text = "Comprar Oren Slapper"
btn3.Size = UDim2.new(0.9, 0, 0, 30)
btn3.Parent = buttonArea
btn3.MouseButton1Click:Connect(buyGlove)

local btn4 = Instance.new("TextButton")
btn4.Text = "Comprar Trap"
btn4.Size = UDim2.new(0.9, 0, 0, 30)
btn4.Parent = buttonArea
btn4.MouseButton1Click:Connect(buyTrap) -- <--- ESTE É O BOTÃO DA TRAP

print("Script carregado! O botão 'Comprar Trap' está no final da lista.")
