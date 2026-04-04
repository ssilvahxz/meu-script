local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // SISTEMA DE KEYS COM SAVE REAL \\ --
local HttpService = game:GetService("HttpService")

local KeysValidas = {
    ["2011"] = true,
    ["3456"] = true,
    ["8899"] = true,
}

local FileName = "PremiumHub_Keys.json"
local KeysUsadas = {}

local Player = game.Players.LocalPlayer
local CurrentPlayerName = Player.Name
local AcessoAtivado = false
local ClickTPEnabled = false
local Ponto1, Ponto2 = nil, nil

-- Carregar keys
if isfile and isfile(FileName) then
    local success, data = pcall(function()
        return HttpService:JSONDecode(readfile(FileName))
    end)
    if success and type(data) == "table" then
        KeysUsadas = data
    end
end

-- Salvar keys
local function SalvarKeys()
    if writefile then
        writefile(FileName, HttpService:JSONEncode(KeysUsadas))
    end
end

-- Validar acesso
local function ValidarAcesso(keyInserida)
    local userId = tostring(Player.UserId)

    if not KeysValidas[keyInserida] then
        return false
    end

    if KeysUsadas[keyInserida] then
        return KeysUsadas[keyInserida] == userId
    else
        KeysUsadas[keyInserida] = userId
        SalvarKeys()
        return true
    end
end

-- JANELA
local Window = Rayfield:CreateWindow({
   Name = "🔥 Silvahxz18 MENU 🔥",
   LoadingTitle = "Inicializando Sistema...",
   LoadingSubtitle = "Usuário: " .. CurrentPlayerName,
   ConfigurationSaving = { Enabled = false }
})

-- 🔥 BOTÃO HACKER CUSTOM
task.spawn(function()
    while true do
        task.wait(0.5)
        for _, v in pairs(game.CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") and v.Text:find("Rayfield") then
                
                -- TEXTO
                v.Text = "⚡ SILVAHXZ18 MENU ⚡"
                v.TextColor3 = Color3.fromRGB(0,255,150)

                -- NEON (Glow fake)
                v.TextStrokeTransparency = 0
                v.TextStrokeColor3 = Color3.fromRGB(0,255,150)

                -- ANIMAÇÃO (piscar hacker)
                spawn(function()
                    while v and v.Parent do
                        v.TextTransparency = 0
                        task.wait(0.3)
                        v.TextTransparency = 0.4
                        task.wait(0.3)
                    end
                end)

            end
        end
    end
end)

-- LOGIN
local LoginTab = Window:CreateTab("🔐 Autenticação", 4483362458)
LoginTab:CreateInput({
   Name = "Insira sua Chave Privada",
   PlaceholderText = "Digite sua Key exclusiva...",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      if ValidarAcesso(Text) then
         AcessoAtivado = true
         Rayfield:Notify({
            Title = "✅ Acesso Liberado",
            Content = "Bem-vindo, " .. CurrentPlayerName,
            Duration = 5
         })
      else
         Rayfield:Notify({
            Title = "❌ Acesso Negado",
            Content = "Key inválida ou já vinculada.",
            Duration = 5
         })
      end
   end,
})

-- TELEPORT
local TPTab = Window:CreateTab("🚀 Teleportes", 4483362458)

TPTab:CreateToggle({
   Name = "Ativar Click Teleport",
   CurrentValue = false,
   Callback = function(Value)
      if AcessoAtivado then
         ClickTPEnabled = Value
      end
   end,
})

TPTab:CreateSection("📍 Sistema de Posições")

TPTab:CreateButton({
    Name = "💾 Salvar Local 01",
    Callback = function()
        if AcessoAtivado and Player.Character then
            Ponto1 = Player.Character.HumanoidRootPart.CFrame
        end
    end
})

TPTab:CreateButton({
    Name = "📌 Ir para Local 01",
    Callback = function()
        if AcessoAtivado and Ponto1 and Player.Character then
            Player.Character.HumanoidRootPart.CFrame = Ponto1
        end
    end
})

TPTab:CreateButton({
    Name = "💾 Salvar Local 02",
    Callback = function()
        if AcessoAtivado and Player.Character then
            Ponto2 = Player.Character.HumanoidRootPart.CFrame
        end
    end
})

TPTab:CreateButton({
    Name = "📌 Ir para Local 02",
    Callback = function()
        if AcessoAtivado and Ponto2 and Player.Character then
            Player.Character.HumanoidRootPart.CFrame = Ponto2
        end
    end
})

-- GUIA
local InfoTab = Window:CreateTab("📖 Guia de Uso", 4483362458)
InfoTab:CreateSection("📘 Manual do Usuário")
InfoTab:CreateLabel("Sistema exclusivo com Key única por jogador.")
InfoTab:CreateLabel("A Key é automaticamente vinculada ao seu UserId.")
InfoTab:CreateLabel("Outros jogadores não poderão reutilizar.")
InfoTab:CreateLabel("Use o Teleport com estratégia.")
InfoTab:CreateLabel("Sistema otimizado e seguro.")

-- CRÉDITOS
local CreditTab = Window:CreateTab("💎 Créditos", 4483362458)

CreditTab:CreateSection("👑 Desenvolvedor")
CreditTab:CreateLabel("silvahxz18")

CreditTab:CreateSection("⚙️ Sistema")
CreditTab:CreateLabel("Premium Hub v2.0 Gold")
CreditTab:CreateLabel("Key Lock + Save System")

CreditTab:CreateSection("🚀 Status")
CreditTab:CreateLabel("Online | Estável | Protegido")

CreditTab:CreateSection("🔗 Contato")
CreditTab:CreateButton({
   Name = "📋 Copiar Discord",
   Callback = function()
      setclipboard("silvahxz18")
   end,
})

-- CLICK TP
local Mouse = Player:GetMouse()
Mouse.Button1Down:Connect(function()
    if ClickTPEnabled and AcessoAtivado then
        if Mouse.Target and Player.Character then
            local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(Mouse.Hit.p) + Vector3.new(0,3,0)
            end
        end
    end
end)
