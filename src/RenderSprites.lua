--TablaSprites = {}

function spriteLoad()
    background = love.graphics.newImage("Sprites/Background.png")
    baseTyping = love.graphics.newImage("Sprites/baseTyping.png")
end

function spriteDraw()
    love.graphics.draw(background, 0, 0, 0, w, h)
    love.graphics.draw(baseTyping, 0, 0, 0, 0.8, 0.8)
end
