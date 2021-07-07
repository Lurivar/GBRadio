GBRadio.OptionsTable = {

    type        = "group",
    name        = GBRadio_Version_String,
    childGroups = "tree",
    handler     = GBRadio,
    
    args    = {
    
        textconfig = {
        
            type        = "group",
            name        = "Device",
            cmdHidden   = true,
            order       = 0,
            args        = {
        
                name = {
                
                    name        = "Comms Device Name",
                    desc        = "The name of your comms device\n\nNote: This is used in emotes to describe the type of device you have, as well as in messages.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["Name"] = val; end,
                    get         = function(info) return GBRadio.db.char["Name"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                channelprefix = {
                
                    name        = "Comm Frequencies",
                    desc        = "Your comm frequencies enables you to send and receive communications from people using the same paticular frequency, but only in your guild.\n\nNote: Guilds may split their communication system up with different frequencies for different jobs. Make sure you're entering the right ones!",
                    type        = "input",
                    set         = function(info, val) GBRadio:SetCommFrequencies(val); ReloadUI(); end,
                    get         = function(info) return GBRadio:GetCommFrequencies(); end,
                    confirm     = function() return "Changing this setting requires a reload of your User Interface.\n\nPressing okay will reload your UI.\n\nPressing cancel will undo this change and won't reload your UI." end,
                    width       = "full",
                    multiline   = 5,
                    cmdHidden   = true,
                    order       = 1
                },
                
                primaryfrequency = {
                
                    name    = "Primary comm frequency",
                    type    = "select",
                    values  = function(info) return GBRadio:GetCommFrequencies(true); end,
                    order   = 2,
                    set     = function(info, val) GBRadio.db.char["PrimaryChannelPrefix"] = val; end,
                    get     = function(info) local tmp = GBRadio:GetCommFrequencies(true); if tmp[GBRadio.db.char["PrimaryChannelPrefix"]] == nil then print(tmp[GBRadio.db.char["PrimaryChannelPrefix"]])--[[Radio.db.char["PrimaryChannelPrefix"] = 1;]] end return GBRadio.db.char["PrimaryChannelPrefix"]; end,
                    cmdHidden   = true,
                    order = 2
                
                },
                
                msgsenddelay = {
                
                    name        = "Message send delay",
                    desc        = "Delay (in seconds) between /saying a message and sending it over the comms channel.\n\nNOTE: If this setting is too low, then you run the risk of people receiving your comms message before you've actually said it out loud with /say.",
                    type        = "range",
                    width       = "full",
                    min         = 0,
                    max         = 10,
                    softMin     = 0,
                    softMax     = 10,
                    step        = 0.1,
                    set         = function(info, val) GBRadio.db.char["MsgSendDelay"] = val; end,
                    get         = function(info) return GBRadio.db.char["MsgSendDelay"] end,
                    cmdHidden   = true,
                    order       = 3
                
                },
                
            }
            
        },
        
        messageconfig = {
            
            type        = "group",
            name        = "Messages",
            cmdHidden   = true,
            order       = 1,
            args        = {
                
                outputchatframe = {
                
                    name        = "Output Chat Frame",
                    desc        = "Select which chat frame you want communication messages sent to.\n\nNote: This must be a valid number, otherwise your messages won't show.\n\nFind out proper frame ID's by pressing Identify Chat Frames, and then set the Output Chat Frame slider to match the number of the chat frame you'd like to use.",
                    type        = "range",
                    width       = "full",
                    min         = 1,
                    max         = 10,
                    softMin     = 1,
                    softMax     = 10,
                    step        = 1,
                    set         = function(info, val) GBRadio.db.char["OutputChatFrame"] = val; end,
                    get         = function(info) return GBRadio.db.char["OutputChatFrame"] end,
                    cmdHidden   = true,
                    order       = 0
                
                },
                
                outputchatframeidentify = {
                
                    name        = "Identify Chat Frames",
                    desc        = "Clicking this will output a message in each of your chat windows, helping you to identify them.",
                    type        = "execute",
                    width       = "full",
                    func        = function(info, val) GBRadio:IdentifyChatFrames(); end,
                    cmdHidden   = true,
                    order       = 1
                
                },
                
                chatmessagecolour = {
                
                    name        = "Colour of message text",
                    desc        = "Set text colour",
                    type        = "color",
                    set         = function(info, ...) tmp = {...}; GBRadio.db.char["MessageColour"] = tmp; end,
                    get         = function(info) return GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3], GBRadio.db.char["MessageColour"][4];  end,
                    hasAlpha    = false,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 2
                },
            
                squelchtimer = {
                
                    name        = "Squelch",
                    desc        = "Supresses message received emotes and sounds for the specified time, starting when a message received emote is fired. This setting helps prevent message received emote spam on busy comm frequencies.",
                    type        = "range",
                    set         = function(info, val) GBRadio.db.char["SquelchTimer"] = val; end,
                    get         = function(info) return GBRadio.db.char["SquelchTimer"] end,
                    width       = "full",
                    min         = 0,
                    max         = 10,
                    softMin     = 0,
                    softMax     = 10,
                    step        = 1,
                    cmdHidden   = true,
                    order       = 3
                    
                },
            
                speech = {
                
                    name        = "Speech",
                    desc        = "Automatically /say messages when you send them.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["Speech"] = val; end,
                    get         = function(info) return GBRadio.db.char["Speech"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 4
                    
                },
                
                emotes = {
                
                    name        = "Receive Emotes",
                    desc        = "Display emotes when you receive a communication.\n\nNOTE: Disabling this feature will disable communication sounds, and cause sound settings to be ignored.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["Emotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["Emotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                sendemotes = {
                
                    name        = "Send Emotes",
                    desc        = "Display emotes when you send a communication.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["SendEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["SendEmotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                redactedemotes = {
                
                    name        = "Redacted Emotes",
                    desc        = "Remove messages sent by other players from your emotes.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["RedactedEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["RedactedEmotes"] end,
                    confirm     = function() return "|cFFFF0000WARNING!|r\n\nThis addon does not filter profanity from messages!\n\nBy disabling redacted emotes, messages sent by other players will be automatically relayed into an emote by this addon when you receive a message.\n\nRedacted emotes is automatically enabled because Blizzard always holds you responsible for all messages that are sent by your client, regardless of who or what writes them!\n\nWhilst disabling redacted emotes improves the realism of using a communication device, you should only disable it if you trust that EVERYONE in your guild will not swear, send racist remarks or generally break World of Warcraft's rules when sending messages.\n\nIf you are unsure, it's recommended that you leave redacted emotes enabled!" end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 6
                    
                },
                
                panicemotes = {
                
                    name        = "Panic Emote",
                    desc        = "Display an emote when you use your panic button.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PanicEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["PanicEmotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 7
                    
                },
                
                metagaming = {
                
                    name        = "Meta Gaming Mode",
                    desc        = "Display player names in communications.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["MetaGamingState"] = val; end,
                    get         = function(info) return GBRadio.db.char["MetaGamingState"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 8
                    
                },
                
                showtrp3names = {
                
                    name        = "Show TRP3 Names",
                    desc        = "Show TotalRP3 names in communications alongside real character names.\n\nNote: You don't need TRP3 installed to see names.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["ShowTRP3Names"] = val; end,
                    get         = function(info) return GBRadio.db.char["ShowTRP3Names"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 9
                
                },
                
                deviceemotenoises = {
                
                    name        = "Device Emote Noises",
                    desc        = "These words will be used in automatic emotes to describe the sound your radio makes. Seperate words on a new line. Requires at least 4 entries.",
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) GBRadio.db.char["DeviceEmoteNoises"] = GBRadio:SetDeviceEmoteNoises(val); end,
                    get         = function(info) return GBRadio:GetDeviceEmoteNoises(); end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 10
                    
                },
                
                emotereceive = {
                
                    name        = "Message Received Emote",
                    desc        = "This emote will fire when you receive a communication message, and have redacted emotes switched off.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteReceive"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteReceive"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 11
                    
                },
                
                emotereceivehidden = {
                
                    name        = "Message Received Redacted Emote",
                    desc        = "This emote will fire when you receive a communication message, and have redacted emotes switched on.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteReceiveHidden"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteReceiveHidden"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 12
                    
                },
                
                emotesend = {
                
                    name        = "Message Send Speech Emote",
                    desc        = "This emote will fire when you send a communication message, and have Speech switched on.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteSend"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteSend"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 13
                    
                },
                
                emotesendhidden = {
                
                    name        = "Message Send No Speech Emote",
                    desc        = "This emote will fire when you send a communication message, and have Speech switched off.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteSendHidden"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteSendHidden"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 14
                    
                },
                
                panicbuttonemote = {
                
                    name        = "Panic Button Emote",
                    desc        = "This emote will fire when you type /gbr panic or /pb.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["PanicButtonEmote"] = val; end,
                    get         = function(info) return GBRadio.db.char["PanicButtonEmote"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 15
                    
                },
                
                panicbuttonmessage = {
                
                    name        = "Panic Button Message",
                    desc        = "This message will be sent to your default frequency when you type /panic.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["PanicButtonMessage"] = val; end,
                    get         = function(info) return GBRadio.db.char["PanicButtonMessage"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 16
                    
                }
                
            }
            
        },
        
        transmitterconfig = {
        
            type        = "group",
            name        = "Transmitters",
            cmdHidden   = true,
            order       = 2,
            args        = {
        
                transmitterlocations = {
                
                    name        = "Transmitters",
                    desc        = "Location (in coordinates and instanceId) of transmitters that your device can utilise.\n\nNOTE: They must be in the following format: x,y,instanceId\nThere are no spaces. Please seperate entries on a new line.",
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) GBRadio.db.char["Transmitters"] = GBRadio:SetTransmitters(val); end,
                    get         = function(info) return GBRadio:GetTransmitters(); end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                usetransmitters = {
                
                    name        = "Transmitter mode",
                    desc        = "Enabling this will restrict communications to within ranges of specified transmitters inside specified zones only.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["UseTransmitters"] = val; end,
                    get         = function(info) return GBRadio.db.char["UseTransmitters"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 1
                    
                },
                
                distanceinyards = {
                
                    name        = "Distance in Yards",
                    desc        = "Enabling this will use yards as the primary unit of distance. Otherwise, it will use cartesian coordinate distances instead.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["DistanceInYards"] = val; end,
                    get         = function(info) return GBRadio.db.char["DistanceInYards"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 2
                },
                
                transmittermaxrange = {
                
                    name        = "Maximum transmitter range threshold",
                    desc        = "Maximum range you can be away from a transmitter before message sending and receiving is cut off completely.",
                    type        = "range",
                    set         = function(info, val) GBRadio.db.char["TransmitterMaxRange"] = val; end,
                    get         = function(info) return GBRadio.db.char["TransmitterMaxRange"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    min         = 0,
                    max         = 10000,
                    softMin     = 0,
                    softMax     = 10000,
                    step        = 0.01,
                    order       = 3
                    
                },
                
                usetransmitterdistortion = {
                
                    name        = "Transmitter distortion",
                    desc        = "Enabling this will cause messages to become distorted if the sender or receiver is past the specified thresholds.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["UseTransmitterDistortion"] = val; end,
                    get         = function(info) return GBRadio.db.char["UseTransmitterDistortion"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 4
                    
                },
                
                transmitterlowrange = {
                
                    name        = "Transmitter low distortion threshold",
                    desc        = "Distance from transmitters before messages start to get distorted.",
                    type        = "range",
                    set         = function(info, val) GBRadio.db.char["TransmitterLowRange"] = val; end,
                    get         = function(info) return GBRadio.db.char["TransmitterLowRange"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    min         = 0,
                    max         = 10000,
                    softMin     = 0,
                    softMax     = 10000,
                    step        = 0.01,
                    order       = 5
                    
                },
                
                transmittermedrange = {
                
                    name        = "Transmitter bad distortion threshold",
                    desc        = "Distance from transmitters before messages start to very distorted.",
                    type        = "range",
                    set         = function(info, val) GBRadio.db.char["TransmitterMedRange"] = val; end,
                    get         = function(info) return GBRadio.db.char["TransmitterMedRange"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    min         = 0,
                    max         = 10000,
                    softMin     = 0,
                    softMax     = 10000,
                    step        = 0.01,
                    order       = 6
                    
                },
                
                transmitterhighrange = {
                
                    name        = "Transmitter very bad distortion threshold",
                    desc        = "Distance from transmitters before messages become very badly distorted.",
                    type        = "range",
                    set         = function(info, val) GBRadio.db.char["TransmitterHighRange"] = val; end,
                    get         = function(info) return GBRadio.db.char["TransmitterHighRange"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    min         = 0,
                    max         = 10000,
                    softMin     = 0,
                    softMax     = 10000,
                    step        = 0.01,
                    order       = 7
                    
                }
                
            }
            
        },
        
        soundconfig = {
        
            type        = "group",
            name        = "Sounds",
            cmdHidden   = true,
            order       = 3,
            args        = {
        
                playsounds = {
                
                    name        = "Play Sound Effects",
                    desc        = "Play sound effects when you receive communication messages.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PlaySounds"] = val; end,
                    get         = function(info) return GBRadio.db.char["PlaySounds"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                playareasounds = {
                    name        = "Play Area Sounds",
                    desc        = "Play communication sounds in an area around your character that other GHI users will be able to hear.\n\nDisabling this option will play sounds for only you instead.\n\nNote: Requires GHI to be installed. If GHI isn't installed, this setting is ignored and sounds are played for you only.",
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PlayAreaSounds"] = val; end,
                    get         = function(info) if GBRadio:GHI_Installed() == true then return GBRadio.db.char["PlayAreaSounds"] else return false end end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 1
                },
                
                devicesound = {
                
                    name        = "Device Sound",
                    desc        = "Path to the sound file to play when you receive a communication message.",
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["DeviceSound"] = val; end,
                    get         = function(info) return GBRadio.db.char["DeviceSound"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 2
                    
                },
                
            }
            
        },
        
        exportimport = {
            
            type        = "group",
            name        = "Export/Import",
            cmdHidden   = true,
            order       = 4,
            args        = {
        
                loadpresetmsg = {
                
                    name        = "From the list of presets below, choose what most closely resembles your communication device.",
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                },
                
                loadpreset = {
                
                    name    = "Load preset",
                    type    = "select",
                    values  = function() return GBRadio:FetchPresetList() end,
                    order   = 2,
                    set     = function(info, val) GBRadio:SetPreset(GBRadio_PresetOptions[val].char); ReloadUI(); end,
                    confirm = function() return "|cFFFF0000WARNING!|r\n\nSelecting a preset will wipe your current settings, and replace them with new ones.\n\nAccepting will also reload your user interface (some settings require a UI reload to take effect).\n\nTHIS CANNOT BE UNDONE!\n\nPress accept to confirm that this is what you want.\n\nPress cancel if you want to keep your current settings." end,
                    
                
                },
        
                importboxmsg = {
                
                    name        = "Here you can export or import settings for GBRadio. The main purpose of this feature is to allow guild masters the option to provide pre-made templates for guild members to use, so that everyone uses the same type of communication device.",
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 4
                    
                },
                
                importbox = {
                
                    name        = "Import Settings",
                    desc        = "Paste your GBRadio import data here.",
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) local _, tmp = GBRadio:Deserialize(val); GBRadio:SetPreset(tmp); ReloadUI(); end,
                    confirm     = function() return "|cFFFF0000WARNING!|r\n\nImporting these settings will wipe your current settings, and replace them with new ones.\n\n|cFFFF0000Make sure these settings are compatible with your version of GBRadio, otherwise your settings may become irreversibly corrupt!|r\n\nAccepting will reload your user interface (some settings require a UI reload to take effect).\n\nTHIS CANNOT BE UNDONE!\n\nPress accept to confirm that this is what you want.\n\nPress cancel if you want to keep your current settings." end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                exportbox = {
                
                    name        = "Export Settings",
                    desc        = "Paste your GBRadio import data here.",
                    type        = "input",
                    multiline   = 5,
                    get         = function(info) return GBRadio:Serialize(GBRadio.db.char); end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 6
                    
                },
            
            }
        },
        
        thirdpartymodules = {
            
            type        = "group",
            name        = "3rd Party",
            cmdHidden   = true,
            order       = 5,
            args        = {
            
                ghidetected = {
                    name        = "GHI Installed",
                  --desc        = see below
                    type        = "toggle",
                    get         = function(info) return GBRadio:GHI_Installed(); end,
                    disabled    = true,
                    cmdHidden   = true,
                    descStyle   = "inline",
                    order       = 1
                },
                
                ghidetecteddesc = {
                
                    name        = "If Gryphonheart Items is installed, sound effects will default to playing in an area around you when receiving communications.\n\nNote: You can still disable area sounds if you have GHI installed.",
                    type        = "description",
                    order       = 2
                    
                },
                
                trp3detected = {
                    name        = "TRP3 Installed",
                  --desc        = see below
                    type        = "toggle",
                    get         = function(info) return GBRadio:TRP3_Installed(); end,
                    disabled    = true,
                    cmdHidden   = true,
                    descStyle   = "inline",
                    order       = 3
                },
                
                trp3detecteddesc = {
                
                    name        = "If TotalRP3 is installed, players receiving your communication messages will be able to see your characters custom name (and your characters real in-game name) if they have Meta Gaming Mode switched on.",
                    type        = "description",    
                    order       = 4
                    
                }
            
            }
        },
        
        aboutpage = {
            
            type        = "group",
            name        = "About",
            cmdHidden   = true,
            order       = 6,
            args        = {
        
                Msg = {
                
                    name        = "Thank you for using GBRadio!\n\nGBRadio was developed with communication in mind. Many guard-based roleplaying guilds use radios (or walkers!), and the aim of this addon is to make that as easy and seamless as possible.\n\nA special thanks to the following people and guilds for their help in testing this addon, providing feedback, and giving suggestions:\n\nEtterna @ Argent Dawn\nMiléan @ Argent Dawn\nDidonus @ Argent Dawn\nHarrvey @ Argent Dawn\nYarwood @ Argent Dawn\nLawri @ Argent Dawn\n\nEye of Dalaran @ Argent Dawn\nStormwind Investigations @ Argent Dawn\nStormwind City Guard @ Argent Dawn\n\n|cFF82C2FFAuthor:|r Nasias @ Argent Dawn (EU)\n|cFF82C2FFContact:|r n@siasdarkstar.com\n\n|cFF82C2FFHelp, updates & changelog for BETA:|r\nhttp://www.nasiasdarkstar.com/GBRadio",
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                }
            
            }
        },
        
        helppage = {
            
            type        = "group",
            name        = "Help",
            cmdHidden   = true,
            order       = 7,
            args        = {
        
                Msg = {
                
                    name        = "Quick command cheatsheet:\n\n/bb <your message> -- Sends a message.\n/wbb <your message> -- Sends a discreet message.\n/gbr -- Shows all available slash commands\n/gbr activate -- Toggles your device on or off.\n/pb -- Sends a distress message.",
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                }
            
            }
        },
        
        activate = {
        
            name        = "Radio state",
            desc        = "Turn your communication device on or off.",
            type        = "toggle",
            set         = function(info, val) GBRadio:ToggleRadioState(info, val); end,
            get         = function(info) return GBRadio.db.char["Active"]; end,
            width       = "full",
            order       = 8
            
        },
        
        radiosatedesc = {
        
            name        = "Switch your communication device on or off. This can also be done via slash command!",
            type        = "description",
            order       = 9
            
        },
        
        isolatedmode = {
        
            name        = "Isolated mode",
            desc        = "Restrict messages to guild members only.",
            type        = "toggle",
            set         = function(info, val) GBRadio.db.char["IsolatedMode"] = val; end,
            get         = function(info) return GBRadio.db.char["IsolatedMode"]; end,
            width       = "full",
            cmdHidden   = true,
            order       = 10
            
        },
        
        isolatedmodedesc = {
        
            name        = "Toggles between sending and receiving messages from only guild members on the same radio frequencies, or everyone on the same radio frequencies.",
            type        = "description",
            order       = 11
            
        },
        
        send = {
            name            = "Send message",
            desc            = "<message> - Send a message through your comms device. |cFF00C0FFYou can also type the short-hand version:|r /bb <message>",
            type            = "input",
            set             = function(info, val) GBRadio:SendMessage(val); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        panic = {
            name            = "Panic button",
            desc            = "For emergency use. Sends a distress message to your current frequency. |cFF00C0FFYou can also type the short-hand version:|r /pb",
            type            = "input",
            set             = function(info, val) GBRadio:SendPanicMessage(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        		
		coord = {
            name            = "Coord button",
            desc            = "Tells you your coordinates to use with the transmitter mode.",
            type            = "input",
            set             = function(info, val) GBRadio:GetCoordinates(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },

        distance = {
            name            = "Distance Check",
            desc            = "Tells you your current distance from the closest transmitter.",
            type            = "input",
            set             = function(info, val) GBRadio:ShowPlayerClosestTransmitter(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
        
        },

        dist = {
            name            = "Distance Check",
            desc            = "Tells you your current distance from the closest transmitter.",
            type            = "input",
            set             = function(info, val) GBRadio:ShowPlayerClosestTransmitter(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
        
        },
        
        freq = {
            name            = "Set your primary frequency",
            desc            = "<frequencyID> - Sets your primary frequency to the specified ID. Comms messages get sent to this frequency.",
            type            = "input",
            set             = function(info, val) GBRadio.db.char["PrimaryChannelPrefix"] = tonumber(val); end,
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        showhistory = {
            name            = "Show history",
            desc            = "<lines> - Display x lines of communication history starting from the end.",
            type            = "input",
            set             = function(info, val) GBRadio:ShowHistory(val); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        config = {
            name            = "Open configuration",
            desc            = "Open the configuration screen for GBRadio",
            type            = "execute",
            func            = function(info) InterfaceOptionsFrame_OpenToCategory("GBRadio"); InterfaceOptionsFrame_OpenToCategory("GBRadio"); end,
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true,
            order           = -1
            
        }
        
    }
    
}

-- PRESETS
GBRadio.PresetOptions = {}

-- Set up some constants
GBRadio.DefaultOptions          = GBRadio_PresetOptions["BuzzBox"];
GBRadio.MessageTarget           = "GUILD";
GBRadio.MessagePlayer           = nil;
GBRadio.MessagePriority         = "ALERT";

GBRadio.GHI_Prefix              = "GHI2";
GBRadio.GHI_MsgPrefix           = "\001\003"

GBRadio.GHI_AddonChannelPub     = "xtensionxtooltip2";

-- Keeps track of message logs
GBRadio.MessageLog              = { };
GBRadio.Gender                  = { "their", "his", "her" };

-- This players name and gender
GBRadio.PlayerName              = UnitName("player");
GBRadio.PlayerGender            = UnitSex("player");