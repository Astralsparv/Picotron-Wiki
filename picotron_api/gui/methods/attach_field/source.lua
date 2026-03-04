--[[
    attach_field  //  ** placeholder

    needs a get() and set() callback

    ** maybe fields are always too specialised; leave up to client
        but nice to have a drop-in starting point if can make it general enough
]]
function GuiElement:attach_field(el)
    local el = self:attach(el)

    function el:draw()
        local str = type(self.get == "function") and self:get() or "---"
        if (self:has_keyboard_focus()) str = self.str
        if (self.print_prefix) str = self.print_prefix..str
        local ww,hh = print(str,0,-1000)
        rectfill(0,0,self.width-1,self.height-1, self:has_keyboard_focus() and 8 or 0)			
        print(str,self.width-ww-1,1,6)
        if (self.label) then
            clip()
            local ww = print(self.label,0,-1000)
            print(self.label, -ww, 1, 13)
        end
    end

    function el:click()
        self:set_keyboard_focus(true)
        readtext(true)
        self.str = "" -- starting editing new string
    end


    function el:update()
        if (self:has_keyboard_focus()) then

            while (peektext()) do
                self.str = self.str .. readtext()
            end

            if (keyp("backspace")) self.str = sub(self.str,1,-2)

            if (keyp("enter")) then
                if (type(self.set) == "function") self:set(self.str)
                self:set_keyboard_focus(false)
            end

        end
    end


    return el
end