local TweenService = game:GetService("TweenService")

local NeuralCar = {}
NeuralCar.__index = NeuralCar

function NeuralCar.new(id, folder)
    local newCar = Instance.new("Model")
    newCar.Parent = folder

    local self = setmetatable({
        id = id,
        newCar = newCar,
        speed = 10
    }, NeuralCar)

    return self

end

function NeuralCar:createCar()
    self.newCar.Name = "Car"

    -- Collision groups

    -- Create chassis
    
    local Chassis = Instance.new("Part")
    Chassis.Name = "Chassis"
    Chassis.Parent = self.newCar
    Chassis.Position = Vector3.new(0,5,0)
    Chassis.Size = Vector3.new(10,1,4)
    Chassis.Material = "Plastic"

    -- Set primary part
    self.newCar.PrimaryPart = Chassis

    -- Create front left wheel
    local FrontLeft = Instance.new("Model")
    FrontLeft.Parent = self.newCar
    FrontLeft.Name = "FrontLeft"

    -- Part A FL
    local PartAFL = Instance.new("Part")
    PartAFL.Parent = FrontLeft
    PartAFL.Name = "PartA"
    PartAFL.Size = Vector3.new(1,1,1)
    PartAFL.CanCollide = false
    local WeldPartAFL = Instance.new("Weld")
    WeldPartAFL.Parent = PartAFL
    WeldPartAFL.Part0 = PartAFL
    WeldPartAFL.Part1 = Chassis
    WeldPartAFL.C0 = CFrame.new(0,0,-0.5) * CFrame.Angles(0,math.rad(180),math.rad(180))
    WeldPartAFL.C1 = CFrame.new(-4.5,0,2) * CFrame.Angles(0,math.rad(180),math.rad(180))
    local AttachmentAFL = Instance.new("Attachment")
    AttachmentAFL.Parent = PartAFL
    AttachmentAFL.CFrame = CFrame.new(0,0.5,0) * CFrame.Angles(0,0,math.rad(90))
    AttachmentAFL.Name = "Attachment1"

    -- Part B FL
    local PartBFL = Instance.new("Part")
    PartBFL.Parent = FrontLeft
    PartBFL.Name = "PartB"
    PartBFL.Size = Vector3.new(1,1,1)
    PartBFL.CanCollide = false
    local AttachmentBFL0 = Instance.new("Attachment")
    AttachmentBFL0.Parent = PartBFL
    AttachmentBFL0.CFrame = CFrame.new(0,0.5,0) * CFrame.Angles(0,0,math.rad(90))
    AttachmentBFL0.Name = "Attachment0"
    local SteeringConstraintFL = Instance.new("HingeConstraint")
    SteeringConstraintFL.Name = "SteeringConstraint"
    SteeringConstraintFL.Parent = PartBFL
    SteeringConstraintFL.ActuatorType = "Servo"
    SteeringConstraintFL.AngularResponsiveness = 45
    SteeringConstraintFL.AngularSpeed = 10
    SteeringConstraintFL.ServoMaxTorque = 10000
    SteeringConstraintFL.Attachment0 = AttachmentBFL0
    SteeringConstraintFL.Attachment1 = AttachmentAFL
    local AttachmentBFL1 = Instance.new("Attachment")
    AttachmentBFL1.Parent = PartBFL
    AttachmentBFL1.CFrame = CFrame.new(0,0,0.5) * CFrame.Angles(0,math.rad(90),0)
    AttachmentBFL1.Name = "Attachment1"

    -- Wheel FL
    local WheelFL = Instance.new("Part")
    WheelFL.Parent = FrontLeft
    WheelFL.Name = "Wheel"
    WheelFL.Shape = "Cylinder"
    WheelFL.Size = Vector3.new(1,3,3)
    local AttachmentWFL0 = Instance.new("Attachment")
    AttachmentWFL0.Parent = WheelFL
    AttachmentWFL0.CFrame = CFrame.new(0.5,0,0)
    AttachmentWFL0.Name = "Attachment0"
    local WheelConstraintFL = Instance.new("HingeConstraint")
    WheelConstraintFL.Name = "WheelConstraint"
    WheelConstraintFL.Parent = WheelFL
    WheelConstraintFL.ActuatorType = "Motor"
    WheelConstraintFL.MotorMaxTorque = 10000
    WheelConstraintFL.Attachment0 = AttachmentWFL0
    WheelConstraintFL.Attachment1 = AttachmentBFL1

    -- Create front right wheel
    local FrontRight = Instance.new("Model")
    FrontRight.Parent = self.newCar
    FrontRight.Name = "FrontRight"

    -- Part A FR
    local PartAFR = Instance.new("Part")
    PartAFR.Parent = FrontRight
    PartAFR.Name = "PartA"
    PartAFR.Size = Vector3.new(1,1,1)
    PartAFR.CanCollide = false
    local WeldPartAFR = Instance.new("Weld")
    WeldPartAFR.Parent = PartAFR
    WeldPartAFR.Part0 = PartAFR
    WeldPartAFR.Part1 = Chassis
    WeldPartAFR.C0 = CFrame.new(0,0,0.5) * CFrame.Angles(0,180,180)
    WeldPartAFR.C1 = CFrame.new(-4.5,0,-2) * CFrame.Angles(0,180,180)
    local AttachmentAFR = Instance.new("Attachment")
    AttachmentAFR.Parent = PartAFR
    AttachmentAFR.CFrame = CFrame.new(0,0.5,0) * CFrame.Angles(0,0,math.rad(90))
    AttachmentAFR.Name = "Attachment1"

    -- Part B FR
    local PartBFR = Instance.new("Part")
    PartBFR.Parent = FrontRight
    PartBFR.Name = "PartB"
    PartBFR.Size = Vector3.new(1,1,1)
    PartBFR.CanCollide = false
    local AttachmentBFR0 = Instance.new("Attachment")
    AttachmentBFR0.Parent = PartBFR
    AttachmentBFR0.CFrame = CFrame.new(0,0.5,0) * CFrame.Angles(0,0,math.rad(90))
    AttachmentBFR0.Name = "Attachment0"
    local SteeringConstraintFR = Instance.new("HingeConstraint")
    SteeringConstraintFR.Name = "SteeringConstraint"
    SteeringConstraintFR.Parent = PartBFR
    SteeringConstraintFR.ActuatorType = "Servo"
    SteeringConstraintFR.AngularResponsiveness = 45
    SteeringConstraintFR.AngularSpeed = 10
    SteeringConstraintFR.ServoMaxTorque = 10000
    SteeringConstraintFR.Attachment0 = AttachmentBFR0
    SteeringConstraintFR.Attachment1 = AttachmentAFR
    local AttachmentBFR1 = Instance.new("Attachment")
    AttachmentBFR1.Parent = PartBFR
    AttachmentBFR1.CFrame = CFrame.new(0,0,-0.5) * CFrame.Angles(0,math.rad(-90),0)
    AttachmentBFR1.Name = "Attachment1"

    -- Wheel FR
    local WheelFR = Instance.new("Part")
    WheelFR.Parent = FrontRight
    WheelFR.Name = "Wheel"
    WheelFR.Shape = "Cylinder"
    WheelFR.Size = Vector3.new(1,3,3)
    local AttachmentWFR0 = Instance.new("Attachment")
    AttachmentWFR0.Parent = WheelFR
    AttachmentWFR0.CFrame = CFrame.new(-0.5,0,0) * CFrame.Angles(0,math.rad(180),0)
    AttachmentWFR0.Name = "Attachment0"
    local WheelConstraintFR = Instance.new("HingeConstraint")
    WheelConstraintFR.Name = "WheelConstraint"
    WheelConstraintFR.Parent = WheelFR
    WheelConstraintFR.ActuatorType = "Motor"
    WheelConstraintFR.MotorMaxTorque = 10000
    WheelConstraintFR.Attachment0 = AttachmentWFR0
    WheelConstraintFR.Attachment1 = AttachmentBFR1
    
    -- Create back left wheel
    local BackLeft = Instance.new("Model")
    BackLeft.Parent = self.newCar
    BackLeft.Name = "BackLeft"

    -- Part A BL
    local PartABL = Instance.new("Part")
    PartABL.Parent = BackLeft
    PartABL.Name = "PartA"
    PartABL.Size = Vector3.new(1,1,1)
    PartABL.CanCollide = false
    local WeldPartABL = Instance.new("Weld")
    WeldPartABL.Parent = PartABL
    WeldPartABL.Part0 = PartABL
    WeldPartABL.Part1 = Chassis
    WeldPartABL.C0 = CFrame.new(0,0,-0.5) * CFrame.Angles(0,math.rad(180),math.rad(180))
    WeldPartABL.C1 = CFrame.new(4.5,0,2) * CFrame.Angles(0,math.rad(180),math.rad(180))
    local AttachmentBBL1 = Instance.new("Attachment")
    AttachmentBBL1.Parent = PartABL
    AttachmentBBL1.CFrame = CFrame.new(0,0,0.5) * CFrame.Angles(0,math.rad(90),0)
    AttachmentBBL1.Name = "Attachment1"

    -- Wheel BL
    local WheelBL = Instance.new("Part")
    WheelBL.Parent = BackLeft
    WheelBL.Name = "Wheel"
    WheelBL.Shape = "Cylinder"
    WheelBL.Size = Vector3.new(1,3,3)
    local AttachmentWBL0 = Instance.new("Attachment")
    AttachmentWBL0.Parent = WheelBL
    AttachmentWBL0.CFrame = CFrame.new(0.5,0,0)
    AttachmentWBL0.Name = "Attachment0"
    local WheelConstraintBL = Instance.new("HingeConstraint")
    WheelConstraintBL.Name = "WheelConstraint"
    WheelConstraintBL.Parent = WheelBL
    WheelConstraintBL.ActuatorType = "Motor"
    WheelConstraintBL.MotorMaxTorque = 10000
    WheelConstraintBL.Attachment0 = AttachmentWBL0
    WheelConstraintBL.Attachment1 = AttachmentBBL1

    -- Create back right wheel
    local BackRight = Instance.new("Model")
    BackRight.Parent = self.newCar
    BackRight.Name = "BackRight"

    -- Part A BR
    local PartABR = Instance.new("Part")
    PartABR.Parent = BackRight
    PartABR.Name = "PartA"
    PartABR.Size = Vector3.new(1,1,1)
    PartABR.CanCollide = false
    local WeldPartABR = Instance.new("Weld")
    WeldPartABR.Parent = PartABR
    WeldPartABR.Part0 = PartABR
    WeldPartABR.Part1 = Chassis
    WeldPartABR.C0 = CFrame.new(0,0,0.5) * CFrame.Angles(0,180,180)
    WeldPartABR.C1 = CFrame.new(4.5,0,-2) * CFrame.Angles(0,180,180)
    local AttachmentBBR1 = Instance.new("Attachment")
    AttachmentBBR1.Parent = PartABR
    AttachmentBBR1.CFrame = CFrame.new(0,0,-0.5) * CFrame.Angles(0,math.rad(-90),0)
    AttachmentBBR1.Name = "Attachment1"

    -- Wheel BR
    local WheelBR = Instance.new("Part")
    WheelBR.Parent = BackRight
    WheelBR.Name = "Wheel"
    WheelBR.Shape = "Cylinder"
    WheelBR.Size = Vector3.new(1,3,3)
    local AttachmentWBR0 = Instance.new("Attachment")
    AttachmentWBR0.Parent = WheelBR
    AttachmentWBR0.CFrame = CFrame.new(0.5,0,0)
    AttachmentWBR0.Name = "Attachment0"
    local WheelConstraintBR = Instance.new("HingeConstraint")
    WheelConstraintBR.Name = "WheelConstraint"
    WheelConstraintBR.Parent = WheelBR
    WheelConstraintBR.ActuatorType = "Motor"
    WheelConstraintBR.MotorMaxTorque = 10000
    WheelConstraintBR.Attachment0 = AttachmentWBR0
    WheelConstraintBR.Attachment1 = AttachmentBBR1


    print("Created car")
    return self.newCar
end

function NeuralCar:brake()
    self.speed -= 0.1
end

function NeuralCar:steer(angle)
    self.newCar.FrontLeft.PartB.SteeringConstraint.TargetAngle = angle
	self.newCar.FrontRight.PartB.SteeringConstraint.TargetAngle = angle
end


function NeuralCar:throttle(curr_speed)
    self.newCar.FrontLeft.Wheel.WheelConstraint.AngularVelocity = math.min(self.speed, curr_speed)
	self.newCar.FrontRight.Wheel.WheelConstraint.AngularVelocity = -math.min(self.speed, curr_speed)
	
	self.newCar.BackLeft.Wheel.WheelConstraint.AngularVelocity = math.min(self.speed, curr_speed)
	self.newCar.BackRight.Wheel.WheelConstraint.AngularVelocity = -math.min(self.speed, curr_speed)
end

function NeuralCar:getSpeed()
    return self.speed
end

return NeuralCar