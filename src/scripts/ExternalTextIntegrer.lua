TextEntity = TextEntity or require("TextEntity")

local ExternalTextIntegrer = Object:extend()

function ExternalTextIntegrer:new()
    self.textList = {}
    self.currentText = nil
    
    -- gets all the txt files inside the TextFile directory
    textListLoader()
end

function ExternalTextIntegrer:nextText()

end

function textListLoader()
    -- loads all the txt files inside the TextFile directory\
    -- search all file names in the TextFile directory
    textFileNames = {}
    textFileNames = love.filesystem.getRealDirectoryItems("TextFiles")

    -- creates the text entities and insert them inside textList
    for i, file in pairs(textFileNames) do
        
    end

end

return ExternalTextIntegrer




