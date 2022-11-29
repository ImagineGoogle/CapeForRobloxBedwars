local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

local GuiLibrary = {}
local windows = {}
local modules = {}
local folderDirectory = "cape/"
local saveName = tostring(game.GameId) .. "-" .. "Save.json"
local toggledColour = Color3.fromRGB(0, 106, 206)

local function betterisfile(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local function loadModules()
	local HttpService = game:GetService("HttpService")
	if (readfile and isfile and betterisfile(folderDirectory .. saveName)) then
		modules = HttpService:JSONDecode(readfile(folderDirectory .. saveName))
	end
end

local function saveModules()
	local json
	local HttpService = game:GetService("HttpService")
	if (writefile) then
		json = HttpService:JSONEncode(modules)
		writefile(saveName, json)
	end
end

local function randomString()
    local randomlength = math.random(10,100)
    local array = {}

    for i = 1, randomlength do
        array[i] = string.char(math.random(32, 126))
    end

    return table.concat(array)
end

if not isfolder("cape") then
    makefolder("cape")
end

loadModules()

GuiLibrary.Gui = Instance.new("ScreenGui")
local gui = GuiLibrary.Gui
gui.DisplayOrder = 99999
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.IgnoreGuiInset = true
gui.OnTopOfCoreBlur = true
gui.Name = randomString()
if gethui and (not KRNL_LOADED) then
    gui.Parent = gethui()
elseif not is_sirhurt_closure and syn and syn.protect_gui then
    syn.protect_gui(gui)
    gui.Parent = game:GetService("CoreGui")
else
    gui.Parent = game:GetService("CoreGui")
end

function GuiLibrary.CreateMainGui()


    GuiLibrary.ScaledFrame = Instance.new("Frame")
    local ScaledFrame = GuiLibrary.ScaledFrame

    GuiLibrary.HUDFrame = Instance.new("Frame")
    local HUDFrame = GuiLibrary.HUDFrame

    local ArrayList = Instance.new("Frame")
    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    local Notifications = Instance.new("Frame")
    local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")

    ScaledFrame.Name = "ScaledFrame"
    ScaledFrame.Parent = gui
    ScaledFrame.AnchorPoint = Vector2.new(0, 0.5)
    ScaledFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScaledFrame.BackgroundTransparency = 1.000
    ScaledFrame.BorderSizePixel = 0
    ScaledFrame.Position = UDim2.new(0, 0, -1.4, 0)
    ScaledFrame.Size = UDim2.new(1, 0, 1, 0)
    ScaledFrame.Active = true

    HUDFrame.Name = "HUDFrame"
    HUDFrame.Parent = ScaledFrame
    HUDFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    HUDFrame.BackgroundTransparency = 0.500
    HUDFrame.Size = UDim2.new(1, 0, 1, 0)
    HUDFrame.Visible = false

    ArrayList.Name = "ArrayList"
    ArrayList.Parent = ScaledFrame
    ArrayList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ArrayList.BackgroundTransparency = 1.000
    ArrayList.BorderSizePixel = 0
    ArrayList.Size = UDim2.new(0.146279708, 0, 1, 0)

    UIAspectRatioConstraint_2.Parent = ArrayList
    UIAspectRatioConstraint_2.AspectRatio = 0.200
    UIAspectRatioConstraint_2.AspectType = Enum.AspectType.ScaleWithParentSize
    UIAspectRatioConstraint_2.DominantAxis = Enum.DominantAxis.Height

    Notifications.Name = "Notifications"
    Notifications.Parent = ScaledFrame
    Notifications.AnchorPoint = Vector2.new(1, 0)
    Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notifications.BackgroundTransparency = 1.000
    Notifications.BorderSizePixel = 0
    Notifications.Position = UDim2.new(1, 0, 0, 0)
    Notifications.Size = UDim2.new(0.107257076, 0, 1, 0)

    UIAspectRatioConstraint_3.Parent = Notifications
    UIAspectRatioConstraint_3.AspectRatio = 0.280
    UIAspectRatioConstraint_3.AspectType = Enum.AspectType.ScaleWithParentSize
    UIAspectRatioConstraint_3.DominantAxis = Enum.DominantAxis.Height

    UIS.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.Y and not gameProcessedEvent then
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

            if HUDFrame.Visible == true then
                task.spawn(function()
                    task.wait(0.3)
                    HUDFrame.Visible = false
                    for i, v in pairs(HUDFrame:GetDescendants()) do
                        if v:IsA("TextButton") and v:FindFirstChild("ScaledText") then
                            if v.BackgroundColor3 ~= toggledColour then
                                v.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            end
                        end
                    end
                end)
                TS:Create(ScaledFrame, tweenInfo, {Position = UDim2.new(0, 0, -1.4, 0)}):Play()
            else
                HUDFrame.Visible = true
                TS:Create(ScaledFrame, tweenInfo, {Position = UDim2.new(0, 0, 0.5, 0)}):Play()
            end
        end
    end)
end

function GuiLibrary.CreateWindow(name)

    local Window = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local DropDown = Instance.new("ImageButton")
    local Line = Instance.new("Frame")
    local List = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local UICorner = Instance.new("UICorner")


    Window.Name = tostring(name)
    Window.Parent = GuiLibrary.HUDFrame
    Window.Active = true
    Window.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0.0122645451, 0, 0.0249376539, 0)
    for i, v in pairs(windows) do
        Window.Position = Window.Position + UDim2.new(0.143, 0, 0, 0)
    end

    Window.Size = UDim2.new(0.137230784, 0, 0.0511221997, 0)

    Title.Name = "Title"
    Title.Parent = Window
    Title.AnchorPoint = Vector2.new(0, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.04, 0, 0.5, 0)
    Title.Size = UDim2.new(0.42600891, 0, 0.414634109, 0)
    Title.Font = Enum.Font.SourceSansSemibold
    Title.Text = tostring(name)
    Title.TextColor3 = Color3.fromRGB(207, 207, 207)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    DropDown.Name = "DropDown"
    DropDown.Parent = Window
    DropDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropDown.BackgroundTransparency = 1.000
    DropDown.Position = UDim2.new(0.879999995, 0, 0.24390246, 0)
    DropDown.Rotation = 90
    DropDown.Size = UDim2.new(0.0896860883, 0, 0.48780483, 0)
    DropDown.Image = "rbxassetid://6993472329"
    DropDown.ImageColor3 = Color3.fromRGB(207, 207, 207)

    Line.Name = "Line"
    Line.Parent = Window
    Line.AnchorPoint = Vector2.new(0, 1)
    Line.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Size = UDim2.new(1, 0, 0.0731707215, 0)
    Line.Visible = true

    List.Name = "List"
    List.Parent = Window
    List.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    List.BackgroundTransparency = 1.000
    List.BorderSizePixel = 0
    List.Position = UDim2.new(0, 0, 0.999999166, 0)
    List.Size = UDim2.new(1, 0, 17, 0)
    List.Visible = true

    UIListLayout.Parent = List

    UIAspectRatioConstraint.Parent = Window
    UIAspectRatioConstraint.AspectRatio = 5.439

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Window

    table.insert(windows, Window)

    DropDown.MouseButton1Click:Connect(function()
        if DropDown.Rotation == 270 then
            DropDown.Rotation = 90
            List.Visible = true
            Line.Visible = true
        else
            DropDown.Rotation = 270
            List.Visible = false
            Line.Visible = false
        end
    end)
end

function GuiLibrary.CreateModule(window, name, func)
    local options = {}
    local enabled = false

    local Module = Instance.new("TextButton")
    local Divider = Instance.new("Frame")
    local ScaledText = Instance.new("TextLabel")

    Module.Name = name
    Module.Parent = GuiLibrary.HUDFrame[window].List
    Module.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Module.BorderSizePixel = 0
    Module.Size = UDim2.new(1, 0, 0.060258247, 0)
    Module.AutoButtonColor = false
    Module.Font = Enum.Font.SourceSans
    Module.Text = ""
    Module.TextColor3 = Color3.fromRGB(180, 180, 180)
    Module.TextSize = 14.000
    Module.TextXAlignment = Enum.TextXAlignment.Left

    Divider.Name = "Divider"
    Divider.Parent = Module
    Divider.AnchorPoint = Vector2.new(0, 1)
    Divider.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Divider.BorderSizePixel = 0
    Divider.Position = UDim2.new(0, 0, 1, 0)
    Divider.Size = UDim2.new(1, 0, 0, 1)

    ScaledText.Name = "ScaledText"
    ScaledText.Parent = Module
    ScaledText.AnchorPoint = Vector2.new(0, 0.5)
    ScaledText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScaledText.BackgroundTransparency = 1.000
    ScaledText.Position = UDim2.new(0.0346534587, 0, 0.5, 0)
    ScaledText.Size = UDim2.new(0.964125574, 0, 0.357142866, 0)
    ScaledText.Font = Enum.Font.SourceSans
    ScaledText.Text = name
    ScaledText.TextColor3 = Color3.fromRGB(180, 180, 180)
    ScaledText.TextScaled = true
    ScaledText.TextSize = 14.000
    ScaledText.TextWrapped = true
    ScaledText.TextXAlignment = Enum.TextXAlignment.Left

    local function enable()
        enabled = true
            modules[name] = true
            saveModules()

            local suc, err = pcall(function()
                task.spawn(function()
                    func(true)
                end)
            end)
            if err then
                warn(err)
            end
            Module.BackgroundColor3 = toggledColour
            Module.ScaledText.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    local function disable()
        enabled = false
        modules[name] = false
        saveModules()

        local suc, err = pcall(function()
            task.spawn(function()
                func(false)
            end)
        end)
        if err then
            warn(err)
        end
        Module.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Module.ScaledText.TextColor3 = Color3.fromRGB(180, 180, 180)
    end

    function options.Toggle(enabled)
        if enabled == true then
            enable()
        elseif enabled == false then
            disable()
        end
    end

    Module.MouseEnter:Connect(function()
        if Module.BackgroundColor3 ~= toggledColour then
            Module.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
    end)

    Module.MouseLeave:Connect(function()
        if Module.BackgroundColor3 ~= toggledColour then
            Module.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
    end)

    Module.MouseButton1Click:Connect(function()
        if enabled == false then
            enable()
        else
            disable()
        end
    end)

    if modules[name].Enabled == true then
        firesignal(Module.MouseButton1Click)
    else
        modules[name] = {Name = name, Enabled = false, Function = func}
        saveModules()
    end

    return options
end

function GuiLibrary.Panic()
    for _, module in pairs(modules) do
        module.Function(false)
    end
end

return GuiLibrary
