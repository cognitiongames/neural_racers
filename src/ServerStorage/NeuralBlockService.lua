local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local NeuralCar = require(game:GetService("ReplicatedStorage").Source.NeuralCar)

local NeuralBlockService = Knit.CreateService { Name = "NeuralBlockService", Client = {}}

local carFolder

function NeuralBlockService:KnitInit()
    print("Ha")
end

function NeuralBlockService:KnitStart()
    print("Started")

    -- Create folder for block
    carFolder = Instance.new("Folder")
    carFolder.Name = "Cars"
    carFolder.Parent = game:WaitForChild("Workspace")

    local car = NeuralCar.new(1, carFolder)
    car:createCar()
    car:steer(10)
    local x = 0
    
    while true do
        wait(1)
        car:throttle(x)
        x += 1
    end
end





return NeuralBlockService