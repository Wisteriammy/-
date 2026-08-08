local supportedGames = {
    [920587237] = {name = "Adopt Me", url = "https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/adoptme"},
    [109983668079237] = {name = "Steal a Brainrot", url = "https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/stealabrainrot"},
    [142823291] = {name = "Murder Mystery 2", url = "https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/murdermystery2"},
    [97598239454123] = {name = "Grow a Garden 2", url = "https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/growagarden2"}
}

local mainHubUrl = "https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/mainhub"

local placeId = game.PlaceId
local target = supportedGames[placeId]

local urlToLoad = target and target.url or mainHubUrl

local success, result = pcall(function()
    return game:HttpGet(urlToLoad)
end)

if success then
    local loadSuccess, err = pcall(function()
        loadstring(result)()
    end)

    if not loadSuccess then
        warn("[Hub] Failed to execute script: " .. tostring(err))
    end
else
    warn("[Hub] Failed to fetch script: " .. tostring(result))
end
