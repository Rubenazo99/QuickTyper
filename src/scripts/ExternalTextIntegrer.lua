TextEntity = TextEntity or require("src/scripts/TextEntity")

local ExternalTextIntegrer = Object:extend()

function ExternalTextIntegrer:new()
    self.textList = {}
    self.currentId = 1
    
    -- gets all the txt files inside the TextFile directory
    -- loads all the txt files inside the TextFile directory\
    -- search all file names in the TextFile directory
    textFileNames = {}
    textFileNames = love.filesystem.getDirectoryItems("TextFiles")

    -- creates the text entities and insert them inside textList
    for i, file in pairs(textFileNames) do
        local text = (love.filesystem.read("TextFiles/"..file))
        

        local entity = TextEntity(text,nil,i)
        table.insert(self.textList,entity)
    end
    
    self.currentText = self.textList[self.currentId]
end

function ExternalTextIntegrer:nextText()
    id = id + 1
    self.currentText = self.textList[self.currentId]
end

function ExternalTextIntegrer:previousText()
    id = id - 1
    self.currentText = self.textList[self.currentId]
end

-- function textListLoader(textList)
--     -- loads all the txt files inside the TextFile directory\
--     -- search all file names in the TextFile directory
--     textFileNames = {}
--     textFileNames = love.filesystem.getDirectoryItems("TextFiles")

--     -- creates the text entities and insert them inside textList
--     for i, file in pairs(textFileNames) do
--         local text = (love.filesystem.read("TextFiles/"..file))
        
--         local entity = TextEntity:new(text,nil,i)
--         table.insert(textList,entity)
--     end

-- end

return ExternalTextIntegrer




