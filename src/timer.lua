Actor = Actor or require "src/actor"
local Timer = Actor:extend()

function Timer:new(maxTime, rep, fun)
    self.current = 0
    self.max = maxTime
    self.rpt = rep
    self.fn = fun or function () end
    self.position = Vector.new(1, 1)

end

function Timer:update(dt)

    self.current = self.current + dt

    if self.current > self.max then
        
        if self.rpt == true then
            
            self.current = 0
            self:fn()

        else

            for i, v in pairs(actorList) do
                
                if actorList[i] == self then
                    table.remove(actorList, i)
                end

            end

        end

    end
end

return Timer
