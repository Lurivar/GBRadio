GBRadio_Colour          = {};
GBRadio_Localisation    = {};

GBRadio_Version = "GBRadio - v" .. "0.10 BETA";

-- LOCALISATION.LUA
GBRadio_Colour.Error       = ""--"|cFFFF0000";
GBRadio_Colour.Notice      = ""--"|cFF00C0FF";
GBRadio_Colour.PlayerName  = ""--"|cFF00FF00";
GBRadio_Colour.GBRadioName = ""--"|cFF00C0FF";

GBRadio_Localisation.CMD                             = "/gbr activate";

GBRadio_Localisation.PREFIX_MESSAGE                  = "|r[" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_FREQUENCY                = "|r[@" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_PLAYER_NAME              = "|r[" .. GBRadio_Colour.GBRadioName .. "\124Hplayer:%s\124h%s\124h|r]";

GBRadio_Localisation.PREFIX_META_GAMING              = "";
GBRadio_Localisation.PREFIX_ERROR                    = "|r[" .. GBRadio_Colour.Error .. "ERROR|r]";

GBRadio_Localisation.SPLIT_DELIMITER                 = " -- ";
GBRadio_Localisation.SEPERATOR                       = "--------------------------------------------------------------------------";

GBRadio_Localisation.NOTICE_RADIO_ON                 = GBRadio_Localisation.PREFIX_MESSAGE .. " Your %s crackles briefly as it's activated.";
GBRadio_Localisation.NOTICE_RADIO_OFF                = GBRadio_Localisation.PREFIX_MESSAGE .. " Your %s falls silent as it's deactivated.";
GBRadio_Localisation.NOTICE_OUT_OF_RANGE             = GBRadio_Localisation.PREFIX_MESSAGE .. " Your %s is dead quiet... It appears you're too far away from the closest transmitter!"

GBRadio_Localisation.NOTICE_CLOSEST_TRANSMITTER      = GBRadio_Localisation.PREFIX_MESSAGE .. " The closest transmitter is about %s away, at the coordinates %s.";

GBRadio_Localisation.NOTICE_RADIO_IS_OFF             = GBRadio_Localisation.PREFIX_MESSAGE .. " You notice that your %s isn't activated on. Activate it on with " .. GBRadio_Localisation.CMD;

GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON      = GBRadio_Localisation.PREFIX_FREQUENCY .. GBRadio_Localisation.PREFIX_PLAYER_NAME .. ": %s";
GBRadio_Localisation.MSG_RECEIVE_META_GAMING_OFF     = GBRadio_Localisation.PREFIX_FREQUENCY .. ": %s";

GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_HIDDEN    = "'s %s %s as a messsage is received.";       -- format: Player name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.)
GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_VISIBLE   = "'s %s %s with a message: ";                 -- format: Player name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.), message

GBRadio_Localisation.EMOTE_SEND_MESSAGE_HIDDEN       = "murmurs something into %s %s.";                               -- format: Gender
GBRadio_Localisation.EMOTE_SEND_MESSAGE_VISIBLE      = "speaks into %s %s" .. GBRadio_Localisation.SPLIT_DELIMITER;         -- format: Gender

GBRadio_Localisation.HISTORY_TITLE                   = GBRadio_Colour.Notice .. "# Displaying communications history for %s";
GBRadio_Localisation.HISTORY_SUMMARY                 = GBRadio_Colour.Notice .. "# Finished outputting %s out of %s possible lines of history";

GBRadio_Localisation.ERROR_MSG_RECEIVE               = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Localisation.PREFIX_ERROR .. " Your %s fizzled whilst decoding a message!";

GBRadio_Localisation.IDENTIFY_CHAT_FRAME             = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Colour.Notice .. " IDENTIFICATION - This is chat frame %s";