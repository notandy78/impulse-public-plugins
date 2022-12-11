local setNameCommand = {
	description = "Forcefully changes a player's name. Does not save to database.",
	requiresArg = true,
    etOnly = true,
	onRun = function(ply, arg, rawText)
        local target = arg[1]
        local newName = string.sub(rawText, (string.len(target) + 2))
		newName = string.Trim(newName)
        local targ = impulse.FindPlayer(target)
        
        if not ply:IsEventTeamDirector() then
            return ply:Notify("You do not have permission to use this command.")
        end

        if not targ and not IsValid(targ) then
            ply:Notify("Could not find player: "..tostring(target))
        end

        if targ and IsValid(targ) then
            ply:Notify("You have changed "..targ:Name().."'s name to "..newName..".")
            targ:SetRPName(newName)
        end
    end
}

impulse.RegisterChatCommand("/setname", setNameCommand)
