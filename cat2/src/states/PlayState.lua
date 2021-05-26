PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.cat = Cat()
    self.alien = Alien()
    self.backgroundScroll = 0
end

function PlayState:update(dt)
    self.alien:update(dt)
    self.cat:update(dt)
    --if cat.dx == 10 then
    self.backgroundScroll = (self.backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    --end

    if self.cat:collidesEnemy(self.alien) then
        love.graphics.printf('GAME OVER', 0, 64, VIRTUAL_WIDTH, 'center')
    end   
end

function PlayState:render()
    love.graphics.draw(gTextures['background'], 0, 0)
    self.cat:render()
    self.alien:render()
    love.graphics.draw(gTextures['ground'], 0, WINDOW_HEIGHT - 5)
end