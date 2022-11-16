local w, h = love.graphics.getDimensions()

Actor = Actor or require "src/actor"
TypeActor = TypeActor or require "src/scripts/TypeActor"
Vector = Vector or require "src/Vector"

love.graphics.setDefaultFilter('nearest', 'nearest')

local debug = true

-- La lista de actores mientras se ejecute el juego
local actorList = {}

function love.load()
    local font = love.graphics.newFont("assets/fonts/courier.ttf", 15)
    love.filesystem.load("src/scripts/RenderSprites.lua")()
    love.filesystem.load("src/scripts/Audios.lua")()
    local typeActor = TypeActor(w/2 - 300, 200)
    table.insert(actorList, typeActor)
    
    audioLoad()
    spriteLoad()

end

function love.update(dt)

    for index, actor in pairs(actorList) do
        actor:update(dt)
    end

end

function love.draw()

    spriteDraw() --Se dibuja tanto el fondo como la mesa de escribir
    for index, actor in pairs(actorList) do
        actor:draw()
    end


end

function love.keypressed(key)

    if #key == 1 then
        ReturnActor("TypeActor"):addKey(key)
    elseif key == "space" then
        ReturnActor("TypeActor"):addKey(" ")
    elseif key == "escape" then
        love.event.quit()
    elseif key == "return" and debug == true then
        ReturnActor("TypeActor"):resetText()
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

function AddActor(self)
    table.insert(actorList, self)
end