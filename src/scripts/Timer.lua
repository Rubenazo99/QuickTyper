
Actor = Actor or require "src/actor"
local Timer = Actor:extend()

local executing = false

function Timer:new(maxTime)
    self.name = "Timer"
    self.currentTime = 0
    self.maxTime = maxTime or 20
end

function Timer:update(dt)
    if executing then
        self.currentTime = self.currentTime + dt
        if self.currentTime > self.maxTime then
            TimePassed()
            self.currentTime = 0

            type = ReturnActor("TypeActor"):prevText()
        end
    end
end

function Timer:changeMaxTime(maxTime)
    self.maxTime = maxTime
end

function Timer:reset()
    self.currentTime = 0
end

function Timer:pause()
    executing = false
end

function Timer:play()
    executing = true
end

function Timer:setTime()
    local text = ReturnActor("ExternalTextIntegrer")
    self.maxTime = text.currentText.time
end

function TimePassed()
end

return Timer
