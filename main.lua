local menu = require('projects/guessing game/modules/menu')

main = function()
	choice = 0
	
	repeat
		choice = menu.showMainMenu()
		os.execute("cls")
		
		if choice == 1 then
		
		elseif choice == 2 then
			
		elseif choice == 3 then
			menu.showPlayerCreateMenu()
		elseif choice == 4 then
		
		else
			print("[ERROR]: You have input an invalid choice")
		end	
		
	until choice == 5
	
	print("Game over!")
end

main()