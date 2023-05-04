local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local NeuralBlockService = Knit.CreateService { Name = "NeuralBlockService", Client = {}}

function NeuralBlockService:KnitInit()
    print("Ha")
end



return NeuralBlockService