repeat task.wait() until game:IsLoaded()

local GuiLibrary = loadstring("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua", true)()

GuiLibrary:CreateMainGui()

GuiLibrary:CreateWindow("Combat")
GuiLibrary:CreateWindow("Blatant")

GuiLibrary:CreateModule(
    "Combat",
    "Velocity",
    function()
        print("enabled!")
    end,
    function()
        print("disabled!")
    end
)
