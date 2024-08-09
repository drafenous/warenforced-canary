local voodooOfLife = Action()

function voodooOfLife.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid ~= 1 or not target:isPlayer() then
        return false
    end

    local isMyself = false;
    if target:getGuid() == player:getGuid() then
        isMyself = true;
    end

    if target:getGroup():getId() ~= GROUP_TYPE_NONE then
        if isMyself then
            player:sendCancelMessage("Your're not dead.")
        else
            player:sendCancelMessage(target:getName() .. " is not dead.")
        end
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
    if not isMyself then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have revived " .. target:getName() .. ".")
    end
    item:remove(1)
    target:save()
    return true
end

voodooOfLife:id(44780)
voodooOfLife:register()
