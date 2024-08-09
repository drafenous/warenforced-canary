--[[
	/addbless playername, blessId, count
]] local printConsole = true

local addBless = TalkAction("/addbless")

function addBless.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    if param == "" then
        player:sendCancelMessage("Command param required.")
        return true
    end

    local split = param:split(",")
    local targetName = split[1]
    local blessId = tonumber(split[2])
    local count = split[3] and tonumber(split[3]) or 1

    logger.info("Param: {}, targetName: {}, blessId: {}, count: {}", param, targetName, blessId, count)

    local target = Player(targetName)
    if target then
        if blessId <= 9 then
            target:addBlessing(blessId)
            target:sendTextMessage(MESSAGE_ADMINISTRATOR, "You have received a new bless: " .. blessId)
            player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You have sucessfull added the bless " .. blessId ..
                " to the player " .. target:getName() .. ".")
            if printConsole then
                logger.info("[addBless.onSay] - Player: {} has been added {} of the bless: {} to the player: {}",
                    player:getName(), count, blessId, target:getName())
            end
            return true
        end
        player:sendCancelMessage("Invalid bless id.")
        return true
    end
    player:sendCancelMessage("Player not found.")
    return true
end

addBless:separator(" ")
addBless:groupType("god")
addBless:register()
