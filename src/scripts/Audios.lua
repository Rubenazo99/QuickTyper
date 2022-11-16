local Audio = Object:extend()


function Audio:new()
    self.name = "Audio"

    self.TablaAudios = {}

    local a = love.audio.newSource("Audios/a.mp3", "static")
    table.insert(self.TablaAudios, a)
    local b = love.audio.newSource("Audios/b.mp3", "static")
    table.insert(self.TablaAudios, b)
    local c = love.audio.newSource("Audios/c.mp3", "static")
    table.insert(self.TablaAudios, c)
    local d = love.audio.newSource("Audios/d.mp3", "static")
    table.insert(self.TablaAudios, d)
    local e = love.audio.newSource("Audios/e.mp3", "static")
    table.insert(self.TablaAudios, e)
    local f = love.audio.newSource("Audios/f.mp3", "static")
    table.insert(self.TablaAudios, f)
    local g = love.audio.newSource("Audios/g.mp3", "static")
    table.insert(self.TablaAudios, g)
    local h = love.audio.newSource("Audios/h.mp3", "static")
    table.insert(self.TablaAudios, h)
    local i = love.audio.newSource("Audios/i.mp3", "static")
    table.insert(self.TablaAudios, i)
    local j = love.audio.newSource("Audios/j.mp3", "static")
    table.insert(self.TablaAudios, j)
end

function Audio:update()
end
function Audio:draw()
end

function Audio:doSound()
    local barra = ReturnActor("DepletingBar")
    --Lerp(1, 0.05, barra.timer())    Lerp(1, 0.05, barra.timer())
    local AudioRandom = math.random(1, 10)
    self.TablaAudios[AudioRandom]:setPitch(Lerp(2, 0.05, barra.timer.currentTime/barra.timer.maxTime))
    self.TablaAudios[AudioRandom]:play()
    
end

return Audio
