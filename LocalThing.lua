--[[ // Made by RC7USER00, posted by ChillbyteHD, ChillbyteHD did not make this code and doesn't support what it does. idea was made by RC7USER00 ]]

-- Services
local TextChatService = game:GetService("TextChatService")

-- Settings
local message = "(EZ TROLLED BY RC7USER00) NIGGA 🤣"
local delayTime = 0.1
local active = true

-- Function to spam chat
local function spamChat()
    local channel = TextChatService:FindFirstChild("RBXGeneral")
    if not channel then
        warn("RBXGeneral channel not found! This game may have disabled default chat.")
        return
    end

    while active do
        pcall(function()
            channel:SendAsync(message)
        end)
        task.wait(delayTime)
    end
end

-- Start spamming
spamChat()