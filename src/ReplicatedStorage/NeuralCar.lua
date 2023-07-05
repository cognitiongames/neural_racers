local TweenService = game:GetService("TweenService")

local NeuralCar = {}
NeuralCar.__index = NeuralCar

function NeuralCar.new(id, folder)
    local newCar = Instance.new("Model")
    newCar.Parent = folder

    local self = setmetatable({
        id = id,
        newCar = newCar,
        speed = 0.01
    }, NeuralCar)

    return self

end

function NeuralCar:createCar()
    self.newCar.Name = "Car"

    -- Create chassis
    local chassis = Instance.new("Part")
    chassis.Name = "Chassis"
    chassis.Parent = self.newCar
    chassis.Anchored = true
    chassis.Position = Vector3.new(0,1,0)
    chassis.Size = Vector3.new(10,1,4)
    chassis.Material = "Plastic"
    chassis.CanCollide = false
    chassis.CanTouch = true

    -- Set primary part
    self.newCar.PrimaryPart = chassis


    print("Created car")
    return self.newCar
end

function NeuralCar:throttle()
    self.speed += 0.001
end

function NeuralCar:brake()
    self.speed -= 0.1
end

function NeuralCar:left()
    local carPrimaryPart = self.newCar.Chassis

    local carTweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

    local newCFrame = carPrimaryPart.CFrame * CFrame.Angles(0, math.rad(0.05), 0)

    local carRotationTween = TweenService:create(carPrimaryPart, carTweenInfo, {CFrame = newCFrame})

    carRotationTween:Play()
    return carRotationTween
end

function NeuralCar:move()
    print(self.speed)
    local carPrimaryPart = self.newCar.Chassis

    local carTweenInfo = TweenInfo.new(0.01, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

    local newCFrame = carPrimaryPart.CFrame * CFrame.new(0, 0, -self.speed)

    local carMovementTween = TweenService:create(carPrimaryPart, carTweenInfo, {CFrame = newCFrame})

    carMovementTween:Play()
    return carMovementTween
end

function NeuralCar:getSpeed()
    return self.speed
end

return NeuralCar