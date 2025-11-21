local UEHelpers = require("UEHelpers")


local PlayerController=nil



local KismetStringLib = FindFirstOf("Class /Script/Engine.KismetStringLibrary")

local SCriptstruct_C= StaticFindObject("Class /Script/CoreUObject.ScriptStruct")
local Key_C = StaticFindObject("ScriptStruct /Script/InputCore.Key")

print("test print")

local LastDoor = nil

local function Test()
	--print("yyay")
	local FirstPlayerController = UEHelpers:GetPlayerController()
	if FirstPlayerController~=nil then
		local Pawn = FirstPlayerController.Pawn
		if Pawn~=nil then
			
		end
		local ArrTable= table
		
		ArrTable.KeyName=FName("OculusTouch_Left_Trigger_Click")
		--local keyStruct = ArrTable.m_KeyStruct
		--keyStruct= StaticConstructObject(Key_C,SCriptstruct_C)
		--	StaticConstructObject(Key_C,SCriptstruct_C)
		--keyStruct.KeyName= FName("W")
		if FirstPlayerController:IsInputKeyDown(ArrTable)== true then
			--print("true")
		else --print("false")
		end
		
		
--		print(FirstPlayerController:IsInputKeyDown(ArrTable):ToString())
		
		
		
		
	end
end

local CommandStruct_C = FindFirstOf("Class /Script/ReadyOrNot.SWATManager")

local ModiKey1=false
local ModiKey2=false

local function issueModifier1()

	ModiKey1 = true
end
local function issueModifier2()

	ModiKey2 = true
end

local function issueHold()


	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	CommandStruct_C:GiveHoldCommand(CurrTeamType)


end

local function issueFallIn()

	--print(" Backslash pressed")
	
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if not ModiKey1 then
		CommandStruct_C:GiveFallInCommand(CurrTeamType,1)
		
	else
		local Pawn= PlayerController.Pawn
		CommandStruct_C:GiveMoveCommand(CurrTeamType, Pawn:K2_GetActorLocation())
		ModiKey1=false
	end


end

local function issueSaD()

	print("9 pressed")
	local Pawn= PlayerController.Pawn
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	CommandStruct_C:GiveSearchAndSecureCommand(CurrTeamType, Pawn:K2_GetActorLocation(), true )
	

end

local function issueBreachFlash()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Flashbang_V2.Grenade_Flashbang_V2_C")
	--print(Grenade:GetFullName())
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 2, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 2, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end			
		end
	end
end

local function issueBreach()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then		
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),nil,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),nil,nil ,true,false, false,false ,0 )
				ModiKey1=false
			elseif not ModiKey1 and  ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),nil,nil ,true,true, false,false ,0 )
				ModiKey2=false	
			end
		end
	end
end

local function issueBreachShotgun()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType = PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
		
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),nil,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),nil,nil ,true,false, false,false ,0 )
				ModiKey1=false				
			end
			
			
			
		end
	end
end
local function issueBreachShotgunFlash()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Flashbang_V2.Grenade_Flashbang_V2_C")
	print(Grenade:GetFullName())
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end	
		end
	end
end
local function issueBreachShotgunGas()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_CSGas_V2.Grenade_CSGas_V2_C")
	print(Grenade:GetFullName())
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end				
		end
	end
end
local function issueBreachShotgunStinger()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Stinger_V2.Grenade_Stinger_V2_C")
	print(Grenade:GetFullName())
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 4, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end				
			
		end
	end
end



local function issueBreachGas()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_CSGas_V2.Grenade_CSGas_V2_C")
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then	
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end			
		end
	end
end

local function issueBreachStinger()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Stinger_V2.Grenade_Stinger_V2_C")
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 1, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end			
		end
	end
end


local function issueBreachC2Flash()
	local Target = nil 
	local Pawn= PlayerController.Pawn
	local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Flashbang_V2.Grenade_Flashbang_V2_C")
	 Target=LastDoor
	 LastDoor=nil
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	if Target~=nil then
		if string.find(Target:GetFullName(),"Door") then
			if not ModiKey1 and not ModiKey2 then
				CommandStruct_C:GiveBreachAndClearCommand(Target, 6, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,false,false, false,false ,0 )
			elseif ModiKey1 and not ModiKey2 then	
				CommandStruct_C:GiveBreachAndClearCommand(Target, 6, CurrTeamType, Pawn:K2_GetActorLocation(),Grenade,nil ,true,false, false,false ,0 )	
				ModiKey1=false	
			end			
		end
	end
end
local function issueBreachC2()
    local Target = nil 
    local Pawn = PlayerController.Pawn
    Target = LastDoor
    LastDoor = nil
    local CurrTeamType = PlayerController.Pawn.SwatCommandWidget.ActiveTeamType

    if Target ~= nil and string.find(Target:GetFullName(), "Door") then
        if not ModiKey1 and not ModiKey2 then
            CommandStruct_C:GiveBreachAndClearCommand(
                Target, 6, CurrTeamType, Pawn:K2_GetActorLocation(), nil, nil, false,false,false,false,0
            )
        elseif ModiKey1 and not ModiKey2 then
            CommandStruct_C:GiveBreachAndClearCommand(
                Target, 6, CurrTeamType, Pawn:K2_GetActorLocation(), nil, nil, true,false,false,false,0
            )
            ModiKey1 = false
        end
    end
end


local function issueStackUp()

	
	
	local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	
	if Target~=nil then
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		if not ModiKey1 and not ModiKey2 then
		--	print(Target:GetFullName())
			CommandStruct_C:GiveStackUpCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), Pawn:GetActorUpVector(), true, 1)
		elseif ModiKey1 and not ModiKey2 then
			CommandStruct_C:GiveStackUpCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), Pawn:GetActorUpVector(), true, 2)
			ModiKey1=false
		elseif ModiKey2 and not ModiKey1 then	
			CommandStruct_C:GiveStackUpCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), Pawn:GetActorUpVector(), true, 3)
			ModiKey2=false
		elseif ModiKey1 and ModiKey2 then
			CommandStruct_C:GiveStackUpCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), Pawn:GetActorUpVector(), true, 4)
			ModiKey2=false
			ModiKey1=false
		end
	end
	

end

local function issueUnlock()

	print("* pressed")
	
	local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	if Target~=nil then
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		print(Target:GetFullName())
		CommandStruct_C:GivePickLockCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation())
	end

end
local function issueOpenDoor()

	print("* pressed")
	
	local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	if Target~=nil then
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		
		if not ModiKey1 then
			CommandStruct_C:GiveOpenDoorCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation())
		else CommandStruct_C:GiveCloseDoorCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation())
			ModiKey1=false
		end
	end

end
local function issueCover()

	
	local Pawn= PlayerController.Pawn
	
	
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		
		CommandStruct_C:GiveCoverAreaCommand(CurrTeamType, Pawn:K2_GetActorLocation())
	

end
local function issueMoveCommand()

	
	local Pawn= PlayerController.Pawn
	
	
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		
		CommandStruct_C:GiveMoveCommand(CurrTeamType, Pawn:K2_GetActorLocation())
	

end
local function issueDisarmTrap()	
	
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	if Target~=nil then		
		CommandStruct_C:GiveDisarmTrapOnDoorCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation())
	end

end
local function issueCheckTrap()

	
	
	
	
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	if Target~=nil then	
		if not ModiKey1 then
			CommandStruct_C:GiveCheckForTrapsCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), Pawn:GetActorUpVector())
		else 	CommandStruct_C:GiveScanDoorCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), 2)
			ModiKey1=false
		end
	end

end
local function issuePeek()

	
		local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
		local Target = nil 
	local Pawn= PlayerController.Pawn
	Target= LastDoor
	LastDoor=nil
	if Target~=nil then		
		CommandStruct_C:GiveScanDoorCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation(), 2)
	end

end

local function issueRestrain()
	local CurrTeamType=PlayerController.Pawn.SwatCommandWidget.ActiveTeamType
	local Target = nil 
	local Pawn= PlayerController.Pawn	
	Target = PlayerController.Pawn.SwatCommandWidget.LastContextActor
	if Target~=nil then		
		CommandStruct_C:GiveRestrainCommand(Target, CurrTeamType, Pawn:K2_GetActorLocation())
	end
end
local function issueYell()
	
	--local Target = nil 
	local Pawn= PlayerController.Pawn	
	--Target = PlayerController.Pawn.SwatCommandWidget.LastContextActor
	if Pawn~=nil then		
		Pawn:OnYellExecute()
	end
end

local SManagerIsReset=false

local function UpdateValues()
	if SManagerIsReset then
		CommandStruct_C= FindFirstOf("SWATManager")
		
		SManagerIsReset=false
	end
	
		PlayerController=UEHelpers:GetPlayerController()
	
	if  UEHelpers:GetPlayerController().Pawn.SwatCommandWidget.LastContextActor ~= nil then
		--if string.find(PlayerController.Pawn.SwatCommandWidget.LastContextActor:GetFullName(),"Door") then
			local LastDoor_ = UEHelpers:GetPlayerController().Pawn.SwatCommandWidget.LastContextActor
			if LastDoor_:IsValid() then
				if string.find(LastDoor_:GetFullName(), "Door") then
					LastDoor =LastDoor_
				end
			end
		--end
	end
end

local function issueWedge()
    local Pawn   = PlayerController.Pawn
    local Target = LastDoor
    LastDoor = nil

    if Target ~= nil and string.find(Target:GetFullName(), "Door") then
        local CurrTeamType = Pawn.SwatCommandWidget.ActiveTeamType

        CommandStruct_C:GiveWedgeDoorCommand(
            Target,
            CurrTeamType,
            Pawn:K2_GetActorLocation(),
            Pawn:GetActorUpVector()
        )
    end
end

local function issueRemoveWedge()
    local Pawn   = PlayerController.Pawn
    local Target = LastDoor
    LastDoor = nil

    if Target ~= nil and string.find(Target:GetFullName(), "Door") then
        local CurrTeamType = Pawn.SwatCommandWidget.ActiveTeamType

        CommandStruct_C:GiveRemoveWedgeCommand(
            Target,
            CurrTeamType,
            Pawn:K2_GetActorLocation(),
            Pawn:GetActorUpVector()
        )
    end
end

local function issueDeployGrenade(grenadeClass, distance)
    local Pawn = PlayerController and PlayerController.Pawn
    if not Pawn or not Pawn:IsValid() then
        return
    end
    if not grenadeClass or not grenadeClass:IsValid() then
        return
    end

    local widget = Pawn.SwatCommandWidget
    if not widget or not widget:IsValid() then
        return
    end

    local CurrTeamType = widget.ActiveTeamType
    if CurrTeamType == nil then
        return
    end

    local ctx = widget.ContextualData   -- FHitResult
    local targetLoc = nil

    if ctx then
        local loc = ctx.Location or ctx.ImpactPoint
        if loc then
            -- convert FHitResult's FVector (userdata) into a Lua table FVector
            targetLoc = {
                X = loc.X,
                Y = loc.Y,
                Z = loc.Z,
            }
        end
    end

    -- Fallback if contextual data isn't valid
    if not targetLoc then
        local origin  = Pawn:K2_GetActorLocation()
        local forward = Pawn:GetActorForwardVector()
        local dist    = distance or 600.0

        targetLoc = {
            X = origin.X + forward.X * dist,
            Y = origin.Y + forward.Y * dist,
            Z = origin.Z,
        }
    end

    CommandStruct_C:GiveDeployGrenadeAtLocation(
        CurrTeamType,
        targetLoc,
        grenadeClass
    )
end

local function issueThrowFlash()
    local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Flashbang_V2.Grenade_Flashbang_V2_C")
    if not Grenade or not Grenade:IsValid() then
        print("Flash grenade class not found")
        return
    end

    issueDeployGrenade(Grenade, 250.0)
end

local function issueThrowStinger()
    local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_Stinger_V2.Grenade_Stinger_V2_C")
    if not Grenade or not Grenade:IsValid() then
        print("Stinger grenade class not found")
        return
    end

    issueDeployGrenade(Grenade, 250.0)
end

local function issueThrowGas()
    local Grenade = StaticFindObject("/Game/Blueprints/Items/WeaponsRevised/Grenade_CSGas_V2.Grenade_CSGas_V2_C")
    if not Grenade or not Grenade:IsValid() then
        print("Gas grenade class not found")
        return
    end

    issueDeployGrenade(Grenade, 250.0)
end







RegisterHook("/Script/ReadyOrNot.PlayerCharacter:Server_UpdateCameraRotationRate", function (Context) end,
function () UpdateValues() end
	
 )
 
 --RegisterHook("/Script/ReadyOrNot.SwatCommandWidget:OnCommandIssued", function ( self, Obj , locals, retur) 
 --print(self:get())
 --
 --end)
 
 
 NotifyOnNewObject("/Script/Engine.PlayerController", function(CreatedObject)
	
	SManagerIsReset=true
	
    
	
end)


RegisterKeyBind(Key.F13, 		function() issueModifier1() end )
RegisterKeyBind(Key.F22, 		function() issueModifier2() end )
  
RegisterKeyBind(Key.MULTIPLY, 	function() issueUnlock() end )
RegisterKeyBind(Key.PAGE_DOWN,	function() issueOpenDoor() end ) 
RegisterKeyBind(Key.F8,  		function() issueYell() end ) 
RegisterKeyBind(Key.F14, function()
    if ModiKey1 and ModiKey2 then
        issueWedge()
        ModiKey1 = false
        ModiKey2 = false

    elseif ModiKey2 then
        issueRemoveWedge()
        ModiKey2 = false

    elseif ModiKey1 then
        issueCover()
        ModiKey1 = false

    else
        issueDisarmTrap()
    end
end)

RegisterKeyBind(Key.F15, function() issueBreachFlash()	end )   
RegisterKeyBind(Key.SEVEN, 		function() issueHold() end )
RegisterKeyBind(Key.PAGE_UP, 	function() issueFallIn() end )
RegisterKeyBind(Key.NINE, 		function() issueSaD() end ) 
RegisterKeyBind(Key.EIGHT, 		function() issueStackUp() end )
RegisterKeyBind(Key.ZERO, 		function() issueBreach() end )
RegisterKeyBind(Key.DIVIDE, 	function() issueBreachFlash() end )   
RegisterKeyBind(Key.ADD, 		function() issueBreachC2Flash() end )
RegisterKeyBind(Key.SUBTRACT, 	function() issueBreachC2() end )
RegisterKeyBind(Key.F16, 		function() issueBreachGas() end )
RegisterKeyBind(Key.F17, 		function() issueBreachStinger() end )
RegisterKeyBind(Key.F18, 		function() issueBreachShotgun() end )
RegisterKeyBind(Key.F19, function()
    if ModiKey1 and ModiKey2 then
        issueThrowGas()
        ModiKey1 = false
        ModiKey2 = false

    elseif ModiKey1 and not ModiKey2 then
        issueThrowFlash()
        ModiKey1 = false

    elseif ModiKey2 and not ModiKey1 then
        issueThrowStinger()
        ModiKey2 = false

    else
        issueBreachShotgunFlash()
    end
end)


RegisterKeyBind(Key.F21, 		function() issueBreachShotgunGas() end )
RegisterKeyBind(Key.F24, 		function() issueBreachShotgunStinger() end )
RegisterKeyBind(Key.F20, 		function() issueRestrain() end )
RegisterKeyBind(Key.F23, 		function() issueCheckTrap() end )
--RegisterKeyBind(Key.F24, 		function() issuePeek() end )
--ModiKey1:
--RegisterKeyBind(Key.F14, 		function() issueCover() end )  issueMoveCommand()
