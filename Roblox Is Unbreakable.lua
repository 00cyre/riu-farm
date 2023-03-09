wait(8);
if not game:IsLoaded() then
	game.Loaded:Wait();
end;
local UserInputService = game:GetService("UserInputService");
Toggle = true;
local UserInputService = game:GetService("UserInputService");
local gui = Instance.new("ScreenGui");
gui.Name = "TextLabelGui";
gui.Parent = game.Players.LocalPlayer.PlayerGui;
local textLabel = Instance.new("TextLabel");
textLabel.Name = "TextLabel";
textLabel.Size = UDim2.new(0, 200, 0, 50);
textLabel.Position = UDim2.new(1, -210, 1, -60);
textLabel.AnchorPoint = Vector2.new(1, 1);
textLabel.Font = Enum.Font.SourceSansBold;
textLabel.TextSize = 30;
textLabel.TextColor3 = Color3.fromRGB(0, 255, 255);
textLabel.TextTransparency = 0;
textLabel.BackgroundTransparency = 1;
textLabel.BorderSizePixel = 0;
textLabel.Text = "LXX";
textLabel.Parent = gui;
local stat = Instance.new("TextLabel");
stat.Name = "Target";
stat.Size = UDim2.new(0, 200, 0, 50);
stat.Position = UDim2.new(1, -210, 1, -30);
stat.AnchorPoint = Vector2.new(1, 1);
stat.Font = Enum.Font.SourceSansBold;
stat.TextSize = 30;
stat.TextColor3 = Color3.fromRGB(0, 255, 255);
stat.TextTransparency = 0;
stat.BackgroundTransparency = 1;
stat.BorderSizePixel = 0;
stat.Text = "Target";
stat.Parent = gui;
(loadstring(game:HttpGet("https://pastebin.com/raw/yJzq5ceV", true)))();
function ToggleScript()
	Toggle = not Toggle;
end;
function Rejoin()
	(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer);
end;
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.P and (not gameProcessed) then
		ToggleScript();
	end;
	if input.KeyCode == Enum.KeyCode.O then
		Rejoin();
	end;
end);
local counter = 0;
while true do
	task.wait();
	if Toggle then
		Enemies = (game:GetService("Workspace")).NPCs.Hostile:GetChildren();
		for i = 1, 5 do
			local v = Enemies[i];
			if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and (v:FindFirstChildOfClass("Humanoid")).Health > 0 then
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(v.PrimaryPart.Position - v.PrimaryPart.CFrame.lookVector * 7, v.PrimaryPart.Position);
				local cameraOffset = Vector3.new(0, 3, 0);
				game.Workspace.CurrentCamera.CFrame = CFrame.new(v.PrimaryPart.Position - v.PrimaryPart.CFrame.lookVector * 7 + cameraOffset, v.PrimaryPart.Position);
				stat.Text = "Target: " .. v.Name;
			end;
			pcall(function()
				if game.Players.LocalPlayer:DistanceFromCharacter(v.PrimaryPart.Position) < 15 then
					if not (game:GetService("Workspace"))[game.Players.LocalPlayer.Name]:FindFirstChild("The World") then
						game.Players.LocalPlayer.Backpack.Events.HotkeyEvent.FireServer("", "Stand Summon", true, false);
					end;
					local hotkeys = {
						"Kick",
						"Barrage",
						"The World",
						"Throwing Knives",
						"Stand Summon",
						"Light Punch Stand",
						"Stand Kick",
						"Chop",
					};
					for _, hotkeyName in ipairs(hotkeys) do
						local hotkeyCooldown = nil;
						for _, v in pairs(game.Players.LocalPlayer.PlayerGui.HUD.Screen.Cooldowns:GetChildren()) do
							if v:FindFirstChild("AbilityName") and v.AbilityName.Text == hotkeyName and v:FindFirstChild("Cooldown") then
								hotkeyCooldown = v.Cooldown.Value;
								break;
							end;
						end;
						if hotkeyCooldown == nil or hotkeyCooldown <= 0 then
							game.Players.LocalPlayer.Backpack.Events.HotkeyEvent:FireServer(hotkeyName, true, false);
							wait();
						end;
					end;
				end;
			end);
		end;
	end;
end;
