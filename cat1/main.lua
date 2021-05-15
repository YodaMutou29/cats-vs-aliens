Class = require 'class'

require 'Alien'
require 'Cat'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 600

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0
local BACKGROUND_SCROLL_SPEED = 30
local BACKGROUND_LOOPING_POINT = 413
local ground = love.graphics.newImage('ground.png')
local cat = Cat()
local alien = Alien()

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.window.setTitle('Cats VS Aliens')

    love.keyboard.keysPressed = {}

    sounds = {
        ['music'] = love.audio.newSource('boss.wav', 'static')
    }

    sounds['music']:setLooping(true)
    sounds['music']:play()
end

function love.update(dt)
    alien:update(dt)
    cat:update(dt)
    --if cat.dx == 10 then
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    --end

    if cat:collidesEnemy(alien) then
        love.graphics.printf('GAME OVER', 0, 64, VIRTUAL_WIDTH, 'center')
    end

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    cat:render()
    alien:render()
    love.graphics.draw(ground, 0, WINDOW_HEIGHT - 5)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end