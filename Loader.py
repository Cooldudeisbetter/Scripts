local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Slendyvn/Draggable/refs/heads/main/Draggable'))()

-- This was coded on mobile

local Window = OrionLib:MakeWindow({Name = "Script Loader", HidePremium = false, SaveConfig = true, IntroText="Script Loader",ConfigFolder = "SLC"})

local scripttab = Window:MakeTab({
	Name = "scripts",
	Icon = "rbxassetid://129118857922530"
})


local function notif(name,ctx,time,img)
	OrionLib:MakeNotification({
		Name = name,
		Content = ctx,
		Image = img,
		Time = time
		
	})
end

notif("Loaded","script loader has been loaded","5","1")

scripttab:AddButton({
	Name = "Solara Hub",
	
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/SH.lua'))()
		notif("Script Loaded","Solara Hub has been loaded","123",5)
	
	end
})

scripttab:AddButton({
	Name = "Monke Hub",
	
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Monkescripter589/monke-hub-/refs/heads/main/monke%20hub"))()
		notif("Script Loaded","Monke Hub has been loaded","123",5)
	
	end
})

scripttab:AddButton({
	Name = "Internal",
	
	Callback = function()
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/MappleGaming208/Magic/main/Scripts/lua/zzerexx/Internal_UI.lua"))()
		task.wait(3)
		print("Internal Ui Loaded! Press insert to open or press the internal ui button to open!")
		notif("Script Loaded","Internal UI has been loaded","123",5)

	end
})

OrionLib:Init()
