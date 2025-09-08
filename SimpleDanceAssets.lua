-- Emote Data Loadstring

return {
    Floss = {
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-90))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(90))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(10))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(-10))}
        },
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(90))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-90))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(-10))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(10))}
        }
    },
    
    Dab = {
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-120))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(math.rad(-20), 0, math.rad(80))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(-15))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(15))}
        }
    },
    
    Wave = {
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-45))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(0))}
        },
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, math.rad(20), math.rad(-45))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(0))}
        },
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, math.rad(-20), math.rad(-45))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(0))}
        }
    },
    
    Dance = {
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-30))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(30))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(-20))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(20))}
        },
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(30))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-30))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(20))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, math.rad(-20))}
        }
    },
    
    -- Example using Roblox animation IDs
    -- You can add more animations like this:
    -- ["AnimationName"] = {
    --     {AnimationId = "rbxassetid://YOUR_ANIMATION_ID_HERE"}
    -- }
    
    -- Example with multiple animation types
    ["Cool Dance"] = {
        {AnimationId = "rbxassetid://1234567890"} -- Replace with actual animation ID
    },
    
    ["Epic Pose"] = {
        {
            {"Right Shoulder", CFrame.new(0.5, 0.5, 0) * CFrame.Angles(math.rad(-45), 0, math.rad(-60))},
            {"Left Shoulder", CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(70))},
            {"Right Hip", CFrame.new(0.5, -1, 0) * CFrame.Angles(0, math.rad(15), math.rad(-10))},
            {"Left Hip", CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, math.rad(-15), math.rad(10))}
        }
    }
}