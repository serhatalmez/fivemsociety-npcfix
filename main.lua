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

        -- These natives have to be called every frame.
        SetPedDensityMultiplierThisFrame(0.0) -- npc/ped spawnlama seviyesini ayarlayın
        SetRandomVehicleDensityMultiplierThisFrame(0.0) -- random araç spawnlama seviyesini ayarlayın
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- senaryo pedlerini spawnlama seviyesini ayarlayın.
        SetGarbageTrucks(false) -- Çöp kamyonu spawnı, true-false olarak düzenleyebilirsiniz.
        SetRandomBoats(false) -- Rastgele bot spawnı, true-false olarak düzenleyebilirsiniz.
        SetCreateRandomCops(false) -- Rastgele polis spawnı, true-false olarak düzenleyebilirsiniz.
        SetCreateRandomCopsNotOnScenarios(false) -- Rastgele polis spawnı, true-false olarak düzenleyebilirsiniz. (Senaryoda olmayan polis pedleri için)
        SetCreateRandomCopsOnScenarios(false) -- Rastgele polis spawnı, true-false olarak düzenleyebilirsiniz. 

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