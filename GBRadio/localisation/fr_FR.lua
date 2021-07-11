GBRadio_Colour          = {};
GBRadio_Localisation    = {};

GBRadio_Version_String = "GBRadio - " .. GBRadio_VERSION;

-- LOCALISATION.LUA
GBRadio_Colour.Error       = ""--"|cFFFF0000";
GBRadio_Colour.Notice      = ""--"|cFF00C0FF";
GBRadio_Colour.PlayerName  = ""--"|cFF00FF00";
GBRadio_Colour.GBRadioName = ""--"|cFF00C0FF";

GBRadio_Localisation.LOCALE                          = "fr_FR";

GBRadio_Localisation.CMD                             = "/gbr activate";

GBRadio_Localisation.PREFIX_MESSAGE                  = "|r[" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_FREQUENCY                = "|r[@" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_PLAYER_NAME              = "|r[" .. GBRadio_Colour.GBRadioName .. "\124Hplayer:%s\124h%s\124h|r]";

GBRadio_Localisation.PREFIX_META_GAMING              = "";
GBRadio_Localisation.PREFIX_ERROR                    = "|r[" .. GBRadio_Colour.Error .. "ERROR|r]";

GBRadio_Localisation.SPLIT_DELIMITER                 = " -- ";
GBRadio_Localisation.SEPERATOR                       = "--------------------------------------------------------------------------";

GBRadio_Localisation.NOTICE_RADIO_ON                 = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s grésille brièvement en s'activant.";
GBRadio_Localisation.NOTICE_RADIO_OFF                = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s se fait silencieux alors que vous le désactivez.";
GBRadio_Localisation.NOTICE_OUT_OF_RANGE             = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s est mortellement silencieux... Il semblerait que vous soyez trop loin du transmetteur le plus proche!"

GBRadio_Localisation.NOTICE_TRANSMITTER_ON           = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s utilise désormais le mode transmetteur.";
GBRadio_Localisation.NOTICE_TRANSMITTER_OFF          = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s n'utilise plus le mode transmetteur.";

GBRadio_Localisation.NOTICE_CLOSEST_TRANSMITTER      = GBRadio_Localisation.PREFIX_MESSAGE .. " Le transmetteur le plus proche est à environ %s, aux coordonnées %s.";

GBRadio_Localisation.NOTICE_RADIO_IS_OFF             = GBRadio_Localisation.PREFIX_MESSAGE .. " Vous remarquez que votre %s n'est pas allumé. Activez le avec " .. GBRadio_Localisation.CMD;

GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON      = GBRadio_Localisation.PREFIX_FREQUENCY .. GBRadio_Localisation.PREFIX_PLAYER_NAME .. ": %s";
GBRadio_Localisation.MSG_RECEIVE_META_GAMING_OFF     = GBRadio_Localisation.PREFIX_FREQUENCY .. ": %s";

GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_HIDDEN    = " attrape son %s qui %s alors qu'il reçoit un message.";    -- format: device name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.)
GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_VISIBLE   = " attrape son %s qui %s alors qu'il reçoit ce message: ";   -- format: device name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.), message

GBRadio_Localisation.EMOTE_SEND_MESSAGE_HIDDEN       = "murmure quelque chose dans %s %s.";                         -- format: Gender, device name
GBRadio_Localisation.EMOTE_SEND_MESSAGE_VISIBLE      = "parle dans %s %s" .. GBRadio_Localisation.SPLIT_DELIMITER;  -- format: Gender, device name

GBRadio_Localisation.HISTORY_TITLE                   = GBRadio_Colour.Notice .. "# Affichage de l'historique de communication pour %s";
GBRadio_Localisation.HISTORY_SUMMARY                 = GBRadio_Colour.Notice .. "# %s de %s lignes possibles écrites";

GBRadio_Localisation.ERROR_MSG_RECEIVE               = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Localisation.PREFIX_ERROR .. " Votre %s bourdonne en décodant un message!";

GBRadio_Localisation.IDENTIFY_CHAT_FRAME             = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Colour.Notice .. " IDENTIFICATION - Ceci est la fenêtre de chat %s";

GBRadio_Localisation.SET_FREQUENCY					 = GBRadio_Localisation.PREFIX_MESSAGE .. " Vous changez la fréquence de votre %s sur : %s.";

GBRadio_Localisation.STATIC                          = " *Grésillements* ";
GBRadio_Localisation.STATIC_SOUND                    = " *brzz* ";

GBRadio_Localisation.POSSESSIVE_GENDER               = { "son", "son", "son" };