Class = require 'class'

require 'Alien'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 600

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')
local alien = Alien()

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.window.setTitle('Cats VS Aliens')

    love.keyboard.keysPressed = {}
end

function love.update(dt)
    alien:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    alien:render()
    love.graphics.draw(ground, 0, WINDOW_HEIGHT - 5)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end