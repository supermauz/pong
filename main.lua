require("player") -- Loads the player.lua file
require("ball") -- Loads the ball.lua file
require("ai") -- Loads the ai.lua file


function love.load()
Player:load()
Ball:load()
AI:load()

Score = {player = 0, ai = 0}
font = love.graphics.newFont(30)
end


function love.update(dt)
Player:update(dt)
Ball:update(dt)
AI:update(dt)
end

function love.draw()
Player:draw()
Ball:draw()
AI:draw()
drawScore()

end

function drawScore() -- Desenha o score na tela
love.graphics.setFont(font)
    love.graphics.print("Player: " ..Score.player, 50, 10)
    love.graphics.print("AI: " ..Score.ai, 600, 10)
end

--Checa as colisões do jogo entre Bola e Raquete do Jogador

function checkCollision(a,b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end