local TextEntity = Actor:extend()

function TextEntity:new(text, charAmount, id, funct)

    self.name = "TextEntity"
    self.text = text or "no text attatched"
    self.charAmount = charAmount or 0
    self.id = id or 0
    self.funct = funct or function() print("no function is present") end
end

function TextEntity:getText() 
    return self.text
end

function TextEntity:insertFunction(func)
    if func then
        self.funct = func
    end
end

return TextEntity


