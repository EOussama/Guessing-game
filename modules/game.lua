local game = {}
local min, max = 0, 0

function game:start()
    local input
    math.randomseed(os.clock())
    min = diff * math.random(10)
    max = (diff * (min * math.random(5))) + 1
    guess = math.random(min, max)

    repeat
        print([[
	
	=============[Guess the number]=============
	|             Current score: ]].. player.score ..[[             |
        | Type "reload" to re-generate the numbers |
        |	Type "finish" to end the game      |
	|                                          |
	============================================
	]])
        print(string.format("Input a number between %d and %d", min, max))
        input = io.read()
        os.execute("cls")

        if tostring(input) == 'reload' then
            math.randomseed(os.clock())
            min = diff * math.random(10)
            max = (diff * (min * math.random(5))) + 1
            guess = math.random(min, max)
        elseif tonumber(input) == guess then
            print("You guessed the correct number!")
            player.score = player.score + 1
            math.randomseed(os.clock())
            guess = math.random(min, max)
        elseif tonumber(input) ~= guess then
            print("You guessed the wrong number!")
        else
            print("[ERROR]: You have input an invalid choice")
        end
    until tostring(input) == 'finish'

    if player.name ~= 'Player' then
        local file = io.open("projects/guessing game/data/"..player.name..".cfg", "w")
        file:write("[Name: "..player.name.."]\r\n")
        file:write("[Score: "..player.score.."]")
        file:close()
    end
end

return game