Alien = Class{}

local GRAVITY = 10

function Alien:init()
    self.image = love.graphics.newImage('graphics/alien.png')
    self.x = (WINDOW_WIDTH / 2) - 32
    self.y = WINDOW_HEIGHT - 100

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.dy = 0
end

function Alien:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if self.y >= WINDOW_HEIGHT - 80 then
        self.y = WINDOW_HEIGHT - 80
        self.dy = -5
    end
    self.y = self.y + self.dy
end

function Alien:render()
    love.graphics.draw(self.image, self.x, self.y)
end