-- Este es un simple script que nos muestra un objeto con imagen, nada más.
Actor = Actor or require "src/Actor"

local Image = Actor:extend()

function Image:new(imagePath, scale, x, y, animated, travelDistance, time)

    Image.super.new(self, imagePath, x, y)

    -- Si está animada tendrá estos valores
    self.animated = animated or false

    if self.animated == true then
        self.startPosition = Vector.new(self.position.x, self.position.y)
        self.endPosition = Vector.new(self.startPosition.x, self.startPosition.y + (travelDistance or 0))
        self.repeated = false

        self.timer = Timer(time, true,
        function ()
            if self.repeated == true then
                self.repeated = false
            else self.repeated = true end
        end)
        AddActor(self.timer)
    end

    self.scale = Vector.new(scale or self.scale.x, scale or self.scale.y)

end

function Image:update(dt)

    if self.animated == true then
        
        if self.repeated == false then
            self.position = self:Lerp(self.endPosition, self.startPosition, self.timer.current / self.timer.max)
        else
            local inverseTimer = self.timer.max - self.timer.current
            self.position = self:Lerp(self.endPosition, self.startPosition, inverseTimer / self.timer.max)
        end

    end

end

function Image:draw()

    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)

end

function Image:Lerp(a, b, t)
    return a * (1-t) + b * t
end

return Image
