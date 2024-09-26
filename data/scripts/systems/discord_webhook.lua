-- Sends Discord webhook notifications.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.
if not announcementChannels then
    announcementChannels = {
        ["serverAnnouncements"] = "https://discord.com/api/webhooks/1272738605445414962/6rLqRdOLsDN9d2Lo_UGGqEZoq98cUfqJM20khUrceUCHpn4359JudnL0fETX6W65eQyt", -- Used for an announcement channel on your discord
        ["raids"] = "https://discord.com/api/webhooks/1288663766405353534/lxpOOyUBtvK0AdzyRe2nZXOFjfYYx_8bN9AQsfGo720_aCTh7bwdyxnd8eIxbY37L9vu", -- Used to isolate raids on your discord
        ["player-kills"] = "https://discord.com/api/webhooks/1288664131305734144/WE8srzTRAdG1JOe6CR_P2Pa1kpTCDaCHdWeW__3Sfz4fdZh_DgujPRN81SZ3yA_Q8yLT", -- Self-explaining
        ["player-levels"] = "https://discord.com/api/webhooks/1288664373333721088/fo7oyxElOWZYn41KNr4XWJAyONu2s6W2gOezSn1kI5U3eurRMRmyRsXt2abL2HH7y0TA", -- Self-explaining
        ["reports"] = "https://discord.com/api/webhooks/1288664576241700864/yjmK-a84ZT6nQZ_fu9VYrmnwRwaq2in1e5rPtDnmHaZ5Q_bWGr_y9cBO5KTryk5l3KZj"
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
