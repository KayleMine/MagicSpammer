local addon, spammer = ...
local SP = spammer
--[[ _               _      _     
    (_)    _ _      (_)    | |_   
    | |   | ' \     | |    |  _|  
   _|_|_  |_||_|   _|_|_   _\__|  
 _|"""""|_|"""""|_|"""""|_|"""""| 
 "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 
 ]]
--============================--
Msgs = {}
local messageInputs = spammer.Tbl.messageInputs
local messageLabels = spammer.Tbl.messageLabels
local notify = SP.Frm.notify
local SenderFrame = SP.Frm.SenderFrame
local delayInput = SP.Frm.delayInput
local channelInput = SP.Frm.channelInput
local input1 = SP.Frm.input1
local input2 = SP.Frm.input2
local input3 = SP.Frm.input3
local input4 = SP.Frm.input4
local input5 = SP.Frm.input5
local function saveSetting(input, key) Msgs[key] = input:GetText() end
local function loadSetting(input, key) if Msgs[key] then input:SetText(Msgs[key]) end end
--============================--

--[[                                                 
   _   _   _   _   _  
  / \ / \ / \ / \ / \ 
 ( F | u | n | c | s )
  \_/ \_/ \_/ \_/ \_/ 
]]
--============================--
SP.Fnc.SendMessage = function(text, channel)
    local success, errorMessage = pcall(SendChatMessage, text, "CHANNEL", nil, tonumber(channel))
    if success then
       -- print("Sent: ", text, ' to ', channel)
    else
        print("Werid error: ", errorMessage)
    end
end

SP.Fnc.StartSendingMessages = function()
    local delay = tonumber(delayInput:GetText()) or 1
    local channels = {strsplit(";", channelInput:GetText())}
    local rnd_d = math.random(3, 10)
    local tick_t = tonumber(delay + rnd_d)
    notify:message("Next message in: " .. tick_t .. " Sec.")
    
    if SenderFrame.timer then
        notify:message("Restarting...")
        SenderFrame.timer:Cancel()
    end

    SenderFrame.timer = C_Timer.NewTicker(tick_t, function()
        for _, channel in ipairs(channels) do
            local randomIndex = math.random(1, 5)
            local randomMessage = messageInputs[randomIndex]:GetText()

            while (not randomMessage or randomMessage == "") do
                randomIndex = math.random(1, 5)
                randomMessage = messageInputs[randomIndex]:GetText()
            end
            
            SP.Fnc.SendMessage(randomMessage, channel)
        end
    end)
end

SP.Fnc.StopSendingMessages = function()
    if SenderFrame.timer then
		notify:message("Stopping.....")
        SenderFrame.timer:Cancel()
        SenderFrame.timer = nil
    else
        notify:message("Not active!")
    end
end
 
SP.Fnc.SaveSettings = function()
    saveSetting(input1, "GL1")
    saveSetting(input2, "GL2")
    saveSetting(input3, "GL3")
    saveSetting(input4, "GL4")
    saveSetting(input5, "GL5")
    saveSetting(delayInput, "GL6")
    saveSetting(channelInput, "GL7")
    
    notify:message("Settings saved.")
end
 
SP.Fnc.LoadSettings = function()
    loadSetting(input1, "GL1")
    loadSetting(input2, "GL2")
    loadSetting(input3, "GL3")
    loadSetting(input4, "GL4")
    loadSetting(input5, "GL5")
    loadSetting(delayInput, "GL6")
    loadSetting(channelInput, "GL7")
    
    notify:message("Settings loaded.")
end
--============================--

--============================--
SLASH_Spammer1 = "/spammer"
SLASH_Spammer2 = "/spam"
SlashCmdList["Spammer"] = function(msg)
if SenderFrame:IsShown() then
	SenderFrame:Hide()
else
	SenderFrame:Show()
end
end
--============================--