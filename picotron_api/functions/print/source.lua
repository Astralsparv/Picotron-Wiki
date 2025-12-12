function print(...)
    local temp={...}
    if (#temp==0) return $0x54f0, $0x54f4 -- NOP; return unmodified cursor position

    local str, x, y, col = ...

    -- print to back page if y is set or has a window (0x8) (if only x is set taken to be a colour command for printing to terminal)
    if y or ((peek(0x547f) & 0x8) > 0)
    then
        return _print_p8scii(str, x, y, col)
    end

    if (stat(315) > 0) then
        -- running headless; print to host terminal
        -- doen't happen after creating a windoe because will likely end up spamming console
        _printh(_tostring(str))
    else
        -- 0.2.0d: can set colour with print("blue",12")
        local colpref = ""
        if type(x) == "number" then
            if (x >= 0 and x <= 9) colpref = "\f"..chr(ord("0")+x)
            if (x >= 10) colpref = "\f"..chr(ord("a") + x-10)
        end
        -- when print_to_proc_id is not set, send to self (e.g: printing to terminal)
        _send_message(_envdat.print_to_proc_id or _pid(), {event="print",content=colpref .. _tostring(str)})

        -- lazily create terminal window to print to (!)
        -- allows ctrl+r to test commandline programs. input() does something similar
        if (_envdat.corun_program and not get_display()) then
            window()
            poke(0x547f,peek(0x547f) & ~0x8) -- not a graphical program though; print to terminal
        end

        -- allow message to be dispatched / received
        yield() -- depends how many slices end up being issued within a system frame (see boot)
        --flip(0x5) -- ditto; but works from inside coroutine
        --flip() -- quite slow, but consistent speed
    end
    
end