
-- print stuff centered

function printCentered(y,s)
    local w,h = term.getSize()
    local x = math.floor((w - string.len(s)) /2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

-- check if any disk is present

function diskPresence()
    if disk.isPresent('top')
    or disk.isPresent('bottom')
    or disk.isPresent('left')
    or disk.isPresent('right')
    or disk.isPresent('front')
    or disk.isPresent('back')
    then
        return true
    else
        return false
    end
end            