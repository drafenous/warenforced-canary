local ghost = TalkAction("/ghost")

function ghost.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    local position = player:getPosition()
    local isGhost = not player:isInGhostMode()

    player:setGhostMode(isGhost)
    if isGhost then
        player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are now invisible.")
        position:sendMagicEffect(CONST_ME_AVATAR_APPEAR)
    else
        player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are visible again.")
        position:sendMagicEffect(CONST_ME_AVATAR_APPEAR)
    end
    return true
end

ghost:separator(" ")
ghost:groupType("gamemaster")
ghost:register()
