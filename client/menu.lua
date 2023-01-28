ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    
------------------------------MENU SHOPS

local ShopMenu = false

local achat = RageUI.CreateMenu("Superette", "Nos Article(s)")
achat.Closed = function() ShopMenu = false end

function OpenMenuSuperette()
    if ShopMenu then
        ShopMenu = false
    else
        ShopMenu = true
    RageUI.Visible(achat, true)
        CreateThread(function()
            while ShopMenu do
                Wait(1)
                RageUI.IsVisible(achat, function()

                    RageUI.Separator('↓ ~b~Boissons~s~ ↓')
                    
                    for k,v in pairs(Config.drink) do
                        RageUI.Button("~r~→~s~ "..v.label, nil, {RightLabel = "~b~"..v.price.."$"}, true , {
                            onSelected = function()
                                local item = v.name 
                                local price = v.price
                                local number = KeyboardInput('Combien voulez-vous en acheter ?', '', 2)
                                TriggerServerEvent('Barwoz:buy', number, item, price)	
                                Wait(1)
                            end
                        })
                    end

                    RageUI.Separator('↓ ~b~Nouritures~s~ ↓')

                    for k,v in pairs(Config.eat) do
                        RageUI.Button("~r~→~s~ "..v.label, nil, {RightLabel = "~b~"..v.price.."$"}, true , {
                            onSelected = function()
                                local item = v.name 
                                local price = v.price
                                local number = KeyboardInput('Combien voulez-vous en acheter ?', '', 2)
                                TriggerServerEvent('Barwoz:buy', number, item, price)	
                                Wait(1)
                            end
                        })
                    end
                end)
            end
        end)
    end 
end 

------------------------FUNCTIONS

-----KeyboardInput

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500) 
		return result
	else
		Wait(500) 
		return nil 
	end
end

------------------------------DRAWMARKERS


CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for _,v in pairs(Config.positionshop) do
            if #(pCoords2 - v.position) < 1.5 then
                activerfps = true
                Visual.Subtitle("Appuyer sur ~b~[~s~E~b~]~s~ pour accéder aux ~b~Magasin~s~ !")
            if ShopMenu == false then
                if IsControlJustReleased(0, 38) then
                    OpenMenuSuperette()
                end
            end
            elseif #(pCoords2 - v.position) < 7.0 then
                activerfps = true
                DrawMarker(29, v.position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 1, 1, 2, 0, nil, nil, 0)
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500) 
        end
    end
end)

------------------------------BLIPS

CreateThread(function()

for _, info in pairs(Config.blipsSuperette) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.7)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
    end
end)

------------------------------CREATED BY BARWOZ------------------------------