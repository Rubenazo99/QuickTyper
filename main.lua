local w, h = love.graphics.getDimensions()

Actor = Actor or require "src/actor"
ExternalTextIntegrer = ExternalTextIntegrer or require "src/scripts/ExternalTextIntegrer"
TypeActor = TypeActor or require "src/scripts/TypeActor"
Vector = Vector or require "src/Vector"
Image = Image or require "src/scripts/Image"
Timer = Timer or require "src/scripts/Timer"
DepletingBar = DepletingBar or require "src/scripts/DepletingBar"
--love.filesystem.load("src/scripts/Audios.lua")()
local timer

love.graphics.setDefaultFilter('nearest', 'nearest')

local debug = true

-- La lista de actores mientras se ejecute el juego
--==================================================
actorList = {}

function love.load()
    --Cargamos la font solo para el texto de exit
    exitFont = love.graphics.newFont("assets/fonts/courier.ttf", 50)
    -- Carga todos los fondos predeterminados
    --==========================================
    local bg1 = Image("src/textures/bg1.png", w / 2, h / 2)
    table.insert(actorList, bg1)

    local bg2 = Image("src/textures/bg3.png", w / 2, h / 2)
    table.insert(actorList, bg2)

    local bg3 = Image("src/textures/bg2.png", w / 2, h / 2)
    table.insert(actorList, bg3)

    local typeActor = TypeActor(w / 2 - 460, 280)
    table.insert(actorList, typeActor)

    local textInteger = ExternalTextIntegrer()
    table.insert(actorList, textInteger)

    -- Carga los audios
    --==================
    --audioLoad()

    local bar = DepletingBar(w/2-500,20,15, 1000)
    table.insert(actorList, bar)
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

    love.graphics.setFont(exitFont)
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print("ESC to exit", w-950, h-95)
        --lo dejamos como estava
        love.graphics.setColor(255, 255, 255, 1)

end

function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    elseif key == "return" then
        ReturnActor("TypeActor"):addEnter()
    end

    if key == "p" then
        print("key pressed")
        ReturnActor("DepletingBar").timer:play()
    end
end

function love.textinput(text)
    ReturnActor("TypeActor"):addKey(text)
    audioSound()
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
