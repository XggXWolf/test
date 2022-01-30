-- Gui to Lua
-- Version: 3.2


local FindUndercover = Instance.new("ScreenGui")
local Under = Instance.new("Frame")
local UcName = Instance.new("TextLabel")
local Uc = Instance.new("TextLabel")

--Properties:

FindUndercover.Name = "FindUndercover"
FindUndercover.Parent = game.CoreGui

Under.Name = "Under"
Under.Parent = FindUndercover
Under.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Under.Position = UDim2.new(0.847863317, 0, 0.851734996, 0)
Under.Size = UDim2.new(0, 178, 0, 74)
Under.Active = true
Under.Draggable = true

UcName.Name = "UcName"
UcName.Parent = Under
UcName.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
UcName.BorderSizePixel = 0
UcName.Position = UDim2.new(0, 0, 0.315459371, 0)
UcName.Size = UDim2.new(0, 178, 0, 50)
UcName.Font = Enum.Font.Roboto
UcName.Text = "Undercover"
UcName.TextColor3 = Color3.fromRGB(255, 255, 255)
UcName.TextSize = 15.000

Uc.Name = "Uc"
Uc.Parent = Under
Uc.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Uc.BorderSizePixel = 0
Uc.Position = UDim2.new(0, 0, -0.00886494387, 0)
Uc.Size = UDim2.new(0, 178, 0, 24)
Uc.Font = Enum.Font.Roboto
Uc.Text = "Undercover"
Uc.TextColor3 = Color3.fromRGB(255, 255, 255)
Uc.TextSize = 15.000


-- Script

local k = 1
local l = 0

while k > 0 do
	wait(1)
	print("while1")
	UcName.Text = "not found"

	for _,player in pairs(game:GetService("Players"):GetPlayers())do        

		local undercover = player.Backpack:FindFirstChild("Fake Check Target")

		if undercover  then
			
			local undercesp = undercover.Parent.Parent.Character
			
			local xraypart = undercesp.HumanoidRootPart
			local xraylabel = undercesp.Head
			local folder = Instance.new("Folder")
			folder.Name = "xray"
			folder.Parent = xraypart



			local function createSGUI(face)			
				local sgui = Instance.new("SurfaceGui")
				sgui.Parent = folder
				sgui.Face = face
				sgui.AlwaysOnTop = true
				sgui.Adornee = xraypart
				local frame = Instance.new("Frame")
				frame.Parent = sgui
				frame.Size = UDim2.new(1,0,1,0)
				frame.BackgroundColor3 = Color3.new(0,200,0)
				frame.BackgroundTransparency = 0.5
			end

			local function createBGUI()
				local bgui = Instance.new("BillboardGui")
				bgui.Parent = xraylabel
				bgui.AlwaysOnTop = true
				bgui.Size = UDim2.new(100,0,100,0)
				local label = Instance.new("TextLabel")
				label.Parent = bgui
				label.Text = "Undercover"
				label.TextColor3 = Color3.new(0,200,0)
				label.Size = UDim2.new(1,0,1,0)
				label.BackgroundTransparency = 100
				label.TextSize = 10
				label.AnchorPoint = Vector2.new(0,0.015)
			end


			if xraypart.xray:FindFirstChild("SurfaceGui") == nil then
				createSGUI(1)
				createSGUI(2)
				createSGUI(3)
				createSGUI(4)
				createSGUI(5)
				createSGUI(0)
				createBGUI()
				print("hi")
			end



			local function destroyGUI()
				folder:Destroy()
				xraylabel.BillboardGui:Destroy()
			end


			undercesp:WaitForChild('Humanoid').Died:Connect(function() -- If player is dead then destroy esp
				if  xraypart.xray:FindFirstChild("SurfaceGui") then
					destroyGUI()
				end
			end)


			
			
			
			UcName.Text = undercesp.Name
			k = 0
			l = 1
			while l >  0 do
				wait(1)
				local undercover = player.Backpack:FindFirstChild("Fake Check Target")
				if  undercover then
					print("while2")
				else
					UcName.Text = "not found"
					k = 1
					l = 0

				end        
			end
		else

		end
	end

end

k = 0
k = 1
