-- Delay function courtesy of http://wowwiki.wikia.com/wiki/USERAPI_wait
local waitTable = {};
local waitFrame = nil;

function GBRadio:DelayFunction(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
    waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end;

-- Decimal colour to hexadecimal colour courtesy of http://wowprogramming.com/snippets/Convert_decimal_classcolor_into_hex_27
function GBRadio:DecimalToHex(r,g,b)
    local r = string.format("%02x", r * 255);
    local g = string.format("%02x", g * 255);
    local b = string.format("%02x", b * 255);
    
    return r, g, b
end;

-- Rounding function courtesy of http://wowwiki.wikia.com/wiki/USERAPI_round
function GBRadio:Round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end;

function GBRadio:IdentifyChatFrames()
    for i = 1, NUM_CHAT_WINDOWS do
        local Frame = _G["ChatFrame"..i]
        if Frame then
            Frame:AddMessage(string.format(GBRadio_Localisation.IDENTIFY_CHAT_FRAME, self.db.char["Name"], tostring(i)), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);
        end
    end
end;

function GBRadio:FetchPresetList()

    local PresetList = {}
    
    for k, v in pairs(GBRadio_PresetOptions) do
    
        PresetList[k] = v.char["Name"];
    
    end
    
    return PresetList;

end;

function GBRadio:SetPreset(PresetTable)
    
    for k,v in pairs(GBRadio.db.char) do
    
        GBRadio.db.char[k] = PresetTable[k];
    
    end

end;

function GBRadio:TextareaToCSV(InputText)

    local regex = "[^a-zA-Z0-9\n]";
    local InputText = string.gsub(InputText, regex, "");
    -- Removes duplicated newline entries
    InputText = string.gsub(InputText, "[\n]+", ",");
    
    if InputText == "," then
        InputText = "";
    end
    
    return InputText;
    
end;

function GBRadio:CSVToTable(InputText)
    local tmp = { strsplit(",", InputText) };

    return tmp;

end;

function GBRadio:CSVToTextarea(InputText)

    local tmp = string.gsub(InputText, ",", "\n");
    return tmp;

end;

function GBRadio:SetDeviceEmoteNoises(val)

    local EmoteNoise = self:TextareaToCSV(val);
    
    if EmoteNoise == "" then
        EmoteNoise = self.DefaultOptions.char["DeviceEmoteNoises"];
    end
    
    return EmoteNoise;

end;

-- true for table, false for string
function GBRadio:GetDeviceEmoteNoises(asTable)

    asTable = asTable or false;
    
    if asTable == false then
        return self:CSVToTextarea(self.db.char["DeviceEmoteNoises"]);
    else
        return self:CSVToTable(self.db.char["DeviceEmoteNoises"]);
    end

end;

-- Sets the channel prefix for addon communication message function
function GBRadio:SetCommFrequencies(NewPrefixList)
    
    local PrefixList = self:TextareaToCSV(NewPrefixList);
    
    if PrefixList == "" then
        PrefixList = GBRadio.DefaultOptions.char["ChannelPrefix"];
    end
    
    self.db.char["ChannelPrefix"] = PrefixList;

end;

function GBRadio:GetCommFrequencies(asTable)

    asTable = asTable or false;

    if asTable == false then
        return self:CSVToTextarea(self.db.char["ChannelPrefix"]);
    else
        return self:CSVToTable(self.db.char["ChannelPrefix"]);
    end

end;

function GBRadio:SetTransmitters(val)

    local tmp           = {};
    local firstStep     = { strsplit("\n", val) };
    local secondStep    = {};

    for k, v in pairs(firstStep) do
        tmp = { strsplit(",", v) };
        secondStep[k] = { ["x"] = tmp[1], ["y"] = tmp[2], ["Area"] = tmp[3] };
    end

    return secondStep;

end;

function GBRadio:GetTransmitters()

    local tmp = {};
    
    for k, v in pairs(self.db.char["Transmitters"]) do
        tmp[k] = string.format("%s,%s,%s", v["x"], v["y"], v["Area"]);
    end
    
    tmp = table.concat(tmp, "\n");
    
    return tmp;

end;

function GBRadio:GetClosestTransmitter(Location)

    Location    = Location or GBRadio:GetPlayerLocation();
    local TransmitterDistances  = {}
    local Transmitters          = self.db.char["Transmitters"];
    local DistanceCoords;   -- Distance in cartesian coordinates
    local DistanceYrds;     -- Distance in yards
    local AngleRads;
    local AngleDegs;
    local DistanceMeasurement;
    local ClosestTransmitter = { ["Distance"] = -1, ["DistanceYrds"] = -1, ["x"] = 0, ["y"] = 0 };
    local DistanceMeasurementKey       
    
    if Transmitters == false then 
    
        return false;
        
    end
    
    for k, v in pairs(Transmitters) do
        -- If the transmitter is in the same area as us, and the transmitters MAP translated to localisation is the same as the area we are in
        if ( string.lower(v["Area"]) == string.lower(Location["Area"]) ) --[[and ( string.lower(v["Area"]) == string.lower(GBRMapFiles:MapLocalize(Location["Map"])) )]] then
        
            DistanceCoords  = self:DistanceVector(v, Location, false);
            DistanceYrds    = GBRMapFiles:DistanceAndDirection(Location["Map"], 1, v["x"]/100, v["y"]/100 );
            
                    if self.db.char["DistanceInYards"] == true then
                    
                        DistanceMeasurement     = DistanceYrds;
                        DistanceMeasurementKey  = "DistanceYrds";
                        
                    else
                    
                        DistanceMeasurement     = DistanceCoords;
                        DistanceMeasurementKey = "Distance";
                        
                    end
            
            -- If this transmitter is closer than the previous transmitter, and a previous transmitter has already been selected -- Or if no transmitter in this zone has been selected
            if ( DistanceMeasurement < ClosestTransmitter[DistanceMeasurementKey] and ClosestTransmitter[DistanceMeasurementKey] ~= -1 ) or ( ClosestTransmitter[DistanceMeasurementKey] == -1 ) then

                ClosestTransmitter = { 
                    ["Distance"]        = DistanceCoords, 
                    ["DistanceYrds"]    = DistanceYrds,
                    ["x"]               = v["x"], 
                    ["y"]               = v["y"], 
                    ["PlayerLocation"]  = Location 
                };
                
            end
            
        end
        
    end
    
    return ClosestTransmitter;
    
end;



function GBRadio:ShowPlayerClosestTransmitter()

    --math.atan2(y2-y1, x2-x1)
    local Transmitter       = self:GetClosestTransmitter();
    
    if Transmitter ~= false then
    
        local Distance;
        local PlayerLocation        = Transmitter.PlayerLocation;
        local TransmitterLocation   = string.format("X:%.2f, Y:%.2f", Transmitter["x"], Transmitter["y"] );
        
        if self.db.char["DistanceInYards"] == true then
        
            Distance = string.format("%.2f yards", Transmitter["DistanceYrds"]);
        
        else
        
            Distance = string.format("%.2f points", Transmitter["Distance"]);
        end

        local ChatFrame     = _G["ChatFrame" .. self.db.char["OutputChatFrame"]];

        ChatFrame:AddMessage(string.format(GBRadio_Localisation.NOTICE_CLOSEST_TRANSMITTER, self.db.char["Name"], Distance, TransmitterLocation), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);

    end

end;

function GBRadio:AddInterferenceToMessage(Message, Level)

    local InterferenceMessage = "";
    local MessageLength = string.len(Message);
    local StringSplits;
    local LetterEngulf;
    local tmp = {};
    local SplitInterval;
    local Pivot;
    
    -- Small amount of interference
    if Level == 0 then
    
        return Message;
    
    elseif Level == 1 then
    
        StringSplits    = math.random(0,3);     -- How many bits of interference are we going to be doing?
        LetterEngulf    = math.random(1,2);     -- How many letters do we engulf on each point for interference?
    
    -- Large amount of interference
    elseif Level == 2 then
    
        StringSplits = math.random(0,5);
        LetterEngulf = math.random(2,3);
    
    -- Huge amount of interference
    else
    
        StringSplits = math.random(3,8);
        LetterEngulf = math.random(3,6);
    
    end
    
    if StringSplits > MessageLength then
    
        StringSplits = MessageLength
        
    end
    
    SplitInterval   = math.ceil(MessageLength / StringSplits); -- Split the string up in to the number of parts specified by StringSplits

    if ((LetterEngulf * 2) + 1 ) * StringSplits < MessageLength then

        for i = 1, StringSplits, 1 do

            
            local StartPoint     = 1 + (SplitInterval * ( i - 1 ) );
            local EndPoint       = SplitInterval * i;
            
            if EndPoint > MessageLength then
            
                EndPoint = MessageLength;
                
            end
            
            Pivot = math.random(StartPoint+LetterEngulf, EndPoint-LetterEngulf);
            
            tmp[i] = { 
                ["StartPoint"]   = string.sub(Message, StartPoint, Pivot-LetterEngulf),
                ["EndPoint"]     = string.sub(Message, Pivot+LetterEngulf+1, EndPoint)
            }
            
        end
        
        for k, v in pairs(tmp) do
        
            InterferenceMessage = InterferenceMessage .. v["StartPoint"] .. " *static* " .. v["EndPoint"];
        
        end
        
    else
    
        InterferenceMessage = " *static* ";
        
    end
    
    if StringSplits == 0 then
    
        return Message;
        
    end
    
    return InterferenceMessage;

end;

-- Point a, Point b, give result squared or perform square root operatin
function GBRadio:DistanceVector(PointA, PointB, squared)

    local dX = PointA.x - PointB.x;
    local dY = PointA.y - PointB.y
    local vector = (dX * dX) + (dY * dY);
    
    squared = squared or false;
    
    if squared == true then
        return vector;
    end
    
    return math.sqrt(vector);

end;

function GBRadio:GetPlayerLocation()

    SetMapToCurrentZone() ;
    local PosX, PosY    = GetPlayerMapPosition("player");
    local Area          = GetZoneText();
    local Map           = GetMapInfo();
    
    return { ["x"] = (PosX * 100), ["y"] = (PosY * 100), ["Area"] = Area, ["Map"] = Map };

end;

function GBRadio:RegisterAddonChannel()
    local CommFrequencies = self:GetCommFrequencies(true);
    
    for k, v in pairs(CommFrequencies) do
        self:RegisterComm(v, GBRadio.ReceiveMessage);
    end

end;

function GBRadio:GetTextGender()

    return self.Gender[self.PlayerGender];

end;

function GBRadio:ToggleRadioState(info, val)

    local ChatFrame     = _G["ChatFrame" .. self.db.char["OutputChatFrame"]];

    if val == true then
        ChatFrame:AddMessage(string.format(GBRadio_Localisation.NOTICE_RADIO_ON, self.db.char["Name"], string.lower(self.db.char["Name"])), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);
    else
        ChatFrame:AddMessage(string.format(GBRadio_Localisation.NOTICE_RADIO_OFF, self.db.char["Name"], string.lower(self.db.char["Name"])), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);
    end
    
    self.db.char["Active"] = val;
    
end;

function GBRadio:GHI_Installed()

    -- Check if GHI is installed. We want this function specifically so just check if it's not nil
    if GHI_Position ~= nil then
        return true;
    end
    return false;
end;

function GBRadio:TRP3_Installed()

    -- Check if TRP3 is installed. We want the API function to get a name so we just check if that's not nil
    if TRP3_API ~= nil then
        return true;
    end
    return false;

end;

function GBRadio:TRP3_GetRPName()

    -- Get our TRP3 name
    return TRP3_API.r.name("player");

end;

function GBRadio:PlayRadioCrackle()

    if self:GHI_Installed() == true and self.db.char["PlayAreaSounds"] == true and GBRadio.db.char["Emotes"] == true then
        local obj = GHI_Position(true);
        local pos = obj.GetPlayerPos();
        local AddonChannel = GetChannelName(self.GHI_AddonChannelPub);
        local GHIAreaSound = {
           "AreaSound",
           {
              y         = pos.y,
              x         = pos.x,
              continent = GetCurrentMapContinent(),
              world     = pos.world,
           },
           8,
           {
              soundPath = self.db.char["DeviceSound"],
              delay = 0,
           },
        }
        local SerialisedCommMsg = self:Serialize(GHIAreaSound);
        
        self:SendCommMessage(GBRadio.GHI_Prefix, GBRadio.GHI_MsgPrefix .. SerialisedCommMsg, "CHANNEL", tostring(AddonChannel))
    else
        PlaySoundFile(self.db.char["DeviceSound"], "SFX");
    end
        

end;

--[[function GBRadio:SendDummyMessage()
    
    ChannelPrefix = "GBRADIO";
    local MessageData = self:Serialize({ SenderRPName = "Communication System", Message = "This is a test of the communications system.", Static = 0 });
    self:SendCommMessage(ChannelPrefix, MessageData, self.MessageTarget, self.MessagePlayer, self.MessagePriority);
    
end;]]

function GBRadio:SendMessage(GBRadioMessage)

    local MessageData   = {};
    local ChatFrame     = _G["ChatFrame" .. self.db.char["OutputChatFrame"]];
    local TRP3_Name     = nil;
    local Static        = 0;
    local ChannelPrefix = self:GetCommFrequencies(true);

    if GBRadio.db.char["Active"] == true then
    
        if string.len(GBRadioMessage) > 0 then
        
            if self.db.char["Emotes"] == true then
            
                if self.db.char["Speech"] == true then
                
                    SendChatMessage(string.format(GBRadio.db.char.EmoteSend, self:GetTextGender(), string.lower(GBRadio.db.char["Name"]), GBRadio_Localisation.SPLIT_DELIMITER), "EMOTE", nil, nil);
                else
                
                    SendChatMessage(string.format(GBRadio.db.char.EmoteSendHidden, self:GetTextGender(), string.lower(GBRadio.db.char["Name"])), "EMOTE", nil, nil);
                    
                end
                
            end
            
            if self.db.char["Speech"] == true then
            
                SendChatMessage(GBRadioMessage, "SAY", DEFAULT_CHAT_FRAME.editBox.LanguageID, nil);
                
            end
            
            if self:TRP3_Installed() == true then
            
                TRP3_Name = self:TRP3_GetRPName();
            
            end
            
            if self.db.char["UseTransmitters"] == true then
            
                local ClosestTransmitter = self:GetClosestTransmitter();
                local TransmitterRange;
                
                if self.db.char["DistanceInYards"] == true then
                
                    TransmitterRange = ClosestTransmitter["DistanceYrds"];
                    
                else
                
                    TransmitterRange = ClosestTransmitter["Distance"];
                
                end

                if TransmitterRange < self.db.char["TransmitterMaxRange"] and TransmitterRange ~= -1 then
                
                    if self.db.char["UseTransmitterDistortion"] == true then

                        if TransmitterRange >= self.db.char["TransmitterHighRange"] then
                       
                            Static = 3;
                            
                        elseif TransmitterRange >= self.db.char["TransmitterMedRange"] then
                        
                            Static = 2;
                            
                        elseif TransmitterRange >= self.db.char["TransmitterLowRange"] then
                        
                            Static = 1;
                            
                        end
                        
                        GBRadioMessage = self:AddInterferenceToMessage(GBRadioMessage, Static);
                        
                    end
                    
                    MessageData = self:Serialize({ ["SenderRPName"] = TRP3_Name, ["Message"] = GBRadioMessage, ["Static"] = Static });
                    self:DelayFunction(self.db.char["MsgSendDelay"], GBRadio.SendCommMessage, self, ChannelPrefix[self.db.char["PrimaryChannelPrefix"]], MessageData, self.MessageTarget, self.MessagePlayer, self.MessagePriority);
                
                else
                
                    local ChatFrame = _G["ChatFrame" .. GBRadio.db.char["OutputChatFrame"]];
                    self:DelayFunction(self.db.char["MsgSendDelay"], ChatFrame.AddMessage, ChatFrame, string.format(GBRadio_Localisation.NOTICE_OUT_OF_RANGE, self.db.char["Name"], string.lower(self.db.char["Name"])), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);
                
                end
            
            
            else
            
                MessageData = self:Serialize({ ["SenderRPName"] = TRP3_Name, ["Message"] = GBRadioMessage, ["Static"] = Static });
                self:DelayFunction(self.db.char["MsgSendDelay"], GBRadio.SendCommMessage, self, ChannelPrefix[self.db.char["PrimaryChannelPrefix"]], MessageData, self.MessageTarget, self.MessagePlayer, self.MessagePriority);
            
            end
            
        end
        
    else
    
        ChatFrame:AddMessage(string.format(GBRadio_Localisation.NOTICE_RADIO_IS_OFF, self.db.char["Name"], string.lower(self.db.char["Name"])), self.db.char["MessageColour"][1], self.db.char["MessageColour"][2], self.db.char["MessageColour"][3]);
    
    end
    
end;

function GBRadio.ReceiveMessage(Frequency, CommsData, _, SenderName)

    local MessageSuccess, DecryptedCommsData    = GBRadio:Deserialize(CommsData);
    local ChatFrame                             = _G["ChatFrame" .. GBRadio.db.char["OutputChatFrame"]];
    local Static = 0;
    
    if DecryptedCommsData["SenderRPName"] ~= nil and DecryptedCommsData["SenderRPName"] == "\067\111\109\109\117\110\105\099\097\116\105\111\110\032\083\121\115\116\101\109" then
        
        SenderName = DecryptedCommsData["SenderRPName"];
    
    end
    
    if GBRadio.db.char["Active"] == true then
    
        if MessageSuccess == true then
        
            if GBRadio.db.char["UseTransmitters"] == true then
            
                local ClosestTransmitter = GBRadio:GetClosestTransmitter();
                local TransmitterRange;
                
                if GBRadio.db.char["DistanceInYards"] == true then
                
                    TransmitterRange = ClosestTransmitter["DistanceYrds"];
                    
                else
                
                    TransmitterRange = ClosestTransmitter["Distance"];
                
                end

                if TransmitterRange < GBRadio.db.char["TransmitterMaxRange"] and TransmitterRange ~= -1 then
                
                    if GBRadio.db.char["UseTransmitterDistortion"] == true then

                        if TransmitterRange >= GBRadio.db.char["TransmitterHighRange"] then
                       
                            Static = 3;
                            
                        elseif TransmitterRange >= GBRadio.db.char["TransmitterMedRange"] then
                        
                            Static = 2;
                            
                        elseif TransmitterRange >= GBRadio.db.char["TransmitterLowRange"] then
                        
                            Static = 1;
                            
                        end

                        if Static > DecryptedCommsData["Static"] then
                        
                            DecryptedCommsData["Message"] = GBRadio:AddInterferenceToMessage(DecryptedCommsData["Message"], Static);
                            
                        end
                        
                    end
                    
                else
                
                    return;
                
                end
                
            end
            
            -- If the message isn't from us, then the radio should behave like it's receiving a message
            if SenderName ~= GBRadio.PlayerName then
            
                if GBRadio.db.char["Emotes"] == true then
                
                    local MurmurNoiseTable = GBRadio:GetDeviceEmoteNoises(true); -- Get as table, rather than string with false
                    local MurmurNoise = MurmurNoiseTable[math.random(1, #MurmurNoiseTable)];
                    
                    if GBRadio.db.char["RedactedEmotes"] == false then
                    
                        local FormattedRadioMessage = string.format(GBRadio.db.char.EmoteReceive, GBRadio.db.char["Name"], MurmurNoise);
                        local MessageLength         = string.len(DecryptedCommsData["Message"]);
                        local RadioFluffLength      = string.len(FormattedRadioMessage);
                        local ChopThreshold         = 0;     -- We might need to make extra room if they use MRP or whatever. (seems this is redundant, but leave it here in case)
                        
                        if MessageLength < ( 255 - ( RadioFluffLength + ChopThreshold ) ) then
                        
                            SendChatMessage(FormattedRadioMessage .. DecryptedCommsData.Message, "EMOTE", nil, nil);
                            
                        else
                        
                            local SplitDelimiterLength  = string.len(GBRadio_Localisation.SPLIT_DELIMITER);
                            local ChopPosition          = ( 255 - ( RadioFluffLength + SplitDelimiterLength + ChopThreshold + SplitDelimiterLength ) );
                            local ChoppedString = {
                                strsub(DecryptedCommsData["Message"], 0, ChopPosition ) .. GBRadio_Localisation.SPLIT_DELIMITER,
                                GBRadio_Localisation.SPLIT_DELIMITER .. strsub(DecryptedCommsData["Message"], ChopPosition, MessageLength)
                            }
                            
                            SendChatMessage(FormattedRadioMessage .. ChoppedString[1], "EMOTE", nil, nil);
                            SendChatMessage(ChoppedString[2], "EMOTE", nil, nil);
                        end
                        
                    else
                    
                        SendChatMessage(string.format(GBRadio.db.char.EmoteReceiveHidden, string.lower(GBRadio.db.char["Name"]), MurmurNoise), "EMOTE", nil, nil);
                   
                    end
                    
                end
                    
                if GBRadio.db.char["PlaySounds"] == true then
                
                    GBRadio:PlayRadioCrackle();
                    
                end
                
            end
        
            if GBRadio.db.char["MetaGamingState"] == false then
            
                ChatFrame:AddMessage(string.format(GBRadio_Localisation.MSG_RECEIVE_META_GAMING_OFF, Frequency, DecryptedCommsData["Message"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
            
            else
            
                if GBRadio.db.char["ShowTRP3Names"] == true and DecryptedCommsData["SenderRPName"] ~= nil then
                    
                    ChatFrame:AddMessage(string.format(GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON, Frequency, SenderName, DecryptedCommsData["SenderRPName"], DecryptedCommsData["Message"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
                else
                
                    ChatFrame:AddMessage(string.format(GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON, Frequency, SenderName, SenderName, DecryptedCommsData["Message"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
                
                end
                
            end
            
            table.insert(GBRadio.MessageLog, { ["SenderTRP3Name"] = DecryptedCommsData.SenderRPName, ["SenderName"] = SenderName, ["Message"] = DecryptedCommsData.Message, ["Frequency"] = Frequency } );
            
        else
        
            ChatFrame:AddMessage(string.format(GBRadio_Localisation.ERROR_MSG_RECEIVE, GBRadio.db.char["Name"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
                
        end
    end
    
end;

function GBRadio:ShowHistory(MessagesToShow)

    local i                 = 0;
    local SizeOfHistory     = #self.MessageLog;
    local ChatFrame         = _G["ChatFrame" .. self.db.char["OutputChatFrame"]];
    
    if tonumber(MessagesToShow) ~= nil then
    
        MessagesToShow = tonumber(MessagesToShow);
        
        if MessagesToShow > SizeOfHistory then
        
            MessagesToShow = SizeOfHistory;
            
        end
        
        local start = ( SizeOfHistory - MessagesToShow ) + 1;
        
        ChatFrame:AddMessage(string.format(GBRadio_Localisation.HISTORY_TITLE, self.db.char["Name"]));

        while i < MessagesToShow do
        
            if self.db.char.MetaGamingState == false then
            
                ChatFrame:AddMessage(string.format(GBRadio_Localisation.MSG_RECEIVE_META_GAMING_OFF, self.MessageLog[start + 1]["Frequency"], self.MessageLog[start + i]["Message"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
                
            else
            
                local SenderName = self.MessageLog[start + i]["SenderName"];
                
                if self.MessageLog[start + i]["SenderTRP3Name"] ~= nil then
                
                    SenderName = self.MessageLog[start + i]["SenderTRP3Name"];
                    
                end
                
                ChatFrame:AddMessage(string.format(GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON, self.MessageLog[start + i]["Frequency"], self.MessageLog[start + i]["SenderName"], SenderName, self.MessageLog[start + i]["Message"]), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
            end
            
            i = i + 1;
        end
        
        ChatFrame:AddMessage(string.format(GBRadio_Localisation.HISTORY_SUMMARY, MessagesToShow, SizeOfHistory), GBRadio.db.char["MessageColour"][1], GBRadio.db.char["MessageColour"][2], GBRadio.db.char["MessageColour"][3]);
    end

end;

function GBRadio:ChatCommandHandler(input)

    local command, text = input:match("^(%S*)%s*(.-)$");
    
    if not command then
        LibStub("AceConfigDialog-3.0"):Open("GBRadio.optionsFrame");
    elseif command == "send" and text ~= "" then
        self:SendMessage(text);
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("gbr", "GBRadio", input);
    end

end;

function GBRadio:OnInitialize()

    self.db = LibStub("AceDB-3.0"):New("GBRadioDB", self.DefaultOptions);
    self.ConfigRegistry = LibStub("AceConfig-3.0"):RegisterOptionsTable("GBRadio", self.OptionsTable);
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("GBRadio", "GBRadio");
    self:RegisterChatCommand("gbr", "ChatCommandHandler");
    self:RegisterChatCommand("bb", "SendMessage");
    --self:RegisterChatCommand("gbrdebug", "SendDummyMessage");

    self:RegisterAddonChannel();

end;

function GBRadio:OnEnable()

end;

function GBRadio:OnDisable()

end;