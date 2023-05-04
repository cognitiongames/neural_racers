local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
require(game:GetService("ServerStorage").Services.NeuralBlockService)

-- Load services or controllers here
--Knit.addServices(ServerStorage.Services)

local success, err = Knit.Start():await()
if not success then
    -- Handle error
    print(tostring(err))
    error(tostring(err))
end