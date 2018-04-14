local plr = require("projects/guessing game/modules/player")
local gm = require("projects/guessing game/modules/game")
local menu = {}

function menu.fileExists(path)
	local file = io.open(path, "r")
	
	if file ~= nil then file:close() end
	return file ~= nil and true or false
end

function menu.showMainMenu()
	local choice = nil
	
	print([[
	
	==============[Guessing game]==============
	|                                         |
	|	1.	Start the game            |
	|	2.	Select a player           |
	|	3.	Create a new player       |
	|	4.	Display all players       |
	|	5.	Quit                      |
	|                                         |
	===========================================
	]])
	io.write("Input the operation number: ")
	choice = io.read()
	
	return tonumber(choice)
end

function menu.showPlayerCreateMenu()
	local choice = nil
	local name = nil
	
	repeat
		print([[
	
	==========[Creating a new player]==========
	|                                         |
	|	1.	Set a player name         |
	|	2.	Go back                   |
	|                                         |
	===========================================
	]])
		io.write("Input the operation number: ")
		choice = tonumber(io.read())
		os.execute("cls")
		
		if choice == 1 then
			io.write("Input the player name: ")
			name = tostring(io.read())
			player.name = name
			if menu.fileExists("projects/guessing game/data/"..name..".cfg") == true then
				print("[ERROR]: This player name is already registered")
			else
				local file = io.open("projects/guessing game/data/"..name..".cfg", "w")
				local cfgFile = io.open("projects/guessing game/data/config.cfg", "a")
				file:write("[Name: "..name.."]\r\n")
				file:write("[Score: 0]")
				cfgFile:write(name.."\r\n")
				cfgFile:close()
				file:close()
			end
		else
			print("[ERROR]: You have input an invalid choice")
		end
	until choice == 2
	
	return name
end

function menu.showPlayerSelectMenu()
	local players = plr.loadPlayers()
	local choice = nil
	local playerStr = ""
	
	for i = 1, #players, 1 do
		playerStr = string.format("%s\t|\t%d.\t%s\t\t\t\t\t\t|\r\n", playerStr, i, players[i])
	end
	playerStr = playerStr.."\t|\t"..(#players + 1).."\tGo back\t\t\t|"
	
	repeat
		print("\r\n\t==========[Select a new player]==========")
		print("\t|\t\t\t\t\t|")
		print(playerStr)
		print("\t|\t\t\t\t\t|")
		print("\t=========================================")

		io.write("Input the player's number that you want to select: ")
		choice = tonumber(io.read())
		os.execute("cls")
		
		if choice >= 1 and choice < #players + 1 then
			for line in io.lines(string.format("projects/guessing game/data/%s.cfg", string.sub(players[choice], 0, #players[choice] - 1))) do
				if string.match(line, "Name") then
					player.name = string.sub(line, 8, #line - 2)
				elseif string.match(line, "Score") then
					player.score = tonumber(string.sub(line, 8, #line - 1))
				end
			end
			
			break
		else
			print("[ERROR]: You have input an invalid player number")
		end
	until choice == #players + 1
	
	print("[INFO]: You have selected \""..player.name.."\" with the score of \""..player.score.."\"")
end

function menu.showPlayers()
	local names = nil
	local scores = nil
	names, scores = plr.getPlayersInfo()
	local choice = nil
	local playerStr = ""
	
	playerStr = "\t|\t*\tNames\tScore\t\t|\r\n\t|\t-------\t-------\t-------\t\t|\r\n"
	for i = 1, #names, 1 do
		playerStr = string.format("%s\t|\t*\t%s\t%d\t\t|\r\n", playerStr, names[i], scores[i])
	end
	playerStr = playerStr.."\t|\t*\tNames\tScore\t\t|\r\n\t|\t-------\t-------\t-------\t\t|\r\n\t|\t\t\t\t\t|\r\n"
	playerStr = playerStr.."\t|\t1.\tGo back\t\t\t|"
	
	repeat
		print("\r\n\t==============[Player list]==============")
		print("\t|\t\t\t\t\t|")
		print(playerStr)
		print("\t|\t\t\t\t\t|")
		print("\t=========================================")
		io.write("Input the operation number: ")
		choice = tonumber(io.read())
		os.execute("cls")
		
		if choice ~= 1 then
			print("[ERROR]: You have input an invalid choice")
		end
	until choice == 1
	
	return name
end

function menu.showDiffMenu()
	local choice = nil
	
	repeat
		print([[
	
	=============[Game difficulty]=============
	|                                         |
	|	1.	Novice                    |
	|	2.	Avergae                   |
	|	3.	Hard                      |
	|	4.	Impossible                |
	|	5.	Go back                   |
	|                                         |
	===========================================
	]])
		io.write("Input the difficulty number: ")
		choice = tonumber(io.read())
		os.execute("cls")

		if choice >= 1 and choice < 5 then
			diff = choice

			gm.start()
		else
			print("[ERROR]: You have input an invalid choice")
		end
	until choice == 5
end

return menu