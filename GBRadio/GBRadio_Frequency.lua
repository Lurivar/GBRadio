function Frequency(init)

    -- Private
    local p = {
        frequency = GBR.DEFAULT_FREQUENCY,      -- Radio frequency
        colour = GBR.DEFAULT_FREQ_COLOUR,       -- Text colour of messages
        window = GBR.DEFAULT_FREQ_WINDOW        -- Window ID where messages appear in-game
    }

    function self.setFrequency(frequency)
        -- We need frequency to be a string for length checks
        if type(frequency) ~= "string" then
            frequency = tostring(frequency)
        end

        -- Size check
        if frequency:len() > GBR.MAX_FREQ_LEN then
            frequency = frequency:sub(0, GBR.MAX_FREQ_LEN)
        end

        self.frequency = frequency
    end
    
    function self.getFrequency()
        return self.frequency
    end
    

    function self.setColour(colour)
        -- We need colour to be a string for length checks
        if type(colour) ~= "string" then
            colour = tostring(colour)
        end

        -- Size check
        if colour:len() > GBR.MAX_COLOUR_LEN then
            colour = colour:sub(0, GBR.MAX_COLOUR_LEN)
        end

        self.colour = colour
    end
    
    function self.getColour()
        return self.colour
    end
    
    function self.setWindow(window)
        if type(window) ~= "number" then
            window = tonumber(window)
        end
        
        if window > GBR.MAX_WINDOW_NUM or window < GBR.MIN_WINDOW_NUM
            window = 1
        end
    end
    
    function self.getWindow()
        return self.window
    end
        

end