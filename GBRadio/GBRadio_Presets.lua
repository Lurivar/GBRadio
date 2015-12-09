GBRadio_PresetOptions = {};

GBRadio_PresetOptions["BuzzBox"] = {
    
    char = {
    
        ["Active"]                      = false,
        ["IsolatedMode"]                = true,
        ["Name"]                        = "Buzz Box",
        ["MetaGamingState"]             = false,
        ["Emotes"]                      = true,
        ["RedactedEmotes"]              = true,
        ["Speech"]                      = true,
        ["PlaySounds"]                  = true,
        ["PanicEmotes"]                 = true,
        ["ChannelPrefix"]               = "GBRADIO",
        ["PrimaryChannelPrefix"]        = 1,
        ["DeviceSound"]                 = "Sound\\Spells\\UNI_FX_RadioStatic_08.ogg",
        ["PlayAreaSounds"]              = true,
        ["DeviceEmoteNoises"]           = "crackles,hisses,whirrs,buzzes",
        ["MsgSendDelay"]                = 1.5,
        ["OutputChatFrame"]             = 1,
        ["ShowTRP3Names"]               = false,
        ["EmoteReceive"]                = "'s %s %s with a message: ",
        ["EmoteReceiveHidden"]          = "'s %s %s as a messsage is received.",
        ["EmoteSend"]                   = "speaks into %s %s %s",
        ["EmoteSendHidden"]             = "murmurs something into %s %s.",
        ["PanicButtonEmote"]            = "presses a button on %s %s.",
        ["PanicButtonMessage"]          = "%s needs urgent assistance at %s. Coordinates roughly %s.",
        ["Transmitters"]                = { { ["x"] = 53, ["y"] = 52, ["Area"] = "Stormwind City" } },
        ["UseTransmitters"]             = false,
        ["DistanceInYards"]             = true,
        ["TransmitterMaxRange"]         = 700,
        ["UseTransmitterDistortion"]    = false,
        ["TransmitterLowRange"]         = 500,
        ["TransmitterMedRange"]         = 600,
        ["TransmitterHighRange"]        = 650,
        ["MessageColour"]               = {0.419607843137255,0.592156862745098,1,1},
        ["SquelchTimer"]                = 5
            
    }

}

GBRadio_PresetOptions["CommunicationRing"] = {
    
    char = {
    
        ["Active"]                      = false,
        ["IsolatedMode"]                = true,
        ["Name"]                        = "Communication Ring",
        ["MetaGamingState"]             = true,
        ["Emotes"]                      = true,
        ["RedactedEmotes"]              = true,
        ["Speech"]                      = false,
        ["PlaySounds"]                  = true,
        ["PanicEmotes"]                 = true,
        ["ChannelPrefix"]               = "GBRADIO",
        ["PrimaryChannelPrefix"]        = 1,
        ["DeviceSound"]                 = "Sound\\Spells\\SPELL_MA_Timewarp_Impact_05.ogg",
        ["PlayAreaSounds"]              = false,
        ["DeviceEmoteNoises"]           = "chimes,pulses,flickers,pings",
        ["MsgSendDelay"]                = 1.5,
        ["OutputChatFrame"]             = 1,
        ["ShowTRP3Names"]               = true,
        ["EmoteReceive"]                = "'s %s %s with a message: ",
        ["EmoteReceiveHidden"]          = "'s %s %s as a messsage is received.",
        ["EmoteSend"]                   = "taps %s %s %s",
        ["EmoteSendHidden"]             = "taps %s %s.",
        ["PanicButtonEmote"]            = "taps %s %s.",
        ["PanicButtonMessage"]          = "%s needs urgent assistance at %s. Coordinates roughly %s.",
        ["Transmitters"]                = { { ["x"] = 53, ["y"] = 52, ["Area"] = "Stormwind City" } },
        ["UseTransmitters"]             = false,
        ["DistanceInYards"]             = true,
        ["TransmitterMaxRange"]         = 5,
        ["UseTransmitterDistortion"]    = false,
        ["TransmitterLowRange"]         = 500,
        ["TransmitterMedRange"]         = 600,
        ["TransmitterHighRange"]        = 650,
        ["MessageColour"]               = {0.419607843137255,0.592156862745098,1,1},
        ["SquelchTimer"]                = 5
        
    }

}