local menu = {}

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
	local choice = 0
	local name = ""
	
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
		else
			print("[ERROR]: You have input an invalid choice")
		end
	until choice == 2
	
	return name
end

return menu