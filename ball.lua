Ball = {}

function Ball:load()
-- Bola inicia no meio da tela
self.x = love.graphics.getWidth()/2
self.y = love.graphics.getHeight()/2
self.width = 20
self.height = 20
self.speed = 225
self.xvel = -self.speed
self.yvel = 0
sound = love.audio.newSource("sound/ball_noise.wav", "static")

end


function Ball:update(dt)
self:move(dt)
self:collide()

end

function Ball:move(dt)
-- Atualiza a posição da bola
self.x = self.x + self.xvel * dt
self.y = self.y + self.yvel * dt
end

function Ball:collide() 
self:collideWall()
self:collidePlayer()
self:collideAI()
self:Score()
 
end
   
function Ball:collideWall()
    if self.y < 0 then
        self.y = 0
        self.yvel = -self.yvel
        Ball:sound()
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yvel = -self.yvel
        Ball:sound()
    end
  
end

function Ball:sound()
    sound:play()
end

function Ball:collidePlayer()
        if checkCollision(self, Player) then
            -- Se a bola colidir com a raquete do jogador, a bola vai para o lado oposto
            self.xvel = self.speed
            local middleBall = self.y + self.height/2
            local middlePlayer = Player.y + Player.height/2
            local collisionPosition = middleBall - middlePlayer
            self.yvel = collisionPosition * 5
            Ball:sound()
        end
       
end

function Ball:collideAI()
        if checkCollision(self, AI) then
            -- Se a bola colidir com a raquete do oponente, a bola vai para o lado oposto
            self.xvel = -self.speed
            local middleBall = self.y + self.height/2
            local middleAI = AI.y + AI.height/2
            local collisionPosition = middleBall - middleAI
            self.yvel = collisionPosition * 5
            Ball:sound()
        end
       
end

function Ball:Score()
    if self.x < 0 then
       self:resetPosition(1)
       -- Add 1 to the score of the player
       Score.ai = Score.ai + 1

       
     end

     if self.x + self.width > love.graphics.getWidth() then
        self:resetPosition(-1)
        -- Add 1 to the score of the player
        Score.player = Score.player + 1
        
    end
end

function Ball:resetPosition(modifier) -- faz a mudança de sinal da velocidade da bola

 -- Se a bola sair da tela do lado do oponente e o ponto é do jogador 
         -- o jogador ganha um ponto
         -- A bola volta pro centro da tela 
         self.x = love.graphics.getWidth()/2 - self.width/2
         self.y = love.graphics.getHeight()/2 - self.height/2
         self.yvel = 0       
         self.xvel = self.speed * modifier
end

function Ball:draw()
-- Desenha a bola na posição atual
love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end
