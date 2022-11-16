local DepletingBar = Object:extend()
local w, h = love.graphics.getDimensions()

Timer = Timer or require "src.timer"

function DepletingBar:new(x, y, height, width)
    self.name = "DepletingBar"
    self.position = Vector.new(x, y)
    self.width =  width or (w - 20)
    self.originalWidth = self.width
    self.height = height

    self.timer =  Timer()    
    table.insert(actorList, self.timer)
    self.color = {1,1,1}
    self.initialColor = self.color

end

function DepletingBar:update(dt)
    self.width = Lerp(self.originalWidth, 0, self.timer.currentTime / self.timer.maxTime)
end


function DepletingBar:draw()
    love.graphics.setColor(0.2,0.2,0.2)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.originalWidth, self.height)
    love.graphics.setColor(self.color[1],self.color[2],self.color[3])
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
    love.graphics.setColor(1,1,1)

end

function Lerp(v0, v1, t)
    return v0 + t * (v1 - v0)
end

return DepletingBar
