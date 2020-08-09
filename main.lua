Citizen.CreateThread(function()
	while true do
        Wait(0)
        SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("frogger"), true)
        SetVehicleModelIsSuppressed(GetHashKey("frogger2"), true)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- crash yememeniz icin

	SetRandomVehicleDensityMultiplierThisFrame(0.0) -- Rastgele araçlar (otoparktan araç çıkması vs) 
        SetParkedVehicleDensityMultiplierThisFrame(5.0) -- Rastgele park etmiş araçlar
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- Rastgele NPC/PEDS senaryoları
        SetGarbageTrucks(false) -- Rastgele ortaya çıkan çöp kamyonları [true/false]
        SetRandomBoats(false) -- Rastgele denizde/suda tekne çıkması [true/false]
        SetCreateRandomCops(false) -- Rastgele polisler (araç/yaya)[true/false]
        SetCreateRandomCopsNotOnScenarios(false) -- Rastgele polisler (senaryo değil)[true/false]
        SetCreateRandomCopsOnScenarios(false) -- Rastgele polisler (senaryo)[true/false]
        SetScenarioTypeEnabled('WORLD_VEHICLE_DRIVE_SOLO', true)

        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
    end
end)
