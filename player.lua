Player = {}

function Player:load()
    --Carrega o jogador na posição inicial do jogo
self.x = 50
self.y = love.graphics.getHeight()/2 
self.width = 20
self.height = 100
self.speed = 500

end

function Player:update(dt)
self:move(dt)
self:checkBoundaries()   
end

function Player:move(dt)
    --Atualiza a posição do jogador
    if love.keyboard.isDown("up") then  -- Se a tecla up estiver pressionada
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then  -- Se a tecla down estiver pressionada
        self.y = self.y + self.speed * dt
    end
end

function Player:checkBoundaries()
     --Verifica se o jogador está dentro da tela
     if self.y < 0 then
        self.y = 0
    elseif self.y > love.graphics.getHeight() - self.height then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()

love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end