AI = {}
-- Arquivo responsável pela "Inteligencia Artificial" do oponente

function AI:load()
self.width = 20
self.height = 100
self.x = love.graphics.getWidth() - self.width - 50
self.y = love.graphics.getHeight()/2
self.yvel = 0
self.speed = 500
self.timer = 0
self.rate = 0.5

end


function AI:update(dt)
    
    self:move(dt)
    self:checkBoundaries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:acquireTarget()
    end
end

function AI:move(dt)
self.y = self.y + self.yvel * dt
end

function AI:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yvel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yvel = self.speed
    else
        self.yvel = 0
    end
end


function AI:checkBoundaries()
    --Verifica se o jogador está dentro da tela
    if self.y < 0 then
       self.y = 0
   elseif self.y > love.graphics.getHeight() - self.height then
       self.y = love.graphics.getHeight() - self.height
   end
end

function AI:draw()
love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end
