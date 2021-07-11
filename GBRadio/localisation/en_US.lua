GBRadio_Colour          = {};
GBRadio_Localisation    = {};

GBRadio_Version_String = "GBRadio - " .. GBRadio_VERSION;

-- LOCALISATION.LUA
GBRadio_Colour.Error       = ""--"|cFFFF0000";
GBRadio_Colour.Notice      = ""--"|cFF00C0FF";
GBRadio_Colour.PlayerName  = ""--"|cFF00FF00";
GBRadio_Colour.GBRadioName = ""--"|cFF00C0FF";

GBRadio_Localisation.LOCALE                          = "en_US";

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

GBRadio_Localisation.NOTICE_TRANSMITTER_ON           = GBRadio_Localisation.PREFIX_MESSAGE .. " Your %s is now in transmitter mode.";
GBRadio_Localisation.NOTICE_TRANSMITTER_OFF          = GBRadio_Localisation.PREFIX_MESSAGE .. " Your %s is now out of transmitter mode.";

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

GBRadio_Localisation.SET_FREQUENCY					 = GBRadio_Localisation.PREFIX_MESSAGE .. " You change the frequency of your %s and put it on %s.";

GBRadio_Localisation.STATIC                          = " *Static* ";
GBRadio_Localisation.STATIC_SOUND                    = " *kchrr* ";

GBRadio_Localisation.POSSESSIVE_GENDER               = { "their", "his", "her" };

GBRadio_Localisation.OPTION_NAME_NAME = "Comms Device Name";
GBRadio_Localisation.OPTION_DESC_NAME = "The name of your comms device\n\nNote: This is used in emotes to describe the type of device you have, as well as in messages.";

GBRadio_Localisation.OPTION_NAME_channelprefix = "Comm Frequencies";
GBRadio_Localisation.OPTION_DESC_channelprefix = "Your comm frequencies enables you to send and receive communications from people using the same paticular frequency, but only in your guild.\n\nNote: Guilds may split their communication system up with different frequencies for different jobs. Make sure you're entering the right ones!";

GBRadio_Localisation.OPTION_NAME_primaryfrequency = "Primary comm frequency";

GBRadio_Localisation.OPTION_NAME_msgsenddelay = "Message send delay";
GBRadio_Localisation.OPTION_DESC_msgsenddelay = "Delay (in seconds) between /saying a message and sending it over the comms channel.\n\nNOTE: If this setting is too low, then you run the risk of people receiving your comms message before you've actually said it out loud with /say.";

GBRadio_Localisation.OPTION_NAME_outputchatframe = "Output Chat Frame";
GBRadio_Localisation.OPTION_DESC_outputchatframe = "Select which chat frame you want communication messages sent to.\n\nNote: This must be a valid number, otherwise your messages won't show.\n\nFind out proper frame ID's by pressing Identify Chat Frames, and then set the Output Chat Frame slider to match the number of the chat frame you'd like to use.";

GBRadio_Localisation.OPTION_NAME_outputchatframeidentify = "Identify Chat Frames";
GBRadio_Localisation.OPTION_DESC_outputchatframeidentify = "Clicking this will output a message in each of your chat windows, helping you to identify them.";

GBRadio_Localisation.OPTION_NAME_chatmessagecolour = "Colour of message text";
GBRadio_Localisation.OPTION_DESC_chatmessagecolour = "Set text colour";

GBRadio_Localisation.OPTION_NAME_squelchtimer = "Squelch";
GBRadio_Localisation.OPTION_DESC_squelchtimer = "Supresses message received emotes and sounds for the specified time, starting when a message received emote is fired. This setting helps prevent message received emote spam on busy comm frequencies.";

GBRadio_Localisation.OPTION_NAME_speech = "Speech";
GBRadio_Localisation.OPTION_DESC_speech = "Automatically /say messages when you send them.";

GBRadio_Localisation.OPTION_NAME_emotes = "Receive Emotes";
GBRadio_Localisation.OPTION_DESC_emotes = "Display emotes when you receive a communication.\n\nNOTE: Disabling this feature will disable communication sounds, and cause sound settings to be ignored.";

GBRadio_Localisation.OPTION_NAME_sendemotes = "Send Emotes";
GBRadio_Localisation.OPTION_DESC_sendemotes = "Display emotes when you send a communication.";

GBRadio_Localisation.OPTION_NAME_redactedemotes = "Redacted Emotes";
GBRadio_Localisation.OPTION_DESC_redactedemotes = "Remove messages sent by other players from your emotes.";

GBRadio_Localisation.OPTION_NAME_panicemotes = "Panic Emote";
GBRadio_Localisation.OPTION_DESC_panicemotes = "Display an emote when you use your panic button.";

GBRadio_Localisation.OPTION_NAME_metagaming = "Meta Gaming Mode";
GBRadio_Localisation.OPTION_DESC_metagaming = "Display player names in communications.";

GBRadio_Localisation.OPTION_NAME_showtrp3names = "Show TRP3 Names";
GBRadio_Localisation.OPTION_DESC_showtrp3names = "Show TotalRP3 names in communications alongside real character names.\n\nNote: You don't need TRP3 installed to see names.";

GBRadio_Localisation.OPTION_NAME_deviceemotenoises = "Device Emote Noises";
GBRadio_Localisation.OPTION_DESC_deviceemotenoises = "These words will be used in automatic emotes to describe the sound your radio makes. Seperate words on a new line. Requires at least 4 entries.";

GBRadio_Localisation.OPTION_NAME_emotereceive = "Message Received Emote";
GBRadio_Localisation.OPTION_DESC_emotereceive = "This emote will fire when you receive a communication message, and have redacted emotes switched off.";

GBRadio_Localisation.OPTION_NAME_emotereceivehidden = "Message Received Redacted Emote";
GBRadio_Localisation.OPTION_DESC_emotereceivehidden = "This emote will fire when you receive a communication message, and have redacted emotes switched on.";

GBRadio_Localisation.OPTION_NAME_emotesend = "Message Send Speech Emote";
GBRadio_Localisation.OPTION_DESC_emotesend = "This emote will fire when you send a communication message, and have Speech switched on.";

GBRadio_Localisation.OPTION_NAME_emotesendhidden = "Message Send No Speech Emote";
GBRadio_Localisation.OPTION_DESC_emotesendhidden = "This emote will fire when you send a communication message, and have Speech switched off.";

GBRadio_Localisation.OPTION_NAME_panicbuttonemote = "Panic Button Emote";
GBRadio_Localisation.OPTION_DESC_panicbuttonemote = "This emote will fire when you type /gbr panic or /pb.";

GBRadio_Localisation.OPTION_NAME_panicbuttonmessage = "Panic Button Message";
GBRadio_Localisation.OPTION_DESC_panicbuttonmessage = "This message will be sent to your default frequency when you type /panic.";

GBRadio_Localisation.OPTION_NAME_transmitterlocations = "Transmitters";
GBRadio_Localisation.OPTION_DESC_transmitterlocations = "Location (in coordinates and instanceId) of transmitters that your device can utilise.\n\nNOTE: They must be in the following format: x,y,instanceId\nThere are no spaces. You can put multiple InstanceIds by separating them with - . Please seperate entries on a new line.";

GBRadio_Localisation.OPTION_NAME_usetransmitters = "Transmitter mode";
GBRadio_Localisation.OPTION_DESC_usetransmitters = "Enabling this will restrict communications to within ranges of specified transmitters inside specified zones only.";

GBRadio_Localisation.OPTION_NAME_transmittermaxrange = "Maximum transmitter range threshold";
GBRadio_Localisation.OPTION_DESC_transmittermaxrange = "Maximum range you can be away from a transmitter before message sending and receiving is cut off completely.";

GBRadio_Localisation.OPTION_NAME_usetransmitterdistortion = "Transmitter distortion";
GBRadio_Localisation.OPTION_DESC_usetransmitterdistortion = "Enabling this will cause messages to become distorted if the sender or receiver is past the specified thresholds.";

GBRadio_Localisation.OPTION_NAME_transmitterlowrange = "Transmitter low distortion threshold";
GBRadio_Localisation.OPTION_DESC_transmitterlowrange = "Distance from transmitters before messages start to get distorted.";

GBRadio_Localisation.OPTION_NAME_transmittermedrange = "Transmitter bad distortion threshold";
GBRadio_Localisation.OPTION_DESC_transmittermedrange = "Distance from transmitters before messages start to very distorted.";

GBRadio_Localisation.OPTION_NAME_transmitterhighrange = "Transmitter very bad distortion threshold";
GBRadio_Localisation.OPTION_DESC_transmitterhighrange = "Distance from transmitters before messages become very badly distorted.";

GBRadio_Localisation.OPTION_NAME_playsounds = "Play Sound Effects";
GBRadio_Localisation.OPTION_DESC_playsounds = "Play sound effects when you receive communication messages.";

GBRadio_Localisation.OPTION_NAME_playareasounds = "Play Area Sounds";
GBRadio_Localisation.OPTION_DESC_playareasounds = "Play communication sounds in an area around your character that other GHI users will be able to hear.\n\nDisabling this option will play sounds for only you instead.\n\nNote: Requires GHI to be installed. If GHI isn't installed, this setting is ignored and sounds are played for you only.";

GBRadio_Localisation.OPTION_NAME_devicesound = "Device Sound";
GBRadio_Localisation.OPTION_DESC_ = "ID of the sound file to play when you receive a communication message.";

GBRadio_Localisation.OPTION_NAME_loadpresetmsg = "From the list of presets below, choose what most closely resembles your communication device.";

GBRadio_Localisation.OPTION_NAME_loadpreset = "Load preset";

GBRadio_Localisation.OPTION_NAME_importboxmsg = "Here you can export or import settings for GBRadio. The main purpose of this feature is to allow guild masters the option to provide pre-made templates for guild members to use, so that everyone uses the same type of communication device.";

GBRadio_Localisation.OPTION_NAME_importbox = "Import Settings";
GBRadio_Localisation.OPTION_DESC_importbox = "";

GBRadio_Localisation.OPTION_NAME_exportbox = "Export Settings";
GBRadio_Localisation.OPTION_DESC_exportbox = "Copy your GBRadio export data here.";

GBRadio_Localisation.OPTION_NAME_ghidetected = "GHI Installed";
GBRadio_Localisation.OPTION_DESC_ghidetected = "If Gryphonheart Items is installed, sound effects will default to playing in an area around you when receiving communications.\n\nNote: You can still disable area sounds if you have GHI installed.";

GBRadio_Localisation.OPTION_NAME_trp3detected = "TRP3 Installed";
GBRadio_Localisation.OPTION_DESC_trp3detected = "If TotalRP3 is installed, players receiving your communication messages will be able to see your characters custom name (and your characters real in-game name) if they have Meta Gaming Mode switched on.";

GBRadio_Localisation.OPTION_NAME_aboutpage = "";
GBRadio_Localisation.OPTION_DESC_aboutpage = "Thank you for using GBRadio!\n\nGBRadio was developed with communication in mind. Many guard-based roleplaying guilds use radios (or walkers!), and the aim of this addon is to make that as easy and seamless as possible.\n\nA special thanks to the following people and guilds for their help in testing this addon, providing feedback, and giving suggestions:\n\nEtterna @ Argent Dawn\nMiléan @ Argent Dawn\nDidonus @ Argent Dawn\nHarrvey @ Argent Dawn\nYarwood @ Argent Dawn\nLawri @ Argent Dawn\n\nEye of Dalaran @ Argent Dawn\nStormwind Investigations @ Argent Dawn\nStormwind City Guard @ Argent Dawn\n\n|cFF82C2FFAuthor:|r Nasias @ Argent Dawn (EU)\n|cFF82C2FFContact:|r n@siasdarkstar.com\n\n|cFF82C2FFHelp, updates & changelog for BETA:|r\nhttp://www.nasiasdarkstar.com/GBRadio";

GBRadio_Localisation.OPTION_NAME_helppage = "Help";
GBRadio_Localisation.OPTION_DESC_helppage = "Quick command cheatsheet:\n\n/bb <your message> -- Sends a message.\n/wbb <your message> -- Sends a discreet message.\n/gbr -- Shows all available slash commands\n/gbr coord -- Shows the coordinates at your position\n/gbr activate -- Toggles your device on or off.\n/pb -- Sends a distress message.";

GBRadio_Localisation.OPTION_NAME_activate = "Radio state";
GBRadio_Localisation.OPTION_DESC_activate = "Turn your communication device on or off.";

GBRadio_Localisation.OPTION_NAME_radiosatedesc = "Switch your communication device on or off. This can also be done via slash command!";
GBRadio_Localisation.OPTION_DESC_radiosatedesc = "";

GBRadio_Localisation.OPTION_NAME_isolatedmode = "Isolated mode";
GBRadio_Localisation.OPTION_DESC_isolatedmode = "Restrict messages to guild members only.";

GBRadio_Localisation.OPTION_NAME_isolatedmodedesc = "Toggles between sending and receiving messages from only guild members on the same radio frequencies, or everyone on the same radio frequencies.";
GBRadio_Localisation.OPTION_DESC_isolatedmodedesc = "";

GBRadio_Localisation.OPTION_NAME_send = "Send message";
GBRadio_Localisation.OPTION_DESC_send = "<message> - Send a message through your comms device. |cFF00C0FFYou can also type the short-hand version:|r /bb <message>";

GBRadio_Localisation.OPTION_NAME_panic = "Panic button";
GBRadio_Localisation.OPTION_DESC_panic = "For emergency use. Sends a distress message to your current frequency. |cFF00C0FFYou can also type the short-hand version:|r /pb";

GBRadio_Localisation.OPTION_NAME_coord = "Coordinates";
GBRadio_Localisation.OPTION_DESC_coord = "Tells you your coordinates to use with the transmitter mode.";

GBRadio_Localisation.OPTION_NAME_distance = "Distance Check";
GBRadio_Localisation.OPTION_DESC_distance = "Tells you your current distance from the closest transmitter.";

GBRadio_Localisation.OPTION_NAME_freq = "Set your primary frequency";
GBRadio_Localisation.OPTION_DESC_freq = "<frequencyID> - Sets your primary frequency to the specified ID. Comms messages get sent to this frequency.";

GBRadio_Localisation.OPTION_NAME_showhistory = "Show history";
GBRadio_Localisation.OPTION_DESC_showhistory = "<lines> - Display x lines of communication history starting from the end.";

GBRadio_Localisation.OPTION_NAME_config = "Open configuration";
GBRadio_Localisation.OPTION_DESC_config = "Open the configuration screen for GBRadio";

GBRadio_Localisation.OPTION_NAME_textconfig = [[Device]]
GBRadio_Localisation.OPTION_DESC_textconfig = [[]]

GBRadio_Localisation.OPTION_NAME_messageconfig = [[Messages]]
GBRadio_Localisation.OPTION_DESC_messageconfig = [[]]

GBRadio_Localisation.OPTION_NAME_transmitterconfig = [[Transmitters]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_soundconfig = [[Sounds]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_exportimport = [[Export/Import]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_thirdpartymodules = [[3rd Party]]
GBRadio_Localisation.OPTION_DESC_ = [[]]