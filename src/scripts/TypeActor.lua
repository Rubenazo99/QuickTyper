Vector = Vector or require "src/vector"
Timer = Timer or require "src/timer"
local TypeActor = Actor:extend()
local w, h = love.graphics.getDimensions()

function TypeActor:new(x, y, scale)

    self.name = "TypeActor"
    self.position = Vector.new(x or 0, y or 0)
    self.currentText = ""
    self.currentCharAmmount = #self.currentText
    self.font = font or love.graphics.newFont("assets/fonts/courier.ttf", 35)
    self.scale = scale or 1
    self.margin = 920

end
  
function TypeActor:draw()

    local width = self.font:getWidth(self.currentText)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(self.currentText, self.font, self.position.x, self.position.y, self.margin, "left", 0, self.scale, self.scale)
    love.graphics.setColor(1, 1, 1)

end

function TypeActor:addKey(char)
    self.currentText = self.currentText .. char
    self.currentCharAmmount = #self.currentText
end

function TypeActor:removeKey()
    self.currentText = string.sub(self.currentText, 1, #self.currentText - 1)
end

-- Esta función reseteará el texto por completo
function TypeActor:resetText()
    self.currentText = ""
    self.currentCharAmmount = 0
end

-- Esta función hará un sonido aleatorio cuando toque
function TypeActor:makeSound()

end

return TypeActor