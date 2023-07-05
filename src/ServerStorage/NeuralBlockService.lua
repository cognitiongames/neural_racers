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

    local move = true
    local rotate = true

    while true do
        wait(0.01)
        if move then
            move = false
            car:move().Completed:Connect(function()
                move = true
                car:left()
            end)
            if car:getSpeed() < 0.3 then
                car:throttle()
                
            end
        end
        
        --car:left()
    end
end





return NeuralBlockService