local attach_text_editor = nil 
function GuiElement:attach_text_editor(...)
    -- lazily load the text editor
    if (not attach_text_editor) attach_text_editor = include("/system/lib/gui_ed.lua")
    return attach_text_editor(self, ...)
end