Vector = Vector or require "src/vector"
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

    -- Este es el texto que hay que modificar para cada nuevo texto
    -- será sobreescrito por el ExternalTextIntegrer en loading
    self.targetText = ""

end
  
function TypeActor:draw()

    love.graphics.setColor(0, 0, 0, 0.3)
    love.graphics.printf(self.targetText, self.font, self.position.x, self.position.y, self.margin, "left", 0, self.scale, self.scale)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(self.currentText, self.font, self.position.x, self.position.y, self.margin, "left", 0, self.scale, self.scale)
    love.graphics.setColor(1, 1, 1)

end

function TypeActor:addKey(char)
    self.currentText = self.currentText .. char
    self.currentCharAmmount = #self.currentText
    self:CheckCurrentText()
    if self:CheckTextFinished() then self:NextText() end
end

function TypeActor:addEnter()
    self.currentText = self.currentText .. "\n"
end

function TypeActor:removeKey()
    self.currentText = string.sub(self.currentText, 1, #self.currentText - 1)
end

-- Esta función reseteará el texto por completo
function TypeActor:resetText()
    self.currentText = ""
    self.currentCharAmmount = 0
end

function TypeActor:CheckCurrentText()
    
    local i = self.currentCharAmmount
    if self.targetText:sub(i, i) ~= self.currentText:sub(i, i) then
        self:resetText()
    end

end

function TypeActor:CheckTextFinished()
    return #self.currentText == #self.targetText
end

function TypeActor:NextText()

    local externalText = ReturnActor("ExternalTextIntegrer")
    externalText:nextText()
    self.targetText = externalText.currentText.text
    self:resetText()

    local bar = ReturnActor("DepletingBar")
    bar.timer:reset()
    bar.timer:play()
end

-- Esta función hará un sonido aleatorio cuando toque
function TypeActor:makeSound()

end

return TypeActor