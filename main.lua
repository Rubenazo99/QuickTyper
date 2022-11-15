--[[
    Your love2d game start here
]]
local w, h = love.graphics.getDimensions()

love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
    love.filesystem.load("src/RenderSprites.lua")()
    love.filesystem.load("src/Audios.lua")()
    
    audioLoad()
    spriteLoad()
end

function love.update(dt)
    audioLoad()
end

function love.draw()

    spriteDraw() --Se dibuja tanto el fondo como la mesa de escribir

end

