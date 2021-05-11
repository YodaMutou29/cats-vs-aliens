Cat = Class{}

local GRAVITY = 0

function Cat:init()
    self.image = love.graphics.newImage('cat.png')
    self.x = 0
    self.y = WINDOW_HEIGHT - self.image:getHeight()

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.dx = 0
    self.dy = 0
end

function Cat:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if self:collidesGround() then
        GRAVITY = 0
        self.dy = 0
    else
        GRAVITY = 20
    end

    if love.keyboard.keysPressed['space'] or love.keyboard.keysPressed['w'] then
        self.y = WINDOW_HEIGHT - self.image:getHeight() - 10
        self.dy = -10
    end


    if love.keyboard.isDown('d') then
        self.dx = 10
    elseif love.keyboard.isDown('a') then
        self.dx = -10
    else
        self.dx = 0
    end

    self.x = self.x + self.dx
    self.y = self.y + self.dy
end

function Cat:collidesGround()
    if self.y < WINDOW_HEIGHT - self.image:getHeight() - 10 then
        return false
    end
    return true
end

function Cat:collidesEnemy(enemy)
    if self.x > enemy.x + enemy.width or enemy.x > self.x + self.width then
       return false
    end
    
    if self.y > enemy.y + enemy.height or enemy.y > self.y + self.height then
        return false
    end 
    
    return true
end

function Cat:render()
    love.graphics.draw(self.image, self.x, self.y)
end