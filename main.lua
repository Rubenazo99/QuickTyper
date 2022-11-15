Actor = Actor or require "src/actor"

love.graphics.setDefaultFilter('nearest', 'nearest')

-- La lista de actores mientras se ejecute el juego
local actorList = {}

function love.load()

    textFileNames = love.filesystem.getDirectoryItems("TextFiles")

end

function love.update(dt)
end

function love.draw()

end

function love.keypressed(key)
    if key == 'a' then
        for i = 1, #textFileNames do
            print(textFileNames[i])
        end
       
        for i, file in pairs(textFileNames) do
            print(love.filesystem.read("TextFiles/"..file))
        end
    end


end

--========================================

function ReturnActor(name)
    for index, actor in pairs(actorList) do
        if actor.name == name then
            return actor, index
        end
    end
end

function RemoveActor(self)
    local actor, index = ReturnActor(self.name)
    table.remove(actorList, index)
end