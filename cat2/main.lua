require 'src/Dependencies'

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.window.setTitle('Cats VS Aliens')

    gFonts = {
        ['small'] = love.graphics.newFont('fonts/title.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/title.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/title.ttf', 32),
        ['title'] = love.graphics.newFont('fonts/title.ttf', 96)
    }
    love.graphics.setFont(gFonts['small'])

    gTextures = {
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['ground'] = love.graphics.newImage('graphics/ground.png'),
        ['cat'] = love.graphics.newImage('graphics/cat.png'),
        ['alien'] = love.graphics.newImage('graphics/alien.png')
    }

    sounds = {
        ['music'] = love.audio.newSource('sounds/boss.wav', 'static')
    }

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('start')

    sounds['music']:setLooping(true)
    sounds['music']:play()

    love.keyboard.keysPressed = {}
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    gStateMachine:render()
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
       return true
    end
    return false
 end