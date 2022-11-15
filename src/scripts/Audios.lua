TablaAudios = {}

function audioLoad()
    RubenSound = love.audio.newSource("Audios/AudioRuben3.wav", "static")
    table.insert(TablaAudios, RubenSound)
end

function audioSound()
    if love.keyboard.isDown("a") then
        RubenSound:play()
    end
end
