repeat task.wait() until game:IsLoaded()

local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/MainScript.lua", true))()')

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua"), true)()

GuiLibrary:CreateMainGui()

GuiLibrary:CreateWindow("Combat")
GuiLibrary:CreateWindow("Blatant")
GuiLibrary:CreateWindow("Render")
GuiLibrary:CreateWindow("Utility")
GuiLibrary:CreateWindow("World")

GuiLibrary:CreateModule("Combat", "Velocity", function(callback)
    if callback then
        print("enabled!")
    else
        print("disabled!")
    end
end)
