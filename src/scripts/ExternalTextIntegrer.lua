TextEntity = TextEntity or require("src/scripts/TextEntity")

local ExternalTextIntegrer = Object:extend()

function ExternalTextIntegrer:new()
    self.name = "ExternalTextIntegrer"

    self.textList = {}
    self.currentId = 1

    -- gets all the txt files inside the TextFile directory
    -- loads all the txt files inside the TextFile directory\
    -- search all file names in the TextFile directory
    local textFileNames = {}
    textFileNames = love.filesystem.getDirectoryItems("TextFiles")

    -- creates the text entities and insert them inside textList
    for i, file in pairs(textFileNames) do
        local text = (love.filesystem.read("TextFiles/" .. file))
        local stringArr = {}
        for w in string.gmatch(textFileNames[i], "%s") do
            table.insert(stringArr,w)
        end
        local levelTime = stringArr[2]

        print(levelTime)

        local entity = TextEntity(text, nil, i, levelTime)
        table.insert(self.textList, entity)
    end

    self.currentText = self.textList[self.currentId]

    local typeActor, index = ReturnActor("TypeActor")
    typeActor.targetText = self.currentText.text
end

function ExternalTextIntegrer:update(dt)
end -- Esta funcion solo existe para que no se rompa el texto
function ExternalTextIntegrer:draw()
end -- Lo mismo

function ExternalTextIntegrer:nextText()
    if self.textList[self.currentId + 1] ~= nil then
        self.currentId = self.currentId + 1
        self.currentText = self.textList[self.currentId]
    end
end

function ExternalTextIntegrer:previousText()
    if self.textList[self.currentId - 1] ~= nil then
        self.currentId = self.currentId - 1
        self.currentText = self.textList[self.currentId]
    end
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
