GBRadio.OptionsTable = {

    type        = "group",
    name        = GBRadio_Version_String,
    childGroups = "tree",
    handler     = GBRadio,
    
    args    = {
    
        textconfig = {
        
            type        = "group",
            name        = GBRadio_Localisation.OPTION_NAME_textconfig,
            cmdHidden   = true,
            order       = 0,
            args        = {
        
                name = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_name,
                    desc        = GBRadio_Localisation.OPTION_DESC_name,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["Name"] = val; end,
                    get         = function(info) return GBRadio.db.char["Name"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                channelprefix = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_channelprefix,
                    desc        = GBRadio_Localisation.OPTION_DESC_channelprefix,
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
                
                    name    = GBRadio_Localisation.OPTION_NAME_primaryfrequency,
                    type    = "select",
                    values  = function(info) return GBRadio:GetCommFrequencies(true); end,
                    order   = 2,
                    set     = function(info, val) GBRadio.db.char["PrimaryChannelPrefix"] = val; end,
                    get     = function(info) local tmp = GBRadio:GetCommFrequencies(true); if tmp[GBRadio.db.char["PrimaryChannelPrefix"]] == nil then print(tmp[GBRadio.db.char["PrimaryChannelPrefix"]])--[[Radio.db.char["PrimaryChannelPrefix"] = 1;]] end return GBRadio.db.char["PrimaryChannelPrefix"]; end,
                    cmdHidden   = true,
                    order = 2
                
                },
                
                msgsenddelay = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_msgsenddelay,
                    desc        = GBRadio_Localisation.OPTION_DESC_msgsenddelay,
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
            name        = GBRadio_Localisation.OPTION_NAME_messageconfig,
            cmdHidden   = true,
            order       = 1,
            args        = {
                
                outputchatframe = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_outputchatframe,
                    desc        = GBRadio_Localisation.OPTION_DESC_outputchatframe,
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
                
                    name        = GBRadio_Localisation.OPTION_NAME_outputchatframeidentify,
                    desc        = GBRadio_Localisation.OPTION_DESC_outputchatframeidentify,
                    type        = "execute",
                    width       = "full",
                    func        = function(info, val) GBRadio:IdentifyChatFrames(); end,
                    cmdHidden   = true,
                    order       = 1
                
                },
                
                chatmessagecolour = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_chatmessagecolour,
                    desc        = GBRadio_Localisation.OPTION_DESC_chatmessagecolour,
                    type        = "color",
                    set         = function(info, ...) tmp = {...}; GBRadio.db.char["MessageColour"] = tmp; end,
                    get         = function(info) return GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3], GBRadio.db.char["MessageColour"][4];  end,
                    hasAlpha    = false,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 2
                },
            
                squelchtimer = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_squelchtimer,
                    desc        = GBRadio_Localisation.OPTION_DESC_squelchtimer,
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
                
                    name        = GBRadio_Localisation.OPTION_NAME_speech,
                    desc        = GBRadio_Localisation.OPTION_DESC_speech,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["Speech"] = val; end,
                    get         = function(info) return GBRadio.db.char["Speech"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 4
                    
                },
                
                emotes = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_emotes,
                    desc        = GBRadio_Localisation.OPTION_DESC_emotes,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["Emotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["Emotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                sendemotes = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_sendemotes,
                    desc        = GBRadio_Localisation.OPTION_DESC_sendemotes,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["SendEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["SendEmotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                redactedemotes = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_redactedemotes,
                    desc        = GBRadio_Localisation.OPTION_DESC_redactedemotes,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["RedactedEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["RedactedEmotes"] end,
                    confirm     = function() return "|cFFFF0000WARNING!|r\n\nThis addon does not filter profanity from messages!\n\nBy disabling redacted emotes, messages sent by other players will be automatically relayed into an emote by this addon when you receive a message.\n\nRedacted emotes is automatically enabled because Blizzard always holds you responsible for all messages that are sent by your client, regardless of who or what writes them!\n\nWhilst disabling redacted emotes improves the realism of using a communication device, you should only disable it if you trust that EVERYONE in your guild will not swear, send racist remarks or generally break World of Warcraft's rules when sending messages.\n\nIf you are unsure, it's recommended that you leave redacted emotes enabled!" end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 6
                    
                },
                
                panicemotes = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_panicemotes,
                    desc        = GBRadio_Localisation.OPTION_DESC_panicemotes,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PanicEmotes"] = val; end,
                    get         = function(info) return GBRadio.db.char["PanicEmotes"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 7
                    
                },
                
                metagaming = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_metagaming,
                    desc        = GBRadio_Localisation.OPTION_DESC_metagaming,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["MetaGamingState"] = val; end,
                    get         = function(info) return GBRadio.db.char["MetaGamingState"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 8
                    
                },
                
                showtrp3names = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_showtrp3names,
                    desc        = GBRadio_Localisation.OPTION_DESC_showtrp3names,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["ShowTRP3Names"] = val; end,
                    get         = function(info) return GBRadio.db.char["ShowTRP3Names"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 9
                
                },
                
                deviceemotenoises = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_deviceemotenoises,
                    desc        = GBRadio_Localisation.OPTION_DESC_deviceemotenoises,
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) GBRadio.db.char["DeviceEmoteNoises"] = GBRadio:SetDeviceEmoteNoises(val); end,
                    get         = function(info) return GBRadio:GetDeviceEmoteNoises(); end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 10
                    
                },
                
                emotereceive = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_emotereceive,
                    desc        = GBRadio_Localisation.OPTION_DESC_emotereceive,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteReceive"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteReceive"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 11
                    
                },
                
                emotereceivehidden = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_emotereceivehidden,
                    desc        = GBRadio_Localisation.OPTION_DESC_emotereceivehidden,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteReceiveHidden"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteReceiveHidden"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 12
                    
                },
                
                emotesend = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_emotesend,
                    desc        = GBRadio_Localisation.OPTION_DESC_emotesend,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteSend"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteSend"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 13
                    
                },
                
                emotesendhidden = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_emotesendhidden,
                    desc        = GBRadio_Localisation.OPTION_DESC_emotesendhidden,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["EmoteSendHidden"] = val; end,
                    get         = function(info) return GBRadio.db.char["EmoteSendHidden"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 14
                    
                },
                
                panicbuttonemote = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_panicbuttonemote,
                    desc        = GBRadio_Localisation.OPTION_DESC_panicbuttonemote,
                    type        = "input",
                    set         = function(info, val) GBRadio.db.char["PanicButtonEmote"] = val; end,
                    get         = function(info) return GBRadio.db.char["PanicButtonEmote"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 15
                    
                },
                
                panicbuttonmessage = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_panicbuttonmessage,
                    desc        = GBRadio_Localisation.OPTION_DESC_panicbuttonmessage,
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
            name        = GBRadio_Localisation.OPTION_NAME_transmitterconfig,
            cmdHidden   = true,
            order       = 2,
            args        = {
        
                transmitterlocations = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_transmitterlocations,
                    desc        = GBRadio_Localisation.OPTION_DESC_transmitterlocations,
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) GBRadio.db.char["Transmitters"] = GBRadio:SetTransmitters(val); end,
                    get         = function(info) return GBRadio:GetTransmitters(); end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                usetransmitters = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_usetransmitters,
                    desc        = GBRadio_Localisation.OPTION_DESC_usetransmitters,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["UseTransmitters"] = val; end,
                    get         = function(info) return GBRadio.db.char["UseTransmitters"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 1
                    
                },
                
                transmittermaxrange = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_transmittermaxrange,
                    desc        = GBRadio_Localisation.OPTION_DESC_transmittermaxrange,
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
                
                    name        = GBRadio_Localisation.OPTION_NAME_usetransmitterdistortion,
                    desc        = GBRadio_Localisation.OPTION_DESC_usetransmitterdistortion,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["UseTransmitterDistortion"] = val; end,
                    get         = function(info) return GBRadio.db.char["UseTransmitterDistortion"]; end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 4
                    
                },
                
                transmitterlowrange = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_transmitterlowrange,
                    desc        = GBRadio_Localisation.OPTION_DESC_transmitterlowrange,
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
                
                    name        = GBRadio_Localisation.OPTION_NAME_transmittermedrange,
                    desc        = GBRadio_Localisation.OPTION_DESC_transmittermedrange,
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
                
                    name        = GBRadio_Localisation.OPTION_NAME_transmitterhighrange,
                    desc        = GBRadio_Localisation.OPTION_DESC_transmitterhighrange,
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
            name        = GBRadio_Localisation.OPTION_NAME_soundconfig,
            cmdHidden   = true,
            order       = 3,
            args        = {
        
                playsounds = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_playsounds,
                    desc        = GBRadio_Localisation.OPTION_DESC_playsounds,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PlaySounds"] = val; end,
                    get         = function(info) return GBRadio.db.char["PlaySounds"] end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 0
                    
                },
                
                playareasounds = {
                    name        = GBRadio_Localisation.OPTION_NAME_playareasounds,
                    desc        = GBRadio_Localisation.OPTION_DESC_playareasounds,
                    type        = "toggle",
                    set         = function(info, val) GBRadio.db.char["PlayAreaSounds"] = val; end,
                    get         = function(info) if GBRadio:GHI_Installed() == true then return GBRadio.db.char["PlayAreaSounds"] else return false end end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 1
                },
                
                devicesound = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_devicesound,
                    desc        = GBRadio_Localisation.OPTION_DESC_devicesound,
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
            name        = GBRadio_Localisation.OPTION_NAME_exportimport,
            cmdHidden   = true,
            order       = 4,
            args        = {
        
                loadpresetmsg = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_loadpresetmsg,
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                },
                
                loadpreset = {
                
                    name    = GBRadio_Localisation.OPTION_NAME_loadpreset,
                    type    = "select",
                    values  = function() return GBRadio:FetchPresetList() end,
                    order   = 2,
                    set     = function(info, val) GBRadio:SetPreset(GBRadio_PresetOptions[val].char); ReloadUI(); end,
                    confirm = function() return "|cFFFF0000WARNING!|r\n\nSelecting a preset will wipe your current settings, and replace them with new ones.\n\nAccepting will also reload your user interface (some settings require a UI reload to take effect).\n\nTHIS CANNOT BE UNDONE!\n\nPress accept to confirm that this is what you want.\n\nPress cancel if you want to keep your current settings." end,
                    
                
                },
        
                importboxmsg = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_importboxmsg,
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 4
                    
                },
                
                importbox = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_importbox,
                    desc        = GBRadio_Localisation.OPTION_DESC_importbox,
                    type        = "input",
                    multiline   = 5,
                    set         = function(info, val) local _, tmp = GBRadio:Deserialize(val); GBRadio:SetPreset(tmp); ReloadUI(); end,
                    confirm     = function() return "|cFFFF0000WARNING!|r\n\nImporting these settings will wipe your current settings, and replace them with new ones.\n\n|cFFFF0000Make sure these settings are compatible with your version of GBRadio, otherwise your settings may become irreversibly corrupt!|r\n\nAccepting will reload your user interface (some settings require a UI reload to take effect).\n\nTHIS CANNOT BE UNDONE!\n\nPress accept to confirm that this is what you want.\n\nPress cancel if you want to keep your current settings." end,
                    width       = "full",
                    cmdHidden   = true,
                    order       = 5
                    
                },
                
                exportbox = {
                
                    name        = GBRadio_Localisation.OPTION_NAME_exportbox,
                    desc        = GBRadio_Localisation.OPTION_DESC_exportbox,
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
            name        = GBRadio_Localisation.OPTION_NAME_thirdpartymodules,
            cmdHidden   = true,
            order       = 5,
            args        = {
            
                ghidetected = {
                    name        = GBRadio_Localisation.OPTION_NAME_ghidetected,
                  --desc        = see below
                    type        = "toggle",
                    get         = function(info) return GBRadio:GHI_Installed(); end,
                    disabled    = true,
                    cmdHidden   = true,
                    descStyle   = "inline",
                    order       = 1
                },
                
                ghidetecteddesc = {
                
                    name        = GBRadio_Localisation.OPTION_DESC_ghidetected,
                    type        = "description",
                    order       = 2
                    
                },
                
                trp3detected = {
                    name        = GBRadio_Localisation.OPTION_NAME_trp3detected,
                  --desc        = see below
                    type        = "toggle",
                    get         = function(info) return GBRadio:TRP3_Installed(); end,
                    disabled    = true,
                    cmdHidden   = true,
                    descStyle   = "inline",
                    order       = 3
                },
                
                trp3detecteddesc = {
                
                    name        = GBRadio_Localisation.OPTION_DESC_trp3detected,
                    type        = "description",    
                    order       = 4
                    
                }
            
            }
        },
        
        aboutpage = {
            
            type        = "group",
            name        = GBRadio_Localisation.OPTION_NAME_aboutpage,
            cmdHidden   = true,
            order       = 6,
            args        = {
        
                Msg = {
                
                    name        = GBRadio_Localisation.OPTION_DESC_aboutpage,
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                }
            
            }
        },
        
        helppage = {
            
            type        = "group",
            name        = GBRadio_Localisation.OPTION_NAME_helppage,
            cmdHidden   = true,
            order       = 7,
            args        = {
        
                Msg = {
                
                    name        = GBRadio_Localisation.OPTION_DESC_helppage,
                    type        = "description",
                    fontSize    = "medium",    
                    order       = 1
                    
                }
            
            }
        },
        
        activate = {
        
            name        = GBRadio_Localisation.OPTION_NAME_activate,
            desc        = GBRadio_Localisation.OPTION_DESC_activate,
            type        = "toggle",
            set         = function(info, val) GBRadio:ToggleRadioState(info, val); end,
            get         = function(info) return GBRadio.db.char["Active"]; end,
            width       = "full",
            order       = 8
            
        },
        
        radiosatedesc = {
        
            name        = GBRadio_Localisation.OPTION_NAME_radiosatedesc,
            type        = "description",
            order       = 9
            
        },
        
        isolatedmode = {
        
            name        = GBRadio_Localisation.OPTION_NAME_isolatedmode,
            desc        = GBRadio_Localisation.OPTION_DESC_isolatedmode,
            type        = "toggle",
            set         = function(info, val) GBRadio.db.char["IsolatedMode"] = val; end,
            get         = function(info) return GBRadio.db.char["IsolatedMode"]; end,
            width       = "full",
            cmdHidden   = true,
            order       = 10
            
        },
        
        isolatedmodedesc = {
        
            name        = GBRadio_Localisation.OPTION_NAME_isolatedmodedesc,
            type        = "description",
            order       = 11
            
        },
        
        send = {
            name            = GBRadio_Localisation.OPTION_NAME_send,
            desc            = GBRadio_Localisation.OPTION_DESC_send,
            type            = "input",
            set             = function(info, val) GBRadio:SendMessage(val); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        panic = {
            name            = GBRadio_Localisation.OPTION_NAME_panic,
            desc            = GBRadio_Localisation.OPTION_DESC_panic,
            type            = "input",
            set             = function(info, val) GBRadio:SendPanicMessage(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        		
		coord = {
            name            = GBRadio_Localisation.OPTION_NAME_coord,
            desc            = GBRadio_Localisation.OPTION_DESC_coord,
            type            = "input",
            set             = function(info, val) GBRadio:GetCoordinates(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },

        distance = {
            name            = GBRadio_Localisation.OPTION_NAME_distance,
            desc            = GBRadio_Localisation.OPTION_DESC_distance,
            type            = "input",
            set             = function(info, val) GBRadio:ShowPlayerClosestTransmitter(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
        
        },

        dist = {
            name            = GBRadio_Localisation.OPTION_NAME_distance,
            desc            = GBRadio_Localisation.OPTION_NAME_distance,
            type            = "input",
            set             = function(info, val) GBRadio:ShowPlayerClosestTransmitter(); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
        
        },
        
        freq = {
            name            = GBRadio_Localisation.OPTION_NAME_freq,
            desc            = GBRadio_Localisation.OPTION_NAME_freq,
            type            = "input",
            set             = function(info, val) GBRadio.db.char["PrimaryChannelPrefix"] = tonumber(val); end,
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        showhistory = {
            name            = GBRadio_Localisation.OPTION_NAME_showhistory,
            desc            = GBRadio_Localisation.OPTION_DESC_showhistory,
            type            = "input",
            set             = function(info, val) GBRadio:ShowHistory(val); end,
            width           = "full",
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true
            
        },
        
        config = {
            name            = GBRadio_Localisation.OPTION_NAME_config,
            desc            = GBRadio_Localisation.OPTION_DESC_config,
            type            = "execute",
            func            = function(info) InterfaceOptionsFrame_OpenToCategory("GBRadio"); InterfaceOptionsFrame_OpenToCategory("GBRadio"); end,
            guiHidden       = true,
            dialogHidden    = true,
            dropdownHidden  = true,
            order           = -1
            
        },

        conf = {
            name            = GBRadio_Localisation.OPTION_NAME_config,
            desc            = GBRadio_Localisation.OPTION_DESC_config,
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

-- This players name and gender
GBRadio.PlayerName              = UnitName("player");
GBRadio.PlayerGender            = UnitSex("player");