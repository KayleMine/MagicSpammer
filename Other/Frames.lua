          -- _____                    _____                    _____                    _____                    _____                    _____                    _____                    _____                           
         -- /\    \                  /\    \                  /\    \                  /\    \                  /\    \                  /\    \                  /\    \                  /\    \                      
        -- /::\    \                /::\____\                /::\    \                /::\    \                /::\    \                /::\____\                /::\    \                /::\    \                    
       -- /::::\    \              /:::/    /               /::::\    \              /::::\    \               \:::\    \              /::::|   |               /::::\    \              /::::\    \                
      -- /::::::\    \            /:::/    /               /::::::\    \            /::::::\    \               \:::\    \            /:::::|   |              /::::::\    \            /::::::\    \          
     -- /:::/\:::\    \          /:::/    /               /:::/\:::\    \          /:::/\:::\    \               \:::\    \          /::::::|   |             /:::/\:::\    \          /:::/\:::\    \          
    -- /:::/__\:::\    \        /:::/    /               /:::/  \:::\    \        /:::/__\:::\    \               \:::\    \        /:::/|::|   |            /:::/  \:::\    \        /:::/__\:::\    \      
   -- /::::\   \:::\    \      /:::/    /               /:::/    \:::\    \      /::::\   \:::\    \              /::::\    \      /:::/ |::|   |           /:::/    \:::\    \      /::::\   \:::\    \    
  -- /::::::\   \:::\    \    /:::/    /               /:::/    / \:::\    \    /::::::\   \:::\    \    ____    /::::::\    \    /:::/  |::|   | _____    /:::/    / \:::\    \    /::::::\   \:::\    \  
 -- /:::/\:::\   \:::\    \  /:::/    /               /:::/    /   \:::\    \  /:::/\:::\   \:::\____\  /\   \  /:::/\:::\    \  /:::/   |::|   |/\    \  /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \ 
-- /:::/__\:::\   \:::\____\/:::/____/               /:::/____/     \:::\____\/:::/  \:::\   \:::|    |/::\   \/:::/  \:::\____\/:: /    |::|   /::\____\/:::/____/  ___\:::|    |/:::/__\:::\   \:::\____\
-- \:::\   \:::\   \::/    /\:::\    \               \:::\    \      \::/    /\::/   |::::\  /:::|____|\:::\  /:::/    \::/    /\::/    /|::|  /:::/    /\:::\    \ /\  /:::|____|\:::\   \:::\   \::/    /
 -- \:::\   \:::\   \/____/  \:::\    \               \:::\    \      \/____/  \/____|:::::\/:::/    /  \:::\/:::/    / \/____/  \/____/ |::| /:::/    /  \:::\    /::\ \::/    /  \:::\   \:::\   \/____/  
  -- \:::\   \:::\    \       \:::\    \               \:::\    \                    |:::::::::/    /    \::::::/    /                   |::|/:::/    /    \:::\   \:::\ \/____/    \:::\   \:::\    \       
   -- \:::\   \:::\____\       \:::\    \               \:::\    \                   |::|\::::/    /      \::::/____/                    |::::::/    /      \:::\   \:::\____\       \:::\   \:::\____\       
    -- \:::\   \::/    /        \:::\    \               \:::\    \                  |::| \::/____/        \:::\    \                    |:::::/    /        \:::\  /:::/    /        \:::\   \::/    /         
     -- \:::\   \/____/          \:::\    \               \:::\    \                 |::|  ~|               \:::\    \                   |::::/    /          \:::\/:::/    /          \:::\   \/____/          
      -- \:::\    \               \:::\    \               \:::\    \                |::|   |                \:::\    \                  /:::/    /            \::::::/    /            \:::\    \               
       -- \:::\____\               \:::\____\               \:::\____\               \::|   |                 \:::\____\                /:::/    /              \::::/    /              \:::\____\                  
        -- \::/    /                \::/    /                \::/    /                \:|   |                  \::/    /                \::/    /                \::/____/                \::/    /                      
         -- \/____/                  \/____/                  \/____/                  \|___|                   \/____/                  \/____/                                           \/____/                             

local addon, spammer = ...
local SP = spammer
SP.Fnc = {};
SP.Frm = {};
spammer.Tbl = {
	messageInputs = {},
	messageLabels = {}
}
local messageInputs = spammer.Tbl.messageInputs
local messageLabels = spammer.Tbl.messageLabels

--=========GaypDate===========--
local function onUpdate(self, elapsed)
	if self.time < GetTime() - 2.8 then
	if self:GetAlpha() <= 0 then
	self:Hide()
		else
	local newAlpha = self:GetAlpha() - 0.05
	if newAlpha < 0 then
		newAlpha = 0
	end
		self:SetAlpha(newAlpha)
	end
	end
end
--============================--

--============================--
SP.Frm.SenderFrame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
local SenderFrame = SP.Frm.SenderFrame
SenderFrame:SetSize(400, 300)
SenderFrame:SetPoint("CENTER")
SenderFrame:SetMovable(true)
SenderFrame:EnableMouse(true)
SenderFrame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
SenderFrame:SetBackdropColor(0, 0, 0, 0.8)
SenderFrame:Hide()
-----------------------------------
SenderFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
SenderFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)
-----------------------------------
SenderFrame:RegisterEvent("ADDON_LOADED")
SenderFrame:RegisterEvent("ADDON_ACTION_BLOCKED")
SenderFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addon then
        SP.Fnc.LoadSettings()
		print("▀██▀─▄███▄─▀██─██▀██▀▀█")
		print("─██─███─███─██─██─██▄█ ")
		print("─██─▀██▄██▀─▀█▄█▀─██▀█ ")
		print("▄██▄▄█▀▀▀─────▀──▄██▄▄█")
		print("▀▄██████████████████▄▀")
		print("▀▄█▓▒░░░░░░░░░░░░▒█▄▀")
		print("▀▄█▓▒░░░░/spammer░░░▒█▄▀")
		print("▀▄█▓▒░░░░░░░░░░░░▒█▄▀")
		print("▀▄██████████████████▄▀")
    end
    if event == "ADDON_ACTION_BLOCKED" and arg1 == addon then -- lol nice try but blizz assholes...
        print("Spammer: Error no Lua Unlocker!")
    end
end)
--============================--

--============================--
SP.Frm.Anim = CreateFrame("Frame", nil, SenderFrame)
local Anim = SP.Frm.Anim
Anim.elapsed = 0
Anim:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    local r = math.abs(math.sin(self.elapsed * 2))
    local g = math.abs(math.sin(self.elapsed * 3))
    local b = math.abs(math.sin(self.elapsed * 5))
    SenderFrame:SetBackdropBorderColor(r, g, b, 1)
end)
--============================--

--============================--
SP.Frm.notify = CreateFrame("Frame",nil,SenderFrame)
local notify = SP.Frm.notify
notify:SetSize(SenderFrame:GetWidth()-10,30)
notify:Hide()
notify:SetScript("OnUpdate",onUpdate)
notify:SetPoint("BOTTOM",0,5)
notify.text = notify:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
notify.text:SetAllPoints()
notify.texture = notify:CreateTexture()
notify.texture:SetAllPoints()
notify.texture:SetColorTexture(0,0,0,0.40) 
notify.time = 0
function notify:message(message) 
	self.text:SetText(message)
	self:SetAlpha(1)
	self.time = GetTime() 
	self:Show() 
end
--============================--

--============================--
C_Timer.After(0, function() -- delayed to nextframe, make sure we setup funcs...
SP.Frm.startButton = CreateFrame("Button", nil, SenderFrame, "UIPanelButtonTemplate")
local startButton = SP.Frm.startButton
startButton:SetText("Start")
startButton:SetSize(80, 25)
startButton:SetPoint("TOPLEFT", 10, -10)
startButton:SetScript("OnClick", SP.Fnc.StartSendingMessages)

SP.Frm.stopButton = CreateFrame("Button", nil, SenderFrame, "UIPanelButtonTemplate")
local stopButton = SP.Frm.stopButton
stopButton:SetText("Stop")
stopButton:SetSize(80, 25)
stopButton:SetPoint("LEFT", startButton, "RIGHT", 10, 0)
stopButton:SetScript("OnClick", SP.Fnc.StopSendingMessages)

SP.Frm.saveButton = CreateFrame("Button", nil, SenderFrame, "UIPanelButtonTemplate")
local saveButton = SP.Frm.saveButton
saveButton:SetText("Save")
saveButton:SetSize(80, 25)
saveButton:SetPoint("TOPRIGHT", -35, -10)
saveButton:SetScript("OnClick", SP.Fnc.SaveSettings)

SP.Frm.loadButton = CreateFrame("Button", nil, SenderFrame, "UIPanelButtonTemplate")
local loadButton = SP.Frm.loadButton
loadButton:SetText("Load")
loadButton:SetSize(80, 25)
loadButton:SetPoint("TOPRIGHT", -115, -10)
loadButton:SetScript("OnClick", SP.Fnc.LoadSettings)
end)
--============================--



--============================--
SP.Frm.inputTextAnim = CreateFrame("Frame", nil, UIParent)
local inputTextAnim = SP.Frm.inputTextAnim
inputTextAnim.elapsed = 0
inputTextAnim:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    local r = math.abs(math.sin(self.elapsed * 2))
    local g = math.abs(math.sin(self.elapsed * 3))
    local b = math.abs(math.sin(self.elapsed * 5))
    for _, input in ipairs(messageInputs) do
        input:SetTextColor(r, g, b, 1)
    end
end)
--============================--

--============================--

-----------------------------------
SP.Frm.label1 = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local label1 = SP.Frm.label1
label1:SetText("1-Message:")
label1:SetPoint("TOPLEFT", 10, -40)
local _, _, _, _, lbl1 = label1:GetPoint()

SP.Frm.input1 = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local input1 = SP.Frm.input1
input1:SetSize(200, 25)
input1:SetPoint("TOPLEFT", label1, "TOPRIGHT", 10, 0)
input1:SetAutoFocus(false)
local _, _, _, _, inp1 = input1:GetPoint()

table.insert(messageLabels, label1)
table.insert(messageInputs, input1)
-----------------------------------

-----------------------------------
SP.Frm.label2 = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local label2 = SP.Frm.label2
label2:SetText("2-Message:")
label2:SetPoint("TOPLEFT", 10, lbl1-30)
local _, _, _, _, lbl2 = label2:GetPoint()

SP.Frm.input2 = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local input2 = SP.Frm.input2
input2:SetSize(200, 25)
input2:SetAutoFocus(false)
input2:SetPoint("TOPLEFT", label2, "TOPRIGHT", 10, 0)

table.insert(messageLabels, label2)
table.insert(messageInputs, input2)
-----------------------------------

-----------------------------------
SP.Frm.label3 = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local label3 = SP.Frm.label3
label3:SetText("3-Message:")
label3:SetPoint("TOPLEFT", 10, lbl2-30)
local _, _, _, _, lbl3 = label3:GetPoint()

SP.Frm.input3 = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local input3 = SP.Frm.input3
input3:SetSize(200, 25)
input3:SetAutoFocus(false)
input3:SetPoint("TOPLEFT", label3, "TOPRIGHT", 10, 0)

table.insert(messageLabels, label3)
table.insert(messageInputs, input3)
-----------------------------------

-----------------------------------
SP.Frm.label4 = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local label4 = SP.Frm.label4
label4:SetText("4-Message:")
label4:SetPoint("TOPLEFT", 10, lbl3-30)
local _, _, _, _, lbl4 = label4:GetPoint()

SP.Frm.input4 = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local input4 = SP.Frm.input4
input4:SetSize(200, 25)
input4:SetAutoFocus(false)
input4:SetPoint("TOPLEFT", label4, "TOPRIGHT", 10, 0)

table.insert(messageLabels, label4)
table.insert(messageInputs, input4)
-----------------------------------

-----------------------------------
SP.Frm.label5 = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local label5 = SP.Frm.label5
label5:SetText("5-Message:")
label5:SetPoint("TOPLEFT", 10, lbl4-30)
local _, _, _, _, lbl5 = label5:GetPoint()

SP.Frm.input5 = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local input5 = SP.Frm.input5
input5:SetSize(200, 25)
input5:SetAutoFocus(false)
input5:SetPoint("TOPLEFT", label5, "TOPRIGHT", 10, 0)

table.insert(messageLabels, label5)
table.insert(messageInputs, input5)
-----------------------------------


-----------------------------------
SP.Frm.delayLabel = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local delayLabel = SP.Frm.delayLabel
delayLabel:SetText("Delay (sec.):")
delayLabel:SetPoint("TOPLEFT", messageInputs[5], "BOTTOMLEFT", 0, -10)
-----------------------------------
SP.Frm.channelLabel = SenderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
local channelLabel = SP.Frm.channelLabel
channelLabel:SetText("CH Numbers (1;2;3;...):")
channelLabel:SetPoint("TOPLEFT", delayLabel, "TOPRIGHT", -92, -30)
-----------------------------------
SP.Frm.delayInput = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local delayInput = SP.Frm.delayInput
delayInput:SetSize(80, 25)
delayInput:SetAutoFocus(false)
delayInput:SetPoint("TOPLEFT", delayLabel, "TOPRIGHT", 65, 0)
-----------------------------------
SP.Frm.channelInput = CreateFrame("EditBox", nil, SenderFrame, "InputBoxTemplate")
local channelInput = SP.Frm.channelInput
channelInput:SetSize(80, 25)
channelInput:SetAutoFocus(false)
channelInput:SetPoint("TOPLEFT", channelLabel, "TOPRIGHT", 20, 0)
--============================--

--============================--
SP.Frm.closeButton = CreateFrame("Button", nil, SenderFrame, "UIPanelCloseButton")
local closeButton = SP.Frm.closeButton
closeButton:SetPoint("TOPRIGHT", -5, -5)
closeButton:SetScript("OnClick", function()
    SenderFrame:Hide()
end)
 --============================--
 
 
--=======================================--
--  (*^-^) still not died from cringe?  --
--=======================================--
