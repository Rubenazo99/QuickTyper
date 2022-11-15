Vector = Vector or require "src/vector"
local TypeActor = Actor:extend()

function TypeActor:new(x, y)

    self.name = "TypeActor"
    self.position = Vector.new(x, y)
    self.currentText = ""
    self.currentCharAmmount = #self.currentText
    self.font = font or love.graphics.getFont()

end
  
function TypeActor:draw()

    love.graphics.printf(self.currentText, self.font, self.position.x, self.position.y, 50, "left")

end

function TypeActor:addKey(char)
    self.currentText = self.currentText .. char
    self.currentCharAmmount = #self.currentText
end

function TypeActor:makeSound()
    -- Aqui tienes la función en la que hará el sonido
end

return TypeActor