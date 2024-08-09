local forceRevive = TalkAction("/forcerevive")

function forceRevive.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    -- Check the first param (player name) exists
    if param == "" then
        player:sendCancelMessage("Player name param required")
        -- Distro log
        logger.error("[forceRevive.onSay] - Player name param not found")
        return true
    end

    local split = param:split(",")
    local name = split[1]

    -- Check if player is online
    local target = Player(name)
    if not target then
        player:sendCancelMessage("Player " .. string.titleCase(name) .. " is not online.")
        -- Distro log
        logger.error("[forceRevive.onSay] - Player {} is not online", string.titleCase(name))
        return true
    end

    if target:getGroup():getId() ~= GROUP_TYPE_NONE then
        player:sendCancelMessage("You can only revive a dead player.")
        return true
    end
    
    local targetGuid = player:getGuid()
    local resultId = db.query("UPDATE `player_deaths` SET `playerWasRevived` = 1 WHERE `player_id` = " .. targetGuid ..
                                  " ORDER BY time DESC LIMIT 1")
    target:setGroup(Group(GROUP_TYPE_NORMAL))
    local sex = target:getSex()
    local currentOutfit = target:getOutfit()
    currentOutfit.lookAddons = 0
    if sex == 1 then
        currentOutfit.lookType = 128
    elseif sex == 0 then
        currentOutfit.lookType = 136
    end
    target:setOutfit(currentOutfit)
    target:getPosition():sendMagicEffect(50)

    target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been revived.")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have revived " .. target:getName() .. ".")
    target:save()
    return true
end

forceRevive:separator(" ")
forceRevive:groupType("god")
forceRevive:register()
