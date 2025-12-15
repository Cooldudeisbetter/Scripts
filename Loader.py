local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Slendyvn/Draggable/refs/heads/main/Draggable'))()

-- This was coded on mobile

local Window = OrionLib:MakeWindow({Name = "Script Loader", HidePremium = false, SaveConfig = true, IntroText="Script Loader",Icon="rbxassetid://16481845020",ConfigFolder = "SLC"})

local scripttab = Window:MakeTab({
	Name = "scripts",
	Icon = "rbxassetid://129118857922530"
})

local settingstab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://6918434507"
})

local keyless = scripttab:AddSection({
	Name = "Keyless Scripts"
})

local key = scripttab:AddSection({
	Name = "Key System Scripts"
})

local gamestab = Window:MakeTab({
	Name = "Game Scripts",
	Icon = "rbxassetid://238317630"
})

local function notif(name,ctx,time,img)
	OrionLib:MakeNotification({
		Name = name,
		Content = ctx,
		Image = img,
		Time = time
		
	})
end

notif("Loaded","script loader has been loaded","rbxassetid://11604833061",1)

keyless:AddButton({
	Name = "Solara Hub",
	
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/SH.lua'))()
		notif("Script Loaded","Solara Hub has been loaded","rbxassetid://11604833061",5)
	
	end
})

key:AddButton({
	Name = "Monke Hub",
	
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Monkescripter589/monke-hub-/refs/heads/main/monke%20hub"))()
		notif("Script Loaded","Monke Hub has been loaded","rbxassetid://11604833061",5)
	
	end
})

keyless:AddButton({
	Name = "Internal",
	
	Callback = function()
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/MappleGaming208/Magic/main/Scripts/lua/zzerexx/Internal_UI.lua"))()
		task.wait(3)
		print("Internal Ui Loaded! Press insert to open or press the internal ui button to open!")
		notif("Script Loaded","Internal UI has been loaded","rbxassetid://11604833061",5)

	end
})


key:AddButton({
	Name = "Luna Hub (Key is UnoXLuna)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/UnoXLuna/Luna-Hub/refs/heads/main/Script-Loader"))()
		notif("Script Loaded","Luna Hub has been loaded","rbxassetid://11604833061",5)
	end
})

settingstab:AddButton({
	Name = "Destroy Hub",
	Callback = function()
		OrionLib:Destroy()
	end
})


local fortlinespt = gamestab:AddSection({
	Name = "Fortline"
})
fortlinespt:AddButton({
	Name = "Hydra Hub",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/FORTLINE-free-vip-script-24909"))()
		notif("Script Loaded","Hydra Hub has been loaded","rbxassetid://11604833061",5)
	end
})


OrionLib:Init()
