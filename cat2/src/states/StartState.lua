StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function StartState:render()
    love.graphics.draw(gTextures['background'], 0, 0)
    love.graphics.draw(gTextures['ground'], 0, WINDOW_HEIGHT - 5)

    --print title to screen
    love.graphics.setFont(gFonts['title'])
    love.graphics.printf("CATS VS ALIENS", 0, WINDOW_HEIGHT / 3,
        WINDOW_WIDTH, 'center')

    --print start button to screen
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("START", 0, WINDOW_HEIGHT - 100,
        WINDOW_WIDTH, 'center')
end