local QBCore = exports['qb-core']:GetCoreObject()
local bunker = false
local laundry = false

RegisterNetEvent("xmmx-pixiedust:client:openMythicPouch", function()
    if Config.Utils == "ox" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = "Opening Pouch",
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = Config.PouchAnimDict,
                clip = Config.PouchAnimClip, 
                flag = 49,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
        })
    else
        QBCore.Functions.Progressbar('open_pouch', "Opening Pouch", 5000, false, false, { 
            disableMovement = true, 
            disableCarMovement = true, 
            disableMouse = false, 
            disableCombat = false, 
        }, { 
            animDict = Config.PouchAnimDict, 
            anim = Config.PouchAnimClip, 
            flags = 49, 
        }, {}, {}, function() 
        end, function()
        end, "mythicalpouch")
    end
end)

RegisterNetEvent('xmmx-pixiedust:client:teleport', function()
    local id = PlayerId()
    if Config.Utils == "ox" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = "Nighty Night!",
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = Config.TeleAnimDict,
                clip = Config.TeleAnimClip, 
                flag = 9,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
        })
    else
        QBCore.Functions.Progressbar('go_somewhere', "Nighty Night!", 6000, false, false, { 
            disableMovement = true, 
            disableCarMovement = true, 
            disableMouse = false, 
            disableCombat = false, 
        }, { 
            animDict = Config.TeleAnimDict, 
            anim = Config.TeleAnimClip, 
            flags = 9, 
        }, {}, {}, function() 
        end, function()
        end, "pixiedust")
        Citizen.Wait(5000)
    end    
    PixieDream()
    TriggerServerEvent('qb-log:server:CreateLog', 'pixiedust', 'PIXIE LOGS:', 'blue', '**'.. GetPlayerName(id) ..'** Has used Pixie Dust!')
end)

RegisterNetEvent('xmmx-pixiedust:client:teleport2', function()
    local id = PlayerId()
    if Config.ProgressBar == "ox" then
        lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = "Nighty Night!",
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = Config.TeleAnimDict,
                clip = Config.TeleAnimClip, 
                flag = 9,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
        })
    else
        QBCore.Functions.Progressbar('go_somewhere', "Nighty Night!", 6000, false, false, { 
            disableMovement = true, 
            disableCarMovement = true, 
            disableMouse = false, 
            disableCombat = false, 
        }, { 
            animDict = Config.TeleAnimDict, 
            anim = Config.TeleAnimClip, 
            flags = 9, 
        }, {}, {}, function() 
        end, function()
        end, "pixiedust2")
        Citizen.Wait(5000)
    end    
    PixieDream2()
    TriggerServerEvent('qb-log:server:CreateLog', 'pixiedust', 'PIXIE LOGS:', 'blue', '**'.. GetPlayerName(id) ..'** Has used Pixie Dust!')
end)

function loadAnimDict(dict)	if not HasAnimDictLoaded(dict) then while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end end

function PixieDream()
    if not bunker then
        bunker = true
        laundry = true
        local player = PlayerPedId()
        startCoords = GetEntityCoords(player)
        startHeading = GetEntityHeading(player)
        ShakeGameplayCam('DRUNK_SHAKE', 1.25)
        SetTimecycleModifierStrength(1.0)
        SetTimecycleModifier("BikerFilter")
        TriggerEvent("InteractSound_CL:PlayOnOne", "gunclicks", Config.GunVol)
        DoScreenFadeOut(8000)
        loadAnimDict('random@drunk_driver_1') 
        TaskPlayAnim(player, "random@drunk_driver_1", "drunk_fall_over", 8.0, 8.0, -1, 0, 0, false, false, false ) 
        Citizen.Wait(3000)
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, true, true, true )
        while not IsScreenFadedOut() do Wait(100) end
        SetEntityCoords(player, Config.GunBunker.Coords) 
        SetEntityHeading(player, Config.GunBunker.Heading) 
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, false, false, false )
        Citizen.Wait(2000)
        DoScreenFadeIn(8000)
        if Config.Utils == "ox" then
            lib.notify({ title = '', description = 'You\'ve awaken in a strange place!', type = 'inform', duration = 5000, position = "center-right", })
        else
            QBCore.Functions.Notify("You\'ve awaken in a strange place!", "primary", 5000)
        end
        SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
        Citizen.Wait(10000)      
        ResetPedMovementClipset(player, 0) 
        ClearTimecycleModifier()        
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        Citizen.Wait(5000)        
        ClearPedTasks(player)
    elseif bunker then
        bunker = false
        laundry = false
        local player = PlayerPedId()
        ShakeGameplayCam('DRUNK_SHAKE', 1.25)
        SetTimecycleModifierStrength(1.0)
        SetTimecycleModifier("BikerFilter")
        TriggerEvent("InteractSound_CL:PlayOnOne", "lullaby", Config.PublicVol)
        DoScreenFadeOut(8000)
        loadAnimDict('random@drunk_driver_1') 
        TaskPlayAnim(player, "random@drunk_driver_1", "drunk_fall_over", 8.0, 8.0, -1, 0, 0, false, false, false )    
        Citizen.Wait(3000)
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, true, true, true )
        while not IsScreenFadedOut() do Wait(100) end
        SetEntityCoords(player, startCoords) 
        SetEntityHeading(player, startHeading) 
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, false, false, false )
        Citizen.Wait(2000)
        DoScreenFadeIn(8000)
        if Config.Utils == "ox" then
            lib.notify({ title = '', description = 'You\'ve awaken from a weird dream!', type = 'inform', duration = 5000, position = "center-right", })
        else
            QBCore.Functions.Notify('You\'ve awaken from a weird dream!', 'primary', 5000)
        end
        SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
        Citizen.Wait(10000)
        ResetPedMovementClipset(player, 0)
        ClearTimecycleModifier()
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        SetPedMotionBlur(player, false)
        ClearPedTasks(player)
    end
end

function PixieDream2()
    if not laundry then
        laundry = true
        bunker = true
        local player = PlayerPedId()
        startCoords = GetEntityCoords(player)
        startHeading = GetEntityHeading(player)
        ShakeGameplayCam('DRUNK_SHAKE', 1.25)
        SetTimecycleModifierStrength(1.0)
        SetTimecycleModifier("BikerFilter")
        TriggerEvent("InteractSound_CL:PlayOnOne", "coinsdrop", Config.MoneyVol)
        DoScreenFadeOut(8000)
        loadAnimDict('random@drunk_driver_1') 
        TaskPlayAnim(player, "random@drunk_driver_1", "drunk_fall_over", 8.0, 8.0, -1, 0, 0, false, false, false ) 
        Citizen.Wait(3000)
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, true, true, true )
        while not IsScreenFadedOut() do Wait(100) end
        SetEntityCoords(player, Config.Money.Coords) 
        SetEntityHeading(player, Config.Money.Heading) 
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, false, false, false )
        Citizen.Wait(2000)
        DoScreenFadeIn(8000)
        if Config.Utils == "ox" then
            lib.notify({ title = '', description = 'You\'ve awaken in a strange place!', type = 'inform', duration = 5000, position = "center-right", })
        else
            QBCore.Functions.Notify("You\'ve awaken in a strange place!", "info")
        end
        SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
        Citizen.Wait(10000)      
        ResetPedMovementClipset(player, 0) 
        ClearTimecycleModifier()        
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        Citizen.Wait(5000)        
        ClearPedTasks(player)
    elseif laundry then
        laundry = false
        bunker = false
        local player = PlayerPedId()
        ShakeGameplayCam('DRUNK_SHAKE', 1.25)
        SetTimecycleModifierStrength(1.0)
        SetTimecycleModifier("BikerFilter")
        TriggerEvent("InteractSound_CL:PlayOnOne", "lullaby", Config.PublicVol)
        DoScreenFadeOut(8000)
        loadAnimDict('random@drunk_driver_1') 
        TaskPlayAnim(player, "random@drunk_driver_1", "drunk_fall_over", 8.0, 8.0, -1, 0, 0, false, false, false )    
        Citizen.Wait(3000)
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, true, true, true )
        while not IsScreenFadedOut() do Wait(100) end
        SetEntityCoords(player, Config.Public.Coords) 
        SetEntityHeading(player, Config.Public.Heading) 
        loadAnimDict('timetable@tracy@sleep@') 
        TaskPlayAnim(player, "timetable@tracy@sleep@", "idle_c", 8.0, 8.0, -1, 0, 0, false, false, false )
        Citizen.Wait(2000)
        DoScreenFadeIn(8000)
        if Config.Utils == "ox" then
            lib.notify({ title = '', description = 'You\'ve awaken from a weird dream!', type = 'inform', duration = 5000, position = "center-right", })
        else
            QBCore.Functions.Notify('You\'ve awaken from a weird dream!', 'primary', 5000)
        end
        SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
        Citizen.Wait(10000)
        ResetPedMovementClipset(player, 0)
        ClearTimecycleModifier()
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        SetPedMotionBlur(player, false)
        ClearPedTasks(player)
    end
end
