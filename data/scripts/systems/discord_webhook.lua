-- Sends Discord webhook notifications.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.
if not announcementChannels then
    announcementChannels = {
        ["serverAnnouncements"] = configKeys.DISCORD_WEBHOOK_URL, -- Used for an announcement channel on your discord
        ["raids"] = configKeys.DISCORD_RAIDS_WEBHOOK_URL, -- Used to isolate raids on your discord
        ["player-kills"] = configKeys.DISCORD_PLAYER_KILLS_WEBHOOK_URL, -- Self-explaining
        ["player-levels"] = configKeys.DISCORD_PLAYER_LEVELS_WEBHOOK_URL, -- Self-explaining
        ["reports"] = configKeys.DISCORD_REPORTS_WEBHOOK_URL
    }
end

--[[
	Example of notification (After you do the config):
	This is going to send a message into your server announcements channel

	local message = blablabla
	local title = test
	Webhook.sendMessage(title, message, WEBHOOK_COLOR_YELLOW,
                        announcementChannels["serverAnnouncements"])

	Dev Comment: This lib can be used to add special webhook channels
	where you are going to send your messages. Webhook.specialSend was designed
	to be used with countless possibilities.
]]
