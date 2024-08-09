-- keep it ordered
local invalidTypes = {1, 135, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178,
                      179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 411, 415, 424, 439, 440, 468,
                      469, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 501, 518, 519, 520, 524, 525,
                      536, 543, 549, 576, 581, 582, 597, 616, 623, 625, 638, 639, 640, 641, 642, 643, 645, 646, 652,
                      653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 700, 701, 702, 703, 704, 705, 706, 707,
                      708, 709, 710, 711, 713, 715, 718, 719, 722, 723, 737, 741, 742, 743, 744, 748, 751, 752, 753,
                      754, 755, 756, 757, 758, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777,
                      778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796,
                      797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815,
                      816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834,
                      835, 836, 837, 838, 839, 840, 841, 847, 861, 864, 865, 866, 867, 871, 872, 880, 891, 892, 893,
                      894, 895, 896, 897, 898, 911, 912, 917, 930, 941, 942, 946, 953, 954, 959, 983, 995, 996, 997,
                      998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1012, 1014, 1015,
                      1022, 1028, 1074, 1075, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1089, 1090, 1096, 1097,
                      1098, 1099, 1100, 1141, 1145, 1153, 1154, 1155, 1156, 1160, 1170, 1171, 1172, 1176, 1177, 1178,
                      1182, 1192, 1193, 1194, 1198, 1215, 1216, 1225, 1226, 1227, 1228, 1235, 1236, 1237, 1238, 1239,
                      1240, 1241, 1242, 1250, 1254, 1263, 1267, 1273, 1274, 1287, 1302, 1318, 1319, 1320, 1327, 1328,
                      1329, 1330, 1340, 1343, 1345, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1356, 1357,
                      1358, 1359, 1360, 1361, 1362, 1368, 1369, 1370, 1374, 1375, 1376, 1388, 1392, 1395, 1400, 1402,
                      1404, 1409, 1410, 1411, 1420, 1421, 1427, 1429, 1432, 1433, 1434, 1435, 1438, 1442, 1443, 1451,
                      1452, 1458, 1462}

local looktype = TalkAction("/looktype")

function looktype.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    if param == "" then
        player:sendCancelMessage("Command param required.")
        return true
    end

    local split = param:split(",")
    local playerOutfit = player:getOutfit()
    local lookType = split[1] and tonumber(split[1]) or playerOutfit.lookType
    local lookHead = split[2] and tonumber(split[2]) or playerOutfit.lookHead
    local lookBody = split[3] and tonumber(split[3]) or playerOutfit.lookBody
    local lookLegs = split[4] and tonumber(split[4]) or playerOutfit.lookLegs
    local lookFeet = split[5] and tonumber(split[5]) or playerOutfit.lookFeet
    local lookAddons = split[6] and tonumber(split[6]) or playerOutfit.lookAddons

    if lookAddons > 3 then
        player:sendCancelMessage("Invalid Addon number")
        return true
    end

    if lookType >= 0 and lookType < 1469 and not table.contains(invalidTypes, lookType) then
        playerOutfit.lookType = lookType
        playerOutfit.lookHead = lookHead
        playerOutfit.lookBody = lookBody
        playerOutfit.lookLegs = lookLegs
        playerOutfit.lookFeet = lookFeet
        playerOutfit.lookAddons = lookAddons
        player:setOutfit(playerOutfit)
    else
        player:sendCancelMessage("A look type with that id does not exist.")
    end
    return true
end

looktype:separator(" ")
looktype:groupType("gamemaster")
looktype:register()
