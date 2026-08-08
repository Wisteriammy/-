local function LoadScripts()
    print("[LOADER] Fetching first script...")
    
    local success1, result1 = pcall(function()
        return game:HttpGet("https://pastefy.app/Md06iIua/raw")
    end)
    
    if not success1 then
        print("[LOADER] Failed to load first script: " .. tostring(result1))
        return
    end
    
    print("[LOADER] Executing first script...")
    
    local func1, err1 = loadstring(result1)
    
    if not func1 then
        print("[LOADER] Failed to compile first script: " .. tostring(err1))
        return
    end
    
    pcall(func1)
    print("[LOADER] First script executed. Waiting 1 second...")
    
    task.wait(1)
    
    print("[LOADER] Fetching second script...")
    
    local success2, result2 = pcall(function()
        return game:HttpGet("https://pastefy.app/S7lMsuC0/raw")
    end)
    
    if not success2 then
        print("[LOADER] Failed to load second script: " .. tostring(result2))
        return
    end
    
    print("[LOADER] Executing second script...")
    
    local func2, err2 = loadstring(result2)
    
    if not func2 then
        print("[LOADER] Failed to compile second script: " .. tostring(err2))
        return
    end
    
    pcall(func2)
    print("[LOADER] Both scripts loaded and executed successfully!")
end

local success, err = pcall(LoadScripts)

if not success then
    print("[LOADER] Fatal error: " .. tostring(err))
end
