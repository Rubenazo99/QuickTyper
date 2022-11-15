local w, h = love.graphics.getDimensions()

Actor = Actor or require "src/actor"
TypeActor = TypeActor or require "src/scripts/TypeActor"
Vector = Vector or require "src/Vector"
Image = Image or require "src/scripts/Image"

love.filesystem.load("src/scripts/Audios.lua")()

love.graphics.setDefaultFilter('nearest', 'nearest')

local debug = true

-- La lista de actores mientras se ejecute el juego
--==================================================
local actorList = {}

function love.load()

    -- Carga todos los fondos predeterminados
    --==========================================
    local bg1 = Image("src/textures/bg1.png", w / 2, h / 2)
    table.insert(actorList, bg1)

    local bg2 = Image("src/textures/bg3.png", w / 2, h / 2)
    table.insert(actorList, bg2)

    local bg3 = Image("src/textures/bg2.png", w / 2, h / 2)
    table.insert(actorList, bg3)

    local typeActor = TypeActor(w/2 - 460, 280)
    table.insert(actorList, typeActor)
    
    -- Carga los audios
    --==================
    audioLoad()

end

function love.update(dt)

    for index, actor in pairs(actorList) do
        actor:update(dt)
    end

end

function love.draw()

    --spriteDraw() --Se dibuja tanto el fondo como la mesa de escribir
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