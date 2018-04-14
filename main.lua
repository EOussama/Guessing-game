local menu = require('projects/guessing game/modules/menu')
local plr = require('projects/guessing game/modules/player')
player = plr:new("Player", 0)

main = function()
	os.execute("cls")
	choice = 0
	
	if menu.fileExists("projects/guessing game/data/config.cfg") == false then
		local file = io.open("projects/guessing game/data/config.cfg", "w")
		file:close()
	end
	
	repeat
		choice = menu.showMainMenu()
		os.execute("cls")
		
		if choice == 1 then
		
		elseif choice == 2 then
			menu.showPlayerSelectMenu()
		elseif choice == 3 then
			menu.showPlayerCreateMenu()
		elseif choice == 4 then
			menu.showPlayers()
		else
			print("[ERROR]: You have input an invalid choice")
		end	
		
	until choice == 5
	
	print("Game over!")
end

main()