--[[ Made by RC7USER00 to troll, ChillbyteHD is not a part of this and doesn't support this ]]

-- Services
local TextChatService = game:GetService("TextChatService")

-- Settings
local message = "(EZ TROLLED BY RC7USER00) Nigger LOL"
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