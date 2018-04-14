local player = {name = nil, score = nil}

function player:new(name, score)
	setmetatable({}, player)
	
	self.name= name
	self.score = score
	
	return self
end

function player.loadPlayers()
	local players = {}

	for line in io.lines("projects/guessing game/data/config.cfg") do
		players[#players + 1] = line
	end
	
	return players
end

function player.getPlayersInfo()
	local names = {}
	local scores = {}

	for line in io.lines("projects/guessing game/data/config.cfg") do
		for pInfo in io.lines("projects/guessing game/data/"..string.sub(line, 0, #line - 1)..".cfg") do
			if string.match(pInfo, "Name") then
				names[#names + 1] = string.sub(pInfo, 8, #pInfo - 2)
			elseif string.match(pInfo, "Score") then
				scores[#scores + 1] = tonumber(string.sub(pInfo, 8, #pInfo - 1))
			end
		end
	end
	
	return names, scores
end

return player