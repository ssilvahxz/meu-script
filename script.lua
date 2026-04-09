local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // SISTEMA DE KEYS COM SAVE REAL \\ --
local HttpService = game:GetService("HttpService")

local KeysValidas = {
    ["2011"] = true,
    ["3456"] = true,
    ["8899"] = true,
    ["4821"] = true, 
    ["1063"] = true,
    ["9257"] = true,
    ["3418"] = true,
    ["6782"] = true,
["6782"] = true,
["5591"] = true,
["8046"] = true,
["2179"] = true,
["9904"] = true,
["1637"] = true,
["7280"] = true,
["4512"] = true,
["8863"] = true,
["3029"] = true,
["7741"] = true,
["6198"] = true,
["2450"] = true,
["9573"] = true,
["1346"] = true,
["8201"] = true,
["5639"] = true,
["4087"] = true,
["7124"] = true,
["2965"] = true,
["8810"] = true,
["3472"] = true,
["6594"] = true,
["1038"] = true,
["9746"] = true,
["5217"] = true,
["8842"] = true,
["2361"] = true,
["7905"] = true,
["4183"] = true,
["6650"] = true,
["1927"] = true,
["8306"] = true,
["5479"] = true,
["2648"] = true,
["9013"] = true,
["3782"] = true,
["6154"] = true,
["7429"] = true,
["1506"] = true,
["8897"] = true,
["4235"] = true,
["6789"] = true,
["2041"] = true,
["9578"] = true,
["3620"] = true,
["7415"] = true,
["8162"] = true,
["5394"] = true,
["2703"] = true,
["9981"] = true,
["6147"] = true,
["3859"] = true,
["7206"] = true,
["4519"] = true,
["1682"] = true,
["8043"] = true,
["2995"] = true,
["6701"] = true,
["9328"] = true,
["5146"] = true,
["7830"] = true,
["2457"] = true,
["6618"] = true,
["3904"] = true,
["8725"] = true,
["1439"] = true,
["9560"] = true,
["4872"] = true,
["6205"] = true,
["3117"] = true,
["7084"] = true,
["5693"] = true,
["8241"] = true,
["1378"] = true,
["9902"] = true,
["4526"] = true,
["7813"] = true,
["6097"] = true,
["2345"] = true,
["8651"] = true,
["3920"] = true,
["7186"] = true,
["5402"] = true,
["1764"] = true,
["8890"] = true,
["2673"] = true,
["9045"] = true,
["6318"] = true,
["7582"] = true,
["1420"] = true,
["9867"] = true,
["5031"] = true,
["6748"] = true,

}

local FileName = "PremiumHub_Keys.json"
local KeysUsadas = {}

local Player = game.Players.LocalPlayer
local CurrentPlayerName = Player.Name
local AcessoAtivado = false
local ClickTPEnabled = false
local Ponto1, Ponto2, Ponto3 = nil, nil, nil

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

-- BOTÃO HACKER
task.spawn(function()
    while true do
        task.wait(0.5)
        for _, v in pairs(game.CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") and v.Text:find("Rayfield") then
                v.Text = "⚡ SILVAHXZ18 MENU ⚡"
                v.TextColor3 = Color3.fromRGB(0,255,150)
                v.TextStrokeTransparency = 0
                v.TextStrokeColor3 = Color3.fromRGB(0,255,150)

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

local noclip = false

TPTab:CreateToggle({
    Name = "👻 Noclip",
    CurrentValue = false,
    Callback = function(Value)
        if AcessoAtivado then
            noclip = Value
        else
            Rayfield:Notify({
                Title = "🔒 Bloqueado",
                Content = "Digite a Key primeiro!",
                Duration = 3
            })
        end
    end
})

game:GetService("RunService").Stepped:Connect(function()
    if noclip and AcessoAtivado and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
game:GetService("RunService").Stepped:Connect(function()
    if noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

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

-- Teleporte - Local 1
TPTab:CreateButton({
    Name = "💾 Salvar Local 01",
    Callback = function()
        if AcessoAtivado and Player.Character then
            Ponto1 = Player.Character.HumanoidRootPart.CFrame
            Rayfield:Notify({
                Title = "💾 Local 01",
                Content = "Local 01 salvo com sucesso!",
                Duration = 3
            })
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

-- Espaço
TPTab:CreateSection(" ") 

-- Teleporte - Local 2
TPTab:CreateButton({
    Name = "💾 Salvar Local 02",
    Callback = function()
        if AcessoAtivado and Player.Character then
            Ponto2 = Player.Character.HumanoidRootPart.CFrame
            Rayfield:Notify({
                Title = "💾 Local 02",
                Content = "Local 02 salvo com sucesso!",
                Duration = 3
            })
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

-- Espaço
TPTab:CreateSection(" ") 

-- Teleporte - Local 3
TPTab:CreateButton({
    Name = "💾 Salvar Local 03",
    Callback = function()
        if AcessoAtivado and Player.Character then
            Ponto3 = Player.Character.HumanoidRootPart.CFrame
            Rayfield:Notify({
                Title = "💾 Local 03",
                Content = "Local 03 salvo com sucesso!",
                Duration = 3
            })
        end
    end
})

TPTab:CreateButton({
    Name = "📌 Ir para Local 03",
    Callback = function()
        if AcessoAtivado and Ponto3 and Player.Character then
            Player.Character.HumanoidRootPart.CFrame = Ponto3
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
      setclipboard("https://discord.gg/Zgjms7B8H")
      Rayfield:Notify({
          Title = "Discord",
          Content = "Link copiado com sucesso!",
          Duration = 3
      })
   end,
})
-- ABA VERSÃO
local VersionTab = Window:CreateTab("📌 Versão", 4483362458)

-- Configura a versão inicial (você pode mudar no GitHub)
local ScriptVersion = "1.0.1"

-- Função para pegar data e hora atual
local function GetCurrentDateTime()
    local date = os.date("*t") -- pega tabela com dia, mês, ano, hora, minuto, segundo
    return string.format("%02d/%02d/%04d %02d:%02d:%02d", 
        date.day, date.month, date.year, date.hour, date.min, date.sec)
end

-- Label principal da versão
local VersionLabel = VersionTab:CreateLabel("Versão: "..ScriptVersion.." | "..GetCurrentDateTime())

-- Atualizar a data/hora a cada segundo
task.spawn(function()
    while true do
        task.wait(1)
        VersionLabel:Set("Versão: "..ScriptVersion.." | "..GetCurrentDateTime())
    end
end)

--================ CONFIG PRO =================
local ConfigFile = "SilvaHub_Config.json"

local function SalvarConfig()
    if writefile then
        writefile(ConfigFile, HttpService:JSONEncode(S))
    end
end

local function CarregarConfig()
    if isfile and isfile(ConfigFile) then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(ConfigFile))
        end)
        if success and type(data) == "table" then
            for k,v in pairs(data) do
                S[k] = v
            end
        end
    end
end

-- carregar automaticamente
CarregarConfig()

--================ ABA CONFIG =================
local ConfigTab = Window:CreateTab("⚙️ Config")

ConfigTab:CreateButton({
    Name = "💾 Salvar Config",
    Callback = function()
        SalvarConfig()
        Rayfield:Notify({
            Title = "Config",
            Content = "Configuração salva!",
            Duration = 3
        })
    end
})

ConfigTab:CreateButton({
    Name = "📂 Carregar Config",
    Callback = function()
        CarregarConfig()
        Rayfield:Notify({
            Title = "Config",
            Content = "Config carregada!",
            Duration = 3
        })
    end
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
