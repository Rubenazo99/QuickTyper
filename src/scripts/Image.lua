-- Este es un simple script que nos muestra un objeto con imagen, nada más.
Actor = Actor or require "src/Actor"
bulRandom = false
local Image = Actor:extend()

function Image:new(imagePath, x, y, scale)
    Image.super.new(self, imagePath, x, y)

    self.scale = Vector.new(scale or self.scale.x, scale or self.scale.y)
end

function Image:update(dt)
    
end

function Image:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

function ExitPaper(Image)
    if love.keyboard.isDown("g") then
        bulRandom = true
    end
    if bulRandom then
        if Image.position.y < 1100 then --no hardcodear
            Image.position.y = Image.position.y + 10
        end
    end
end

function NewPaper(Image)
    if love.keyboard.isDown("h") then
        bulRandom = false
    end
    if not bulRandom then
        if Image.position.y > (430) then --no hardcodear
            Image.position.y = Image.position.y - 10
            
        end
    end
end

return Image
