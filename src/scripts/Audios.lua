TablaAudios = {}

function audioLoad()
    a = love.audio.newSource("Audios/a.mp3", "static")
    table.insert(TablaAudios, a)
    b = love.audio.newSource("Audios/b.mp3", "static")
    table.insert(TablaAudios, b)
    c = love.audio.newSource("Audios/c.mp3", "static")
    table.insert(TablaAudios, c)
    d = love.audio.newSource("Audios/d.mp3", "static")
    table.insert(TablaAudios, d)
    e = love.audio.newSource("Audios/e.mp3", "static")
    table.insert(TablaAudios, e)
    f = love.audio.newSource("Audios/f.mp3", "static")
    table.insert(TablaAudios, f)
    g = love.audio.newSource("Audios/g.mp3", "static")
    table.insert(TablaAudios, g)
    h = love.audio.newSource("Audios/h.mp3", "static")
    table.insert(TablaAudios, h)
    i = love.audio.newSource("Audios/i.mp3", "static")
    table.insert(TablaAudios, i)
    j = love.audio.newSource("Audios/j.mp3", "static")
    table.insert(TablaAudios, j)
end

function audioSound()
    if love.keyboard.isDown("a") then
         TablaAudios[love.math.random(1, #TablaAudios)]:play()
     end
end

random = love.math.random(1, #TablaAudios)
TablaAudios[random]:play()
TablaAudios[random]:setPitch(love.math.random(0.5, 1))