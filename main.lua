Actor = Actor or require "src/actor"
TypeActor = TypeActor or rquire "src/scripts/TypeActor"

love.graphics.setDefaultFilter('nearest', 'nearest')

-- La lista de actores mientras se ejecute el juego
local actorList = {}

function love.load()

    local typeActor = TypeActor(20, 20)

end

function love.update(dt)

end

function love.draw()

end

function love.keypressed(key)

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